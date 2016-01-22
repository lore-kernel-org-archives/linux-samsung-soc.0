From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v12.1 07/17] drm: rockchip: dp: add rockchip platform dp
 driver
Date: Fri, 22 Jan 2016 09:37:08 +0800
Message-ID: <56A187C4.2030100@rock-chips.com>
References: <1450873538-18304-1-git-send-email-ykk@rock-chips.com>
 <1453197893-13413-1-git-send-email-ykk@rock-chips.com>
 <7132332.jmLRiUjx3U@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7132332.jmLRiUjx3U@phil>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSGVpa28sCgpPbiAwMS8yMi8yMDE2IDAzOjExIEFNLCBIZWlrbyBTdHVlYm5lciB3cm90ZToK
PiBIaSBZYWtpciwKPgo+IEFtIERpZW5zdGFnLCAxOS4gSmFudWFyIDIwMTYsIDE4OjA0OjUzIHNj
aHJpZWIgWWFraXIgWWFuZzoKPj4gUm9ja2NoaXAgaGF2ZSB0aHJlZSBjbG9ja3MgZm9yIGRwIGNv
bnRyb2xsZXIsIHdlIGxlYXZlIHBjbGtfZWRwCj4+IHRvIGFuYWxvZ2l4X2RwIGRyaXZlciBjb250
cm9sLCBhbmQga2VlcCB0aGUgc2Nsa19lZHBfMjRtIGFuZAo+PiBzY2xrX2VkcCBpbiBwbGF0Zm9y
bSBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBz
LmNvbT4KPj4gVGVzdGVkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllckBvc2cu
c2Ftc3VuZy5jb20+Cj4+IC0tLQo+IFsuLi5dCj4KPj4gK3N0YXRpYyBpbnQgcm9ja2NoaXBfZHBf
ZHJtX2NyZWF0ZV9lbmNvZGVyKHN0cnVjdCByb2NrY2hpcF9kcF9kZXZpY2UgKmRwKQo+PiArewo+
PiArCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciA9ICZkcC0+ZW5jb2RlcjsKPj4gKwlzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRwLT5kcm1fZGV2Owo+PiArCXN0cnVjdCBkZXZpY2Ug
KmRldiA9IGRwLT5kZXY7Cj4+ICsJaW50IHJldDsKPj4gKwo+PiArCWVuY29kZXItPnBvc3NpYmxl
X2NydGNzID0gZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3MoZHJtX2RldiwKPj4gKwkJCQkJCQkg
ICAgIGRldi0+b2Zfbm9kZSk7Cj4+ICsJRFJNX0RFQlVHX0tNUygicG9zc2libGVfY3J0Y3MgPSAw
eCV4XG4iLCBlbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyk7Cj4+ICsKPj4gKwlyZXQgPSBkcm1fZW5j
b2Rlcl9pbml0KGRybV9kZXYsIGVuY29kZXIsICZyb2NrY2hpcF9kcF9lbmNvZGVyX2Z1bmNzLAo+
PiArCQkJICAgICAgIERSTV9NT0RFX0VOQ09ERVJfVE1EUyk7Cj4gc2hvdWxkIGJlCj4gKwkJCSAg
ICAgICBEUk1fTU9ERV9FTkNPREVSX1RNRFMsIE5VTEwpOwoKT3BzLCAgOi18Cgo+IEV4eW5vcy1z
aWRlIHNlZW1zIHRvIGJlIG9rIHRob3VnaC4KPgo+IFdpdGggdGhlIGFkYXB0ZWQgdjEyLjEgcGF0
Y2hlcyBpdCBhcHBsaWVzIGNsZWFubHkgYW5kIGRpc3BsYXkgaXMgd29ya2luZyBhcwo+IHdlbGwu
IFNvIHdpdGggdGhlIHRoaW5nIGFib3ZlIGZpeGVkLCB5b3UgY291bGQgcmVzdWJtaXQgYSBmdWxs
IHYxMywKPiBlc3BlY2lhbGx5IGFzIHlvdSB3YW50IHRvIGRyb3AgcGF0Y2ggMTYgYXMgZGlzY3Vz
c2VkIHRoZXJlLgoKR290IGl0IDopCgpUaGFua3MsCllha2lyCj4KPiBIZWlrbwo+Cj4KPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
