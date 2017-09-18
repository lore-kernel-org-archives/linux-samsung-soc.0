From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [RESEND PATCH v4 3/3] ARM: dts: exynos: Remove the display-timing
 and delay from rinato dts
Date: Mon, 18 Sep 2017 11:54:24 +0900
Message-ID: <1505703264-6704-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170918025448epcas2p22a44b6c8efeac613e7e90c3c49b3eb8a@epcas2p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: krzk@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, kgene@kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

IFRoZSBkaXNwbGF5LXRpbWluZyBhbmQgZGVsYXkgYXJlIGluY2x1ZGVkIGluIHRoZSBwYW5lbCBk
cml2ZXIuIFNvIGl0CiBzaG91bGQgYmUgcmVtb3ZlZCBpbiBkdHMuCgpTaWduZWQtb2ZmLWJ5OiBI
b2VnZXVuIEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5nLmNvbT4KLS0tCgpIaSBLcnp5c3p0b2Ys
CgpUaGlzIHBhdGNoIHdhcyByZWJhc2VkIHRvIHRoZSBtYWlubGluZSAodjQuMTQtcmMxKS4KCkJl
c3QgcmVnYXJkcywKSG9lZ2V1bgoKIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAtcmluYXRv
LmR0cyB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0
by5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0by5kdHMKaW5kZXggMGI0
NTQ2Ny4uZmY3OTJmZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1y
aW5hdG8uZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAtcmluYXRvLmR0cwpA
QCAtMjI3LDI4ICsyMjcsNiBAQAogCQl2Y2ktc3VwcGx5ID0gPCZsZG8yMF9yZWc+OwogCQlyZXNl
dC1ncGlvcyA9IDwmZ3BlMCAxIEdQSU9fQUNUSVZFX0xPVz47CiAJCXRlLWdwaW9zID0gPCZncHgw
IDYgR1BJT19BQ1RJVkVfSElHSD47Ci0JCXBvd2VyLW9uLWRlbGF5PSA8MzA+OwotCQlwb3dlci1v
ZmYtZGVsYXk9IDwxMjA+OwotCQlyZXNldC1kZWxheSA9IDw1PjsKLQkJaW5pdC1kZWxheSA9IDwx
MDA+OwotCQlmbGlwLWhvcml6b250YWw7Ci0JCWZsaXAtdmVydGljYWw7Ci0JCXBhbmVsLXdpZHRo
LW1tID0gPDI5PjsKLQkJcGFuZWwtaGVpZ2h0LW1tID0gPDI5PjsKLQotCQlkaXNwbGF5LXRpbWlu
Z3MgewotCQkJdGltaW5nLTAgewotCQkJCWNsb2NrLWZyZXF1ZW5jeSA9IDw0NjAwMDAwPjsKLQkJ
CQloYWN0aXZlID0gPDMyMD47Ci0JCQkJdmFjdGl2ZSA9IDwzMjA+OwotCQkJCWhmcm9udC1wb3Jj
aCA9IDwxPjsKLQkJCQloYmFjay1wb3JjaCA9IDwxPjsKLQkJCQloc3luYy1sZW4gPSA8MT47Ci0J
CQkJdmZyb250LXBvcmNoID0gPDE1MD47Ci0JCQkJdmJhY2stcG9yY2ggPSA8MT47Ci0JCQkJdnN5
bmMtbGVuID0gPDI+OwotCQkJfTsKLQkJfTsKIAl9OwogfTsKIAotLSAKMS45LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
