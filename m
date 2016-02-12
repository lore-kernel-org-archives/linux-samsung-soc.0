From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/4] drm/exynos: cleanup of header files
Date: Fri, 12 Feb 2016 13:13:55 +0100
Message-ID: <1455279239-13609-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKClRoaXMgc21hbGwgY2xlYW51cCBzZXJpZXMgaXMgYmFzZWQgb24gZXh5bm9zLWRy
bS1uZXh0LgoKUmVnYXJkcwpBbmRyemVqCgoKQW5kcnplaiBIYWpkYSAoNCk6CiAgZHJtL2V4eW5v
czogcmVtb3ZlIHN0cnVjdCBleHlub3NfZHJtX3BhbmVsX2luZm8KICBkcm0vZXh5bm9zL2ZpbWM6
IHJlbW92ZSB1bnVzZWQgY2FtZXJhIGludGVyZmFjZSBwb2xhcml6YXRpb24gY29kZQogIGRybS9l
eHlub3M6IHJlbW92ZSBwbGF0Zm9ybSBkYXRhIHN0cnVjdHVyZXMgYW5kCiAgICBpbmNsdWRlL2Ry
bS9leHlub3NfZHJtLmgKICBkcm0vZXh5bm9zOiB1c2UgYXJjaCBpbmRlcGVuZGVudCB0eXBlcyBp
biB1YXBpIGhlYWRlcgoKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zN19kcm1fZGVjb24u
YyB8ICAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcF9jb3JlLmMgICAgfCAg
IDcgKy0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUuaCAgICB8ICAgNCAr
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYyAgIHwgIDI4IC0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jICAgfCAgIDEgLQog
aW5jbHVkZS9kcm0vZXh5bm9zX2RybS5oICAgICAgICAgICAgICAgICAgIHwgMTAxIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL3VhcGkvZHJtL2V4eW5vc19kcm0uaCAgICAg
ICAgICAgICAgfCAgMjYgKysrKy0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgMTUxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2V4eW5v
c19kcm0uaAoKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
