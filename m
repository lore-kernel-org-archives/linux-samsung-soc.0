From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH] drm/exynos: atomic check only enabled crtc states
Date: Sat, 12 Dec 2015 00:18:29 +0900
Message-ID: <CAAQKjZM4i+PvyTEF9PY-DA44LKqa5dyFHiK-WDe1+hCG2-eXsw@mail.gmail.com>
References: <CABxcv=kKWbS5bWNE--wP8nuFEkTR=2vghQpAo-AtnYvm34tnow@mail.gmail.com>
 <1448607451-13784-1-git-send-email-a.hajda@samsung.com>
 <565853DE.602@osg.samsung.com> <566807A6.3070701@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <566807A6.3070701@osg.samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSmF2aWVyLAoKMjAxNS0xMi0wOSAxOTo1MSBHTVQrMDk6MDAgSmF2aWVyIE1hcnRpbmV6IENh
bmlsbGFzIDxqYXZpZXJAb3NnLnNhbXN1bmcuY29tPjoKPiBIZWxsbyBJbmtpLAo+Cj4gT24gMTEv
MjcvMjAxNSAxMDowMCBBTSwgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIHdyb3RlOgo+PiBIZWxs
byBBbmRyemVqLAo+Pgo+PiBPbiAxMS8yNy8yMDE1IDAzOjU3IEFNLCBBbmRyemVqIEhhamRhIHdy
b3RlOgo+Pj4gU2luY2UgYXRvbWljIGNoZWNrIGlzIGNhbGxlZCBhbHNvIGZvciBkaXNhYmxlZCBj
cnRjcyBpdCBzaG91bGQgc2tpcAo+Pj4gbW9kZSBjaGVja2luZyBhcyBpdCBjYW4gYmUgdW5pbml0
aWFsaXplZC4gVGhlIHBhdGNoIGZpeGVzIGl0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6
ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4+PiBTdWdnZXN0ZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4+PiAtLS0KPj4+IEhpIEphdmllciwKPj4+
Cj4+PiBDb3VsZCB5b3UgY2hlY2sgd2l0aCB0aGlzIHBhdGNoLgo+Pj4KPj4KPj4gVGhlIHBhdGNo
IGZpeGVzIHRoZSBpc3N1ZSBJIHJlcG9ydGVkLiBUaGUgZGlzcGxheSBtb2RlIGlzIGNvcnJlY3Rs
eSBzZXQKPj4gd2l0aCBhbmQgd2l0aG91dCBhIEhETUkgbW9uaXRvciBwbHVnZ2VkLiBTbyBvbiBh
biBFeHlub3M1ODAwIFBlYWNoIFBpOgo+Pgo+PiBUZXN0ZWQtYnk6IEphdmllciBNYXJ0aW5leiBD
YW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KPj4KPgo+IFRoaXMgcGF0Y2ggd2FzIG5l
dmVyIHBpY2tlZCBidXQgZml4ZXMgYW5kIGltcG9ydGFudAo+IGJ1ZyBpbnRyb2R1Y2VkIGluIHRo
ZSB2NC40IG1lcmdlIHdpbmRvdyBzbyBpdCBzaG91bGQKPiBiZSBzZW50IGR1cmluZyB0aGUgdjQu
NC1yYyBjeWNsZS4KCkRvbid0IHdvcnJ5IGFib3V0IHRoYXQuCgpUaGFua3MsCklua2kgRGFlCgo+
Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzCj4gT3BlbiBT
b3VyY2UgR3JvdXAKPiBTYW1zdW5nIFJlc2VhcmNoIEFtZXJpY2EKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
