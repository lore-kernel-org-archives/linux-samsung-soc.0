From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Fri, 2 Jan 2015 18:44:41 +0530
Message-ID: <CAEC9eQPKC05C0uJr0eKEuG1eqWohYqV=2seWQtanRFryDgF0ng@mail.gmail.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
 <548ABAB6.6010200@collabora.co.uk> <3197445.qizQc0zeRb@avalon>
 <54914D7D.9060108@collabora.co.uk>
 <CAPj87rN4HZzDt5JBLyTRmKZs7XcOG=0ha7ZQf9hmjPAFgTyhYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPj87rN4HZzDt5JBLyTRmKZs7XcOG=0ha7ZQf9hmjPAFgTyhYQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgRGFuaWVsLAoKVGhpcyBzZXJpZXMgaXMgc2l0dGluZyBvdXQgdGhlcmUgc2luY2UgbG9uZyB3
aXRob3V0IGFueSBBQ0tzLgpJZiBwZW9wbGUgY2FuIEFDSyB0aGlzIHNlcmllcywgSSBhbSByZWFk
eSB0byByZWJhc2UgYW5kIHNlbmQgQVNBUC4KClJlZ2FyZHMsCkFqYXkgS3VtYXIKCk9uIEZyaSwg
SmFuIDIsIDIwMTUgYXQgNjo0MCBQTSwgRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9y
Zz4gd3JvdGU6Cj4gSGkgQWpheSwKPgo+IE9uIDE3IERlY2VtYmVyIDIwMTQgYXQgMDk6MzEsIEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcwo+IDxqYXZpZXIubWFydGluZXpAY29sbGFib3JhLmNvLnVr
PiB3cm90ZToKPj4KPj4gT24gMTIvMTYvMjAxNCAxMjozNyBBTSwgTGF1cmVudCBQaW5jaGFydCB3
cm90ZToKPj4gPj4gWW91IGFza2VkIEFqYXkgdG8gY2hhbmdlIGhpcyBzZXJpZXMgdG8gdXNlIHRo
ZSB2aWRlbyBwb3J0IGFuZCBlbnBvaW50cwo+PiA+PiBEVAo+PiA+PiBiaW5kaW5ncyBpbnN0ZWFk
IG9mIHBoYW5kbGVzLCBjb3VsZCB5b3UgcGxlYXNlIHJldmlldyBoaXMgbGF0ZXN0Cj4+ID4+IHZl
cnNpb24/Cj4+ID4+Cj4+ID4+IEkgZ3Vlc3MgaXMgbm93IHRvbyBsYXRlIGZvciAzLjE5IHNpbmNl
IHdlIGFyZSBpbiB0aGUgbWlkZGxlIG9mIHRoZQo+PiA+PiBtZXJnZQo+PiA+PiB3aW5kb3cgYnV0
IGl0IHdvdWxkIGJlIGdyZWF0IGlmIHRoaXMgc2VyaWVzIGNhbiBhdCBsZWFzdCBtYWRlIGl0IHRv
Cj4+ID4+IDMuMjAuCj4+ID4KPj4gPiBJIGRvbid0IGhhdmUgdGltZSB0byByZXZpZXcgdGhlIHNl
cmllcyBpbiBkZXRhaWxzIHJpZ2h0IG5vdywgYnV0IEknbQo+PiA+IGhhcHB5Cj4+ID4gd2l0aCB0
aGUgRFQgYmluZGluZ3MsIGFuZCBoYXZlIG5vIGJpZyBpc3N1ZSB3aXRoIHRoZSByZXN0IG9mIHRo
ZQo+PiA+IHBhdGNoZXMuIEkKPj4gPiBkb24ndCByZWFsbHkgbGlrZSB0aGUgb2ZfZHJtX2ZpbmRf
YnJpZGdlKCkgY29uY2VwdCBpbnRyb2R1Y2VkIGluIDAzLzE0Cj4+ID4gYnV0IEkKPj4gPiB3b24n
dCBuYWNrIGl0IGdpdmVuIGxhY2sgb2YgdGltZSB0byBpbXBsZW1lbnQgYW4gYWx0ZXJuYXRpdmUg
cHJvcG9zYWwuCj4+ID4gSXQncyBhbgo+PiA+IGludGVybmFsIEFQSSwgaXQgY2FuIGFsd2F5cyBi
ZSByZXdvcmtlZCBsYXRlciBhbnl3YXkuCj4+Cj4+IFRoYW5rcyBhIGxvdCBmb3IgdGFraW5nIHRo
ZSB0aW1lIHRvIGxvb2sgYXQgdGhlIERUIGJpbmRpbmdzLCB0aGVuIEkgZ3Vlc3MKPj4gdGhhdCB0
aGUgc2VyaWVzIGFyZSBmaW5hbGx5IHJlYWR5IHRvIGJlIG1lcmdlZD8KPj4KPj4gQWpheSdzIHNl
cmllcyBkb24ndCBhcHBseSBjbGVhbmx5IGFueW1vcmUgYmVjYXVzZSBpdCBoYXMgYmVlbiBhIHdo
aWxlCj4+IHNpbmNlCj4+IGhlIHBvc3RlZCBpdCBidXQgaGUgY2FuIHJlYmFzZSBvbiB0b3Agb2Yg
My4xOS1yYzEgb25jZSBpdCBpcyByZWxlYXNlZCBhbmQKPj4gcmUtcmVzZW5kLgo+Cj4KPiBEbyB5
b3UgaGF2ZSBhbnkgcGxhbnMgdG8gcmViYXNlIHRoaXMgc28gaXQncyByZWFkeSBmb3IgbWVyZ2lu
Zz8KPgo+IFRoaWVycnksIERhbmllbCwgRGF2ZSAtIHdob3NlIHRyZWUgd291bGQgdGhpcyBiZSBi
ZXN0IHRvIG1lcmdlIHRocm91Z2g/Cj4KPiBDaGVlcnMsCj4gRGFuaWVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
