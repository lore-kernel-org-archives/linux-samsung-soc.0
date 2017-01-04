From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v5 1/3] drm/exynos: mic: Add mode_set callback function
Date: Wed, 04 Jan 2017 10:05:30 +0100
Message-ID: <a9e86290-ab21-409f-5be0-7b74bc401feb@samsung.com>
References: <1483517711-23849-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170104081521epcas1p40d5fbfbe0600d0df05e77b36ce6a353f@epcas1p4.samsung.com>
 <1483517711-23849-2-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1483517711-23849-2-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jh80.chung@samsung.com, cw00.choi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDQuMDEuMjAxNyAwOToxNSwgSG9lZ2V1biBLd29uIHdyb3RlOgo+IEJlZm9yZSBhcHBseWlu
ZyB0aGUgcGF0Y2gsIHVzZWQgdGhlIG9mX2dldF92aWRlb21vZGUgZnVuY3Rpb24gdG8KPiBwYXJz
ZSB0aGUgZGlzcGxheS10aW1pbmdzIGluIHRoZSBwYW5lbCB3aGljaCBpcyB0aGUgY2hpbGQgZHJp
dmVyCj4gb2YgZHNpIGluIHRoZSBkZXZpY2V0cmVlLiB0aGlzIGlzIHdyb25nLiBTbyByZW1vdmVk
IHRoZQo+IG9mX2dldF92aWRlb21vZGUgYW5kIGZpeGVkIHRvIGdldCB2aWRlb21vZGUgc3RydWN0
IHRocm91Z2gKPiBtb2RlX3NldCBjYWxsYmFjayBmdW5jdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6
IEhvZWdldW4gS3dvbiA8aG9lZ2V1bi5rd29uQHNhbXN1bmcuY29tPgoKUmV2aWV3ZWQtYnk6IEFu
ZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgpPbmx5IG9uZSwgbm9uLWJsb2NraW5n
IGNvbW1lbnQgYmVsb3cuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fbWljLmMgfCAzMCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9taWMuYwo+IGluZGV4IGEwZGVmMGIuLmEwZjQ1OWMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX21pYy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX21pYy5jCj4gQEAgLTI4NiwxMyArMjg2
LDYgQEAgc3RhdGljIGludCBwYXJzZV9kdChzdHJ1Y3QgZXh5bm9zX21pYyAqbWljKQo+ICAJCQl9
Cj4gIAkJCW5vZGVzW2orK10gPSByZW1vdGVfbm9kZTsKPiAgCj4gLQkJCXJldCA9IG9mX2dldF92
aWRlb21vZGUocmVtb3RlX25vZGUsCj4gLQkJCQkJCQkmbWljLT52bSwgMCk7Cj4gLQkJCWlmIChy
ZXQpIHsKPiAtCQkJCURSTV9FUlJPUigibWljOiBmYWlsZWQgdG8gZ2V0IHZpZGVvbW9kZSIpOwo+
IC0JCQkJZ290byBleGl0Owo+IC0JCQl9Cj4gLQoKSSB0aGluayB0aGUgd2hvbGUgcGFyc2VfZHQg
ZnVuY3Rpb24gc2hvdWxkIGJlIHJlZmFjdG9yZWQsIGJ1dCBpdCBjYW4gYmUKZG9uZSBsYXRlciBp
biBzZXBhcmF0ZSBwYXRjaC4KClJlZ2FyZHMKQW5kcnplagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
