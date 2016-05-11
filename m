From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/4] drm: add generic zpos property
Date: Wed, 11 May 2016 13:56:21 +0200
Message-ID: <57331DE5.8060803@samsung.com>
References: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, daniel@ffwll.ch
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, fabien.dessenne@st.com, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, vincent.abriou@st.com, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDUvMTEvMjAxNiAxMjoyNSBQTSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gVGhpcyBw
YXRjaCBhZGRzIHN1cHBvcnQgZm9yIGdlbmVyaWMgcGxhbmUncyB6cG9zIHByb3BlcnR5IHByb3Bl
cnR5IHdpdGgKPiB3ZWxsLWRlZmluZWQgc2VtYW50aWNzOgo+IC0gYWRkZWQgenBvcyBwcm9wZXJ0
aWVzIHRvIHBsYW5lIGFuZCBwbGFuZSBzdGF0ZSBzdHJ1Y3R1cmVzCj4gLSBhZGRlZCBoZWxwZXJz
IGZvciBub3JtYWxpemluZyB6cG9zIHByb3BlcnRpZXMgb2YgZ2l2ZW4gc2V0IG9mIHBsYW5lcwo+
IC0gd2VsbCBkZWZpbmVkIHNlbWFudGljczogcGxhbmVzIGFyZSBzb3J0ZWQgYnkgenBvcyB2YWx1
ZXMgYW5kIHRoZW4gcGxhbmUKPiAgIGlkIHZhbHVlIGlmIHpwb3MgZXF1YWxzCj4gCj4gTm9ybWFs
aXplZCB6cG9zIHZhbHVlcyBhcmUgY2FsY3VsYXRlZCBhdXRvbWF0aWNhbGx5IHdoZW4gZ2VuZXJp
Ywo+IG11dHRhYmxlIHpwb3MgcHJvcGVydHkgaGFzIGJlZW4gaW5pdGlhbGl6ZWQuIERyaXZlcnMg
Y2FuIHNpbXBseSB1c2UKPiBwbGFuZV9zdGF0ZS0+bm9ybWFsaXplZF96cG9zIGluIHRoZWlyIGF0
b21pY19jaGVjayBhbmQvb3IgcGxhbmVfdXBkYXRlCj4gY2FsbGJhY2tzIHdpdGhvdXQgYW55IGFk
ZGl0aW9uYWwgY2FsbHMgdG8gRFJNIGNvcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5
cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+IAo+IENvbXBhcmUgdG8gTWFyZWsn
cyBvcmlnaW5hbCBwYXRjaCB6cG9zIHByb3BlcnR5IGlzIG5vdyBzcGVjaWZpYyB0byBlYWNoCj4g
cGxhbmUgYW5kIG5vIG1vcmUgdG8gdGhlIGNvcmUuCj4gTm9ybWFsaXplIGZ1bmN0aW9uIHRha2Ug
Y2FyZSBvZiB0aGUgcmFuZ2Ugb2YgcGVyIHBsYW5lIGRlZmluZWQgcmFuZ2UKPiBiZWZvcmUgc2V0
IG5vcm1hbGl6ZWRfenBvcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8
YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KClRoZSBvcmRlciBvZiBTb0IgaXMgb2ssIGJ1
dCB0aGUgImZyb20iIGZpZWxkIHNob3VsZCBiZSBzZXQgdG8gTWFyZWsuCgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
