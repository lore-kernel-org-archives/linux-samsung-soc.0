From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drm/exynos: atomic check only enabled crtc states
Date: Wed, 9 Dec 2015 07:51:18 -0300
Message-ID: <566807A6.3070701@osg.samsung.com>
References: <CABxcv=kKWbS5bWNE--wP8nuFEkTR=2vghQpAo-AtnYvm34tnow@mail.gmail.com>
 <1448607451-13784-1-git-send-email-a.hajda@samsung.com>
 <565853DE.602@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <565853DE.602@osg.samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@dowhile0.org>, Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gSW5raSwKCk9uIDExLzI3LzIwMTUgMTA6MDAgQU0sIEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyB3cm90ZToKPiBIZWxsbyBBbmRyemVqLAo+IAo+IE9uIDExLzI3LzIwMTUgMDM6NTcgQU0s
IEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4+IFNpbmNlIGF0b21pYyBjaGVjayBpcyBjYWxsZWQgYWxz
byBmb3IgZGlzYWJsZWQgY3J0Y3MgaXQgc2hvdWxkIHNraXAKPj4gbW9kZSBjaGVja2luZyBhcyBp
dCBjYW4gYmUgdW5pbml0aWFsaXplZC4gVGhlIHBhdGNoIGZpeGVzIGl0Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+PiBTdWdnZXN0ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4+IC0tLQo+PiBIaSBK
YXZpZXIsCj4+Cj4+IENvdWxkIHlvdSBjaGVjayB3aXRoIHRoaXMgcGF0Y2guCj4+Cj4gCj4gVGhl
IHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBJIHJlcG9ydGVkLiBUaGUgZGlzcGxheSBtb2RlIGlzIGNv
cnJlY3RseSBzZXQKPiB3aXRoIGFuZCB3aXRob3V0IGEgSERNSSBtb25pdG9yIHBsdWdnZWQuIFNv
IG9uIGFuIEV4eW5vczU4MDAgUGVhY2ggUGk6Cj4gCj4gVGVzdGVkLWJ5OiBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgPGphdmllckBvc2cuc2Ftc3VuZy5jb20+Cj4gCgpUaGlzIHBhdGNoIHdhcyBu
ZXZlciBwaWNrZWQgYnV0IGZpeGVzIGFuZCBpbXBvcnRhbnQKYnVnIGludHJvZHVjZWQgaW4gdGhl
IHY0LjQgbWVyZ2Ugd2luZG93IHNvIGl0IHNob3VsZApiZSBzZW50IGR1cmluZyB0aGUgdjQuNC1y
YyBjeWNsZS4KCkJlc3QgcmVnYXJkcywKLS0gCkphdmllciBNYXJ0aW5leiBDYW5pbGxhcwpPcGVu
IFNvdXJjZSBHcm91cApTYW1zdW5nIFJlc2VhcmNoIEFtZXJpY2EKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
