From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH -v2] drm/exynos: track vblank events on a per crtc basis
Date: Mon, 02 Feb 2015 14:38:06 +0900
Message-ID: <54CF0D3E.2050008@samsung.com>
References: <1422016980-23806-2-git-send-email-gustavo@padovan.org>
 <1422551459-25812-1-git-send-email-gustavo@padovan.org>
 <54CAF028.6060902@samsung.com> <20150130143037.GB30820@joana>
 <CAPj87rOJO5kYeVeserzrCk6AYu3CfrKBk8hhNCvzWUGQu_7ncg@mail.gmail.com>
 <20150130160806.GB14009@phenom.ffwll.local> <20150130171718.GI30820@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20150130171718.GI30820@joana>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, =?UTF-8?B?IifrjIDsnbjquLAvTQ==?= =?UTF-8?B?b2JpbGUgUy9XIFBsYXRmb3JtIExhYi4o7Ya17Iug7JewKS9FMyjsgqzsm5ApL+yCvA==?= =?UTF-8?B?7ISx7KCE7J6QJyI=?= <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDEvMzEvMjAxNSAwMjoxNyBBTSwgR3VzdGF2byBQYWRvdmFuIHdyb3RlOgo+IDIwMTUtMDEt
MzAgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjoKPiAKPj4gT24gRnJpLCBKYW4gMzAs
IDIwMTUgYXQgMDM6NTc6NTNQTSArMDAwMCwgRGFuaWVsIFN0b25lIHdyb3RlOgo+Pj4gSGksCj4+
Pgo+Pj4gT24gMzAgSmFudWFyeSAyMDE1IGF0IDE0OjMwLCBHdXN0YXZvIFBhZG92YW4gPGd1c3Rh
dm9AcGFkb3Zhbi5vcmc+IHdyb3RlOgo+Pj4+IDIwMTUtMDEtMzAgSm9vbnlvdW5nIFNoaW0gPGp5
MDkyMi5zaGltQHNhbXN1bmcuY29tPjoKPj4+Pj4gV2Ugd2lsbCBsb3NlIHVuZmluaXNoZWQgcHJp
b3IgZXZlbnRzIGJ5IHRoaXMgY2hhbmdlLiBUaGF0J3Mgd2h5IHdlIHVzZQo+Pj4+PiBsaW5rZWQg
bGlzdC4KPj4+Pgo+Pj4+IEkgdGhpbmsgeW91IGFyZSByaWdodCwgYnV0IEkgd2FzIHVzaW5nIGV4
eW5vc19jcnRjLT5ldmVudCB0byBkbyBleGFjdGx5IHRoZQo+Pj4+IHNhbWUgYXMgZXh5bm9zX2Ny
dGMtPnBlbmRpbmdfZmxpcC4gU28gd2Ugd2VyZSBsb3NpbmcgYSBldmVudCBpbgo+Pj4+IGV4eW5v
c19kcm1fY3J0Y19kcG1zKCkgYmVmb3JlIHRvby4gSSBjaGFuZ2UgdGhpcyBwYXRjaCB0byBoYXZl
IGEgcGFnZV9mbGlwCj4+Pj4gbGlzdCBvbiB0aGUgY3J0Yy4KPj4+Cj4+PiBUaGUgdXN1YWwgYXBw
cm9hY2ggaW4gb3RoZXIgZHJpdmVycyBpcyB0byByZXR1cm4gLUVCVVNZIHdoZW4gdGhlcmUgaXMK
Pj4+IGFscmVhZHkgYW4gYXN5bmMgcGFnZWZsaXAgcGVuZGluZy4gVGhpcyBkZWZpbml0ZWx5IG1h
a2VzIHNlbnNlIHRvIG1lLAo+Pj4gYXMgSSBkb24ndCBzZWUgdGhlIHBvaW50IG9mIHN1Ym1pdHRp
bmcgcGFnZWZsaXBzIGZhc3RlciB0aGFuIHRoZQo+Pj4gaGFyZHdhcmUgY2FuIGFjdHVhbGx5IHJl
bmRlciwgYW5kIHByZXRlbmRpbmcgdG8gdGhlIGFwcGxpY2F0aW9uIHRoYXQKPj4+IHRoZXkgd2Vy
ZSBhY3R1YWxseSBzaG93bi4KPj4KPj4gWWVzLCByaWdodCBub3cgZHJtIGRvZXNuJ3QgcmVhbGx5
IHN1cHBvcnQgYW55dGhpbmcgbGlrZSBhIHBhZ2VmbGlwIHF1ZXVlLgo+PiBTYW1lIGZvciBhdG9t
aWMgcmVhbGx5LiBFdmVuIHRoZSBhc3luYyBwYWdlZmxpcCBtb2RlIHdvcmtzIGxpa2UgaXQsIGl0
Cj4+IGp1c3QgZW5kcyB1cCBmbGlwcGluZyBmYXN0ZXIuCj4+Cj4+IExvbmctdGVybSB3ZSB3YW50
IGEgZmxpcCBxdWV1ZSB3aGVyZSBzdWJzZXF1ZW50IGZsaXBzIGNhbiBiZSBmb2xkZWQKPj4gdG9n
ZXRoZXIgb24gdGhlIG5leHQgdmJsYW5rLiBUaGF0IG1ha2VzIGJlbmNobWFyay1tb2RlIGdhbWVz
IGhhcHB5LAo+PiB3aXRob3V0IHJlc3VsdGluZyBpbiB0ZWFyaW5nIGxpa2UgYXN5bmMgZmxpcHMg
YW5kIHN0aWxsIHJlc3VsdGluZyBpbiB0aGUKPj4gbG93ZXN0IHBvc3NpYmxlIGxhdGVuY3kgKHNp
bmNlIHRoZSBrZXJuZWwgd2UganVzdCBjb21taXQgdGhlIGZsaXBzIGZvcgo+PiB3aGljaCBhbGwg
dGhlIGJ1ZmZlcnMgYXJlIHJlYWR5IGFuZCBub3Qgc3RhbGwpLgo+IAo+IFllYWgsIHRoYXQgbWFr
ZXMgc2Vuc2UuIEknbGwganVzdCBhZGQgYSBjaGVjayBmb3IgLUVCVVNZIGFuZCBzZW5kIGEgdjIu
Cj4gCgpUaGVuIGl0J3MgcmVhc29uYWJsZSB0byBtZS4KClRoYW5rcy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
