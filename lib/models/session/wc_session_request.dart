import 'package:json_annotation/json_annotation.dart';
import 'package:wallet_connect/models/wc_peer_meta.dart';

part 'wc_session_request.g.dart';

@JsonSerializable()
class WCSessionRequest {
  final String peerId;
  final WCPeerMeta peerMeta;
  @JsonKey(fromJson: _chainIdFromValue)
  final int? chainId;
  WCSessionRequest({
    required this.peerId,
    required this.peerMeta,
    this.chainId,
  });

  static int? _chainIdFromValue(value) => int.tryParse(value.toString());

  factory WCSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$WCSessionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$WCSessionRequestToJson(this);

  @override
  String toString() =>
      'WCSessionRequest(peerId: $peerId, peerMeta: $peerMeta, chainId: $chainId)';
}
