From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: add bindings for USB physical
 connector
Date: Mon, 5 Mar 2018 16:14:58 -0600
Message-ID: <20180305221458.lw5a4wznwjkbubox@rob-hp-laptop>
References: <20180227071134.28063-1-a.hajda@samsung.com>
 <CGME20180227071138eucas1p17e1e16f13f6d3e3b15a57dc93eb8cf3f@eucas1p1.samsung.com>
 <20180227071134.28063-2-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20180227071134.28063-2-a.hajda@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDg6MTE6MjlBTSArMDEwMCwgQW5kcnplaiBIYWpkYSB3
cm90ZToKPiBUaGVzZSBiaW5kaW5ncyBhbGxvdyB0byBkZXNjcmliZSBtb3N0IGtub3duIHN0YW5k
YXJkIFVTQiBjb25uZWN0b3JzCj4gYW5kIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBleHRlbmQg
aXQgaWYgbmVjZXNzYXJ5Lgo+IFVTQiBjb25uZWN0b3JzLCBiZXNpZGUgVVNCIGNhbiBiZSB1c2Vk
IHRvIHJvdXRlIG90aGVyIHByb3RvY29scywKPiBmb3IgZXhhbXBsZSBVQVJULCBBdWRpbywgTUhM
LiBJbiBzdWNoIGNhc2UgZXZlcnkgZGV2aWNlIHBhc3NpbmcgZGF0YQo+IHRocm91Z2ggdGhlIGNv
bm5lY3RvciBzaG91bGQgaGF2ZSBhcHByb3ByaWF0ZSBncmFwaCBiaW5kaW5ncy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IC0tLQo+IHY0
Ogo+IC0gaW1wcm92ZWQgJ3R5cGUnIGRlc2NyaXB0aW9uIChSb2IpLAo+IC0gaW1wcm92ZWQgZGVz
Y3JpcHRpb24gb2YgMm5kIGV4YW1wbGUgKFJvYikuCj4gdjM6Cj4gLSByZW1vdmVkIE1ITCBwb3J0
IChzYW1zdW5nIGNvbm5lY3RvciB3aWxsIGhhdmUgc2VwYXJhdGUgYmluZGluZ3MpLAo+IC0gYWRk
ZWQgMm5kIGV4YW1wbGUgZm9yIFVTQi1DLAo+IC0gaW1wcm92ZWQgZm9ybWF0dGluZy4KPiB2MjoK
PiAtIG1vdmVkIGNvbm5lY3RvciB0eXBlKEEsQixDKSB0byBjb21wYXRpYmxlIHN0cmluZyAoUm9i
KSwKPiAtIHJlbmFtZWQgc2l6ZSBwcm9wZXJ0eSB0byB0eXBlIChSb2IpLAo+IC0gY2hhbmdlZCB0
eXBlIGRlc2NyaXB0aW9uIHRvIGJlIGxlc3MgY29uZnVzaW5nIChMYXVyZW50KSwKPiAtIHJlbW92
ZWQgdmVuZG9yIHNwZWNpZmljIGNvbXBhdGlibGVzIChpbXBsaWVkIGJ5IGdyYXBoIHBvcnQgbnVt
YmVyKSwKPiAtIGFkZGVkIHJlcXVpcmVtZW50IG9mIGNvbm5lY3RvciBiZWluZyBhIGNoaWxkIG9m
IElDIChSb2IpLAo+IC0gcmVtb3ZlZCBtYXgtbW9kZSAoc3VidGx5IHN1Z2dlc3RlZCBieSBSb2Is
IGl0IHNob3VsZCBiZSBkZXRlY3RlZCBhbnl3YXkKPiAgIGJ5IFVTQiBDb250cm9sbGVyIGluIHJ1
bnRpbWUsIGRvd25zaWRlIGlzIHRoYXQgZGV2aWNlIGlzIG5vdCBhYmxlIHRvCj4gICByZXBvcnQg
aXRzIHJlYWwgY2FwYWJpbGl0aWVzLCBtYXliZSBiZXR0ZXIgd291bGQgYmUgdG8gbWFrZSBpdCBv
cHRpb25hbCg/KSksCj4gLSBhc3NpZ25lZCBwb3J0IG51bWJlcnMgdG8gZGF0YSBidXNlcyAoUm9i
KS4KPiAKPiBSZWdhcmRzCj4gQW5kcnplago+IC0tLQo+ICAuLi4vYmluZGluZ3MvY29ubmVjdG9y
L3VzYi1jb25uZWN0b3IudHh0ICAgICAgICAgICB8IDc1ICsrKysrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rv
ci50eHQKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
