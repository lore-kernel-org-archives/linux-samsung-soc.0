From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 0/3] drm/exynos/gsc: Support the rotate hardware limits of gsc
Date: Fri, 01 Sep 2017 10:47:53 +0900
Message-ID: <1504230476-1878-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170901014757epcas1p19de712f2cea2e48b3d42b878743dd9f8@epcas1p1.samsung.com>
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
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gYWxsLAoKVGhlIGdzY2FsZXIgaGFzIGhhcmR3YXJlIHJvdGF0aW9uIGxpbWl0cy4gU28g
dGhpcyBwYXRjaCBzZXQgc3VwcG9ydAp0aGUgcm90YXRlIGhhcmR3YXJlIGxpbWl0cyBvZiBnc2Mu
CgpCZXN0IHJlZ2FyZHMsCkhvZWdldW4KCkhvZWdldW4gS3dvbiAoMyk6CiAgQVJNOiBkdHM6IGV4
eW5vczogQWRkIHRoZSBoYXJkd2FyZSByb3RhdGlvbiBsaW1pdHMgZm9yIGdzYwogIGFybTY0OiBk
dHM6IGV4eW5vczogQWRkIHRoZSBoYXJkd2FyZSByb3RhdGlvbiBsaW1pdHMgZm9yIGdzYwogIGRy
bS9leHlub3MvZ3NjOiBBZGQgcm90YXRpb24gaGFyZHdhcmUgbGltaXRzIG9mIGdzY2FsZXIKCiBh
cmNoL2FybS9ib290L2R0cy9leHlub3M1MjUwLmR0c2kgICAgICAgICAgfCAgOCArKysrCiBhcmNo
L2FybS9ib290L2R0cy9leHlub3M1NDIwLmR0c2kgICAgICAgICAgfCAgNCArKwogYXJjaC9hcm02
NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy5kdHNpIHwgIDYgKysrCiBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMgICAgfCA2MyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0KIGluY2x1ZGUvdWFwaS9kcm0vZXh5bm9zX2RybS5oICAgICAgICAgICAgICB8ICAy
ICsKIDUgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgot
LSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
