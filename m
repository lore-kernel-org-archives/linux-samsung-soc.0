From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] drm/exynos: Suspend/resume is unused if !PM
Date: Thu, 24 Sep 2015 12:14:13 +0200
Message-ID: <1443089655-15352-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClByb3RlY3QgdGhlIHN1
c3BlbmQgYW5kIHJlc3VtZSBjYWxsYmFja3Mgd2l0aCBhbiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQ
Cmd1YXJkIHRvIGF2b2lkICJkZWZpbmVkIGJ1dCBub3QgdXNlZCIgd2FybmluZ3MuCgpTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMKaW5k
ZXggZjBhNTgzOWJkMjI2Li5lMDdhMGZlMTY0MzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZHJ2LmMKQEAgLTMwNCw2ICszMDQsNyBAQCBpbnQgZXh5bm9zX2F0b21pY19jb21t
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRl
LAogCXJldHVybiAwOwogfQogCisjaWZkZWYgQ09ORklHX1BNX1NMRUVQCiBzdGF0aWMgaW50IGV4
eW5vc19kcm1fc3VzcGVuZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBwbV9tZXNzYWdlX3Qgc3Rh
dGUpCiB7CiAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKQEAgLTM0MCw2ICszNDEs
NyBAQCBzdGF0aWMgaW50IGV4eW5vc19kcm1fcmVzdW1lKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
CiAKIAlyZXR1cm4gMDsKIH0KKyNlbmRpZgogCiBzdGF0aWMgaW50IGV4eW5vc19kcm1fb3Blbihz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCiB7Ci0tIAoyLjUu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
