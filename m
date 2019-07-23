From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
Subject: [RFC PATCH 03/11] devfreq: exynos-bus: Change goto-based logic to
 if-else logic
Date: Tue, 23 Jul 2019 14:20:08 +0200
Message-ID: <20190723122016.30279-4-a.swigon@partner.samsung.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122024eucas1p1ff060d072132bfbc8a8a1d10fa1f90f8@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190723122016.30279-1-a.swigon@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: sw0312.kim@samsung.com, krzk@kernel.org, inki.dae@samsung.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, georgi.djakov@linaro.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCBpbXByb3ZlcyBjb2RlIHJlYWRhYmlsaXR5IGJ5IGNoYW5naW5nIHRoZSBmb2xs
b3dpbmcgY29uc3RydWN0OgoKPiAgICBpZiAoY29uZCkKPiAgICAgICAgZ290byBwYXNzaXZlOwo+
ICAgIGZvbygpOwo+ICAgIGdvdG8gb3V0Owo+cGFzc2l2ZToKPiAgICBiYXIoKTsKPm91dDoKCmlu
dG8gdGhpczoKCj4gICAgaWYgKGNvbmQpCj4gICAgICAgIGJhcigpOwo+ICAgIGVsc2UKPiAgICAg
ICAgZm9vKCk7CgpTaWduZWQtb2ZmLWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25AcGFydG5l
ci5zYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jIHwgMjQgKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5j
IGIvZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYwppbmRleCBjZjZmNmNiZDBmNTUuLjRiYjgz
Yjk0NWJmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9kZXZmcmVxL2V4eW5vcy1idXMuYworKysgYi9k
cml2ZXJzL2RldmZyZXEvZXh5bm9zLWJ1cy5jCkBAIC01MDUsMjUgKzUwNSwxOSBAQCBzdGF0aWMg
aW50IGV4eW5vc19idXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlub2Rl
ID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUsICJkZXZmcmVxIiwgMCk7CiAJaWYgKG5v
ZGUpIHsKIAkJb2Zfbm9kZV9wdXQobm9kZSk7Ci0JCWdvdG8gcGFzc2l2ZTsKKwkJcmV0ID0gZXh5
bm9zX2J1c19wcm9maWxlX2luaXRfcGFzc2l2ZShidXMsIHByb2ZpbGUpOworCQlpZiAocmV0IDwg
MCkKKwkJCWdvdG8gZXJyOwogCX0gZWxzZSB7CiAJCXJldCA9IGV4eW5vc19idXNfcGFyZW50X3Bh
cnNlX29mKG5wLCBidXMpOworCQlpZiAocmV0IDwgMCkKKwkJCWdvdG8gZXJyOworCisJCXJldCA9
IGV4eW5vc19idXNfcHJvZmlsZV9pbml0KGJ1cywgcHJvZmlsZSk7CisJCWlmIChyZXQgPCAwKQor
CQkJZ290byBlcnI7CiAJfQogCi0JaWYgKHJldCA8IDApCi0JCWdvdG8gZXJyOwotCi0JcmV0ID0g
ZXh5bm9zX2J1c19wcm9maWxlX2luaXQoYnVzLCBwcm9maWxlKTsKLQlpZiAocmV0IDwgMCkKLQkJ
Z290byBlcnI7Ci0KLQlnb3RvIG91dDsKLXBhc3NpdmU6Ci0JcmV0ID0gZXh5bm9zX2J1c19wcm9m
aWxlX2luaXRfcGFzc2l2ZShidXMsIHByb2ZpbGUpOwotCWlmIChyZXQgPCAwKQotCQlnb3RvIGVy
cjsKLQotb3V0OgogCW1heF9zdGF0ZSA9IGJ1cy0+ZGV2ZnJlcS0+cHJvZmlsZS0+bWF4X3N0YXRl
OwogCW1pbl9mcmVxID0gKGJ1cy0+ZGV2ZnJlcS0+cHJvZmlsZS0+ZnJlcV90YWJsZVswXSAvIDEw
MDApOwogCW1heF9mcmVxID0gKGJ1cy0+ZGV2ZnJlcS0+cHJvZmlsZS0+ZnJlcV90YWJsZVttYXhf
c3RhdGUgLSAxXSAvIDEwMDApOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
