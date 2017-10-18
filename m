From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [RFC PATCH v4 6/8] drm/bridge/analogix: Do not use device's
 drvdata
Date: Wed, 18 Oct 2017 10:16:08 +0530
Message-ID: <c11c1115-58fb-f6d4-56f8-05277a9ccea9@codeaurora.org>
References: <20171017101624.12506-1-jeffy.chen@rock-chips.com>
 <20171017101624.12506-7-jeffy.chen@rock-chips.com>
 <000101d347a1$cd216160$67642420$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <000101d347a1$cd216160$67642420$@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: 'Jeffy Chen' <jeffy.chen@rock-chips.com>
Cc: 'Daniel Vetter' <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, dianders@chromium.org, 'Laurent Pinchart' <Laurent.pinchart@ideasonboard.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, briannorris@chromium.org, 'Krzysztof Kozlowski' <krzk@kernel.org>, linux-rockchip@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>, 'Caesar Wang' <wxt@rock-chips.com>, broonie@kernel.org, 'Vincent Abriou' <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org, 'zain wang' <wzz@rock-chips.com>, 'Tomeu Vizoso' <tomeu.vizoso@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, dmitry.torokhov@gmail.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, tfiga@chromium.org, 'Kyungmin Park' <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAxMC8xOC8yMDE3IDA1OjEzIEFNLCBKaW5nb28gSGFuIHdyb3RlOgo+IE9uIFR1ZXNk
YXksIE9jdG9iZXIgMTcsIDIwMTcgNjoxNiBBTSwgSmVmZnkgQ2hlbiB3cm90ZToKPj4KPj4gRnJv
bTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KPj4KPj4gVGhlIGRyaXZlciB0aGF0
IGluc3RhbnRpYXRlcyB0aGUgYnJpZGdlIHNob3VsZCBvd24gdGhlIGRydmRhdGEsIGFzIGFsbAo+
PiBkcml2ZXIgbW9kZWwgY2FsbGJhY2tzIChwcm9iZSwgcmVtb3ZlLCBzaHV0ZG93biwgUE0gb3Bz
LCBldGMuKSBhcmUgYWxzbwo+PiBvd25lZCBieSBpdHMgZHJpdmVyIHN0cnVjdC4gTW9yZW92ZXIs
IHN0b3JpbmcgdHdvIGRpZmZlcmVudCBwb2ludGVyCj4+IHR5cGVzIGluIGRyaXZlciBkYXRhIGRl
cGVuZGluZyBvbiBkcml2ZXIgaW5pdGlhbGl6YXRpb24gc3RhdHVzIGlzIGJhcmVseQo+PiBhIGdv
b2QgcHJhY3RpY2UgYW5kIGluIGZhY3QgaGFzIGxlZCB0byBtYW55IGJ1Z3MgaW4gdGhpcyBkcml2
ZXIuCj4+Cj4+IExldCdzIGNsZWFuIHVwIHRoaXMgbWVzcyBhbmQgY2hhbmdlIEFuYWxvZ2l4IGVu
dHJ5IHBvaW50cyB0byBzaW1wbHkKPj4gYWNjZXB0IHNvbWUgb3BhcXVlIHN0cnVjdCBwb2ludGVy
LCBhZGp1c3RpbmcgdGhlaXIgdXNlcnMgYXQgdGhlIHNhbWUKPj4gdGltZSB0byBhdm9pZCBicmVh
a2luZyB0aGUgY29tcGlsYXRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0
ZmlnYUBjaHJvbWl1bS5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEplZmZ5IENoZW4gPGplZmZ5LmNo
ZW5Acm9jay1jaGlwcy5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPgo+IAoKVGhpcyBkZXBlbmRzIG9uIHByZXZpb3VzIHBhdGNoZXMgb2YgdGhl
IHNlcmllcy4gSSBndWVzcyBpdCB3b3VsZCBiZSBlYXNpZXIKdG8gcXVldWUgdGhpcyB0byBkcm0t
bWlzYyBhcyBhIHBhcnQgb2YgdGhlIGVEUCBzdXBwb3J0IHNlcmllcy4gRm9yIHRoYXQ6CgpBY2tl
ZC1ieTogQXJjaGl0IFRhbmVqYSA8YXJjaGl0dEBjb2RlYXVyb3JhLm9yZz4KCj4gQWNrZWQtYnk6
IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+IAo+IEJlc3QgcmVnYXJkcywKPiBK
aW5nb28gSGFuCj4gCj4+IC0tLQo+Pgo+PiBDaGFuZ2VzIGluIHY0OiBOb25lCj4+IENoYW5nZXMg
aW4gdjM6IE5vbmUKPj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Pgo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIHwgNTAgKysrKysrKysrLS0tLS0t
LS0KPj4gLS0tLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jICAgICAg
ICAgICAgICAgICB8IDI2ICsrKysrKy0tLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMgICAgfCA0Nwo+ICsrKysrKysrKysrLS0tLS0tLQo+PiAt
LQo+PiAgIGluY2x1ZGUvZHJtL2JyaWRnZS9hbmFsb2dpeF9kcC5oICAgICAgICAgICAgICAgICAg
IHwgMTkgKysrKy0tLS0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDY5
IGRlbGV0aW9ucygtKQo+Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKPiAKCi0tIApRdWFsY29tbSBJbm5v
dmF0aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBM
aW51eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
