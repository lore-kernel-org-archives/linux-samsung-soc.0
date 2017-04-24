From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Mon, 24 Apr 2017 13:12:36 +0200
Message-ID: <cf931f91-aec1-d667-bede-da01e0b94258@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
 <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
 <20170422025127.GS7065@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20170422025127.GS7065@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, broonie@kernel.org, krzk@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDQvMjIvMjAxNyAwNDo1MSBBTSwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+PiArc3RhdGljIGlu
dCBzYW1zdW5nX3BsbDN4eHhfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+PiArewo+PiArCXN0
cnVjdCBzYW1zdW5nX2Nsa19wbGwgKnBsbCA9IHRvX2Nsa19wbGwoaHcpOwo+PiArCXUzMiB0bXA7
Cj4+ICsKPj4gKwl0bXAgPSByZWFkbF9yZWxheGVkKHBsbC0+Y29uX3JlZyk7Cj4+ICsJdG1wIHw9
IEJJVChwbGwtPmVuYWJsZV9vZmZzKTsKPj4gKwl3cml0ZWxfcmVsYXhlZCh0bXAsIHBsbC0+Y29u
X3JlZyk7Cj4+ICsKPj4gKwkvKiB3YWl0IGxvY2sgdGltZSAqLwo+PiArCWRvIHsKPj4gKwkJY3B1
X3JlbGF4KCk7Cj4+ICsJCXRtcCA9IHJlYWRsX3JlbGF4ZWQocGxsLT5jb25fcmVnKTsKPj4gKwl9
IHdoaWxlICghKHRtcCAmIEJJVChwbGwtPmxvY2tfb2ZmcykpKTsKID4KPiBOb3QgYSBwcm9ibGVt
IHdpdGggdGhpcyBwYXRjaCBiZWNhdXNlIHdlJ3JlIG1vdmluZyBjb2RlIGFyb3VuZCwKPiBidXQg
dGhpcyBpcyBhIHBvdGVudGlhbCBpbmZpbml0ZSBsb29wIHRoYXQgc2hvdWxkIGhhdmUgc29tZSBz
b3J0Cj4gb2YgdGltZW91dCBzbyB3ZSBkb24ndCBzaXQgaGVyZSBmb3JldmVyIHRyeWluZyB0byBz
ZWUgYSBiaXQKPiB0b2dnbGUuCgpZZXMsIEkgd2lsbCBhZGQgc29tZSBwcm90ZWN0aW9uIGluIG5l
dyBwYXRjaCwgbGlrZSBpdCBpcyBkb25lCmZvciBuZXdlciBQTExzLiBUaGFua3MgZm9yIHlvdSBy
ZXZpZXcuCgotLSAKUmVnYXJkcywKU3lsd2VzdGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
