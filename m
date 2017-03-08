From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v5 4/5] arm64: dts: exynos: Remove the OF graph from DSI node
Date: Wed, 08 Mar 2017 13:54:11 +0900
Message-ID: <1488948852-5380-5-git-send-email-hoegeun.kwon@samsung.com>
References: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170308045502epcas1p21a483d429e2169b322e40fd833c47f27@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1488948852-5380-1-git-send-email-hoegeun.kwon@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIE9GIGdyYXBoIGlzIG5vdCBuZWVkZWQgYmVjYXVzZSB0aGUgcGFuZWwgaXMgYSBjaGlsZCBv
ZiBkc2kuIFJlbW92ZQp0aGUgcG9ydHMgbm9kZSBpbiBEU0kgbm9kZS4KClNpZ25lZC1vZmYtYnk6
IEhvZWdldW4gS3dvbiA8aG9lZ2V1bi5rd29uQHNhbXN1bmcuY29tPgpSZXZpZXdlZC1ieTogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZGkgU2h5dGkg
PGFuZGkuc2h5dGlAc2Ftc3VuZy5jb20+Ci0tLQogYXJjaC9hcm02NC9ib290L2R0cy9leHlub3Mv
ZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kgfCAxNCAtLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZXh5bm9zL2V4eW5vczU0MzMtdG0yLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9l
eHlub3MvZXh5bm9zNTQzMy10bTItY29tbW9uLmR0c2kKaW5kZXggZTMxZTIwYy4uNzdiYTIzOCAx
MDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTItY29t
bW9uLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTIt
Y29tbW9uLmR0c2kKQEAgLTMwMywyMCArMzAzLDYgQEAKIAlzYW1zdW5nLHBsbC1jbG9jay1mcmVx
dWVuY3kgPSA8MjQwMDAwMDA+OwogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CiAJcGluY3Ry
bC0wID0gPCZ0ZV9pcnE+OwotCi0JcG9ydHMgewotCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLQkJ
I3NpemUtY2VsbHMgPSA8MD47Ci0KLQkJcG9ydEAxIHsKLQkJCXJlZyA9IDwxPjsKLQotCQkJZHNp
X291dDogZW5kcG9pbnQgewotCQkJCXNhbXN1bmcsYnVyc3QtY2xvY2stZnJlcXVlbmN5ID0gPDUx
MjAwMDAwMD47Ci0JCQkJc2Ftc3VuZyxlc2MtY2xvY2stZnJlcXVlbmN5ID0gPDE2MDAwMDAwPjsK
LQkJCX07Ci0JCX07Ci0JfTsKIH07CiAKICZoZG1pIHsKLS0gCjEuOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
