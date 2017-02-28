From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [RESEND PATCH v2 4/5] arm: dts: Remove the OF graph from DSI node for
 exynos4412 dts
Date: Tue, 28 Feb 2017 17:17:58 +0900
Message-ID: <1488269879-28876-5-git-send-email-hoegeun.kwon@samsung.com>
References: <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170228081812epcas5p3d20eddc91da42ec4a0d973ddc59d184a@epcas5p3.samsung.com>
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
b290L2R0cy9leHlub3M0NDEyLXRyYXRzMi5kdHMgfCAyMyArKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNDQxMi10cmF0czIuZHRzIGIvYXJjaC9h
cm0vYm9vdC9kdHMvZXh5bm9zNDQxMi10cmF0czIuZHRzCmluZGV4IDQxZWNkNmQuLjg2Y2U1ZTUg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQ0MTItdHJhdHMyLmR0cworKysg
Yi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0NDEyLXRyYXRzMi5kdHMKQEAgLTM4NSwyNCArMzg1
LDExIEBACiAmZHNpXzAgewogCXZkZGNvcmUtc3VwcGx5ID0gPCZsZG84X3JlZz47CiAJdmRkaW8t
c3VwcGx5ID0gPCZsZG8xMF9yZWc+OworCXNhbXN1bmcsYnVyc3QtY2xvY2stZnJlcXVlbmN5ID0g
PDUwMDAwMDAwMD47CisJc2Ftc3VuZyxlc2MtY2xvY2stZnJlcXVlbmN5ID0gPDIwMDAwMDAwPjsK
IAlzYW1zdW5nLHBsbC1jbG9jay1mcmVxdWVuY3kgPSA8MjQwMDAwMDA+OwogCXN0YXR1cyA9ICJv
a2F5IjsKIAotCXBvcnRzIHsKLQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Ci0JCSNzaXplLWNlbGxz
ID0gPDA+OwotCi0JCXBvcnRAMSB7Ci0JCQlyZWcgPSA8MT47Ci0KLQkJCWRzaV9vdXQ6IGVuZHBv
aW50IHsKLQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9pbj47Ci0JCQkJc2Ftc3VuZyxidXJz
dC1jbG9jay1mcmVxdWVuY3kgPSA8NTAwMDAwMDAwPjsKLQkJCQlzYW1zdW5nLGVzYy1jbG9jay1m
cmVxdWVuY3kgPSA8MjAwMDAwMDA+OwotCQkJfTsKLQkJfTsKLQl9OwotCiAJcGFuZWxAMCB7CiAJ
CWNvbXBhdGlibGUgPSAic2Ftc3VuZyxzNmU4YWEwIjsKIAkJcmVnID0gPDA+OwpAQCAtNDMwLDEy
ICs0MTcsNiBAQAogCQkJCXZzeW5jLWxlbiA9IDwyPjsKIAkJCX07CiAJCX07Ci0KLQkJcG9ydCB7
Ci0JCQlkc2lfaW46IGVuZHBvaW50IHsKLQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9vdXQ+
OwotCQkJfTsKLQkJfTsKIAl9OwogfTsKIAotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
