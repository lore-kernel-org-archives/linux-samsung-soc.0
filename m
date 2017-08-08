From: Vincent ABRIOU <vincent.abriou@st.com>
Subject: Re: [PATCH 5/8] drm: Nuke
	drm_atomic_helper_plane_set_property
Date: Tue, 8 Aug 2017 10:03:00 +0000
Message-ID: <d7a0f3da-4254-a694-5975-db6fe395461f@st.com>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-6-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20170725080122.20548-6-daniel.vetter@ffwll.ch>
Content-Language: en-US
Content-ID: <8C696F6A28AF3C478DEE35A586A807CC@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Daniel Vetter <daniel.vetter@intel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Mali DP Maintainers <malidp@foss.arm.com>, Ben Skeggs <bskeggs@redhat.com>, Thomas Hellstrom <thellstrom@vmware.com>, Eric Engestrom <eric@engestrom.ch>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

DQoNCk9uIDA3LzI1LzIwMTcgMTA6MDEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IEl0J3Mg
ZGVhZCBjb2RlLCB0aGUgY29yZSBoYW5kbGVzIGFsbCB0aGlzIGRpcmVjdGx5IG5vdy4gVGhpcyBh
bHNvDQo+IGFsbG93cyB1cyB0byB1bmV4cG9ydCBkcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9zZXRf
cHJvcGVydHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4NCg0KWy4uLl0NCg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2N1
cnNvci5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2dkcC5jICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkv
c3RpX2hxdmRwLmMgICAgICAgICAgICAgICAgIHwgIDEgLQ0KDQpBY2tlZC1ieTogVmluY2VudCBB
YnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4NCg0KQlINClZpbmNlbnQKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
