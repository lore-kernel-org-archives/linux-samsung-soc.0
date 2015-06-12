From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 3/9] exynos/fimg2d: simplify g2d_fini()
Date: Fri, 12 Jun 2015 20:15:08 +0200
Message-ID: <1434132914-3150-4-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1434132914-3150-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, gustavo.padovan@collabora.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

ZnJlZSgpaW5nIGEgbnVsbHB0ciBpcyBhIG5vb3AsIHNvIHJlbW92ZSB0aGUgY2hlY2suCgpTaWdu
ZWQtb2ZmLWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2JpQG1hdGgudW5pLWJpZWxlZmVsZC5kZT4K
LS0tCiBleHlub3MvZXh5bm9zX2ZpbWcyZC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9leHlub3MvZXh5bm9zX2Zp
bWcyZC5jIGIvZXh5bm9zL2V4eW5vc19maW1nMmQuYwppbmRleCA1ZWE0MmU2Li4yNGEwNmQwIDEw
MDY0NAotLS0gYS9leHlub3MvZXh5bm9zX2ZpbWcyZC5jCisrKyBiL2V4eW5vcy9leHlub3NfZmlt
ZzJkLmMKQEAgLTI1NCw4ICsyNTQsNyBAQCBzdHJ1Y3QgZzJkX2NvbnRleHQgKmcyZF9pbml0KGlu
dCBmZCkKIAogdm9pZCBnMmRfZmluaShzdHJ1Y3QgZzJkX2NvbnRleHQgKmN0eCkKIHsKLQlpZiAo
Y3R4KQotCQlmcmVlKGN0eCk7CisJZnJlZShjdHgpOwogfQogCiAvKioKLS0gCjIuMC41CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
