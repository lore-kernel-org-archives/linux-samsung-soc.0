From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2 14/22] drm/exynos: fimd: fix dma burst size setting for
 small plane size
Date: Mon, 30 Nov 2015 15:40:32 +0000
Message-ID: <CAPj87rN7vgTUkUqY+qNN7NafF-aK8fYQWdFLokyeHum6q5rH3w@mail.gmail.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
 <1448891617-18830-15-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448891617-18830-15-git-send-email-m.szyprowski@samsung.com>
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
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAzMCBOb3ZlbWJlciAyMDE1IGF0IDEzOjUzLCBNYXJlayBTenlwcm93c2tpIDxtLnN6
eXByb3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+IFRoaXMgcGF0Y2ggZml4ZXMgdHJhc2hlZCBk
aXNwbGF5IG9mIGJ1ZmZlcnMgY3JvcHBlZCB0byB2ZXJ5IHNtYWxsIHdpZHRoLgo+IEV2ZW4gaWYg
RE1BIGlzIHVuc3RhYmxlIGFuZCBjYXVzZXMgdGVhcmluZyB3aGVuIGNoYW5naW5nIHRoZSBidXJz
dCBzaXplLAo+IGl0IGlzIHN0aWxsIGJldHRlciB0aGFuIGRpc3BsYXlpbmcgYSBnYXJiYWdlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcu
Y29tPgoKUmV2aWV3ZWQtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPgoK
Q2hlZXJzLApEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
