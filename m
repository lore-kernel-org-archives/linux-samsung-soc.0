From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v2 25/26] drm/bridge: require the owner .odev to
 be filled in on drm_bridge_add/attach
Date: Fri,  4 May 2018 15:52:11 +0200
Message-ID: <20180504135212.26977-26-peda@axentia.se>
References: <20180504135212.26977-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180504135212.26977-1-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
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
Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Inki
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIC5vZGV2IG93bmVyIGRldmljZSB3aWxsIGJlIGhhbmR5IHRvIGhhdmUgYXJvdW5kLgoKU2ln
bmVkLW9mZi1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2JyaWRnZS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9icmlkZ2UuYwppbmRleCBkZjA4NGRiMzM0OTQuLjc4ZDE4NmI2ODMxYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2JyaWRnZS5jCkBAIC03MCw2ICs3MCw5IEBAIHN0YXRpYyBMSVNUX0hFQUQoYnJp
ZGdlX2xpc3QpOwogICovCiB2b2lkIGRybV9icmlkZ2VfYWRkKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UpCiB7CisJaWYgKFdBUk5fT04oIWJyaWRnZS0+b2RldikpCisJCXJldHVybjsKKwogCW11
dGV4X2xvY2soJmJyaWRnZV9sb2NrKTsKIAlsaXN0X2FkZF90YWlsKCZicmlkZ2UtPmxpc3QsICZi
cmlkZ2VfbGlzdCk7CiAJbXV0ZXhfdW5sb2NrKCZicmlkZ2VfbG9jayk7CkBAIC0xMTUsNiArMTE4
LDkgQEAgaW50IGRybV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwg
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKIAlpZiAoIWVuY29kZXIgfHwgIWJyaWRnZSkKIAkJ
cmV0dXJuIC1FSU5WQUw7CiAKKwlpZiAoV0FSTl9PTighYnJpZGdlLT5vZGV2KSkKKwkJcmV0dXJu
IC1FSU5WQUw7CisKIAlpZiAocHJldmlvdXMgJiYgKCFwcmV2aW91cy0+ZGV2IHx8IHByZXZpb3Vz
LT5lbmNvZGVyICE9IGVuY29kZXIpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4xMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
