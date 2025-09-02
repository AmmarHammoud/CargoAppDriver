import '../shared/constants/constants.dart';
import '../shared/constants/shipment_status.dart';
import 'user_model.dart';

class ShipmentModel {
  late final int id;
  late final int? clientId;
  late final int? centerFromId;
  late final int? centerToId;
  late final int? pickupDriverId;
  late final int? deliveryDriverId;
  late final String? senderLat;
  late final String? senderLng;
  late final int? recipientId;
  late final ShipmentStatus status;
  late final String? recipientLat;
  late final String? recipientLng;
  late final String type;
  late final int? numberOfPieces;
  late final String? weight;
  late final String? deliveryPrice;
  late final String productValue;
  late final String totalAmount;
  late final String? invoiceNumber;
  late final String barcode;
  late final String? qrCodeUrl;
  late final UserModel? recipient;
  late final UserModel? sender;

  ShipmentModel({
    required this.type,
    required this.numberOfPieces,
    required this.weight,
    required this.productValue,
    required this.senderLat,
    required this.senderLng,
  });

  ShipmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceNumber = json['invoice_number'];
    barcode = json['barcode'];
    status = ShipmentStatus.fromBackendStatus(json['status']);
    type = json['shipment_type'];
    numberOfPieces = json['number_of_pieces'];
    weight = json['weight'];
    deliveryPrice = json['delivery_price'];
    productValue = json['product_value'];
    totalAmount = json['total_amount'];
    qrCodeUrl = '${Constants.baseUrl}/${json['qr_code_url']}';
    if (json['recipient'] != null) {
      print(json['recipient']);
      recipient = UserModel.fromJson(json['recipient']);
    }
    if (json['sender'] != null) {
      sender = UserModel.fromJson(json['sender']);
    }
  }

  Map<String, dynamic> toJson() => {};

  @override
  String toString() {
    return 'Shipment(id: $id, invoice: $invoiceNumber, barcode: $barcode, status: ${status.toString()})';
    // return '''
    // id: $id
    // invoiceNumber: $invoiceNumber
    // barcode: $barcode\n
    // ''';
  }
}
