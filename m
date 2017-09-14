From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v4 4/4] [media] exynos-gsc: Add hardware rotation limits
Date: Thu, 14 Sep 2017 09:55:48 +0900
Message-ID: <8171b8d8-f14b-21ba-9e3b-7c6a2e442f3d@samsung.com>
References: <1505302915-15699-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170913114215epcas2p346dd3987cf25481bc780e0eef8b91ed8@epcas2p3.samsung.com>
 <1505302915-15699-5-git-send-email-hoegeun.kwon@samsung.com>
 <509750b5-22d0-77ee-8295-0e52679e0d1e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <509750b5-22d0-77ee-8295-0e52679e0d1e@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kgene@kernel.org, krzk@kernel.org, mchehab@kernel.org, robin.murphy@arm.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDkvMTMvMjAxNyAwOToxMyBQTSwgU3lsd2VzdGVyIE5hd3JvY2tpIHdyb3RlOgo+IE9uIDA5
LzEzLzIwMTcgMDE6NDEgUE0sIEhvZWdldW4gS3dvbiB3cm90ZToKPj4gQEAgLTEwMDQsMTEgKzEw
ODgsMzMgQEAgc3RhdGljIGlycXJldHVybl90IGdzY19pcnFfaGFuZGxlcihpbnQgaXJxLCAKPj4g
dm9pZCAqcHJpdikKPj4gICAgICAgLm51bV9jbG9ja3MgPSAxLAo+PiAgIH07Cj4+ICAgK3N0YXRp
YyBzdHJ1Y3QgZ3NjX2RyaXZlcmRhdGEgZ3NjX3ZfNTI1MF9kcnZkYXRhID0gewo+PiArICAgIC52
YXJpYW50ID0gewo+PiArICAgICAgICBbMF0gPSAmZ3NjX3ZfNTI1MF92YXJpYW50LAo+PiArICAg
ICAgICBbMV0gPSAmZ3NjX3ZfNTI1MF92YXJpYW50LAo+PiArICAgICAgICBbMl0gPSAmZ3NjX3Zf
NTI1MF92YXJpYW50LAo+PiArICAgICAgICBbM10gPSAmZ3NjX3ZfNTI1MF92YXJpYW50LAo+PiAr
ICAgIH0sCj4+ICsgICAgLm51bV9lbnRpdGllcyA9IDQsCj4+ICsgICAgLmNsa19uYW1lcyA9IHsg
ImdzY2wiIH0sCj4+ICsgICAgLm51bV9jbG9ja3MgPSAxLAo+PiArfTsKPj4gKwo+PiArc3RhdGlj
IHN0cnVjdCBnc2NfZHJpdmVyZGF0YSBnc2Nfdl81NDIwX2RydmRhdGEgPSB7Cj4+ICsgICAgLnZh
cmlhbnQgPSB7Cj4+ICsgICAgICAgIFswXSA9ICZnc2Nfdl81NDIwX3ZhcmlhbnQsCj4+ICsgICAg
ICAgIFsxXSA9ICZnc2Nfdl81NDIwX3ZhcmlhbnQsCj4+ICsgICAgfSwKPj4gKyAgICAubnVtX2Vu
dGl0aWVzID0gNCwKPgo+IFNob3VsZG4ndCBudW1fZW5pdGllcyBiZSAyIGhlcmU/IFlvdSBkb24n
dCBuZWVkIHRvIHJlc2VuZCwgSSBjYW4KPiBhbWVuZCB0aGF0IHdoZW4gYXBwbHlpbmcuCj4KCgpZ
ZXMsIG51bV9lbml0aWVzIGlzIDIuClNvcnJ5IEkgbWFkZSBhIG1pc3Rha2UuCgpUaGFua3MgU3ls
d2VzdGVyLgoKQmVzdCByZWdhcmRzLApIb2VnZXVuCgo+PiArICAgIC5jbGtfbmFtZXMgPSB7ICJn
c2NsIiB9LAo+PiArICAgIC5udW1fY2xvY2tzID0gMSwKPj4gK307Cj4+ICsKPgo+IC0tIAo+IFJl
Z2FyZHMsCj4gU3lsd2VzdGVyCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
