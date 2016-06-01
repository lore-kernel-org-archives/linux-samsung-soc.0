From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 0/10] Add RK3399 eDP support and fix some bugs to
 analogix_dp driver.
Date: Wed, 1 Jun 2016 09:47:02 +0800
Message-ID: <574E3E96.8090909@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
 <5746C321.9000707@rock-chips.com>
 <4e1c65f8-5a5b-dbb9-35fe-ef09c0758536@osg.samsung.com>
 <5747E648.6020100@rock-chips.com>
 <f6fb95e2-6357-5219-ea08-263c017955e4@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <f6fb95e2-6357-5219-ea08-263c017955e4@osg.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

SmF2aWVyLCBNYXJrLCBJbmtpLCBKaW5nb28KCk9uIDA2LzAxLzIwMTYgMDQ6MDEgQU0sIEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToKPiBIZWxsbyBZYWtpciwKPgo+IE9uIDA1LzI3LzIw
MTYgMDI6MTYgQU0sIFlha2lyIFlhbmcgd3JvdGU6Cj4+IEhpIEphdmllciwKPj4KPj4gT24gMDUv
MjYvMjAxNiAwODo0OCBQTSwgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIHdyb3RlOgo+Pj4gSGVs
bG8gWWFraXIsCj4+Pgo+Pj4gT24gMDUvMjYvMjAxNiAwNTozNCBBTSwgWWFraXIgWWFuZyB3cm90
ZToKPj4+PiBIaSBKYXZpZXIsCj4+Pj4KPj4+PiBPbiAwNS8yNC8yMDE2IDAxOjAxIFBNLCBZYWtp
ciBZYW5nIHdyb3RlOgo+Pj4+PiBIaSBhbGwsCj4+Pj4+Cj4+Pj4+IFRoaXMgc2VyaWVzIGhhdmUg
YmVlbiBwb3N0ZWQgYWJvdXQgb25lIG1vbnRoLCBzdGlsbCBubyBjb21tZW50cywgaGVscCBoZXJl
IDooCj4+Pj4gVGhpcyBzZXJpZXMgd29ya3MgcmlnaHRseSBvbiBSb2NrY2hpcCBwbGF0Zm9ybSwg
YW5kIG1vc3Qgb2YgdGhlbSBoYXZlbid0IHRvdWNoIHRoZQo+Pj4+IGNvbW1vbiBhbmFsb2dpeF9k
cCBkcml2ZXIgKGV4Y2VwdCBmb3IgdGhlIGhvdHBsdWcgZml4ZWQpLiBTbyBpIGd1ZXNzIEV4eW5v
cyBwbGF0Zm9ybQo+Pj4+IHNob3VsZCBhbHNvIGhhcHB5IHdpdGggdGhpcyBjaGFuZ2VzLgo+Pj4+
Cj4+Pj4gQnV0IG5vdCBzdXJlIGFib3V0IHRoYXQuIFNvLCBpcyBpdCBwb3NzaWJsZSB0aGF0IHlv
dSBjb3VsZCBoZWxwIHRvIGNoZWNrIHRoaXMgb24gRXh5bm9zCj4+Pj4gQ2hyb21lYm9vaywgaWYg
c28gaSB3b3VsZCBiZSB2ZXJ5IGdyYXRlZnVsIGFib3V0IHRoYXQuCj4+Pj4KPj4+IE9mIGNvdXJz
ZSwgSScgbGwgdGVzdC4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIG1lIGEgYnJhbmNoIHRoYXQg
SSBjYW4KPj4+IHB1bGwgZGlyZWN0bHkgdG8gYXZvaWQgY2hlcnJ5LXBpY2tpbmcgYWxsIHRoZSBw
YXRjaGVzIGZyb20gdGhlIGxpc3Q/Cj4+PiAgICAKPj4gQWgsIHRoYW5rcyBhIGxvdCwgSSBkbyBo
YXZlIGEgdHJlZSBodHRwczovL2dpdGh1Yi5jb20veWFraXItWWFuZy9saW51eC90cmVlL2Zyb21s
aXN0LzMzOTktZWRwCj4+Cj4gSSB0ZXN0ZWQgeW91ciBicmFuY2ggb24gYW4gRXh5bm9zNTgwMCBQ
ZWFjaCBQaSBDaHJvbWVib29rIGFuZCBkaXNwbGF5Cj4gaXMgd29ya2luZyBjb3JyZWN0bHkuIFNv
IGZlZWwgZnJlZSB0byBhZGQgZm9yIHRoZSB3aG9sZSBzZXJpZXM6Cj4KPiBUZXN0ZWQtYnk6IEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KSGkgSmF2aWVy
LAoKVGhhbmsgeW91IHZlcnkgbXVjaCwgaXQncyBncmVhdCB0byBoZWFyIHRoYXQsIGFuZCBtYWtl
IGEgYmlnIHN0ZXAgCmZvcndhcmQuICAgOi1ECgoKSGkgTWFyaywgSW5raSwgSmluZ29vCgpUaG9z
ZSBwYXRjaGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gRXh5bm9zIGFuZCBSb2NrY2hpcCBwbGF0Zm9y
bSByaWdodGx5LCBhbmQKClRoaXMgcGF0Y2hlcyBoYXZlIGJlZW4gdG91Y2hlZCBzb21lIHJvY2tj
aGlwX2RybSBhbmQgYW5hbG9naXhfZHAgY29yZQpjb2RlLCBpdCB3b3VsZCBiZSBncmVhdCB0byBn
ZXQgc29tZSByZXZpZXdlZC9hY2tlZCBmcm9tIHlvdS4gQW5kIGZvciBub3cgCnRoaXMKcGF0Y2gt
c2V0IGhhdmUgYmVlbiB0ZXN0ZWQgb24gUm9ja2NoaXAgYW5kIEV4eW5vcyBwbGF0Zm9ybSByaWdo
dGx5LCBzbyAKY291bGQgeW91CmhlbHAgdG8gc2hhcmUgc29tZSBmdXJ0aGVyIGNvbW1lbnRzIGhl
cmUgOykKCgpUaGFua3MsCi0gWWFraXIKPiBCZXN0IHJlZ2FyZHMsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
