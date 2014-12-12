From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 04/15] regulator: add restrack support
Date: Fri, 12 Dec 2014 09:22:29 +0100
Message-ID: <548AA5C5.4060204@samsung.com>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <1418226513-14105-5-git-send-email-a.hajda@samsung.com>
 <20141210160720.GS11764@sirena.org.uk> <548976D2.7080005@samsung.com>
 <20141211125837.GV11764@sirena.org.uk>
 <20141211134327.GO11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20141211134327.GO11285@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Grant Likely <grant.likely@linaro.org>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTIvMTEvMjAxNCAwMjo0MyBQTSwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IHdyb3RlOgo+
IE9uIFRodSwgRGVjIDExLCAyMDE0IGF0IDEyOjU4OjM3UE0gKzAwMDAsIE1hcmsgQnJvd24gd3Jv
dGU6Cj4+IEknZCBleHBlY3Qgc29tZW9uZSByZWFkaW5nIHRoZSBjaGFuZ2UgaW4gdGhlIHJlZ3Vs
YXRvciBBUEkgdG8gaGF2ZSBhdAo+PiBsZWFzdCBzb21lIGlkZWEgaG93IHRoaXMgZml0cyBpbiB3
aXRoIHRoZSByZXN0IG9mIHRoZSBBUEkgYW5kIGhvdyB0byB1c2UKPj4gaXQsIGFuZCBwcm9iYWJs
eSBtb3JlIGltcG9ydGFudGx5IEknZCBleHBlY3QgdG8gYmUgYWJsZSB0byB1bmRlcnN0YW5kCj4+
IHdoeSB0aGlzIGlzIERUIG9ubHkuCj4gCj4gWWVwLgo+IAo+IFRoaXMgaXMgYSByZXBldGl0aXZl
IHByb2JsZW0sIGFuZCBJIGZ1bGx5IGFncmVlIHdpdGggeW91ciBjb25jZXJuIGFib3V0Cj4gc3R1
ZmYgd2hpY2ggaXMgc3VwcG9zZWQgdG8gYmUgYXJjaC1pbmRlcGVuZGVudCBiZWluZyBkZXNpZ25l
ZCB3aXRoIG9ubHkKPiBEVCBpbiBtaW5kLgo+IAo+IE5ldyBjb3JlIGtlcm5lbCBmZWF0dXJlcyBz
aG91bGQgKm5vdCogYmUgZGVzaWduZWQgd2l0aCBvbmx5IERUIGluIG1pbmQgLQo+IERUIGlzIG5v
dCB0aGUgb25seSBmaXJtd2FyZSBkZXNjcmlwdGlvbiBsYW5ndWFnZSB3aGljaCB0aGUga2VybmVs
Cj4gc3VwcG9ydHMuICBGb2xrIG5lZWQgdG8gdW5kZXJzdGFuZCB0aGF0IGlmIHRoZXkgZGVzaWdu
IGEgbmV3IGFyY2gKPiBpbmRlcGVuZGVudCBrZXJuZWwgZmVhdHVyZSB3aGVyZSB0aGUgc29sZSB1
c2UgY2FzZSBpcyB3aXRoIERULCB0aGF0IG5ldwo+IGZlYXR1cmUgaXMgcHJvYmFibHkgZ29pbmcg
dG8gZ2V0IHJlamVjdGVkLCBlc3BlY2lhbGx5IHdoZW4gaXQncwo+IHNvbWV0aGluZyBhcyBnZW5l
cmljIGFzIHJlc291cmNlIHRyYWNraW5nLgo+IAo+IFRoZSB3b3JsZCBpcyBub3QgRFQgb25seS4K
PiAKCk9LLiBJIHdpbGwgcG9zdCBuZXh0IHZlcnNpb24gb2YgcGF0Y2hzZXQgd2l0aCByZXNvdXJj
ZS9wcm92aWRlciBsb29rdXAKbGVmdCB0byBmcmFtZXdvcmtzIChyZWd1bGF0b3JzLCBjbG9jaywg
ZXRjKSwgdGhpcyB3YXkgaXQgd2lsbCBiZSBmdWxseQpmaXJtd2FyZSBhZ25vc3RpYy4gSSB3aWxs
IGFkZCBhbHNvIGJldHRlciBkZXNjcmlwdGlvbiBvZiB0aGUgZnJhbWV3b3JrLgoKUmVnYXJkcwpB
bmRyemVqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
