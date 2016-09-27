From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/6] drm/exynos: g2d: rework sleep and runtime PM
Date: Tue, 27 Sep 2016 17:50:05 +0200
Message-ID: <1474991411-2937-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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
To: linux-samsung-soc@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gZXZlcnlvbmUsCgphcyBkaXNjdXNzZWQgd2l0aCBNYXJlayBJIGhhdmUgYnJva2VuIGRv
d24gbXkgaW5pdGlhbCBwYXRjaCBpbnRvIHNtYWxsZXIgcGllY2VyLgoKQW55d2F5LCB0aGlzIHNl
cmllcyBmaXhlcyBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBieSBjb21taXQKYjA1OTg0ZTIxYTdl
MDAwYmY1MDc0YWNlMDBkN2E1NzQ5NDRiMmMxNi4KCldpdGggYmVzdCB3aXNoZXMsClRvYmlhcwoK
VG9iaWFzIEpha29iaSAoNik6CiAgUmV2ZXJ0ICJkcm0vZXh5bm9zOiBnMmQ6IGZpeCBzeXN0ZW0g
YW5kIHJ1bnRpbWUgcG0gaW50ZWdyYXRpb24iCiAgZHJtL2V4eW5vczogZzJkOiBtb3ZlIFBNIG1h
bmFnZW1lbnQgdG8gcnVucXVldWUgd29ya2VyCiAgZHJtL2V4eW5vczogZzJkOiByZW1vdmUgcnVu
cXVldWUgbm9kZXMgaW4gZzJkX3tjbG9zZSxyZW1vdmV9KCkKICBkcm0vZXh5bm9zOiBnMmQ6IHdh
aXQgZm9yIGVuZ2luZSB0byBmaW5pc2gKICBkcm0vZXh5bm9zOiBnMmQ6IHVzZSBhdXRvc3VzcGVu
ZCBtb2RlIGZvciBQTSBydW50aW1lCiAgZHJtL2V4eW5vczogZzJkOiBzaW1wbGlmeSBnMmRfZnJl
ZV9ydW5xdWV1ZV9ub2RlKCkKCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJk
LmMgfCAyMzcgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxODggaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCgotLSAKMi43LjMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
