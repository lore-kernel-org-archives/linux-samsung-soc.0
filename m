From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: atomic check only enabled crtc states
Date: Fri, 27 Nov 2015 07:57:31 +0100
Message-ID: <1448607451-13784-1-git-send-email-a.hajda@samsung.com>
References: <CABxcv=kKWbS5bWNE--wP8nuFEkTR=2vghQpAo-AtnYvm34tnow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CABxcv=kKWbS5bWNE--wP8nuFEkTR=2vghQpAo-AtnYvm34tnow@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

U2luY2UgYXRvbWljIGNoZWNrIGlzIGNhbGxlZCBhbHNvIGZvciBkaXNhYmxlZCBjcnRjcyBpdCBz
aG91bGQgc2tpcAptb2RlIGNoZWNraW5nIGFzIGl0IGNhbiBiZSB1bmluaXRpYWxpemVkLiBUaGUg
cGF0Y2ggZml4ZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgpTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+Ci0tLQpIaSBKYXZpZXIsCgpDb3VsZCB5b3UgY2hlY2sgd2l0aCB0aGlzIHBhdGNoLgoK
UmVnYXJkcwpBbmRyemVqCgogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMu
YyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMKaW5kZXggYjNiYTI3Zi4uZTY5MzU3MSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2NydGMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jCkBAIC01NSw2ICs1NSw5IEBAIHN0
YXRpYyBpbnQgZXh5bm9zX2NydGNfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywK
IHsKIAlzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpleHlub3NfY3J0YyA9IHRvX2V4eW5vc19jcnRj
KGNydGMpOwogCisJaWYgKCFzdGF0ZS0+ZW5hYmxlKQorCQlyZXR1cm4gMDsKKwogCWlmIChleHlu
b3NfY3J0Yy0+b3BzLT5hdG9taWNfY2hlY2spCiAJCXJldHVybiBleHlub3NfY3J0Yy0+b3BzLT5h
dG9taWNfY2hlY2soZXh5bm9zX2NydGMsIHN0YXRlKTsKIAotLSAKMS45LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
