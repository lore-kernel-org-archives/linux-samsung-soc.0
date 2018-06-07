From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/9] drm/exynos: gsc: Increase Exynos5433 buffer width
 alignment to 16 pixels
Date: Thu, 07 Jun 2018 13:06:11 +0200
Message-ID: <20180607110614.335-7-m.szyprowski@samsung.com>
References: <20180607110614.335-1-m.szyprowski@samsung.com>
 <CGME20180607110622eucas1p279bc9784770d10df8c7d5330bac154ad@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20180607110614.335-1-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SW52ZXN0aWdhdGlvbiByZXZlYWxlZCB0aGF0IEdTY2FsZXIgaGFyZHdhcmUgcmVxdWlyZXMgdGhl
IHJlYWwgYnVmZmVyIHdpZHRoCihwaXRjaCkgdG8gYmUgYWxpZ25lZCB0byAxNiBwaXhlbHMuCgpT
aWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2dzYy5jCmluZGV4IGVlMjdmN2ZkYzdhYi4uOTg4YjM5MWM4ODZh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dzYy5jCkBAIC0xMzQwLDcgKzEz
NDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9leHlub3NfaXBwX2xpbWl0IGdzY181NDIw
X2xpbWl0c1tdID0gewogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZXh5bm9zX2lwcF9s
aW1pdCBnc2NfNTQzM19saW1pdHNbXSA9IHsKLQl7IElQUF9TSVpFX0xJTUlUKEJVRkZFUiwgLmgg
PSB7IDMyLCA4MTkxLCAyIH0sIC52ID0geyAxNiwgODE5MSwgMiB9KSB9LAorCXsgSVBQX1NJWkVf
TElNSVQoQlVGRkVSLCAuaCA9IHsgMzIsIDgxOTEsIDE2IH0sIC52ID0geyAxNiwgODE5MSwgMiB9
KSB9LAogCXsgSVBQX1NJWkVfTElNSVQoQVJFQSwgLmggPSB7IDE2LCA0ODAwLCAxIH0sIC52ID0g
eyA4LCAzMzQ0LCAxIH0pIH0sCiAJeyBJUFBfU0laRV9MSU1JVChST1RBVEVELCAuaCA9IHsgMzIs
IDIwNDcgfSwgLnYgPSB7IDgsIDgxOTEgfSkgfSwKIAl7IElQUF9TQ0FMRV9MSU1JVCguaCA9IHsg
KDEgPDwgMTYpIC8gMTYsICgxIDw8IDE2KSAqIDggfSwKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
