From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v2 1/3] drm/exynos: remove to call mixer_wait_for_vblank
Date: Fri, 12 Jun 2015 17:27:14 +0900
Message-ID: <1434097636-10709-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, a.hajda@samsung.com, gustavo.padovan@collabora.co.uk, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIHJlYXNvbiB3YWl0aW5nIHZibGFuayBpcyB0byBiZSBwb3dlciBnYXRlZCBhbmQgZGlzYWJs
ZWQgY2xvY2tzIGFmdGVyCmRtYSBvcGVyYXRpb24gaXMgY29tcGxldGVkLiBUaGUgZG1hIG9wZXJh
dGlvbiBpcyBzdG9wcGVkIGFscmVhZHkgYmVmb3JlCmJlIHBvd2VyIGdhdGVkIGFuZCBjbG9ja3Mg
YXJlIGRpc2FibGVkIHdoZW4gbWl4ZXIgaXMgZGlzYWJsZWQgYnkgY29tbWl0CjM4MWJlMDI1YWMx
YTYoImRybS9leHlub3M6IHN0b3AgbWl4ZXIgYmVmb3JlIGdhdGluZyBjbG9ja3MgZHVyaW5nCnBv
d2Vyb2ZmIikuIERvbid0IG5lZWQgdG8gd2FpdCB2YmxhbmsgYW55bW9yZS4KClNpZ25lZC1vZmYt
Ynk6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21p
eGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCmluZGV4IDZiYWI3
MTcuLmY5M2YwMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21p
eGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwpAQCAtMTAx
MCw3ICsxMDEwLDYgQEAgc3RhdGljIHZvaWQgbWl4ZXJfd2luZG93X3N1c3BlbmQoc3RydWN0IG1p
eGVyX2NvbnRleHQgKmN0eCkKIAkJcGxhbmUtPnJlc3VtZSA9IHBsYW5lLT5lbmFibGVkOwogCQlt
aXhlcl93aW5fZGlzYWJsZShjdHgtPmNydGMsIGkpOwogCX0KLQltaXhlcl93YWl0X2Zvcl92Ymxh
bmsoY3R4LT5jcnRjKTsKIH0KIAogc3RhdGljIHZvaWQgbWl4ZXJfd2luZG93X3Jlc3VtZShzdHJ1
Y3QgbWl4ZXJfY29udGV4dCAqY3R4KQotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
