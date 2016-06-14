From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 10/10] drm/bridge: analogix_dp: fix no drm hpd event when
 panel plug in
Date: Tue, 14 Jun 2016 19:46:42 +0800
Message-ID: <1465904802-1164-1-git-send-email-ykk@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1465904718-663-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tomasz Figa <tomasz.figa-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGVudW0gdmFsdWUgb2YgRFBfSVJRX1RZUEVfSFBfQ0FCTEVfSU4gaXMgemVybywgYnV0IGRy
aXZlciBvbmx5CnNlbmQgZHJtIGhwIGV2ZW50IHdoZW4gdGhlIGlycV90eXBlIGFuZCB0aGUgZW51
bSB2YWx1ZSBpcyB0cnVlLgoKaWYgKGlycV90eXBlICYgRFBfSVJRX1RZUEVfSFBfQ0FCTEVfSU4g
fHwgLi4uKQoJZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGRwLT5kcm1fZGV2KTsKClNvIHRoZXJl
IHdvdWxkIG5vIGRybSBocGQgZXZlbnQgd2hlbiBjYWJsZSBwbHVnIGluLCB0byBmaXggdGhhdApq
dXN0IG5lZWQgdG8gYXNzaWduIGFsbCBob3RwbHVnIGVudW0gd2l0aCBuby16ZXJvIHZhbHVlcy4K
ClJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+ClNp
Z25lZC1vZmYtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KUmV2aWV3ZWQtYnk6
IFN0w6lwaGFuZSBNYXJjaGVzaW4gPG1hcmNoZXVAY2hyb21pdW0ub3JnPgpUZXN0ZWQtYnk6IEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KLS0tCkNoYW5n
ZXMgaW4gdjM6Ci0gQWRkIHJldmlld2VkIGZsYWcgZnJvbSBTdMOpcGhhbmUuCiAgICBbaHR0cHM6
Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS8jL2MvMzQ2MzE5LzE1XQotIEFkZCB0
ZXN0ZWQgZmxhZyBmcm9tIEphdmllcgoKQ2hhbmdlcyBpbiB2MjogTm9uZQoKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5oIHwgOCArKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5oCmluZGV4IGYw
OTI3NWQuLmI0NTYzODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXhfZHBfY29yZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9n
aXgvYW5hbG9naXhfZHBfY29yZS5oCkBAIC0xMjcsMTAgKzEyNywxMCBAQCBlbnVtIGFuYWxvZ19w
b3dlcl9ibG9jayB7CiB9OwogCiBlbnVtIGRwX2lycV90eXBlIHsKLQlEUF9JUlFfVFlQRV9IUF9D
QUJMRV9JTiwKLQlEUF9JUlFfVFlQRV9IUF9DQUJMRV9PVVQsCi0JRFBfSVJRX1RZUEVfSFBfQ0hB
TkdFLAotCURQX0lSUV9UWVBFX1VOS05PV04sCisJRFBfSVJRX1RZUEVfSFBfQ0FCTEVfSU4gID0g
QklUKDApLAorCURQX0lSUV9UWVBFX0hQX0NBQkxFX09VVCA9IEJJVCgxKSwKKwlEUF9JUlFfVFlQ
RV9IUF9DSEFOR0UgICAgPSBCSVQoMiksCisJRFBfSVJRX1RZUEVfVU5LTk9XTiAgICAgID0gQklU
KDMpLAogfTsKIAogc3RydWN0IHZpZGVvX2luZm8gewotLSAKMS45LjEKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtcm9ja2NoaXAgbWFpbGlu
ZyBsaXN0CkxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=
