From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 6/7] arm64: dts: exynos: Remove the OF graph from DSI node
Date: Thu, 02 Mar 2017 19:20:18 +0900
Message-ID: <1488450019-6482-7-git-send-email-hoegeun.kwon@samsung.com>
References: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170302102113epcas5p466a64e5f55c008ceec957b1432a30173@epcas5p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488450019-6482-1-git-send-email-hoegeun.kwon@samsung.com>
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
ZiBkc2kuIFNvCnJlbW92ZWQgdGhlIHBvcnRzIG5vZGUgaW4gRFNJIG5vZGUuCgpTaWduZWQtb2Zm
LWJ5OiBIb2VnZXVuIEt3b24gPGhvZWdldW4ua3dvbkBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290
L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kgfCAxNCAtLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKaW5kZXggZTMxZTIw
Yy4uNzdiYTIzOCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9z
NTQzMy10bTItY29tbW9uLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5
bm9zNTQzMy10bTItY29tbW9uLmR0c2kKQEAgLTMwMywyMCArMzAzLDYgQEAKIAlzYW1zdW5nLHBs
bC1jbG9jay1mcmVxdWVuY3kgPSA8MjQwMDAwMDA+OwogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7CiAJcGluY3RybC0wID0gPCZ0ZV9pcnE+OwotCi0JcG9ydHMgewotCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKLQkJI3NpemUtY2VsbHMgPSA8MD47Ci0KLQkJcG9ydEAxIHsKLQkJCXJlZyA9IDwx
PjsKLQotCQkJZHNpX291dDogZW5kcG9pbnQgewotCQkJCXNhbXN1bmcsYnVyc3QtY2xvY2stZnJl
cXVlbmN5ID0gPDUxMjAwMDAwMD47Ci0JCQkJc2Ftc3VuZyxlc2MtY2xvY2stZnJlcXVlbmN5ID0g
PDE2MDAwMDAwPjsKLQkJCX07Ci0JCX07Ci0JfTsKIH07CiAKICZoZG1pIHsKLS0gCjEuOS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
