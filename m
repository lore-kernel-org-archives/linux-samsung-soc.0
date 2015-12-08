From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: Use OF graph for DP to panel connection in
 exynos5800-peach-pi
Date: Tue, 08 Dec 2015 09:48:47 +0900
Message-ID: <566628EF.5090202@samsung.com>
References: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
 <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
 <56658C78.8090509@osg.samsung.com>
 <CAAQKjZMgse2n0TcjLiBxDn6ddTNSaRKMxoBqU7u8u002W=hRWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAAQKjZMgse2n0TcjLiBxDn6ddTNSaRKMxoBqU7u8u002W=hRWQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <daeinki@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDguMTIuMjAxNSAwMDozNiwgSW5raSBEYWUgd3JvdGU6Cj4gSGkgSmF2aWVyLAo+IAo+IDIw
MTUtMTItMDcgMjI6NDEgR01UKzA5OjAwIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVy
QG9zZy5zYW1zdW5nLmNvbT46Cj4+IEhlbGxvIElua2ksCj4+Cj4+IE9uIDEyLzA3LzIwMTUgMDk6
NTIgQU0sIElua2kgRGFlIHdyb3RlOgo+Pj4gRnJvbTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFz
IDxqYXZpZXJAb3NnLnNhbXN1bmcuY29tPgo+Pj4KPj4KPj4gVGhhbmtzIGEgbG90IGZvciBwb3N0
aW5nIHRoaXMgcGF0Y2guCj4+Cj4+PiBUaGUgRFQgYmluZGluZyBmb3IgdGhlIEV4eW5vcyBEUk0g
RGlzcGxheSBQb3J0IChEUCkgZHJpdmVyIGlzbid0IGNvbnNpc3RlbnQKPj4+IHNpbmNlIGl0IHVz
ZXMgYSBwaGFuZGxlIHRvIGRlc2NyaWJlIHRoZSBjb25uZWN0aW9uIGJldHdlZW4gdGhlIERQIHBv
cnQgYW5kCj4+PiB0aGUgZGlzcGxheSBwYW5lbCBidXQgdXNlcyB0aGUgT0YgZ3JhcGggcG9ydHMg
YW5kIGVuZHBvaW50cyB0byBkZXNjcmliZSB0aGUKPj4+IGNvbm5lY3Rpb24gYmV0d2VuIHRoZSBE
UCBwb3J0LCBhIGJyaWRnZSBjaGlwIGFuZCB0aGUgcGFuZWwuCj4+Pgo+Pj4gVGhlIEV4eW5vcyBE
UCBkcml2ZXIgYW5kIHRoZSBEVCBiaW5kaW5nIGhhdmUgYmVlbiBjaGFuZ2VkIHRvIGFsbG93IGFs
c28gdG8KPj4+IGRlc2NyaWJlIHRoZSBEUCBwb3J0IHRvIHBhbmVsIGNvbm5lY3Rpb24gdXNpbmcg
cG9ydHMgLyBlbmRwb2ludHMgKE9GIGdyYXBoKQo+Pj4gc28gdGhpcyBwYXRjaCBjaGFuZ2VzIHRo
ZSBFeHlub3M1ODAwIFBlYWNoIFBpIERUIHRvIG1ha2UgaXQgY29uc2lzdGVudCB3aXRoCj4+PiB0
aGUgRXh5bm9zNTQyMCBQZWFjaCBQaXQgdGhhdCBoYXMgYSBlRFAgdG8gTFZEUyBjaGlwIGFuZCB1
c2VzIE9GIGdyYXBoIHRvby4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllckBvc2cuc2Ftc3VuZy5jb20+Cj4+PiBUZXN0ZWQtYnk6IEphdmllciBN
YXJ0aW5leiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KPj4KPj4gVGhpcyB0YWcg
d2FzIG5vdCBpbiBteSBvcmlnaW5hbCBwYXRjaCwgaXQncyB0cnVlIHRoYXQgSSB0ZXN0ZWQKPj4g
aXQgYnV0IHdpbGwgc29tZW9uZSBiZWxpZXZlIG1lPyA7KQo+IAo+IE9vcHMuIEkgY29uZnVzZWQg
eW91IHNwcmVhZCBSZXZpZXdlZC1ieSBhbmQgVGVzdGVkLWJ5IGhlcmUgYW5kIHRoZXJlLgo+IERv
bid0IHdvcnJ5IGFib3V0IHRoYXQuIFdpbGwgcmVtb3ZlIGl0IGlmIHlvdSBkb24ndCBnaXZlIG1l
IFRlc3RlZC1ieS4KPiA6KQoKQWN0dWFsbHkgYXV0aG9yc2hpcCAodGhlICJGcm9tIikgaW4gdGhp
cyBjYXNlIG1lYW5zIFRlc3RlZC1ieS4gQXV0aG9yCmFsd2F5cyB0ZXN0cyB0aGUgcGF0Y2ggc28g
aXQgd291bGQgbG9vayB3ZWlyZCBpZiB3ZSBzdGFydCBhZGRpbmcKdGVzdGVkLWJ5IHRvIG91ciBv
d24gcGF0Y2hlcywgcmlnaHQ/CgpEZWFyIElua2ksCkhvd2V2ZXIgdGhlIHBhdGNoIG1pc3NlcyB5
b3VyIFNvQi4gWW91IHRvdWNoZWQgYW5kIHNlbnQgaXQgc28gcGxlYXNlCmV4dGVuZCB0aGUgU29C
IGNoYWluLW9mLWJsYW1lLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
