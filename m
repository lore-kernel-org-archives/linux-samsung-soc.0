From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v2] drm/exynos: dsi: Remove bridge node reference in removal
Date: Fri, 26 May 2017 10:02:01 +0900
Message-ID: <1495760521-330-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170526010217epcas1p3bfb8d9f733bcdafb4209d917fdf28dd8@epcas1p3.samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

U2luY2UgYnJpZGdlIG5vZGUgaXMgcmVmZXJlbmNlZCBkdXJpbmcgaW4gdGhlIHByb2JlLCBpdCBz
aG91bGQgYmUKcmVsZWFzZWQgb24gcmVtb3ZhbC4KClN1Z2dlc3RlZC1ieTogQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogSG9lZ2V1biBLd29uIDxob2Vn
ZXVuLmt3b25Ac2Ftc3VuZy5jb20+Ci0tLQpIaSBJbmtpLAoKVGhpcyBwYXRjaCBzZWVtcyB0byBo
YXZlIGJlZW4gZm9yZ290dGVuLi4uIDopCgpDaGFuZ2VzIGZvciBWMjoKCi0gQ2hlY2tlZCBmb3Ig
cmViYXNlIDQuMTItcmMyCgpCZXN0IHJlZ2FyZHMsCkhvZWdldW4KCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKaW5kZXggNjk4
YTgyNC4uYTExYjc5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwpA
QCAtMTgwNSw2ICsxODA1LDEwIEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiBzdGF0aWMgaW50IGV4eW5vc19kc2lfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CisJc3RydWN0IGV4eW5vc19kc2kgKmRzaSA9
IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCisJb2Zfbm9kZV9wdXQoZHNpLT5icmlkZ2Vf
bm9kZSk7CisKIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7CiAKIAljb21wb25lbnRf
ZGVsKCZwZGV2LT5kZXYsICZleHlub3NfZHNpX2NvbXBvbmVudF9vcHMpOwotLSAKMS45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
