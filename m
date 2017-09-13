From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v3 4/6] [media] exynos-gsc: Add hardware rotation limits
Date: Wed, 13 Sep 2017 18:28:02 +0900
Message-ID: <21b6ae5d-a77b-3ab1-bc84-5f30e76fab50@samsung.com>
References: <1504850560-27950-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170908060309epcas1p3d48dd0871d3fde02ba3c9921bbe5a7a6@epcas1p3.samsung.com>
 <1504850560-27950-5-git-send-email-hoegeun.kwon@samsung.com>
 <27b46679-e6c7-2471-f10e-3f0634178ebf@samsung.com>
 <bb025fcb-e316-dfe9-a8eb-8a9535f35b93@samsung.com>
 <a915a1f7-2c01-472b-b9ee-5367c488a89f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <a915a1f7-2c01-472b-b9ee-5367c488a89f@samsung.com>
Content-language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org, kgene@kernel.org, dri-devel@lists.freedesktop.org, mchehab@kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDkvMTMvMjAxNyAwNjoxMSBQTSwgU3lsd2VzdGVyIE5hd3JvY2tpIHdyb3RlOgo+IEhpIEhv
ZWdldW4sCj4KPiBPbiAwOS8xMy8yMDE3IDA0OjMzIEFNLCBIb2VnZXVuIEt3b24gd3JvdGU6Cj4+
Pj4gQEAgLTEwMTcsOCArMTA4MywxMiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgZ3NjX2lycV9oYW5k
bGVyKGludCBpcnEsCj4+Pj4gdm9pZCAqcHJpdikKPj4+PiAgICAgICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBleHlub3NfZ3NjX21hdGNoW10gPSB7Cj4+Pj4gICAgICAgICB7Cj4+
Pj4gLSAgICAgICAgLmNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M1LWdzYyIsCj4+Pj4gLSAg
ICAgICAgLmRhdGEgPSAmZ3NjX3ZfMTAwX2RydmRhdGEsCj4+PiBDYW4geW91IGtlZXAgdGhlICJz
YW1zdW5nLGV4eW5vczUtZ3NjIiBlbnRyeSB3aXRoIHRoZSBnc2Nfdl81MjUwX3ZhcmlhbnQKPj4+
IGRhdGEsIHNvIHRoYXQgaXQgY2FuIHdvcmsgd2l0aCAic2Ftc3VuZyxleHlub3M1LWdzYyIgY29t
cGF0aWJsZSBpbiBEVAo+Pj4gb24gYm90aCBleHlub3M1MjUwIGFuZCBleHlub3M1NDIwIFNvQ3M/
Cj4+Pgo+PiBUaGFuayB5b3UgZm9yIHlvdXIgcXVlc3Rpb24uCj4+Cj4+IEV4eW5vcyA1MjUwIGFu
ZCA1NDIwIGhhdmUgZGlmZmVyZW50IGhhcmR3YXJlIHJvdGF0aW9uIGxpbWl0cy4KPj4gRXh5bm9z
IDUyNTAgaXMgJy5yZWFsX3JvdF9lbl93L2ggPSAyMDE2JyBhbmQgNTQyMCBpcyAnLnJlYWxfcm90
X2VuX3cvaCA9Cj4+IDIwNDgnLgo+Pgo+PiBTbyBteSBvcGluaW9uIHRoZXkgbXVzdCBoYXZlIGRp
ZmZlcmVudCBjb21wYXRpYmxlLgo+IEkgdGhpbmsgdGhlcmUgaXMgc29tZSBtaXN1bmRlcnN0YW5k
aW5nLCBtdSBzdWdnZXN0aW9uIHdhcyB0byBrZWVwIHRoZQo+ICJzYW1zdW5nLGV4eW5vczUtZ3Nj
IiBjb21wYXRpYmxlIGVudHJ5IGluIGFkZGl0aW9uIHRvIHRoZSBuZXcgaW50cm9kdWNlZAo+IG9u
ZXM6ICJzYW1zdW5nLGV4eW5vczUyNTAtZ3NjIiBhbmQgInNhbXN1bmcsZXh5bm9zNTQyMC1nc2Mi
LiBUaGF0J3MgaW4KPiBvcmRlciB0byBtYWtlIHlvdXIgY2hhbmdlcyBwb3NzaWJseSBiYWNrd2Fy
ZCBjb21wYXRpYmxlLCBpbiB0aGVvcnkKPiB0aGUgdXBkYXRlZCBkcml2ZXIgc2hvdWxkIHN0aWxs
IHdvcmsgd2l0aG91dCBjaGFuZ2VzIGluIGR0cy4KCgpUaGFuayB5b3UgYWdhaW4gZm9yIHlvdXIg
ZXhwbGFuYXRpb24uCgpZZXMsIEkgdW5kZXJzdG9vZC4KSSB3aWxsIGtlZXAgInNhbXN1bmcsZXh5
bm9zNS1nc2MiIGNvbXBhdGlibGUsCmFuZCBhZGQgRXh5bm9zIDUyNTAvNTQyMC81NDMzIGNvbXBh
dGlibGUuCgpCZXN0IHJlZ2FyZHMsCkhvZWdldW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
