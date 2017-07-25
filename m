From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 1/4] drm/atomic: implement
 drm_atomic_helper_commit_tail for runtime_pm users
Date: Tue, 25 Jul 2017 10:09:24 +0200
Message-ID: <20170725080924.edh4h6njfxlwma7o@phenom.ffwll.local>
References: <cover.204b8c1b76558ee33ecf147e51c2b6a04d302d55.1500555652.git-series.maxime.ripard@free-electrons.com>
 <a8f92dc70048bab746e94dadd1c23200626aff60.1500555652.git-series.maxime.ripard@free-electrons.com>
 <20170720184628.5vizn7hjdaaz7rqy@phenom.ffwll.local>
 <20170725065734.kbtb2mrfsjwm2szz@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20170725065734.kbtb2mrfsjwm2szz@flea>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBKdWwgMjUsIDIwMTcgYXQgMDg6NTc6MzRBTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gT24gVGh1LCBKdWwgMjAsIDIwMTcgYXQgMDg6NDY6MjhQ
TSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIFRodSwgSnVsIDIwLCAyMDE3IGF0
IDAzOjAxOjE2UE0gKzAyMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gPiA+IFRoZSBjdXJyZW50
IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsIGhlbHBlciB3b3JrcyBvbmx5IGlmIHRoZSBD
UlRDIGlzCj4gPiA+IGFjY2Vzc2libGUsIGFuZCBkb2N1bWVudHMgYW4gYWx0ZXJuYXRpdmUgaW1w
bGVtZW50YXRpb24gdGhhdCBpcyBzdXBwb3NlZCB0bwo+ID4gPiBiZSB1c2VkIGlmIHRoYXQgaGFw
cGVucy4KPiA+ID4gCj4gPiA+IFRoYXQgaW1wbGVtZW50YXRpb24gaXMgdGhlbiBkdXBsaWNhdGVk
IGJ5IHNvbWUgZHJpdmVycy4gSW5zdGVhZCBvZgo+ID4gPiBkb2N1bWVudGluZyBpdCwgbGV0J3Mg
aW1wbGVtZW50IGFuIGhlbHBlciB0aGF0IGFsbCB0aGUgcmVsZXZhbnQgdXNlcnMgY2FuCj4gPiA+
IHVzZSBkaXJlY3RseS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgo+ID4gCj4gPiBSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IAo+ID4gU2hvdWxkIEkg
dGhyb3cgdGhpcyBpbnRvIGRybS1taXNjLCBvciBkbyB5b3Ugd2FudCB0byBtZXJnZSB0aGlzIHRo
cm91Z2gKPiA+IHNvbWUgZHJpdmVyIHRyZWU/Cj4gCj4gWWVzLCB5b3UgY2FuIHB1dCB0aGVtIGlu
IGRybS1taXNjLCBpdCB3aWxsIHRoZSBiZSB0aGUgZWFzaWVzdCBvcHRpb24uCgpNZXJnZWQsIHRo
YW5rcy4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
