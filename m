From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 1/8] drm/exynos: mixer: fix chroma comment in vp_video_buffer()
Date: Tue,  4 Apr 2017 16:02:54 +0200
Message-ID: <1491314581-18086-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1491314581-18086-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1491314581-18086-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGN1cnJlbnQgY29tbWVudCBzb3VuZHMgbGlrZSB0aGUgZGl2aXNpb24gaXMgZG9uZSB0bwpj
b21wZW5zYXRlIGZvciBzb21lIGhhcmR3YXJlIGVycmF0dW0uIEJ1dCB0aGUgY2hyb21hIHBsYW5l
CmhhdmluZyBoYWxmIHRoZSBoZWlnaHQgb2YgdGhlIGx1bWEgcGxhbmUgaXMganVzdCB0aGUgd2F5
Ck5WMTIvTlYyMSBpcyBkZWZpbmVkLCBzbyBjbGFyaWZ5IHRoaXMgYmVoYXZpb3VyLgoKU2lnbmVk
LW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19taXhlci5jCmluZGV4IDk2NDhkZDUuLjc3ZjE4ZjYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfbWl4ZXIuYwpAQCAtNTMzLDcgKzUzMyw3IEBAIHN0YXRpYyB2b2lkIHZwX3Zp
ZGVvX2J1ZmZlcihzdHJ1Y3QgbWl4ZXJfY29udGV4dCAqY3R4LAogCS8qIHNldHRpbmcgc2l6ZSBv
ZiBpbnB1dCBpbWFnZSAqLwogCXZwX3JlZ193cml0ZShyZXMsIFZQX0lNR19TSVpFX1ksIFZQX0lN
R19IU0laRShmYi0+cGl0Y2hlc1swXSkgfAogCQlWUF9JTUdfVlNJWkUoZmItPmhlaWdodCkpOwot
CS8qIGNocm9tYSBoZWlnaHQgaGFzIHRvIHJlZHVjZWQgYnkgMiB0byBhdm9pZCBjaHJvbWEgZGlz
dG9yaW9ucyAqLworCS8qIHRoZSBjaHJvbWEgcGxhbmUgZm9yIE5WMTIvTlYyMSBpcyBoYWxmIHRo
ZSBoZWlnaHQgb2YgdGhlIGx1bWEgcGxhbmUgKi8KIAl2cF9yZWdfd3JpdGUocmVzLCBWUF9JTUdf
U0laRV9DLCBWUF9JTUdfSFNJWkUoZmItPnBpdGNoZXNbMF0pIHwKIAkJVlBfSU1HX1ZTSVpFKGZi
LT5oZWlnaHQgLyAyKSk7CiAKLS0gCjIuNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
