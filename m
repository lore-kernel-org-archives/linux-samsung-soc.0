From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 1/7] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Date: Mon, 24 Apr 2017 13:12:22 +0200
Message-ID: <017b3ec8-c185-c29a-2944-12f519b461fe@samsung.com>
References: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20170421172016epcas5p342c16e1219c1205a44a84eaa770ad5ac@epcas5p3.samsung.com>
 <1492795191-31298-2-git-send-email-s.nawrocki@samsung.com>
 <20170422152236.tbf4iuoadqrvoc2n@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20170422152236.tbf4iuoadqrvoc2n@kozik-lap>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, cw00.choi@samsung.com, broonie@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDQvMjIvMjAxNyAwNToyMiBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKWy4uLl0K
Pj4gK3N0YXRpYyB2b2lkIHNhbXN1bmdfcGxsM3h4eF9kaXNhYmxlKHN0cnVjdCBjbGtfaHcgKmh3
KQo+PiArewo+PiArCXN0cnVjdCBzYW1zdW5nX2Nsa19wbGwgKnBsbCA9IHRvX2Nsa19wbGwoaHcp
Owo+PiArCXUzMiB0bXA7Cj4+ICsKPj4gKwl0bXAgPSByZWFkbF9yZWxheGVkKHBsbC0+Y29uX3Jl
Zyk7Cj4+ICsJdG1wIHw9IEJJVChwbGwtPmVuYWJsZV9vZmZzKTsKPgo+IEkgdGhpbmsgeW91IG1l
YW50IGhlcmU6Cj4gCXRtcCAmPSB+QklUKCkKClllcywgSSBtZXNzZWQgaXQgdXAgd2hpbGUgY29w
eS9wYXN0aW5nIGZyb20gc2Ftc3VuZ19wbGwzeHh4X2VuYWJsZSgpLgoKPj4gKwl3cml0ZWxfcmVs
YXhlZCh0bXAsIHBsbC0+Y29uX3JlZyk7Cj4+ICt9Cgo+PiAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
c2Ftc3VuZ19wbGwzNnh4X3JlY2FsY19yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+PiAgCQkJCXVu
c2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpCj4+IEBAIC0zNTQsMTAgKzM1OSwxMiBAQCBzdGF0aWMg
aW50IHNhbXN1bmdfcGxsMzZ4eF9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQg
bG9uZyBkcmF0ZSwKPj4gIAl3cml0ZWxfcmVsYXhlZChwbGxfY29uMSwgcGxsLT5jb25fcmVnICsg
NCk7Cj4+Cj4+ICAJLyogd2FpdF9sb2NrX3RpbWUgKi8KPj4gLQlkbyB7Cj4+IC0JCWNwdV9yZWxh
eCgpOwo+PiAtCQl0bXAgPSByZWFkbF9yZWxheGVkKHBsbC0+Y29uX3JlZyk7Cj4+IC0JfSB3aGls
ZSAoISh0bXAgJiAoMSA8PCBQTEwzNlhYX0xPQ0tfU1RBVF9TSElGVCkpKTsKCkkgd2lsbCBhZGQg
YSBjb21tZW50IGhlcmUgbGlrZToKLyogV2FpdCB1bnRpbCB0aGUgUExMIGlzIGxvY2tlZCBpZiBp
dCBpcyBlbmFibGVkLiAqLwoKPj4gKwlpZiAocGxsX2NvbjAgJiBCSVQocGxsLT5lbmFibGVfb2Zm
cykpIHsKPgo+IFdoeSB0aGlzIGFkZGl0aW9uYWwgaWYoKSBpcyBuZWVkZWQ/CgpUaGUgUExMIHdp
bGwgbmV2ZXIgdHJhbnNpdGlvbiB0byBhIGxvY2tlZCBzdGF0ZSBpZiBpdCBpcyBkaXNhYmxlZCwg
d2l0aG91dAp0aGlzIHRlc3Qgd2Ugd291bGQgZW5kIHVwIHdpdGggYW4gaW5kZWZpbml0ZSBsb29w
IGJlbG93LgoKPj4gKwkJZG8gewo+PiArCQkJY3B1X3JlbGF4KCk7Cj4+ICsJCQl0bXAgPSByZWFk
bF9yZWxheGVkKHBsbC0+Y29uX3JlZyk7Cj4+ICsJCX0gd2hpbGUgKCEodG1wICYgQklUKFBMTDM2
WFhfTE9DS19TVEFUX1NISUZUKSkpOwo+Cj4gVG8gYmUgY29uc2lzdGVudDoKPiBCSVQocGxsLT5s
b2NrX29mZnMpPwoKWWVzLCBmaXhlZC4KClRoYW5rcyBmb3IgeW91ciByZXZpZXchCgotLQpSZWdh
cmRzLApTeWx3ZXN0ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
