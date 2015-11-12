From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 04/25] drm/exynos: gsc: fix wrong pm_runtime state
Date: Thu, 12 Nov 2015 13:12:44 -0200
Message-ID: <20151112151244.GC2264@joana>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1447161821-1877-5-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgTWFyZWssCgoyMDE1LTExLTEwIE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1z
dW5nLmNvbT46Cgo+IEZyb206IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+
Cj4gCj4gQXQgcHJvYmUgdGltZSwgZ3NjIGNsb2NrIGlzIG5vdCBlbmFibGVkLCBzbyBwbV9ydW50
aW1lIHN0YXRlIHNob3VsZAo+IGJlIGRlYWN0aXZlLiBTbyB0aGlzIHBhdGNoIHJlbW92ZXMgcG1f
cnVudGltZV9zZXRfYWN0aXZlKCkgZnJvbQo+IGdzY19wcm9iZSgpLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMgfCAxIC0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rh
dm8ucGFkb3ZhbkBjb2xsYWJvcmEuY28udWs+CgoJR3VzdGF2bwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
