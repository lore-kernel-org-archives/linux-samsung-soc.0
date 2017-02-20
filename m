From: Zain Wang <wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Don't return -EBUSY when
 msg->size is 0 in aux transaction
Date: Mon, 20 Feb 2017 10:13:42 +0800
Message-ID: <ba2f3125-372d-3127-7508-5a86539a8ca4@rock-chips.com>
References: <1486978066-5351-1-git-send-email-wzz@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1486978066-5351-1-git-send-email-wzz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Mika Kahola <mika.kahola-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgU2VhbiwKCiAgICAgQ291bGQgeW91IGdpdmUgc29tZSBjb21tZW50cyBmb3IgdGhpcyBwYXRj
aD8KClRoYW5rcwpaYWluCgoK5ZyoIDIwMTcvMi8xMyAxNzoyNywgemFpbiB3YW5nIOWGmemBkzoK
PiBUaGUgYW5hbG9naXhfZHBfdHJhbnNmZXIoKSB3aWxsIHJldHVybiAtRUJVU1kgaWYgbnVtX3Ry
YW5zZmVycmVkIGlzIHplcm8uCj4gQnV0IHNvbWV0aW1lcyB3ZSB3aWxsIHNlbmQgYSBiYXJlIGFk
ZHJlc3MgcGFja2V0IHRvIHN0YXJ0IHRoZSB0cmFuc2FjdGlvbiwKPiBsaWtlIGRybV9kcF9pMmNf
eGZlcigpIHNob3c6Cj4gCS4uLi4uLgo+IAkvKiBTZW5kIGEgYmFyZSBhZGRyZXNzIHBhY2tldCB0
byBzdGFydCB0aGUgdHJhbnNhY3Rpb24uCj4gCSAqIFplcm8gc2l6ZWQgbWVzc2FnZXMgc3BlY2lm
eSBhbiBhZGRyZXNzIG9ubHkgKGJhcmUKPiAJICogYWRkcmVzcykgdHJhbnNhY3Rpb24uCj4gCSAq
Lwo+IAltc2cuYnVmZmVyID0gTlVMTDsKPiAJbXNnLnNpemUgPSAwOwo+IAllcnIgPSBkcm1fZHBf
aTJjX2RvX21zZyhhdXgsICZtc2cpOwo+IAkuLi4uLi4KPgo+IEluIHRoaXMgY2FzZSwgdGhlIG1z
Zy0+c2l6ZSBpcyB6ZXJvLCBzbyB0aGUgbnVtX3RyYW5zZmVycmVkIHdpbGwgYmUgemVybyB0b28u
Cj4gV2UgY2FuJ3QgcmV0dXJuIC1FQlVTWSBoZXJlLCBsZXQncyB3ZSByZXR1cm4gbnVtX3RyYW5z
ZmVycmVkIGlmIG51bV90cmFuc2ZlcnJlZAo+IGVxdWFscyBtc2ctPnNpemUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiB6YWluIHdhbmcgPHd6ekByb2NrLWNoaXBzLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfcmVnLmMgfCAyICstCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5jIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuYwo+IGluZGV4IDMw
MzA4M2EuLjUzODRhY2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbmFsb2dpeF9kcF9yZWcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW5hbG9naXhfZHBfcmVnLmMKPiBAQCAtMTE2Miw1ICsxMTYyLDUgQEAgc3NpemVfdCBh
bmFsb2dpeF9kcF90cmFuc2ZlcihzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2aWNlICpkcCwKPiAgIAkJ
IChtc2ctPnJlcXVlc3QgJiB+RFBfQVVYX0kyQ19NT1QpID09IERQX0FVWF9OQVRJVkVfUkVBRCkK
PiAgIAkJbXNnLT5yZXBseSA9IERQX0FVWF9OQVRJVkVfUkVQTFlfQUNLOwo+ICAgCj4gLQlyZXR1
cm4gbnVtX3RyYW5zZmVycmVkID4gMCA/IG51bV90cmFuc2ZlcnJlZCA6IC1FQlVTWTsKPiArCXJl
dHVybiAobnVtX3RyYW5zZmVycmVkID09IG1zZy0+c2l6ZSkgPyBudW1fdHJhbnNmZXJyZWQgOiAt
RUJVU1k7Cj4gICB9CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdApMaW51eC1yb2NrY2hpcEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcm9ja2NoaXAK
