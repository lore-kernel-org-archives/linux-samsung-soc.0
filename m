From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: add bindings for USB physical
 connector
Date: Thu, 15 Mar 2018 11:46:16 +0000
Message-ID: <1c3f8cde-4f9a-306f-b4f9-c0bdc76caf1f@arm.com>
References: <20180227071134.28063-1-a.hajda@samsung.com>
 <CGME20180227071138eucas1p17e1e16f13f6d3e3b15a57dc93eb8cf3f@eucas1p1.samsung.com>
 <20180227071134.28063-2-a.hajda@samsung.com>
 <ed0ce43c-3c81-b027-2eb1-30e49156c3ac@ti.com>
 <b588527d-2ca2-9e88-9e27-e09e5b52f8d6@samsung.com>
 <12da0d00-9ab3-3752-793b-e487666f35a3@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <12da0d00-9ab3-3752-793b-e487666f35a3@ti.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Roger Quadros <rogerq@ti.com>, Andrzej Hajda <a.hajda@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTIvMDMvMTggMTA6NDEsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6ClsuLi5dCj4+Pj4gQEAgLTAs
MCArMSw3NSBAQAo+Pj4+ICtVU0IgQ29ubmVjdG9yCj4+Pj4gKz09PT09PT09PT09PT0KPj4+PiAr
Cj4+Pj4gK1VTQiBjb25uZWN0b3Igbm9kZSByZXByZXNlbnRzIHBoeXNpY2FsIFVTQiBjb25uZWN0
b3IuIEl0IHNob3VsZCBiZQo+Pj4+ICthIGNoaWxkIG9mIFVTQiBpbnRlcmZhY2UgY29udHJvbGxl
ci4KPj4+PiArCj4+Pj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4+Pj4gKy0gY29tcGF0aWJsZTog
ZGVzY3JpYmVzIHR5cGUgb2YgdGhlIGNvbm5lY3RvciwgbXVzdCBiZSBvbmUgb2Y6Cj4+Pj4gKyAg
ICAidXNiLWEtY29ubmVjdG9yIiwKPj4+PiArICAgICJ1c2ItYi1jb25uZWN0b3IiLAo+Pj4+ICsg
ICAgInVzYi1jLWNvbm5lY3RvciIuCj4+PiBjb21wYXRpYmxlIHNob3VsZCBiZSBqdXN0ICJ1c2It
Y29ubmVjdG9yIgo+Pj4KPj4+IFR5cGUgc2hvdWxkIGJlIGEgcHJvcGVydHkKPj4+Cj4+PiB0eXBl
OiB0eXBlIG9mIHVzYiBjb25uZWN0b3IgIkEiLCAiQiIsICJBQiIsICJDIgo+Pj4gQUIgaXMgZm9y
IGR1YWwtcm9sZSBjb25uZWN0b3JzLgo+Pgo+PiBJIGhhdmUgcHJvcG9zZWQgc3VjaCBwcm9wZXJ0
eSAoYW5kIHNpemUgYWxzbykgaW4gbXkgZmlyc3QgUkZDIFsxXS4gUm9kCj4+IGRpZCBub3QgbGlr
ZSBpdCA6KQo+Pgo+PiBbMV06IGh0dHBzOi8vbWFyYy5pbmZvLz9sPWRldmljZXRyZWUmbT0xNTA2
NjA0MTE1MTUyMzMmdz0yCj4+Cj4gCj4gVGhpcyBpcyB3aGF0IFJvYiBzYXlzIGhlcmUgaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85OTc2MDQzLwo+ICJXZSBkaWQgInR5cGUiIGZv
ciBoZG1pLWNvbm5lY3RvciwgYnV0IEkgdGhpbmsgSSdkIHJlYWxseSBwcmVmZXIKPiBjb21wYXRp
YmxlIGJlIHVzZWQgdG8gZGlzdGluZ3Vpc2ggYXMgbGVhc3Qgd2hlcmUgaXQgbWF5IG1hdHRlciB0
byBzL3cuCj4gSW4gdGhlIEhETUkgY2FzZSwgdGhleSBhbGwgYXJlIHByZXR0eSBtdWNoIHRoZSBz
YW1lLCBqdXN0IGRpZmZlcmVudAo+IHBoeXNpY2FsIHNpemUuIgo+IAo+IFNvIHRoZSBxdWVzdGlv
biBpcy4gRG9lcyBpdCBtYXR0ZXIgdG8gdGhpcyBwYXJ0aWN1bGFyIHNvZnR3YXJlIGltcGxlbWVu
dGF0aW9uCj4gaWYgaXQgaXMgdHlwZSBBLEIsQyBjb25uZWN0b3I/Cj4gSWYgeWVzLCBob3c/Cj4g
Cj4gVHlwZSBBIHdpbGwgbmV2ZXIgaGF2ZSBhbnkgYWx0ZXJuYXRlIGZ1bmN0aW9uLiBJdCBpcyBh
bHdheXMgZGVkaWNhdGVkIHRvIFVTQi4KCkluIFVTQiBzcGVjIHRlcm1zLCBhdCBsZWFzdC4gSW4g
cmVhbGl0eSB0aGVyZSBhcmUgdGhpbmdzIGxpa2UgdGhlIGNvb2wgCnRyaWNrIFJvY2tjaGlwIFNv
Q3MgZG8gd2hlcmVieSB0aGV5IGNhbiBleHBvc2UgdGhlIGRlYnVnIFVBUlQgUngvVHggCnRocm91
Z2ggdGhlIE9URyBwb3J0J3MgRCsvRC0gcGlucywgYW5kIHRoYXQgaXMgb24gYSB0eXBlIEEgY29u
bmVjdG9yIGluIAptYW55IHByb2R1Y3RzLiBJJ20gZ3Vlc3NpbmcgdGhhdCdzIHByb2JhYmx5IGJl
eW9uZCB0aGUgc2NvcGUgb2YgdGhpcyAKYmluZGluZywgdGhvdWdoLgoKPiBBbHNvIGRvZXMgdGhl
IHNpemUgImZ1bGwiLCAibWljcm8iLCAibWluaSIgbWF0dGVyIHRvIHNvZnR3YXJlPwoKSWYgaXQg
bWVhbnMgdGhlIHVzZXIgY2FuIGxvb2sgaW4gc3lzZnMgdG8gZWFzaWx5IGNvcnJlbGF0ZSBsb2dp
Y2FsIHBvcnRzIAp3aXRoIHBoeXNpY2FsIGNvbm5lY3RvcnMgdGhhdCdzIGNlcnRhaW5seSBoYW5k
eSAoZS5nLiBvbiBzb21ldGhpbmcgbGlrZSAKT2Ryb2lkLVhVIHdoZXJlIHRoZSB0d28gVVNCMyBw
b3J0cyBhcmUgYnJvdWdodCBvdXQgdG8gYW4gQSBhbmQgYSAKbWljcm8tQUIgY29ubmVjdG9yIHJl
c3BlY3RpdmVseSkuCgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
