import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_details_event.freezed.dart';

@freezed
abstract class CryptoDetailsEvent with _$CryptoDetailsEvent {
  const factory CryptoDetailsEvent.getCryptoDetails({
    required String cryptoId,
  }) = _LoadCryptoDetails;
}
