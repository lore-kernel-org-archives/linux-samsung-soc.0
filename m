From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] drm/exynos: g2d: fix overflow of cmdlist size
Date: Wed, 18 Jan 2017 09:30:14 +0900
Message-ID: <f0d1e14e-26b9-1f4f-6703-e0efe8ad9af4@samsung.com>
References: <CGME20170117044134epcas5p2d0e67623efa7eb0b9a1ad6f8a593f0c4@epcas5p2.samsung.com>
 <1484628126-21671-1-git-send-email-jy0922.shim@samsung.com>
 <587E2922.10805@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <587E2922.10805@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGkgVG9iaWFzLAoKT24gMDEvMTcvMjAxNyAxMToyNCBQTSwgVG9iaWFzIEpha29iaSB3cm90ZToK
PiBKb29ueW91bmcgU2hpbSB3cm90ZToKPj4gVGhlIHNpemUgb2YgY21kbGlzdCBpcyBpbnRlZ2Vy
IHR5cGUsIHNvIGl0IGNhbiBiZSBvdmVyZmxvd2VkIGJ5IGNtZCBhbmQKPj4gY21kX2J1ZiB0aGF0
IGhhcyB0b28gYmlnIHNpemUuIFRoaXMgcGF0Y2ggd2lsbCBmaXggb3ZlcmZsb3cgaXNzdWUgYXMK
Pj4gY2hlY2tpbmcgbWF4aW11bSBzaXplIG9mIGNtZCBhbmQgY21kX2J1Zi4KPiBJIGRvbid0IHVu
ZGVyc3RhbmQvc2VlIHRoZSBpc3N1ZSBoZXJlLiBDb3VsZCB5b3UgcG9pbnQgb3V0IGZvciB3aGlj
aAo+IGlucHV0IG9mIHRoZSBzZXRfY21kbGlzdCBpb2N0bCB5b3Ugc2VlIHRoaXMgcGFydGljdWxh
ciBvdmVyZmxvdz8KPiAKPiBJbiBwYXJ0aWN1bGFyIGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGlj
aCBzaXplIGZpZWxkIHlvdSdyZSB0YWxraW5nCj4gYWJvdXQuIHN0cnVjdCBnMmRfY21kbGlzdCBk
b2VzIG5vdCBoYXZlIGFueSBmaWVsZCBuYW1lZCAnc2l6ZScuCj4gCgpJIG1lYW4gc2l6ZSBvZiBj
bWRsaXN0IGlzCnNpemUgPSBjbWRsaXN0LT5sYXN0ICsgcmVxLT5jbWRfbnIgKiAyICsgcmVxLT5j
bWRfYnVmX25yICogMiArIDI7CmluIGV4eW5vc19nMmRfc2V0X2NtZGxpc3RfaW9jdGwoKS4KCllv
dSBjYW4gcmVwcm9kdWNlIG92ZXJmbG93IG9mIHNpemUgZWFzaWx5IGlmIHlvdSB1c2UgdmFsdWUg
bGlrZQo0Mjk0OTY3Mjk1IG9yIDIxNDc0ODM2NDcgYXQgdGhlIHJlcS0+Y21kX2J1Zl9uci4KClRo
YW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
