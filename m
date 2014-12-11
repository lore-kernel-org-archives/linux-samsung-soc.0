From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 04/15] regulator: add restrack support
Date: Thu, 11 Dec 2014 11:49:54 +0100
Message-ID: <548976D2.7080005@samsung.com>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com>
 <1418226513-14105-5-git-send-email-a.hajda@samsung.com>
 <20141210160720.GS11764@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20141210160720.GS11764@sirena.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Grant Likely <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/CLKDEV SUPPORT" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgTWFyaywKCk9uIDEyLzEwLzIwMTQgMDU6MDcgUE0sIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24g
V2VkLCBEZWMgMTAsIDIwMTQgYXQgMDQ6NDg6MjJQTSArMDEwMCwgQW5kcnplaiBIYWpkYSB3cm90
ZToKPj4gUmVndWxhdG9ycyBzdXBwb3J0cyB2YXJpb3VzIG1ldGhvZHMgb2YgbG9va3VwLgo+PiBU
aGUgcGF0Y2ggYWRkcyByZXN0cmFjayBzdXBwb3J0IG9ubHkgdG8gRFQgYmFzZWQgcmVndWxhdG9y
cy4KPiBXaHksIHdoYXQgZG9lcyB0aGlzIG1lYW4gYW5kIGhvdyBtaWdodCBvbmUgdXNlIGl0PyAg
SSd2ZSBub3QgbG9va2VkIGF0Cj4gdGhlIGNvZGUgc2luY2UgSSBkb24ndCBrbm93IHdoYXQgaXQn
cyBzdXBwb3NlZCB0byBhY2NvbXBsaXNoLi4uCgpMb29raW5nIGF0IHRoaXMgcGF0Y2ggbWFrZXMg
bm8gc2Vuc2Ugd2l0aG91dCBsb29raW5nIGF0IGNvdmVyIGxldHRlcgpvciBhdCB0aGUgcGF0Y2gg
YWRkaW5nIHJlc3RyYWNrIGZyYW1ld29yay4gSW4gc2hvcnQgYWRkaW5nIHJlc3RyYWNrIHN1cHBv
cnQKdG8gcmVndWxhdG9ycyB3aWxsIGFsbG93IHRvOgotIHByb3BlciBoYW5kbGUgcmVndWxhdG9y
IHByb3ZpZGVyIHVuYmluZC9yZS1iaW5kLCBjdXJyZW50bHkgaXQgcmVzdWx0cwppbiBvb3BzZXMs
IGNyYXNoZXMgYW5kIGhhbmdzLAotIGF2b2lkIGxhdGUgcHJvYmUgZHVlIHRvIGRlZmVycmVkIHBy
b2JpbmcsIGN1cnJlbnRseSBpZiBwcm9iZSBpcwpkZWZlcnJlZCwgcmUtcHJvYmUgb2NjdXJzIGlu
IGxhdGUgaW5pdGNhbGwsCi0gdHJhY2sgYXBwZWFyYW5jZSBvZiByZXNvdXJjZXMgd2hpY2ggY2Fu
IGFsdGVyIGJlaGF2aW9yIG9mIHRoZSBkcml2ZXIKaWYgcHJlc2VudCBidXQgdGhleSBhcmUgbm90
IHJlcXVpcmVkLAogIEkgYW0gbm90IHN1cmUgaWYgdGhlcmUgYXJlIHVzZSBjYXNlcyBmb3IgaXQg
aW4gY2FzZSBvZiByZWd1bGF0b3JzLCBidXQKb3RoZXIgcmVzb3VyY2VzIGhhdmUgc3VjaCB1c2Ug
Y2FzZXMsCi0gYXMgYSBib251cyB3ZSBjYW4gaGF2ZSBzaW1wbGVyIGFsbG9jYXRpb24gb2YgdmFy
aW91cyByZXNvdXJjZXMsIHBsZWFzZQpsb29rIGF0IGNvdmVyIGxldHRlciBmb3IgZXhhbXBsZS4K
Cj4KPiBPbmUgdmVyeSBoaWdoIGxldmVsIHRoaW5nIGlzIHRoYXQgYW55dGhpbmcgdGhhdCBvbmx5
IHdvcmtzIGZvciBEVCBvbmx5Cj4gc2VlbXMgdG8gYmUgYSBub24tc3RhcnRlciwgdGhlIEFQSSBz
aG91bGQgYmUgaGlkaW5nIGRldGFpbHMgb2YgdGhlCj4gZmlybXdhcmUgaW50ZXJmYWNlLgoKSSBh
Z3JlZSwgYnV0IGFzIHRoaXMgaXMgUkZDLCBub3QgZXZlcnl0aGluZyBpcyBmaW5pc2hlZC4gSXQg
c2VlbXMgSSBoYXZlCmZvcmdvdHRlbiB0byBtZW50aW9uIGl0IGNsZWFybHkgaW4gY292ZXIKbGV0
dGVyLgpBbnl3YXkgaXQgc2VlbXMgSSBzaG91bGQgYWRqdXN0IHBhdGNoc2V0IGFuZCBtb3ZlIG1h
dGNoaW5nIGNvZGUgZnJvbQpyZXN0cmFjay90cmFjayBjb3JlIHRvIHNwZWNpZmljIGZyYW1ld29y
a3MuClRoaXMgd2F5IGFueSBjdXJyZW50IG9yIGZ1dHVyZSBsb29rdXAgbWV0aG9kIHNob3VsZCBi
ZSBzdXBwb3J0ZWQuCgpCdXQgdGhlIG1haW4gcHVycG9zZSBvZiB0aGlzIHBhdGNoc2V0IGlzIHRv
IGdldCBvcGluaW9ucywgaWYgdGhlIG1haW4KaWRlYXMgYXJlIE9LLiBBbmQgaWYgdGhlIHBhdGNo
c2V0IGNhbiBiZQpldmVudHVhbGx5IGFjY2VwdGVkLgoKUmVnYXJkcwpBbmRyemVqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
