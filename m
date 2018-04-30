From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 24/24] drm/bridge: establish a link between
 the bridge supplier and consumer
Date: Mon, 30 Apr 2018 23:12:56 +0200
Message-ID: <e2562f6f-f7b0-477c-db38-a3bf6c956fa7@axentia.se>
References: <20180426223139.16740-1-peda@axentia.se>
 <20180426223139.16740-25-peda@axentia.se>
 <20180430153236.GP12521@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180430153236.GP12521-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxOC0wNC0zMCAxNzozMiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBGcmksIEFwciAy
NywgMjAxOCBhdCAxMjozMTozOUFNICswMjAwLCBQZXRlciBSb3NpbiB3cm90ZToKPj4gSWYgdGhl
IGJyaWRnZSBzdXBwbGllciBpcyB1bmJvdW5kLCB0aGlzIHdpbGwgYnJpbmcgdGhlIGJyaWRnZSBj
b25zdW1lcgo+PiBkb3duIGFsb25nIHdpdGggdGhlIGJyaWRnZS4gVGh1cywgdGhlcmUgd2lsbCBu
byBsb25nZXIgbGluZ2VyIGFueQo+PiBkYW5nbGluZyBwb2ludGVycyBmcm9tIHRoZSBicmlkZ2Ug
Y29uc3VtZXIgKHRoZSBkcm1fZGV2aWNlKSB0byBzb21lCj4+IG5vbi1leGlzdGVudCBicmlkZ2Ug
c3VwcGxpZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEu
c2U+Cj4gCj4gTWludXMgdGhlIC0+b3duZXIgYmlrZXNoZWQgSSBicm91Z2h0IHVwIGluIHRoZSBw
cmV2aW91cyBwYXRjaCBJIGFncmVlIHdpdGgKPiB0aGlzIGFwcHJvYWNoIGFzIHRoZSBiZXN0IHdh
eSB0byBtb3ZlIGZvcndhcmQgZm9yIG5vdy4KPiAKPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClRoYW5rcywgbGV0J3Mgc2VlIGlmIExhdXJlbnQgaXMg
YWxzbyBvbi1ib2FyZC4uLgoKPiBPbmUgc21hbGwgc3VnZ2VzdGlvbiBiZWxvdywgZm9yIG1lcmdp
bmcgSSdkIHNheSBwbHMgZ2V0IEp5cmkncwo+IHJldmlldy90ZXN0ZWQtYnkgdG9vLCBzaW5jZSB5
b3UncmUgYm90aCB3b3JraW5nIG9uIHRoZSBzYW1lIHByb2JsZW0gaXQKPiBzZWVtcy4KClllcywg
SSB0b28gd291bGQgYmUgdmVyeSBoYXBweSB0byBzZWUgYSB0ZXN0ZWQtYnkgZnJvbSBzb21lb25l
LgoKPiBBc2lkZTogRG8geW91IHdhbnQgY29tbWl0IHJpZ2h0cyB0byBkcm0tbWlzYyB0byBiZSBh
YmxlIHRvIHB1c2ggd29yayBsaWtlCj4gdGhpcz8KCklmIHRoYXQgbWFrZXMgbGlmZSBlYXNpZXIs
IHN1cmUuCgpDaGVlcnMsClBldGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ZyZWVkcmVubwo=
