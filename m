From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC 0/2] New feature: Framebuffer processors
Date: Thu, 25 Aug 2016 17:06:55 +0900
Message-ID: <57BEA71F.502@samsung.com>
References: <1471859077-15679-1-git-send-email-m.szyprowski@samsung.com>
 <925c67f8-4990-04c6-ec2e-c6c01e283258@amd.com>
 <CAF6AEGtHeSKoQcVbTuucy-KdA8V=LLtC7uTEDmup3_5tz0HZMg@mail.gmail.com>
 <CGME20160823094312epcas1p3543c2e968e1be320791460a50b5ec523@epcas1p3.samsung.com>
 <CAPj87rNo7bQrqMGg-fRkdowdxT_-iUObY66TiHV-4091MqxiPw@mail.gmail.com>
 <57BD8898.9000709@samsung.com> <20160824115711.GD10980@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20160824115711.GD10980@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Enrico Weigelt <enrico.weigelt@gr13.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?UTF-8?B?Q2hyaXN0aWFuIEvDtg==?= =?UTF-8?B?bmln?= <christian.koenig@amd.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

CgoyMDE264WEIDA47JuUIDI07J28IDIwOjU37JeQIERhbmllbCBWZXR0ZXIg7J20KOqwgCkg7JO0
IOq4gDoKPiBPbiBXZWQsIEF1ZyAyNCwgMjAxNiBhdCAwODo0NDoyNFBNICswOTAwLCBJbmtpIERh
ZSB3cm90ZToKPj4gSGksCj4+Cj4+IDIwMTbrhYQgMDjsm5QgMjPsnbwgMTg6NDHsl5AgRGFuaWVs
IFN0b25lIOydtCjqsIApIOyTtCDquIA6Cj4+PiBIaSwKPj4+Cj4+PiBPbiAyMiBBdWd1c3QgMjAx
NiBhdCAxNjoyMywgUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPj4+PiBJ
IGd1ZXNzIGEgbG90IGNvbWVzIGRvd24gdG8gJ2hvdyBsb25nIGJlZm9yZSBodyBkZXNpZ25lcnMg
Ym9sdCBhIENQIHRvCj4+Pj4gdGhlIHRoaW5nJy4uICBhdCB0aGF0IHBvaW50LCBJIHRoaW5rIHlv
dSBlc3BlY2lhbGx5IGRvbid0IHdhbnQgYQo+Pj4+IHBlci1ibGl0IGtlcm5lbCBpbnRlcmZhY2Uu
Cj4+Pgo+Pj4gUmVnYXJkbGVzcyBvZiB3aGV0aGVyIG9yIG5vdCB3ZSB3YW50IGl0LCB3ZSBhbHJl
YWR5IF9oYXZlXyBpdCwgaW4gdGhlCj4+PiBmb3JtIG9mIFY0TDIgTTJNLiBUaGVyZSBhcmUgYWxy
ZWFkeSBhIGZldyBJUCBibG9ja3Mgd29ya2luZyBvbiB0aGF0LCBJCj4+PiBiZWxpZXZlLiBJZiBW
NEwyIDwtPiBLTVMgaW50ZXJvcCBpcyBwYWluZnVsLCB3ZWxsLCB3ZSBuZWVkIHRvIGZpeCB0aGF0
Cj4+PiBhbnl3YXkgLi4uCj4+Cj4+IFNvIHdlIGFyZSB0cnlpbmcgdGhpcy4gV2UgaGFkIGV4cGVy
ZW5lY2VkIHVzaW5nIFY0TDIgYW5kIERSTSB0b2dldGhlciBvbgo+PiBMaW51eCBQbGF0Zm9ybSBt
YWtlcyBpdCB0b28gY29tcGxpY2F0ZWQsIGFuZCBhbHNvIGludGVncmF0ZWQgRFJNIHdpdGgKPj4g
TTJNIHN1Y2ggYXMgMkQgYW5kIFBvc3QgcHJvY2Vzc29yIG1ha2VzIGl0IHNpbXBsaWZpZWQuICBT
byBXZSBoYXZlIGJlZW4KPj4gdHJ5aW5nIHRvIG1vdmUgZXhpc3RpbmcgVjRMMiBiYXNlZCBkcml2
ZXJzIGludG8gRFJNIGV4Y2VwdGluZyBIVyBWaWRlbwo+PiBDb2RlYyAtIGNhbGxlZCBpdCBNRkMg
LSBhbmQgQ2FtZXJhIHNlbnNvciBhbmQgcmVsZXZhbnQgdGhpbmdzLgo+PiBJIHRoaW5rIG5vdyBW
NEwyIGFuZCBEUk0gZnJhbWV3b3JrcyBtYXkgbWFrZSBtYW55IGVuZ2luZWVycyBjb25mdXNpbmcK
Pj4gYmVjYXVzZSB0aGVyZSBhcmUgdGhlIHNhbWUgZGV2aWNlcyB3aGljaCBjYW4gYmUgY29udHJv
bGxlZCBieSBWNEwyIGFuZAo+PiBEUk0gZnJhbWV3b3JrcyAtIG1heWJlIHdlIHdvdWxkIG5lZWQg
bW9yZSBlZmZvcnRzIGxpa2UgTGF1cmVudCBkaWQgd2l0aAo+PiBMaXZlIHNvdXJjZVsxXSBpbiB0
aGUgZnV0dXJlLgo+IAo+IENhbiB5b3UgcGxzIGV4cGxhaW4gaW4gbW9yZSBkZXRhaWwgd2hlcmUg
d29ya2luZyB3aXRoIGJvdGggdjRsIGFuZCBkcm0KPiBkcml2ZXJzIGFuZCBtYWtpbmcgdGhlbSBj
b29wZXJhdGUgdXNpbmcgZG1hLWJ1ZnMgcG9zZXMgcHJvYmxlbXM/IFdlIHNob3VsZAo+IGRlZmlu
aXRlbHkgZml4IHRoYXQuCgpJIHRoaW5rIGl0IHdvdWxkIGJlIG1vc3QgTGludXggUGxhdGZvcm1z
IC0gQW5kcm9pZCwgQ2hyb21lIGFuZCBUaXplbiAtIHdoaWNoIHdvdWxkIHVzZSBPcGVuTUFYL0dT
dHJlYW1tZXIgZm9yIE11bHRpbWVkaWEgYW5kIFggb3IgV2F5bGFuZC9TdXJmYWNlRmxpbmdlciBm
b3IgRGlzcGxheS4KClRoYW5rcywKSW5raSBEYWUKCj4gLURhbmllbAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
