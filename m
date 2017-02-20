From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Don't return -EBUSY when
 msg->size is 0 in aux transaction
Date: Mon, 20 Feb 2017 13:16:17 +0900
Message-ID: <CAAFQd5BJnZg+=VqN-Atf2a0G8Y+KV2R-PmOQRMqFbppKrH-n4g@mail.gmail.com>
References: <1486978066-5351-1-git-send-email-wzz@rock-chips.com>
 <CAAFQd5AaCQNP7M4a58Y03y2uY5vQeRfhm5jkyUgJcyQp9SYB4A@mail.gmail.com>
 <5c1ced2c-f182-ae3c-0edf-eb2ea5042720@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5c1ced2c-f182-ae3c-0edf-eb2ea5042720@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Zain Wang <wzz@rock-chips.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mika Kahola <mika.kahola@intel.com>, Jingoo Han <jingoohan1@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gTW9uLCBGZWIgMjAsIDIwMTcgYXQgMTowNCBQTSwgWmFpbiBXYW5nIDx3enpAcm9jay1jaGlw
cy5jb20+IHdyb3RlOgo+IOWcqCAyMDE3LzIvMjAgMTA6NDAsIFRvbWFzeiBGaWdhIOWGmemBkzoK
Pj4gT24gTW9uLCBGZWIgMTMsIDIwMTcgYXQgNjoyNyBQTSwgemFpbiB3YW5nIDx3enpAcm9jay1j
aGlwcy5jb20+IHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YW5hbG9naXgvYW5hbG9naXhfZHBfcmVnLmMKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuYwo+Pj4gaW5kZXggMzAzMDgzYS4uNTM4NGFjYSAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBf
cmVnLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhf
ZHBfcmVnLmMKPj4+IEBAIC0xMTYyLDUgKzExNjIsNSBAQCBzc2l6ZV90IGFuYWxvZ2l4X2RwX3Ry
YW5zZmVyKHN0cnVjdAo+Pj4gYW5hbG9naXhfZHBfZGV2aWNlICpkcCwKPj4+ICAgICAgICAgICAg
ICAgICAgIChtc2ctPnJlcXVlc3QgJiB+RFBfQVVYX0kyQ19NT1QpID09IERQX0FVWF9OQVRJVkVf
UkVBRCkKPj4+ICAgICAgICAgICAgICAgICAgbXNnLT5yZXBseSA9IERQX0FVWF9OQVRJVkVfUkVQ
TFlfQUNLOwo+Pj4KPj4+IC0gICAgICAgcmV0dXJuIG51bV90cmFuc2ZlcnJlZCA+IDAgPyBudW1f
dHJhbnNmZXJyZWQgOiAtRUJVU1k7Cj4+PiArICAgICAgIHJldHVybiAobnVtX3RyYW5zZmVycmVk
ID09IG1zZy0+c2l6ZSkgPyBudW1fdHJhbnNmZXJyZWQgOiAtRUJVU1k7Cj4+Cj4+IEkgbWlnaHQg
YmUgbWlzc2luZyBzb21ldGhpbmcgYnV0LCBsb29raW5nIGF0IHRoZSBjb2RlLCBJIGRvbid0IHNl
ZSBhbnkKPj4gcG9zc2liaWxpdHkgb2YgbnVtX3RyYW5zZmVycmVkIGV2ZXIgYmVpbmcgZGlmZmVy
ZW50IHRoYW4gbXNnLT5zaXplLiBUbwo+PiBiZSBob25lc3QsIGl0IGRvZXNuJ3Qgc2VlbSB0byBl
dmVuIG1ha2UgYW55IHNlbnNlIGtlZXBpbmcgdGhlIGxvY2FsCj4+IHZhcmlhYmxlIHRoZXJlLCBi
ZWNhdXNlIG1zZy0+c2l6ZSBjYW4gYmUgc2ltcGx5IGFsd2F5cyByZXR1cm5lZCwgYXMKPj4gZXJy
b3JzIGFyZSBoYW5kbGVkIGJ5IGp1bXBpbmcgdG8gYXV4X2Vycm9yIGxhYmVsLgo+Cj4gWWVhaCwg
SSBhZ3JlZSB3aXRoIHlvdS4KPiBUaGUgYmV0dGVyIHdheSB0byBmaXggdGhpcyBpc3N1ZSBpcyB0
byByZXZlcnQgdGhlIGNoYW5nZXMKPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
Lzk0MTE3MTEvCj4gKHJldHVybmluZyBudW1fdHJhbnNmZXJyZWQgZGlyZWN0bHkgbWF5IGJlIGJl
dHRlciBoZXJlKQoKSSB0aGluayBpdCdzIHN0aWxsIG5vdCBlbm91Z2ggdG8gY2xlYW4gdXAgdGhl
IGNvZGUgY29tcGxldGVseS4gSXQKc2hvdWxkIGJlIGp1c3QgZW5vdWdoIHRvIHJlbW92ZSBudW1f
dHJhbnNmZXJyZWQgY29tcGxldGVseSBhbmQgc2ltcGx5CnJldHVybiBtc2ctPnNpemUgYXQgdGhl
IGVuZC4KCkJlc3QgcmVnYXJkcywKVG9tYXN6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
