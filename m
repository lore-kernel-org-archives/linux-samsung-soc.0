From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: Fix build after removal of DRM_WAKUP
Date: Wed, 08 Jan 2014 21:15:53 +0900
Message-ID: <52CD4179.2050108@samsung.com>
References: <1389103152-21877-1-git-send-email-broonie@kernel.org>
	<1389103152-21877-2-git-send-email-broonie@kernel.org>
	<20140107161442.GJ4770@phenom.ffwll.local>
	<CAAQKjZPh1UdcPYb-CgpxNZjYbWyvuL2acH0_qiYm18OgGc7xhQ@mail.gmail.com>
	<20140108120341.GQ31886@sirena.org.uk>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140108120341.GQ31886@sirena.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Mark Brown <broonie@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, linaro-kernel@lists.linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8sCgpPbiAyMDE064WEIDAx7JuUIDA47J28IDIxOjAzLCBNYXJrIEJyb3duIHdyb3RlOgo+
IE9uIFdlZCwgSmFuIDA4LCAyMDE0IGF0IDEwOjE1OjI1QU0gKzA5MDAsIElua2kgRGFlIHdyb3Rl
Ogo+PiAyMDE0LzEvOCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ogo+IAo+Pj4gT29w
cywgbG9va3MgbGlrZSBzb21ldGhpbmcgc2xpcHBlZCBwYXN0IGJldHdlZW4gbWUgbWFraW5nIHRo
ZSBwYXRjaGVzIGFuZAo+Pj4gdGhlbSBnZXR0aW5nIG1lcmdlZC4gVGhhbmtzIGZvciB0YWtpbmcg
Y2FyZSBvZiB0aGlzLiBCb3RoIHBhdGNoZXMgYXJlCj4gCj4+IFRoZXNlIHBhdGNoZXMgYWxyZWFk
eSB3ZXJlIHBvc3RlZCBieSBTZXVuZy1Xb28gbGluayBiZWxvdywgYW5kIEkKPj4gbWVyZ2VkIGFs
cmVhZHkgdGhlbSB0byBleHlub3MtZHJtLW5leHQuCj4+ICAgICBodHRwOi8vd3d3LnNwaW5pY3Mu
bmV0L2xpc3RzL2RyaS1kZXZlbC9tc2c1MDkyMS5odG1sCj4gCj4gQXJlIHlvdSBzdXJlPyAgSSBz
dGlsbCBuZWVkIHRob3NlIHBhdGNoZXMgaW4gLW5leHQgYXMgb2YgdG9kYXkuCj4gCgpZZXMsIGF0
IGxlYXN0IGZvciBleHlub3MtZHJtLW5leHQgdHJlZSBvZiBJbmtpLiBJbmtpIHNlbnQgcHVsbCBy
ZXF1ZXN0CmluY2x1ZGluZyBteSBwYXRjaCB5ZXN0ZXJkYXkuCgpCZXN0IFJlZ2FyZHMsCi0gU2V1
bmctV29vIEtpbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
