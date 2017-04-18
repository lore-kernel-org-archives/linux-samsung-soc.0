From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 3/3] arm64: dts: exynos: Add support for s6e3hf2 panel
 device on TM2e board
Date: Tue, 18 Apr 2017 17:40:36 +0900
Message-ID: <1492504836-19225-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170418084047epcas5p42535837ac327ec48730ca766176bf86d@epcas5p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhpcyBwYXRjaCBhZGQgdGhlIHBhbmVsIGRldmljZSB0cmVlIG5vZGUgZm9yIHM2ZTNoZjIgZGlz
cGxheQpjb250cm9sbGVyIHRvIFRNMmUgZHRzLgoKU2lnbmVkLW9mZi1ieTogSG9lZ2V1biBLd29u
IDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5v
czU0MzMtdG0yZS5kdHMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1
NDMzLXRtMmUuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTJl
LmR0cwppbmRleCA2OTQ3MTdhLi5iNzNlMTIzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMmUuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZXh5bm9zL2V4eW5vczU0MzMtdG0yZS5kdHMKQEAgLTUyLDYgKzUyLDE3IEBACiAJYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSA8Mjc4MDAwMDAwPiwgPDQwMDAwMDAwMD47CiB9OwogCismZHNpIHsKKwlw
YW5lbEAwIHsKKwkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLHM2ZTNoZjIiOworCQlyZWcgPSA8MD47
CisJCXZkZDMtc3VwcGx5ID0gPCZsZG8yN19yZWc+OworCQl2Y2ktc3VwcGx5ID0gPCZsZG8yOF9y
ZWc+OworCQlyZXNldC1ncGlvcyA9IDwmZ3BnMCAwIEdQSU9fQUNUSVZFX0xPVz47CisJCWVuYWJs
ZS1ncGlvcyA9IDwmZ3BmMSA1IEdQSU9fQUNUSVZFX0hJR0g+OworCX07Cit9OworCiAmbGRvMzFf
cmVnIHsKIAlyZWd1bGF0b3ItbmFtZSA9ICJUU1BfVkREXzEuOFZfQVAiOwogCXJlZ3VsYXRvci1t
aW4tbWljcm92b2x0ID0gPDE4MDAwMDA+OwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
