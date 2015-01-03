From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Sat, 03 Jan 2015 15:47:59 +0900
Message-ID: <54A7909F.1070308@samsung.com>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
 <548ABAB6.6010200@collabora.co.uk> <3197445.qizQc0zeRb@avalon>
 <54914D7D.9060108@collabora.co.uk>
 <CAPj87rN4HZzDt5JBLyTRmKZs7XcOG=0ha7ZQf9hmjPAFgTyhYQ@mail.gmail.com>
 <CAEC9eQPKC05C0uJr0eKEuG1eqWohYqV=2seWQtanRFryDgF0ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAEC9eQPKC05C0uJr0eKEuG1eqWohYqV=2seWQtanRFryDgF0ng@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "cpgs ." <cpgs@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNeuFhCAwMeyblCAwMuydvCAyMjoxNCwgQWpheSBrdW1hciB3cm90ZToKPiBIaSBEYW5p
ZWwsCj4gCj4gVGhpcyBzZXJpZXMgaXMgc2l0dGluZyBvdXQgdGhlcmUgc2luY2UgbG9uZyB3aXRo
b3V0IGFueSBBQ0tzLgo+IElmIHBlb3BsZSBjYW4gQUNLIHRoaXMgc2VyaWVzLCBJIGFtIHJlYWR5
IHRvIHJlYmFzZSBhbmQgc2VuZCBBU0FQLgoKQWNrZWQtYnk6IElua2kgRGFlIDxpbmtpLmRhZUBz
YW1zdW5nLmNvbT4KCkFuZCwgZm9yIFtQQVRDSCBWOCA1LzE0XSBkcm0vZXh5bm9zOiBkcDogc3Vw
cG9ydCBkcm1fYnJpZGdlLApTaWduZWQtb2ZmLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3Vu
Zy5jb20+CgpUaGFua3MsCklua2kgRGFlCgo+IAo+IFJlZ2FyZHMsCj4gQWpheSBLdW1hcgo+IAo+
IE9uIEZyaSwgSmFuIDIsIDIwMTUgYXQgNjo0MCBQTSwgRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9v
aXNoYmFyLm9yZz4gd3JvdGU6Cj4+IEhpIEFqYXksCj4+Cj4+IE9uIDE3IERlY2VtYmVyIDIwMTQg
YXQgMDk6MzEsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcwo+PiA8amF2aWVyLm1hcnRpbmV6QGNv
bGxhYm9yYS5jby51az4gd3JvdGU6Cj4+Pgo+Pj4gT24gMTIvMTYvMjAxNCAxMjozNyBBTSwgTGF1
cmVudCBQaW5jaGFydCB3cm90ZToKPj4+Pj4gWW91IGFza2VkIEFqYXkgdG8gY2hhbmdlIGhpcyBz
ZXJpZXMgdG8gdXNlIHRoZSB2aWRlbyBwb3J0IGFuZCBlbnBvaW50cwo+Pj4+PiBEVAo+Pj4+PiBi
aW5kaW5ncyBpbnN0ZWFkIG9mIHBoYW5kbGVzLCBjb3VsZCB5b3UgcGxlYXNlIHJldmlldyBoaXMg
bGF0ZXN0Cj4+Pj4+IHZlcnNpb24/Cj4+Pj4+Cj4+Pj4+IEkgZ3Vlc3MgaXMgbm93IHRvbyBsYXRl
IGZvciAzLjE5IHNpbmNlIHdlIGFyZSBpbiB0aGUgbWlkZGxlIG9mIHRoZQo+Pj4+PiBtZXJnZQo+
Pj4+PiB3aW5kb3cgYnV0IGl0IHdvdWxkIGJlIGdyZWF0IGlmIHRoaXMgc2VyaWVzIGNhbiBhdCBs
ZWFzdCBtYWRlIGl0IHRvCj4+Pj4+IDMuMjAuCj4+Pj4KPj4+PiBJIGRvbid0IGhhdmUgdGltZSB0
byByZXZpZXcgdGhlIHNlcmllcyBpbiBkZXRhaWxzIHJpZ2h0IG5vdywgYnV0IEknbQo+Pj4+IGhh
cHB5Cj4+Pj4gd2l0aCB0aGUgRFQgYmluZGluZ3MsIGFuZCBoYXZlIG5vIGJpZyBpc3N1ZSB3aXRo
IHRoZSByZXN0IG9mIHRoZQo+Pj4+IHBhdGNoZXMuIEkKPj4+PiBkb24ndCByZWFsbHkgbGlrZSB0
aGUgb2ZfZHJtX2ZpbmRfYnJpZGdlKCkgY29uY2VwdCBpbnRyb2R1Y2VkIGluIDAzLzE0Cj4+Pj4g
YnV0IEkKPj4+PiB3b24ndCBuYWNrIGl0IGdpdmVuIGxhY2sgb2YgdGltZSB0byBpbXBsZW1lbnQg
YW4gYWx0ZXJuYXRpdmUgcHJvcG9zYWwuCj4+Pj4gSXQncyBhbgo+Pj4+IGludGVybmFsIEFQSSwg
aXQgY2FuIGFsd2F5cyBiZSByZXdvcmtlZCBsYXRlciBhbnl3YXkuCj4+Pgo+Pj4gVGhhbmtzIGEg
bG90IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gbG9vayBhdCB0aGUgRFQgYmluZGluZ3MsIHRoZW4g
SSBndWVzcwo+Pj4gdGhhdCB0aGUgc2VyaWVzIGFyZSBmaW5hbGx5IHJlYWR5IHRvIGJlIG1lcmdl
ZD8KPj4+Cj4+PiBBamF5J3Mgc2VyaWVzIGRvbid0IGFwcGx5IGNsZWFubHkgYW55bW9yZSBiZWNh
dXNlIGl0IGhhcyBiZWVuIGEgd2hpbGUKPj4+IHNpbmNlCj4+PiBoZSBwb3N0ZWQgaXQgYnV0IGhl
IGNhbiByZWJhc2Ugb24gdG9wIG9mIDMuMTktcmMxIG9uY2UgaXQgaXMgcmVsZWFzZWQgYW5kCj4+
PiByZS1yZXNlbmQuCj4+Cj4+Cj4+IERvIHlvdSBoYXZlIGFueSBwbGFucyB0byByZWJhc2UgdGhp
cyBzbyBpdCdzIHJlYWR5IGZvciBtZXJnaW5nPwo+Pgo+PiBUaGllcnJ5LCBEYW5pZWwsIERhdmUg
LSB3aG9zZSB0cmVlIHdvdWxkIHRoaXMgYmUgYmVzdCB0byBtZXJnZSB0aHJvdWdoPwo+Pgo+PiBD
aGVlcnMsCj4+IERhbmllbAo+IC0tCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNl
bmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXNhbXN1bmctc29jIiBpbgo+IHRoZSBib2R5
IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCj4gTW9yZSBtYWpvcmRv
bW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
