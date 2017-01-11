From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v8 3/3] arm64: dts: exynos: Add support for S6E3HA2 panel
 device on TM2 board
Date: Wed, 11 Jan 2017 15:33:59 +0900
Message-ID: <1484116439-7275-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas1p4b29b1308a0b8088afd46a475770d4b00@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: krzk@kernel.org, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jh80.chung@samsung.com, andi.shyti@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSHl1bmd3b24gSHdhbmcgPGh1bWFuLmh3YW5nQHNhbXN1bmcuY29tPgoKVGhpcyBwYXRj
aCBhZGQgdGhlIHBhbmVsIGRldmljZSB0cmVlIG5vZGUgZm9yIFM2RTNIQTIgZGlzcGxheQpjb250
cm9sbGVyIHRvIFRNMiBkdHMuCgpTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dvbiBId2FuZyA8aHVtYW4u
aHdhbmdAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1
bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBIb2VnZXVuIEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5n
LmNvbT4KVGVzdGVkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KLS0t
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMgfCAxMiArKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIuZHRzIGIvYXJjaC9hcm02
NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIuZHRzCmluZGV4IGRkYmEyZjguLjZkMzYy
ZjkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0y
LmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMi5kdHMK
QEAgLTE4LDYgKzE4LDE4IEBACiAJY29tcGF0aWJsZSA9ICJzYW1zdW5nLHRtMiIsICJzYW1zdW5n
LGV4eW5vczU0MzMiOwogfTsKIAorJmRzaSB7CisJcGFuZWxAMCB7CisJCWNvbXBhdGlibGUgPSAi
c2Ftc3VuZyxzNmUzaGEyIjsKKwkJcmVnID0gPDA+OworCQl2ZGQzLXN1cHBseSA9IDwmbGRvMjdf
cmVnPjsKKwkJdmNpLXN1cHBseSA9IDwmbGRvMjhfcmVnPjsKKwkJcmVzZXQtZ3Bpb3MgPSA8Jmdw
ZzAgMCBHUElPX0FDVElWRV9MT1c+OworCQllbmFibGUtZ3Bpb3MgPSA8JmdwZjEgNSBHUElPX0FD
VElWRV9ISUdIPjsKKwkJdGUtZ3Bpb3MgPSA8JmdwZjEgMyBHUElPX0FDVElWRV9ISUdIPjsKKwl9
OworfTsKKwogJmhzaTJjXzkgewogCXN0YXR1cyA9ICJva2F5IjsKIAotLSAKMS45LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
