From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [RFC PATCH 2/8] drm: exynos/dp: convert to drm bridge mode
Date: Thu, 6 Aug 2015 22:29:29 +0800
Message-ID: <55C36F49.6020207@rock-chips.com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
 <1438870041-23130-1-git-send-email-ykk@rock-chips.com>
 <000001d0d052$f44fa3a0$dceeeae0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <000001d0d052$f44fa3a0$dceeeae0$@com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jingoo Han <jingoohan1@gmail.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Fabio Estevam' <fabio.estevam@freescale.com>, 'Inki Dae' <inki.dae@samsung.com>
Cc: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, 'Andrzej Hajda' <a.hajda@samsung.com>, 'Gustavo Padovan' <gustavo.padovan@collabora.co.uk>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Vincent Palatin' <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, 'Kukjin Kim' <kgene@kernel.org>, 'Thierry Reding' <treding@nvidia.com>, dianders@google.com, linux-arm-kernel@lists.infradead.org, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, djkurtz@google.com, 'Andy Yan' <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSmluZ29vLAoK5ZyoIDIwMTUvOC82IDIyOjE5LCBKaW5nb28gSGFuIOWGmemBkzoKPiBPbiBU
aHVyc2RheSwgQXVndXN0IDA2LCAyMDE1IDExOjA3IFBNLCBZYWtpciBZYW5nIHdyb3RlOgo+PiBJ
biBvcmRlciB0byBtb3ZlIGV4eW5vcyBkcCBjb2RlIHRvIGJyaWRnZSBkaXJlY3RvcnksCj4+IHdl
IG5lZWQgdG8gY29udmVydCBkcml2ZXIgZHJtIGJyaWRnZSBtb2RlIGZpcnN0LiBBcwo+PiBkcCBk
cml2ZXIgYWxyZWFkeSBoYXZlIGEgcHRuMzQ2MCBicmlkZ2UsIHNvIHdlIG5lZWQKPj4gdG8gbW92
ZSBwdG4gYnJpZGdlIHRvIHRoZSBuZXh0IGJyaWRnZSBvZiBkcCBicmlkZ2UuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KPj4gLS0tCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHBfY29yZS5jIHwgMTk2ICsrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHBf
Y29yZS5oIHwgICAyICsKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspLCA3
MiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUu
Ywo+PiBpbmRleCBhODA5N2E0Li5hYTk5ZTIzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcF9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHBfY29yZS5jCj4+IEBAIC0zLDYgKzMsNyBAQAo+PiAgICAqCj4+ICAgICogQ29w
eXJpZ2h0IChDKSAyMDEyIFNhbXN1bmcgRWxlY3Ryb25pY3MgQ28uLCBMdGQuCj4+ICAgICogQXV0
aG9yOiBKaW5nb28gSGFuIDxqZzEuaGFuQHNhbXN1bmcuY29tPgo+PiArICogICAgICAgICBZYWtp
ciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Cj4gUGxlYXNlIGRvbid0IGFkZCB0aGlzLgo+IFlv
dSBqdXN0IGZpeGVkIHNvbWUgcGFydHMgb2YgdGhpcyBjb2RlLiBJIGRvbid0IGZpbmQgdGhlIHJl
YXNvbgo+IHdoeSB5b3UgaGF2ZSB0byBiZSBhZGRlZCB0byBhdXRob3IgZm9yIHRoaXMgZmlsZS4K
PiBJZiB5b3Ugd2FudCB0aGUgdGl0bGUgZm9yIGFuIGF1dGhvciwgcGxlYXNlIHNlbmQgdGhlIHBh
dGNoCj4gZm9yIGEgbmV3IElQLCBpbnN0ZWFkIG9mIG1vZGlmeWluZyB0aGUgZXhpdGluZyBjb2Rl
cy4KCk9rYXksIHRoYW5rcyBmb3IgeW91ciByZW1pbmQgOykKCj4+ICAgWy4uLl0KPj4gICBNT0RV
TEVfQVVUSE9SKCJKaW5nb28gSGFuIDxqZzEuaGFuQHNhbXN1bmcuY29tPiIpOwo+PiArTU9EVUxF
X0FVVEhPUigiWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPiIpOwo+IFRoZSBzYW1lIGFz
IGFib3ZlLgoKRG9uZQo+PiAgIE1PRFVMRV9ERVNDUklQVElPTigiU2Ftc3VuZyBTb0MgRFAgRHJp
dmVyIik7Cj4+ICAgTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHBfY29yZS5oIGIvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHBfY29yZS5oCj4+IGluZGV4IGMzMjFhZDUuLmYyNTg0YjggMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUuaAo+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcF9jb3JlLmgKPj4gQEAgLTMsNiArMyw3IEBA
Cj4+ICAgICoKPj4gICAgKiBDb3B5cmlnaHQgKEMpIDIwMTIgU2Ftc3VuZyBFbGVjdHJvbmljcyBD
by4sIEx0ZC4KPj4gICAgKiBBdXRob3I6IEppbmdvbyBIYW4gPGpnMS5oYW5Ac2Ftc3VuZy5jb20+
Cj4+ICsgKiAgICAgICAgIFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KPiBUaGUgc2Ft
ZSBhcyBhYm92ZS4KPiBIZXJlLCB5b3UganVzdCBhZGRlZCAxIGxpbmUuIElmIHdlIGFkZCBzb21l
b25lIHRvIGF1dGhvcgo+IGluIHRoaXMgd2F5LCBhIGxvdCBvZiBwZW9wbGUgc2hvdWxkIGJlIGFk
ZGVkIHRvIGF1dGhvci4KCkRvbmUKCi0gWWFraXIKPiBCZXN0IHJlZ2FyZHMsCj4gSmluZ29vIEhh
bgo+Cj4KPgo+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
