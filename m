From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [RESEND PATCH v2 3/5] arm: dts: Remove the OF graph from DSI node for
 exynos3250 dts
Date: Tue, 28 Feb 2017 17:17:57 +0900
Message-ID: <1488269879-28876-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170228081812epcas5p36a8acfef59709dfef7e03271e32f9fa9@epcas5p3.samsung.com>
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
ZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBhcmNoL2FybS9i
b290L2R0cy9leHlub3MzMjUwLXJpbmF0by5kdHMgfCAyMyArKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1yaW5hdG8uZHRzIGIvYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zMzI1MC1yaW5hdG8uZHRzCmluZGV4IDU0ODQxM2UuLjgyZTY3NmEg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAtcmluYXRvLmR0cworKysg
Yi9hcmNoL2FybS9ib290L2R0cy9leHlub3MzMjUwLXJpbmF0by5kdHMKQEAgLTIxNSwyNCArMjE1
LDExIEBACiAmZHNpXzAgewogCXZkZGNvcmUtc3VwcGx5ID0gPCZsZG82X3JlZz47CiAJdmRkaW8t
c3VwcGx5ID0gPCZsZG82X3JlZz47CisJc2Ftc3VuZyxidXJzdC1jbG9jay1mcmVxdWVuY3kgPSA8
MjUwMDAwMDAwPjsKKwlzYW1zdW5nLGVzYy1jbG9jay1mcmVxdWVuY3kgPSA8MjAwMDAwMDA+Owog
CXNhbXN1bmcscGxsLWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47CiAJc3RhdHVzID0gIm9r
YXkiOwogCi0JcG9ydHMgewotCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLQkJI3NpemUtY2VsbHMg
PSA8MD47Ci0KLQkJcG9ydEAxIHsKLQkJCXJlZyA9IDwxPjsKLQotCQkJZHNpX291dDogZW5kcG9p
bnQgewotCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX2luPjsKLQkJCQlzYW1zdW5nLGJ1cnN0
LWNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMDA+OwotCQkJCXNhbXN1bmcsZXNjLWNsb2NrLWZy
ZXF1ZW5jeSA9IDwyMDAwMDAwMD47Ci0JCQl9OwotCQl9OwotCX07Ci0KIAlwYW5lbEAwIHsKIAkJ
Y29tcGF0aWJsZSA9ICJzYW1zdW5nLHM2ZTYzajB4MDMiOwogCQlyZWcgPSA8MD47CkBAIC0yNjIs
MTIgKzI0OSw2IEBACiAJCQkJdnN5bmMtbGVuID0gPDI+OwogCQkJfTsKIAkJfTsKLQotCQlwb3J0
IHsKLQkJCWRzaV9pbjogZW5kcG9pbnQgewotCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291
dD47Ci0JCQl9OwotCQl9OwogCX07CiB9OwogCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
