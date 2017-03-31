From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv6 04/10] ARM: dts: exynos: add HDMI controller phandle to
 exynos4.dtsi
Date: Fri, 31 Mar 2017 14:20:30 +0200
Message-ID: <20170331122036.55706-5-hverkuil@xs4all.nl>
References: <20170331122036.55706-1-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170331122036.55706-1-hverkuil@xs4all.nl>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Patrice.chotard@st.com, Javier Martinez Canillas <javier@osg.samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSGFucyBWZXJrdWlsIDxoYW5zLnZlcmt1aWxAY2lzY28uY29tPgoKQWRkIHRoZSBuZXcg
aGRtaSBwaGFuZGxlIHRvIGV4eW5vczQuZHRzaS4gVGhpcyBwaGFuZGxlIGlzIG5lZWRlZCBieSB0
aGUKczVwLWNlYyBkcml2ZXIgdG8gaW5pdGlhbGl6ZSB0aGUgQ0VDIG5vdGlmaWVyIGZyYW1ld29y
ay4KClRlc3RlZCB3aXRoIG15IE9kcm9pZCBVMy4KClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3Vp
bCA8aGFucy52ZXJrdWlsQGNpc2NvLmNvbT4KVGVzdGVkLWJ5OiBNYXJlayBTenlwcm93c2tpIDxt
LnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CkNDOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5l
bC5vcmcKQ0M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNDOiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNC5kdHNp
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9leHlub3M0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0LmR0
c2kKaW5kZXggMThkZWYxYzc3NGQ1Li44NGZjZGZmMTQwYWUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2V4eW5vczQuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M0LmR0
c2kKQEAgLTc3MSw2ICs3NzEsNyBAQAogCQljbG9ja3MgPSA8JmNsb2NrIENMS19IRE1JX0NFQz47
CiAJCWNsb2NrLW5hbWVzID0gImhkbWljZWMiOwogCQlzYW1zdW5nLHN5c2Nvbi1waGFuZGxlID0g
PCZwbXVfc3lzdGVtX2NvbnRyb2xsZXI+OworCQloZG1pLXBoYW5kbGUgPSA8JmhkbWk+OwogCQlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwogCQlwaW5jdHJsLTAgPSA8JmhkbWlfY2VjPjsKIAkJ
c3RhdHVzID0gImRpc2FibGVkIjsKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
