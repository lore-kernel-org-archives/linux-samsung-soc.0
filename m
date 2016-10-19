From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH] exynos-drm: Fix error messages to print flags and size
Date: Wed, 19 Oct 2016 22:28:40 +0900
Message-ID: <CAAQKjZOTQPTf=M9RF5omDZVm2Wh+K15xHQ3xnzwBqiirvadEdg@mail.gmail.com>
References: <1470850236-9101-1-git-send-email-shuahkh@osg.samsung.com>
 <57F64D0B.5050506@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <57F64D0B.5050506@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

MjAxNi0xMC0wNiAyMjowOSBHTVQrMDk6MDAgVG9iaWFzIEpha29iaSA8dGpha29iaUBtYXRoLnVu
aS1iaWVsZWZlbGQuZGU+Ogo+IEhlbGxvLAo+Cj4gSSB0aGluayB0aGlzIHBhdGNoIHdhcyBuZXZl
ciBwaWNrZWQgdXAuIFNvIGp1c3QgYSBzaG9ydCAncGluZycgZnJvbSBteSBzaWRlLgo+CgpPb3Bz
LiBvbmUgSSBtaXNzZWQuIFdpbGwgcGljayBpdCB1cCBzb29uLgoKVGhhbmtzLApJbmtpIERhZQoK
PiBXaXRoIGJlc3Qgd2lzaGVzLAo+IFRvYmlhcwo+Cj4KPiBTaHVhaCBLaGFuIHdyb3RlOgo+PiBG
aXggZXh5bm9zX2RybV9nZW1fY3JlYXRlKCkgZXJyb3IgbWVzc2FnZXMgdG8gaW5jbHVkZSBmbGFn
cyBhbmQgc2l6ZSB3aGVuCj4+IGZsYWdzIGFuZCBzaXplIGFyZSBpbnZhbGlkLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBTaHVhaCBLaGFuIDxzaHVhaGtoQG9zZy5zYW1zdW5nLmNvbT4KPj4gLS0tCj4+
ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgfCA0ICsrLS0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMKPj4gaW5kZXggY2RmOWYxYS4uNGM0Y2Iw
ZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+PiBAQCAt
MjMxLDEyICsyMzEsMTIgQEAgc3RydWN0IGV4eW5vc19kcm1fZ2VtICpleHlub3NfZHJtX2dlbV9j
cmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4gICAgICAgaW50IHJldDsKPj4KPj4gICAg
ICAgaWYgKGZsYWdzICYgfihFWFlOT1NfQk9fTUFTSykpIHsKPj4gLSAgICAgICAgICAgICBEUk1f
RVJST1IoImludmFsaWQgZmxhZ3MuXG4iKTsKPj4gKyAgICAgICAgICAgICBEUk1fRVJST1IoImlu
dmFsaWQgR0VNIGJ1ZmZlciBmbGFnczogJXVcbiIsIGZsYWdzKTsKPj4gICAgICAgICAgICAgICBy
ZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPj4gICAgICAgfQo+Pgo+PiAgICAgICBpZiAoIXNpemUp
IHsKPj4gLSAgICAgICAgICAgICBEUk1fRVJST1IoImludmFsaWQgc2l6ZS5cbiIpOwo+PiArICAg
ICAgICAgICAgIERSTV9FUlJPUigiaW52YWxpZCBHRU0gYnVmZmVyIHNpemU6ICVsdVxuIiwgc2l6
ZSk7Cj4+ICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4+ICAgICAgIH0K
Pj4KPj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
