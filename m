From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/3] drm/exynos/dsi: Use common error handling code in
 exynos_dsi_enable()
Date: Tue, 24 Oct 2017 10:49:52 +0200
Message-ID: <9028478a-a00d-6fcd-0286-b8daefa8c912@users.sourceforge.net>
References: <7d4cdb43-432c-c67a-5d3f-c37bd604f539@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7d4cdb43-432c-c67a-5d3f-c37bd604f539@users.sourceforge.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUdWUsIDI0IE9jdCAyMDE3IDA5OjMyOjE4ICswMjAwCgpBZGQgYSBqdW1wIHRhcmdldCBzbyB0
aGF0IGEgYml0IG9mIGV4Y2VwdGlvbiBoYW5kbGluZyBjYW4gYmUgYmV0dGVyIHJldXNlZAphdCB0
aGUgZW5kIG9mIHRoaXMgZnVuY3Rpb24uCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2lu
ZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5n
IDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHNpLmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kc2kuYwppbmRleCA3OTA0ZmZhOWFiZmIuLmJhNWZiNDljNTQ5MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwpAQCAtMTM4OSw4ICsxMzg5LDcgQEAgc3RhdGlj
IHZvaWQgZXh5bm9zX2RzaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQogCXJl
dCA9IGRybV9wYW5lbF9wcmVwYXJlKGRzaS0+cGFuZWwpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRz
aS0+c3RhdGUgJj0gfkRTSU1fU1RBVEVfRU5BQkxFRDsKLQkJcG1fcnVudGltZV9wdXRfc3luYyhk
c2ktPmRldik7Ci0JCXJldHVybjsKKwkJZ290byBwdXRfc3luYzsKIAl9CiAKIAlleHlub3NfZHNp
X3NldF9kaXNwbGF5X21vZGUoZHNpKTsKQEAgLTE0MDEsMTEgKzE0MDAsMTQgQEAgc3RhdGljIHZv
aWQgZXh5bm9zX2RzaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQogCQlkc2kt
PnN0YXRlICY9IH5EU0lNX1NUQVRFX0VOQUJMRUQ7CiAJCWV4eW5vc19kc2lfc2V0X2Rpc3BsYXlf
ZW5hYmxlKGRzaSwgZmFsc2UpOwogCQlkcm1fcGFuZWxfdW5wcmVwYXJlKGRzaS0+cGFuZWwpOwot
CQlwbV9ydW50aW1lX3B1dF9zeW5jKGRzaS0+ZGV2KTsKLQkJcmV0dXJuOworCQlnb3RvIHB1dF9z
eW5jOwogCX0KIAogCWRzaS0+c3RhdGUgfD0gRFNJTV9TVEFURV9WSURPVVRfQVZBSUxBQkxFOwor
CXJldHVybjsKKworcHV0X3N5bmM6CisJcG1fcnVudGltZV9wdXRfc3luYyhkc2ktPmRldik7CiB9
CiAKIHN0YXRpYyB2b2lkIGV4eW5vc19kc2lfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIpCi0tIAoyLjE0LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
