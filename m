From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v3 25/26] drm/bridge: require the owner .odev to
 be filled in on drm_bridge_add/attach
Date: Wed, 16 May 2018 12:15:09 +0200
Message-ID: <20180516101510.13215-26-peda@axentia.se>
References: <20180516101510.13215-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180516101510.13215-1-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpaul@ch>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIC5vZGV2IG93bmVyIGRldmljZSB3aWxsIGJlIGhhbmR5IHRvIGhhdmUgYXJvdW5kLgoKUmV2
aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkFja2VkLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdl
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Jy
aWRnZS5jCmluZGV4IGRmMDg0ZGIzMzQ5NC4uNzhkMTg2YjY4MzFiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdl
LmMKQEAgLTcwLDYgKzcwLDkgQEAgc3RhdGljIExJU1RfSEVBRChicmlkZ2VfbGlzdCk7CiAgKi8K
IHZvaWQgZHJtX2JyaWRnZV9hZGQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIHsKKwlpZiAo
V0FSTl9PTighYnJpZGdlLT5vZGV2KSkKKwkJcmV0dXJuOworCiAJbXV0ZXhfbG9jaygmYnJpZGdl
X2xvY2spOwogCWxpc3RfYWRkX3RhaWwoJmJyaWRnZS0+bGlzdCwgJmJyaWRnZV9saXN0KTsKIAlt
dXRleF91bmxvY2soJmJyaWRnZV9sb2NrKTsKQEAgLTExNSw2ICsxMTgsOSBAQCBpbnQgZHJtX2Jy
aWRnZV9hdHRhY2goc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLCBzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLAogCWlmICghZW5jb2RlciB8fCAhYnJpZGdlKQogCQlyZXR1cm4gLUVJTlZBTDsK
IAorCWlmIChXQVJOX09OKCFicmlkZ2UtPm9kZXYpKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCWlm
IChwcmV2aW91cyAmJiAoIXByZXZpb3VzLT5kZXYgfHwgcHJldmlvdXMtPmVuY29kZXIgIT0gZW5j
b2RlcikpCiAJCXJldHVybiAtRUlOVkFMOwogCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
