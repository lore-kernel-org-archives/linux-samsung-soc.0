From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/3] drm/exynos: reset temporary value after write to register
Date: Thu, 19 Mar 2015 11:27:49 -0300
Message-ID: <1426775270-31137-2-git-send-email-gustavo@padovan.org>
References: <1426775270-31137-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1426775270-31137-1-git-send-email-gustavo@padovan.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvLnBhZG92YW5AY29sbGFib3JhLmNvLnVrPgoK
J3ZhbCcgd2Fzbid0IGNsZWFuIGFmdGVyIGl0cyBsYXN0IHVzYWdlLCBzbyB3ZSBjb3VsZCBnZXQg
Z2FyYmFnZSB2YWx1ZSBhbmQKc2VuZCB0aGUgd3JvbmcgY29tbWFuZCB0byB0aGUgaHcuCgpTaWdu
ZWQtb2ZmLWJ5OiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEuY28u
dWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19taXhlci5jCmluZGV4IGE5NWZlODQuLjdhZmY4OGYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwpAQCAtNjg3LDcgKzY4Nyw3IEBAIHN0YXRpYyB2b2lk
IG1peGVyX3dpbl9yZXNldChzdHJ1Y3QgbWl4ZXJfY29udGV4dCAqY3R4KQogCW1peGVyX3JlZ193
cml0ZShyZXMsIE1YUl9HUkFQSElDX0NGRygwKSwgdmFsKTsKIAogCS8qIEJsZW5kIGxheWVyIDEg
aW50byBsYXllciAwICovCi0JdmFsIHw9IE1YUl9HUlBfQ0ZHX0JMRU5EX1BSRV9NVUw7CisJdmFs
ID0gTVhSX0dSUF9DRkdfQkxFTkRfUFJFX01VTDsKIAl2YWwgfD0gTVhSX0dSUF9DRkdfUElYRUxf
QkxFTkRfRU47CiAJbWl4ZXJfcmVnX3dyaXRlKHJlcywgTVhSX0dSQVBISUNfQ0ZHKDEpLCB2YWwp
OwogCi0tIAoyLjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
