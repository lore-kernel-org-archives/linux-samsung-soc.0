From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 10/10] drm/bridge: analogix_dp: fix no drm hpd event
 when panel plug in
Date: Wed, 29 Jun 2016 11:35:57 +0800
Message-ID: <5773421D.4070202@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
 <1465904802-1164-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbJwWCBcj9CsxXnu4S4W94r8TioTf1p-poYH8Tac8hYO0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOw6vbJwWCBcj9CsxXnu4S4W94r8TioTf1p-poYH8Tac8hYO0Q@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Yao <yzq@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

U2VhbiwKCk9uIDA2LzIzLzIwMTYgMTA6MjQgUE0sIFNlYW4gUGF1bCB3cm90ZToKPiBPbiBUdWUs
IEp1biAxNCwgMjAxNiBhdCA3OjQ2IEFNLCBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+
IHdyb3RlOgo+PiBUaGUgZW51bSB2YWx1ZSBvZiBEUF9JUlFfVFlQRV9IUF9DQUJMRV9JTiBpcyB6
ZXJvLCBidXQgZHJpdmVyIG9ubHkKPj4gc2VuZCBkcm0gaHAgZXZlbnQgd2hlbiB0aGUgaXJxX3R5
cGUgYW5kIHRoZSBlbnVtIHZhbHVlIGlzIHRydWUuCj4+Cj4+IGlmIChpcnFfdHlwZSAmIERQX0lS
UV9UWVBFX0hQX0NBQkxFX0lOIHx8IC4uLikKPj4gICAgICAgICAgZHJtX2hlbHBlcl9ocGRfaXJx
X2V2ZW50KGRwLT5kcm1fZGV2KTsKPj4KPj4gU28gdGhlcmUgd291bGQgbm8gZHJtIGhwZCBldmVu
dCB3aGVuIGNhYmxlIHBsdWcgaW4sIHRvIGZpeCB0aGF0Cj4+IGp1c3QgbmVlZCB0byBhc3NpZ24g
YWxsIGhvdHBsdWcgZW51bSB3aXRoIG5vLXplcm8gdmFsdWVzLgo+Pgo+PiBSZXBvcnRlZC1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Cj4+IFJldmlld2VkLWJ5OiBTdMOpcGhh
bmUgTWFyY2hlc2luIDxtYXJjaGV1QGNocm9taXVtLm9yZz4KPj4gVGVzdGVkLWJ5OiBKYXZpZXIg
TWFydGluZXogQ2FuaWxsYXMgPGphdmllckBvc2cuc2Ftc3VuZy5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+CgpUaGFua3MgIDspCgo+PiAtLS0K
Pj4gQ2hhbmdlcyBpbiB2MzoKPj4gLSBBZGQgcmV2aWV3ZWQgZmxhZyBmcm9tIFN0w6lwaGFuZS4K
Pj4gICAgICBbaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS8jL2MvMzQ2
MzE5LzE1XQo+PiAtIEFkZCB0ZXN0ZWQgZmxhZyBmcm9tIEphdmllcgo+Pgo+PiBDaGFuZ2VzIGlu
IHYyOiBOb25lCj4+Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dp
eF9kcF9jb3JlLmggfCA4ICsrKystLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5oIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmgKPj4gaW5kZXggZjA5Mjc1ZC4uYjQ1NjM4MCAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9k
cF9jb3JlLmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dp
eF9kcF9jb3JlLmgKPj4gQEAgLTEyNywxMCArMTI3LDEwIEBAIGVudW0gYW5hbG9nX3Bvd2VyX2Js
b2NrIHsKPj4gICB9Owo+Pgo+PiAgIGVudW0gZHBfaXJxX3R5cGUgewo+PiAtICAgICAgIERQX0lS
UV9UWVBFX0hQX0NBQkxFX0lOLAo+PiAtICAgICAgIERQX0lSUV9UWVBFX0hQX0NBQkxFX09VVCwK
Pj4gLSAgICAgICBEUF9JUlFfVFlQRV9IUF9DSEFOR0UsCj4+IC0gICAgICAgRFBfSVJRX1RZUEVf
VU5LTk9XTiwKPj4gKyAgICAgICBEUF9JUlFfVFlQRV9IUF9DQUJMRV9JTiAgPSBCSVQoMCksCj4+
ICsgICAgICAgRFBfSVJRX1RZUEVfSFBfQ0FCTEVfT1VUID0gQklUKDEpLAo+PiArICAgICAgIERQ
X0lSUV9UWVBFX0hQX0NIQU5HRSAgICA9IEJJVCgyKSwKPj4gKyAgICAgICBEUF9JUlFfVFlQRV9V
TktOT1dOICAgICAgPSBCSVQoMyksCj4+ICAgfTsKPj4KPj4gICBzdHJ1Y3QgdmlkZW9faW5mbyB7
Cj4+IC0tCj4+IDEuOS4xCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
