From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] GPU-DRM-Exynos: Delete an unnecessary check before the
 function call "vunmap"
Date: Thu, 21 Jul 2016 19:42:33 +0200
Message-ID: <a5a79711-10a3-e304-a897-892ebdf2ff9f@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54D28870.3060400@users.sourceforge.net>
 <54D329D0.7050006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54D329D0.7050006@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUaHUsIDIxIEp1bCAyMDE2IDE5OjIzOjI1ICswMjAwCgpUaGUgdnVubWFwKCkgZnVuY3Rpb24g
cGVyZm9ybXMgYWxzbyBpbnB1dCBwYXJhbWV0ZXIgdmFsaWRhdGlvbi4KVGh1cyB0aGUgdGVzdCBh
cm91bmQgdGhlIGNhbGwgaXMgbm90IG5lZWRlZC4KClRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5
IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgoKU2lnbmVkLW9mZi1ieTogTWFya3VzIEVs
ZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9mYmRldi5jCmluZGV4IGRkMDkxMTcuLjRjZmIzOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9mYmRldi5jCkBAIC0yNjksOCArMjY5LDcgQEAgc3RhdGljIHZvaWQg
ZXh5bm9zX2RybV9mYmRldl9kZXN0cm95KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJc3RydWN0
IGV4eW5vc19kcm1fZ2VtICpleHlub3NfZ2VtID0gZXh5bm9zX2ZiZC0+ZXh5bm9zX2dlbTsKIAlz
dHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsKIAotCWlmIChleHlub3NfZ2VtLT5rdmFkZHIpCi0J
CXZ1bm1hcChleHlub3NfZ2VtLT5rdmFkZHIpOworCXZ1bm1hcChleHlub3NfZ2VtLT5rdmFkZHIp
OwogCiAJLyogcmVsZWFzZSBkcm0gZnJhbWVidWZmZXIgYW5kIHJlYWwgYnVmZmVyICovCiAJaWYg
KGZiX2hlbHBlci0+ZmIgJiYgZmJfaGVscGVyLT5mYi0+ZnVuY3MpIHsKLS0gCjIuOS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
