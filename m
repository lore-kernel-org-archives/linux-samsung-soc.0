From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] drm/fimd: use DRM_ERROR instead of DRM_INFO in error
 case
Date: Mon, 15 Apr 2019 05:17:39 +0200
Message-ID: <20190415031739.GA9897@ravnborg.org>
References: <1555289240-7735-1-git-send-email-inki.dae@samsung.com>
 <CGME20190415004658epcas1p4203cd2876c49e7157fdab6b17293976e@epcas1p4.samsung.com>
 <1555289240-7735-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1555289240-7735-2-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raQoKT24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgMDk6NDc6MTlBTSArMDkwMCwgSW5raSBE
YWUgd3JvdGU6Cj4gVGhpcyBwYXRjaCBtYWtlcyBlcnJvciBtZXNzYWdlcyB0byBiZSBwcmludGVk
IG91dCB1c2luZyBEUk1fRVJST1IKPiBpbnN0ZWFkIG9mIERSTV9JTkZPLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9maW1kLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCj4gaW5kZXggNzg2YThlZS4uNzg0MjdlYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmltZC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWQuYwo+IEBAIC00MDAsNyArNDAw
LDcgQEAgc3RhdGljIGludCBmaW1kX2F0b21pY19jaGVjayhzdHJ1Y3QgZXh5bm9zX2RybV9jcnRj
ICpjcnRjLAo+ICAJdTMyIGNsa2RpdjsKPiAgCj4gIAlpZiAobW9kZS0+Y2xvY2sgPT0gMCkgewo+
IC0JCURSTV9JTkZPKCJNb2RlIGhhcyB6ZXJvIGNsb2NrIHZhbHVlLlxuIik7Cj4gKwkJRFJNX0VS
Uk9SKCJNb2RlIGhhcyB6ZXJvIGNsb2NrIHZhbHVlLlxuIik7CgpUbyBnaXZlIHRoZSBsb2dzIGEg
bW9yZSBwcmVjaXNlIGluZm8gb24gd2hlcmUgaXMgY29tZXMgZnJvbSB5b3UKY291bGQgY29uc2lk
ZXIgdG8gdXNlOgoKCQlEUk1fREVWX0VSUk9SKGN0eC0+ZGV2LCAiTW9kZSBoYXMgemVybyBjbG9j
ayB2YWx1ZS5cbiIpOwoKTGlrZXdpc2UgYmVsb3cuCgoKCVNhbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
