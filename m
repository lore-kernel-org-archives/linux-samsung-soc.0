From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 2/2] drm/exynos: fix pending update handling
Date: Fri, 23 Sep 2016 15:28:02 +0300
Message-ID: <20160923122802.GB30511@joana>
References: <1474618524-8916-1-git-send-email-a.hajda@samsung.com>
 <CGME20160923081544eucas1p1a734de81448b36af65196f982bee5e27@eucas1p1.samsung.com>
 <1474618524-8916-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1474618524-8916-3-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

MjAxNi0wOS0yMyBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPjoKCj4gRXh5bm9z
IERSTSBkZXZpY2VzIHVwZGF0ZSB0aGVpciByZWdpc3RlcnMgYXQgdmJsYW5rIHRpbWUuIEV4eW5v
cy1EUk0gdXNlcwo+IGN1c3RvbSBtZWNoYW5pc20gdG8gd2FpdCBmb3IgdmJsYW5rLiBUaGlzIG1l
Y2hhbmlzbSBpcyBlcnJvciBwcm9uZSAtCj4gdmFyaWFibGVzIGFyZSBub3QgdXBkYXRlZCBhdG9t
aWNhbGx5LiBBcyBhIHJlc3VsdCBpbiBjZXJ0YWluIGNpcmN1bXN0YW5jZXMKPiB1c2VyIHNwYWNl
IGNhbiB0cnkgdG8gZnJlZSBidWZmZXJzIHdoaWNoIGFyZSBzdGlsbCBpbiB1c2UgYnkgaGFyZHdh
cmUsCj4gaW4gc3VjaCBjYXNlcyBJT01NVSBjYW4gdGhyb3cgT09QUy4KPiBUaGUgcGF0Y2ggaW5z
dGVhZCBvZiBmaXhpbmcgdGhlIG1lY2hhbmlzbSByZXBsYWNlcyBpdCB3aXRoIGRybSBjb3JlIGhl
bHBlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fY3J0Yy5jIHwg
MTYgKy0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYu
YyAgfCA0NCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmggIHwgIDIgLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEd1c3Rhdm8gUGFk
b3ZhbiA8Z3VzdGF2by5wYWRvdmFuQGNvbGxhYm9yYS5jby51az4KCkd1c3Rhdm8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
