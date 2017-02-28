From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [RESEND PATCH v2 5/5] arm: dts: Remove the OF graph from DSI node for
 exynos4210 dts
Date: Tue, 28 Feb 2017 17:17:59 +0900
Message-ID: <1488269879-28876-6-git-send-email-hoegeun.kwon@samsung.com>
References: <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170228081812epcas5p3bf4f6f273099fbb6e6d26ffbab76f4d7@epcas5p3.samsung.com>
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
b290L2R0cy9leHlub3M0MjEwLXRyYXRzLmR0cyB8IDIzICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9leHlub3M0MjEwLXRyYXRzLmR0cyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczQyMTAtdHJhdHMuZHRzCmluZGV4IDBjYTFiNGQuLjk0NTJiZWQgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQyMTAtdHJhdHMuZHRzCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2V4eW5vczQyMTAtdHJhdHMuZHRzCkBAIC0xOTcsMjQgKzE5NywxMSBA
QAogJmRzaV8wIHsKIAl2ZGRjb3JlLXN1cHBseSA9IDwmdnVzYl9yZWc+OwogCXZkZGlvLXN1cHBs
eSA9IDwmdm1pcGlfcmVnPjsKKwlzYW1zdW5nLGJ1cnN0LWNsb2NrLWZyZXF1ZW5jeSA9IDw1MDAw
MDAwMDA+OworCXNhbXN1bmcsZXNjLWNsb2NrLWZyZXF1ZW5jeSA9IDwyMDAwMDAwMD47CiAJc2Ft
c3VuZyxwbGwtY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKIAlzdGF0dXMgPSAib2theSI7
CiAKLQlwb3J0cyB7Ci0JCSNhZGRyZXNzLWNlbGxzID0gPDE+OwotCQkjc2l6ZS1jZWxscyA9IDww
PjsKLQotCQlwb3J0QDEgewotCQkJcmVnID0gPDE+OwotCi0JCQlkc2lfb3V0OiBlbmRwb2ludCB7
Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfaW4+OwotCQkJCXNhbXN1bmcsYnVyc3QtY2xv
Y2stZnJlcXVlbmN5ID0gPDUwMDAwMDAwMD47Ci0JCQkJc2Ftc3VuZyxlc2MtY2xvY2stZnJlcXVl
bmN5ID0gPDIwMDAwMDAwPjsKLQkJCX07Ci0JCX07Ci0JfTsKLQogCXBhbmVsQDAgewogCQlyZWcg
PSA8MD47CiAJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxzNmU4YWEwIjsKQEAgLTI0MiwxMiArMjI5
LDYgQEAKIAkJCQl2c3luYy1sZW4gPSA8Mj47CiAJCQl9OwogCQl9OwotCi0JCXBvcnQgewotCQkJ
ZHNpX2luOiBlbmRwb2ludCB7Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfb3V0PjsKLQkJ
CX07Ci0JCX07CiAJfTsKIH07CiAKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
