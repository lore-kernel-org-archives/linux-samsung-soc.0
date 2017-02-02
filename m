From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver
 on TM2 board
Date: Thu, 2 Feb 2017 15:24:55 +0100
Message-ID: <20170202142455.sjhaq37mwbomk7mf@phenom.ffwll.local>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com> <20170131085449.GA19348@ulmo.ba.sec>
 <20170131143853.GU20076@art_vandelay>
 <20170131150226.GB4519@ulmo.ba.sec>
 <87r33j85ap.fsf@eliezer.anholt.net>
 <20170131215105.GA3515@mithrandir.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20170131215105.GA3515@mithrandir.ba.sec>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, andi.shyti@samsung.com, jh80.chung@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, Hyungwon Hwang <human.hwang@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBKYW4gMzEsIDIwMTcgYXQgMTA6NTE6MDZQTSArMDEwMCwgVGhpZXJyeSBSZWRpbmcg
d3JvdGU6Cj4gT24gVHVlLCBKYW4gMzEsIDIwMTcgYXQgMTA6MTU6MTBBTSAtMDgwMCwgRXJpYyBB
bmhvbHQgd3JvdGU6Cj4gWy4uLl0KPiA+IEFzIGlzLCBJJ20gc3R1Y2sgb3V0IGhlcmUgd2l0aCBt
eSBwYW5lbCBkcml2ZXIgSSBzdWJtaXR0ZWQgb24gRGVjZW1iZXIKPiA+IDE0dGggY29tcGxldGVs
eSBpZ25vcmVkLCBhbmQgbm8gb3RoZXIgZGV2ZWxvcGVyIHdpbGwgbG9vayBhdCBpdCBiZWNhdXNl
Cj4gPiB0aGVpciByZXZpZXcgZG9lc24ndCBjb3VudCBhbmQgb25seSB5b3VycyBkb2VzLgo+IAo+
IEZvciB0aGUgcmVjb3JkLCB1bnRpbCBlYXJsaWVyIHRvZGF5IHdoZW4gRGFuaWVsIHN0YXJ0ZWQg
dG8gcmV2aWV3IHlvdXIKPiBwYXRjaGVzLCBubyBkb3VidCBpbiByZXNwb25zZSB0byB0aGlzIGRp
c2N1c3Npb24sIHRoZXJlIHdhcyBleGFjdGx5IG9uZQo+IHJlc3BvbnNlIHRvIG9uZSBvZiB5b3Vy
IGNsb2NrIGRyaXZlciBwYXRjaGVzIGluIHRoZSBzZXJpZXMuCj4gCj4gU28gY2FuIHdlIHBsZWFz
ZSBzdG9wIHNpbmdsaW5nIG91dCBwYW5lbCBkcml2ZXJzPyBUaGlzIGlzIGEgZ2VuZXJhbAo+IHBy
b2JsZW0gdGhhdCB3ZSd2ZSBoYWQgYWNyb3NzIHRoZSBrZXJuZWwsIG9yIGF0IGxlYXN0IHRoZSBB
Uk0gYW5kCj4gcmVsYXRlZCBwYXJ0cyBvZiBpdCwgZm9yIGFzIGxvbmcgYXMgSSBjYW4gcmVtZW1i
ZXIuCgpJIG9ubHkgbG9va2VkIGF0IHRoYXQgYXMgcGFydCBvZiB0aGUgZHJtLW1pc2Mgc21hbGwg
ZHJpdmVycyBleHBlcmltZW50LCB0bwpoZWxwIGtpY2tzdGFydCBhIHJldmlldyBtYXJrZXQuIEkg
ZGlkbid0IGxvb2sgYXQgdGhlIHBhbmVsIHN0dWZmLiBBbmQgdGhlCnJlYXNvbiBJIGxvb2tlZCBh
dCB0aGF0IHJpZ2h0IG5vdyBpcyBiZWNhdXNlIHJpZ2h0IG5vdyB3ZSBzdGFydGVkIHRoaXMKZXhw
ZXJpbWVudC4gVGhhdCBoYXMgbm90aGluZyBhdCBhbGwgdG8gZG8gd2l0aCB3aGF0J3MgZ29pbmcg
b24gd2l0aApkcm0tcGFuZWwuIElmIHlvdSBsb29rIGF0IGRybS1taXNjLCB0aGUgZHNpIHBhdGNo
ZXMgZm9yIHZjNCBoYXZlIG5vdwpsYW5kZWQsIGJ1dCB0aGUgcGFuZWwgZHJpdmVyIGZvciB0aGUg
cnBpIDciIHRvdWNoc2NyZWVuIGhhc24ndC4KCkFuZCBFcmljIGhhZCB0aGUgZHNpIHBhdGNoZXMg
cXVldWVkIGluIGhpcyB2YzQgdHJlZSBzaW5jZSBhIHdoaWxlLCBqdXN0CndhaXRpbmcgdG8gYmUg
c2VudCBvdXQgaW4gYSBwdWxsIHJlcXVlc3QuIFdlJ3ZlIG9ubHkgZ29uZSB0aHJvdWdoIHRoZSBm
YXN0CnJldmlldyttZXJnaW5nIHRvIGRybS1taXNjIHRvIHRyeSBvdXQgdGhlIG5ldyBwcm9jZXNz
LiBTbyBub3QgcmVsYXRlZCBhdAphbGwgSSB0aGluay4KLURhbmllbAotLSAKRGFuaWVsIFZldHRl
cgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
