From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 6/6] drm/exynos: g2d: simplify g2d_free_runqueue_node()
Date: Tue, 27 Sep 2016 17:59:57 +0200
Message-ID: <1474991997-6350-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1474991997-6350-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1474991997-6350-1-git-send-email-tjakobi@math.uni-bielefeld.de>
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

VGhlIGZ1bmN0aW9uIGlzIG5ldmVyIGNhbGxlZCB3aXRoIHplcm8gJ3J1bnF1ZXVlX25vZGUnLgoK
U2lnbmVkLW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRoLnVuaS1iaWVsZWZlbGQu
ZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jIHwgMyAtLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9nMmQuYwppbmRleCAxYTAwMGMxLi5mYTI1YzdmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2cyZC5jCkBAIC04NDUsOSArODQ1LDYgQEAgc3RhdGljIHZvaWQgZzJk
X2ZyZWVfcnVucXVldWVfbm9kZShzdHJ1Y3QgZzJkX2RhdGEgKmcyZCwKIHsKIAlzdHJ1Y3QgZzJk
X2NtZGxpc3Rfbm9kZSAqbm9kZTsKIAotCWlmICghcnVucXVldWVfbm9kZSkKLQkJcmV0dXJuOwot
CiAJbXV0ZXhfbG9jaygmZzJkLT5jbWRsaXN0X211dGV4KTsKIAkvKgogCSAqIGNvbW1hbmRzIGlu
IHJ1bl9jbWRsaXN0IGhhdmUgYmVlbiBjb21wbGV0ZWQgc28gdW5tYXAgYWxsIGdlbQotLSAKMi43
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
