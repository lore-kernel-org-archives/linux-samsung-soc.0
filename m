From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [RESEND PATCH v2 2/5] arm64: dts: exynos: Remove the OF graph from DSI
 node for exynos5433 dts
Date: Tue, 28 Feb 2017 17:17:56 +0900
Message-ID: <1488269879-28876-3-git-send-email-hoegeun.kwon@samsung.com>
References: <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170228081811epcas5p322c1570e2e29c69592f798916b816a41@epcas5p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIE9GIGdyYXBoIGlzIG5vdCBuZWVkZWQgYmVjYXVzZSB0aGUgcGFuZWwgaXMgYSBjaGlsZCBv
ZiBkc2kuIFNvClJlbW92ZSB0aGUgcG9ydHMgbm9kZSBhbmQgbW92ZSBidXJzdCBhbmQgZXNjIGNs
b2NrIGZyZXF1ZW5jeQpwcm9wZXJ0aWVzIHRvIHRoZSBwYXJlbnQgKERTSSBub2RlKS4KClNpZ25l
ZC1vZmYtYnk6IEhvZWdldW4gS3dvbiA8aG9lZ2V1bi5rd29uQHNhbXN1bmcuY29tPgpSZXZpZXdl
ZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi1jb21tb24uZHRzaSB8IDE2ICsrLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0y
LWNvbW1vbi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIt
Y29tbW9uLmR0c2kKaW5kZXggNmNlOTNhMy4uNzdiYTIzOCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKQEAgLTI5OCwy
MyArMjk4LDExIEBACiAJc3RhdHVzID0gIm9rYXkiOwogCXZkZGNvcmUtc3VwcGx5ID0gPCZsZG82
X3JlZz47CiAJdmRkaW8tc3VwcGx5ID0gPCZsZG83X3JlZz47CisJc2Ftc3VuZyxidXJzdC1jbG9j
ay1mcmVxdWVuY3kgPSA8NTEyMDAwMDAwPjsKKwlzYW1zdW5nLGVzYy1jbG9jay1mcmVxdWVuY3kg
PSA8MTYwMDAwMDA+OwogCXNhbXN1bmcscGxsLWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47
CiAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8JnRlX2lycT47Ci0K
LQlwb3J0cyB7Ci0JCSNhZGRyZXNzLWNlbGxzID0gPDE+OwotCQkjc2l6ZS1jZWxscyA9IDwwPjsK
LQotCQlwb3J0QDEgewotCQkJcmVnID0gPDE+OwotCi0JCQlkc2lfb3V0OiBlbmRwb2ludCB7Ci0J
CQkJc2Ftc3VuZyxidXJzdC1jbG9jay1mcmVxdWVuY3kgPSA8NTEyMDAwMDAwPjsKLQkJCQlzYW1z
dW5nLGVzYy1jbG9jay1mcmVxdWVuY3kgPSA8MTYwMDAwMDA+OwotCQkJfTsKLQkJfTsKLQl9Owog
fTsKIAogJmhkbWkgewotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
