From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/3] drm/bridge/sii8620: simplify hardware reset procedure
Date: Mon, 15 Jan 2018 18:33:56 +0100
Message-ID: <20180115173357.31067-3-a.hajda@samsung.com>
References: <20180115173357.31067-1-a.hajda@samsung.com>
 <CGME20180115173407eucas1p1584fb8b431e549cdd0ebdf057c1a512a@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20180115173357.31067-1-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlcmUgaXMgbm8gbmVlZCB0byBmbGlwIHJlc2V0IHBpbiB0d2ljZS4gQWxzbyBkZWxheXMgY2Fu
IGJlIGNoYW5nZWQgdG8KdmFsdWVzIHByZXNlbnQgaW4gdmVuZG9yJ3MgY29kZS4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zaWwtc2lpODYyMC5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1z
aWk4NjIwLmMKaW5kZXggZGI5M2U1ZTA0OTdjLi43YzQ2ODQ3ZmVmMTggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lsLXNpaTg2MjAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3NpbC1zaWk4NjIwLmMKQEAgLTk4MCwxMyArOTgwLDkgQEAgc3RhdGljIHZvaWQgc2lp
ODYyMF9od19yZXNldChzdHJ1Y3Qgc2lpODYyMCAqY3R4KQogewogCXN0cnVjdCBpMmNfY2xpZW50
ICppMmMgPSB0b19pMmNfY2xpZW50KGN0eC0+ZGV2KTsKIAotCXVzbGVlcF9yYW5nZSgxMDAwMCwg
MjAwMDApOwotCWdwaW9kX3NldF92YWx1ZShjdHgtPmdwaW9fcmVzZXQsIDApOwotCXVzbGVlcF9y
YW5nZSg1MDAwLCAyMDAwMCk7Ci0JZ3Bpb2Rfc2V0X3ZhbHVlKGN0eC0+Z3Bpb19yZXNldCwgMSk7
Ci0JdXNsZWVwX3JhbmdlKDEwMDAwLCAyMDAwMCk7CisJbXNsZWVwKDEwMCk7CiAJZ3Bpb2Rfc2V0
X3ZhbHVlKGN0eC0+Z3Bpb19yZXNldCwgMCk7Ci0JbXNsZWVwKDMwMCk7CisJbXNsZWVwKDEwMCk7
CiAKIAkvKiBJMkMgYnVzIHJlY292ZXJ5IHByZXZlbnRzIEkyQyBlcnJvcnMgZHVlIHRvIGtub3du
IGJ1ZyBpbiB0aGUgY2hpcCAqLwogCWkyY19yZWNvdmVyX2J1cyhpMmMtPmFkYXB0ZXIpOwotLSAK
Mi4xNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
