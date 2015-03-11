From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3 14/17] exynos: fimg2d: fix comment for
 G2D_COEFF_MODE_GB_COLOR
Date: Wed, 11 Mar 2015 22:11:03 +0900
Message-ID: <55003EE7.3060904@samsung.com>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1424787655-10739-15-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1424787655-10739-15-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, robclark@freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGkgVG9iaWFzLAoKT24gMjAxNeuFhCAwMuyblCAyNOydvCAyMzoyMCwgVG9iaWFzIEpha29iaSB3
cm90ZToKPiBUaGUgY29lZmZpY2llbnQgbW9kZSBlbmFibGVzIHVzZSBvZiBnbG9iYWwgY29sb3Is
IG5vdCBhbHBoYS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2JpQG1h
dGgudW5pLWJpZWxlZmVsZC5kZT4KPiAtLS0KPiAgZXh5bm9zL2V4eW5vc19maW1nMmQuaCB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2V4eW5vcy9leHlub3NfZmltZzJkLmggYi9leHlub3MvZXh5bm9zX2ZpbWcy
ZC5oCj4gaW5kZXggZGJjYjc2NC4uNDE4NzU3ZiAxMDA2NDQKPiAtLS0gYS9leHlub3MvZXh5bm9z
X2ZpbWcyZC5oCj4gKysrIGIvZXh5bm9zL2V4eW5vc19maW1nMmQuaAo+IEBAIC0xNTksNyArMTU5
LDcgQEAgZW51bSBlX2cyZF9jb2VmZl9tb2RlIHsKPiAgCUcyRF9DT0VGRl9NT0RFX0RTVF9DT0xP
UiwKPiAgCS8qIEdsb2JhbCBBbHBoYSA6IFNldCBieSBBTFBIQV9SRUcoMHg2MTgpICovCj4gIAlH
MkRfQ09FRkZfTU9ERV9HQl9BTFBIQSwKPiAtCS8qIEdsb2JhbCBBbHBoYSA6IFNldCBieSBBTFBI
QV9SRUcoMHg2MTgpICovCj4gKwkvKiBHbG9iYWwgQ29sb3IgOiBTZXQgYnkgQUxQSEFfUkVHKDB4
NjE4KSAqLwoKQWN0dWFsbHksIGFib3ZlIHJlZ2lzdGVyIHNldHMgbm90IG9ubHkgZ2xvYmFsIGNv
bG9yIHZhbHVlIGJ1dCBhbHNvCmdsb2JhbCBhbHBoYSB2YWx1ZS4gQmVsb3cgc2hvd3MgZmllbGRz
IG9mIHRoZSByZWdpc3RlciwKCkNvbG9yVmFsdWUgIFszMTo4XSAgIEdsb2JhbCBjb2xvciB2YWx1
ZSAoUkdCIG9yZGVyKQpBbHBoYVZhbHVlIFs3OjBdICBHbG9iYWwgYWxwaGEgdmFsdWUKClNvIHJp
Z2h0IGNvbW1lbnQgd291bGQgYmUgIkdsb2JhbCBDb2xvciBhbmQgR2xvYmFsIEFscGhhIi4KClRo
YW5rcywKSW5raSBEYWUKCj4gIAlHMkRfQ09FRkZfTU9ERV9HQl9DT0xPUiwKPiAgCS8qICgxLVNS
QyBhbHBoYSkvRFNUIEFscGhhICovCj4gIAlHMkRfQ09FRkZfTU9ERV9ESVNKT0lOVF9TLAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
