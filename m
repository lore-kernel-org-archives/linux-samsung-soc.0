From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 04/14] exynos/fimg2d: check buffer space in
 g2d_solid_fill()
Date: Mon, 31 Aug 2015 21:27:19 +0200
Message-ID: <55E4AA97.2070502@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-5-git-send-email-tjakobi@math.uni-bielefeld.de>
 <55E45029.40009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55E45029.40009@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: gustavo.padovan@collabora.co.uk, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8hCgoKSW5raSBEYWUgd3JvdGU6Cj4gT24gMjAxNeuFhCAwOOyblCAyNOydvCAyMzoxMywg
VG9iaWFzIEpha29iaSB3cm90ZToKPj4gVGhlIGFtb3VudCBvZiBjb21tYW5kcyAocmVndWxhciBh
bmQgR0VNKSBkb2Vzbid0IGRlcGVuZAo+PiBvbiB0aGUgaW5wdXQgaGVyZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+Cj4+
IC0tLQo+PiAgZXh5bm9zL2V4eW5vc19maW1nMmQuYyB8IDMgKysrCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9leHlub3MvZXh5bm9zX2ZpbWcy
ZC5jIGIvZXh5bm9zL2V4eW5vc19maW1nMmQuYwo+PiBpbmRleCAxYWU4YWRmLi45YjdiY2NlIDEw
MDY0NAo+PiAtLS0gYS9leHlub3MvZXh5bm9zX2ZpbWcyZC5jCj4+ICsrKyBiL2V4eW5vcy9leHlu
b3NfZmltZzJkLmMKPj4gQEAgLTMxOSw2ICszMTksOSBAQCBnMmRfc29saWRfZmlsbChzdHJ1Y3Qg
ZzJkX2NvbnRleHQgKmN0eCwgc3RydWN0IGcyZF9pbWFnZSAqaW1nLAo+PiAgCXVuaW9uIGcyZF9i
aXRibHRfY21kX3ZhbCBiaXRibHQ7Cj4+ICAJdW5pb24gZzJkX3BvaW50X3ZhbCBwdDsKPj4gIAo+
PiArCWlmIChnMmRfY2hlY2tfc3BhY2UoY3R4LCA3LCAxKSkKPj4gKwkJcmV0dXJuIC1FTk9TUEM7
Cj4gCj4gWW91IGNhbiBtYWtlIDMgYW5kIDQgcGF0Y2hlcyB0byBvbmUuIFRoZXNlIHNob3VsZCBi
ZSBzYW1lIHBhdGNoLgpIbW0sIHNvIHdoaWNoIDMgKHJlc3BlY3RpdmVseSA0KSBwYXRjaGVzIHNo
b3VsZCBiZSBzcXVhc2hlZD8KCkkgdHJpZWQgdG8gc2VwYXJhdGUgc3R1ZmYgdG8gbWFrZSByZXZp
ZXcgZWFzaWVyLiBJZiBzcXVhc2hpbmcgaGVyZSBpcwp0aGUgb25seSBpc3N1ZSwgZG8gSSBuZWVk
IHRvIHJlc2VuZCB0aGUgc2VyaWVzIG9yIGNhbiBlLmcuIEVtaWwganVzdCBkbwp0aGUgc3F1YXNo
IHdoZW4gbWVyZ2luZz8KCldpdGggYmVzdCB3aXNoZXMsClRvYmlhcwoKCj4gCj4+ICsKPj4gIAln
MmRfYWRkX2NtZChjdHgsIERTVF9TRUxFQ1RfUkVHLCBHMkRfU0VMRUNUX01PREVfTk9STUFMKTsK
Pj4gIAlnMmRfYWRkX2NtZChjdHgsIERTVF9DT0xPUl9NT0RFX1JFRywgaW1nLT5jb2xvcl9tb2Rl
KTsKPj4gIAlnMmRfYWRkX2Jhc2VfYWRkcihjdHgsIGltZywgZzJkX2RzdCk7Cj4+Cj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
