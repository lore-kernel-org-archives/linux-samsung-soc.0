From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH v3 1/5] ARM: dts: exynos: Enable HDMI for Arndale Octa board
Date: Wed, 24 Aug 2016 22:07:15 +0900
Message-ID: <1472044039-16536-2-git-send-email-woogyom.kim@gmail.com>
References: <1472044039-16536-1-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1472044039-16536-1-git-send-email-woogyom.kim@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Milo Kim <woogyom.kim@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

KiBHUElPIGZvciBIRE1JIGhvdCBwbHVnIGRldGVjdAogIEdQWDNfNyBpcyB1c2VkLiBUaGUgSFBE
IGF3YXJlbmVzcyBpcyBkb25lIHdoZW4gdGhlIEdQSU8gaXMgYWN0aXZlIGhpZ2ggYW5kCiAgc2lu
Z2xlIGVuZGVkLgoKKiBFbmFibGUgSERNSSBibG9jayBpbiBFeHlub3M1NDIwCiAgSERNSSBWREQg
YW5kIFBMTCBjb25zdW1lIDEuMFYgTERPNiAoUFZERF9BTkFJUF8xVjApIGFuZCBIRE1JIG9zY2ls
bGF0b3IKICByZXF1aXJlcyAxLjhWIExETzcgKFBWRERfQU5BSVBfMVY4KS4KCiogU3VwcG9ydCBI
RE1JIGRpc3BsYXkgZGF0YSBjaGFubmVsCiAgSTJDICMyIGlzIGFzc2lnbmVkIGZvciB0aGUgSERN
SSBEREMuIEl0IGVuYWJsZXMgdGhlIEVESUQgYWNjZXNzLgoKQ2M6IEt1a2ppbiBLaW0gPGtnZW5l
QGtlcm5lbC5vcmc+CkNjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1zdW5n
LmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+CkNjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBN
aWxvIEtpbSA8d29vZ3lvbS5raW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2V4
eW5vczU0MjAtYXJuZGFsZS1vY3RhLmR0cyB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZXh5
bm9zNTQyMC1hcm5kYWxlLW9jdGEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMC1h
cm5kYWxlLW9jdGEuZHRzCmluZGV4IDM5YTNiODEuLjJmYjU3MDggMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL2V4eW5vczU0MjAtYXJuZGFsZS1vY3RhLmR0cworKysgYi9hcmNoL2FybS9i
b290L2R0cy9leHlub3M1NDIwLWFybmRhbGUtb2N0YS5kdHMKQEAgLTcwLDYgKzcwLDE5IEBACiAJ
c3RhdHVzID0gImRpc2FibGVkIjsKIH07CiAKKyZoZG1pIHsKKwlocGQtZ3Bpb3MgPSA8JmdweDMg
NyBHUElPX09QRU5fU09VUkNFPjsKKwl2ZGRfb3NjLXN1cHBseSA9IDwmbGRvN19yZWc+OworCXZk
ZF9wbGwtc3VwcGx5ID0gPCZsZG82X3JlZz47CisJdmRkLXN1cHBseSA9IDwmbGRvNl9yZWc+Owor
CWRkYyA9IDwmaTJjXzI+OworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZpMmNfMiB7CisJc3Rh
dHVzID0gIm9rYXkiOworfTsKKwogJmhzaTJjXzQgewogCXN0YXR1cyA9ICJva2F5IjsKIAotLSAK
MS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
