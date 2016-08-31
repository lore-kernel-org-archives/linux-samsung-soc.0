From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/6] media: s5p-cec: fix system and runtime pm integration
Date: Wed, 31 Aug 2016 14:55:58 +0200
Message-ID: <1472648159-9814-6-git-send-email-m.szyprowski@samsung.com>
References: <1472648159-9814-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1472648159-9814-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VXNlIGdlbmVyaWMgaGVscGVycyBpbnN0ZWFkIG9mIG9wZW4tY29kaW5nIHVzYWdlIG9mIHJ1bnRp
bWUgcG0gZm9yIHN5c3RlbQpzbGVlcCBwbSwgd2hpY2ggd2FzIHBvdGVudGlhbGx5IGJyb2tlbiBm
b3Igc29tZSBjb3JuZXIgY2FzZXMuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxt
LnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL21lZGlhL3M1cC1j
ZWMvczVwX2NlYy5jIHwgMTcgKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9zNXAtY2VjL3M1cF9jZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zNXAtY2Vj
L3M1cF9jZWMuYwppbmRleCA3ODMzMzI3M2M0ZTUuLjc3ZDk4ODc4MDFiOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL3M1cC1jZWMvczVwX2NlYy5jCisrKyBiL2RyaXZlcnMvc3Rh
Z2luZy9tZWRpYS9zNXAtY2VjL3M1cF9jZWMuYwpAQCAtMjUwLDIyICsyNTAsOSBAQCBzdGF0aWMg
aW50IHM1cF9jZWNfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiAw
OwogfQogCi1zdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHM1cF9jZWNfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCi17Ci0JaWYgKHBtX3J1bnRpbWVfc3VzcGVuZGVkKGRldikpCi0JCXJldHVy
biAwOwotCXJldHVybiBzNXBfY2VjX3J1bnRpbWVfc3VzcGVuZChkZXYpOwotfQotCi1zdGF0aWMg
aW50IF9fbWF5YmVfdW51c2VkIHM1cF9jZWNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKLXsK
LQlpZiAocG1fcnVudGltZV9zdXNwZW5kZWQoZGV2KSkKLQkJcmV0dXJuIDA7Ci0JcmV0dXJuIHM1
cF9jZWNfcnVudGltZV9yZXN1bWUoZGV2KTsKLX0KLQogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZf
cG1fb3BzIHM1cF9jZWNfcG1fb3BzID0gewotCVNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKHM1cF9j
ZWNfc3VzcGVuZCwgczVwX2NlY19yZXN1bWUpCisJU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMocG1f
cnVudGltZV9mb3JjZV9zdXNwZW5kLAorCQkJCXBtX3J1bnRpbWVfZm9yY2VfcmVzdW1lKQogCVNF
VF9SVU5USU1FX1BNX09QUyhzNXBfY2VjX3J1bnRpbWVfc3VzcGVuZCwgczVwX2NlY19ydW50aW1l
X3Jlc3VtZSwKIAkJCSAgIE5VTEwpCiB9OwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
