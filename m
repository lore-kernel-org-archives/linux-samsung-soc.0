From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos/dsi: Add runtime PM so LCD power domain
 could be turned off
Date: Fri, 14 Nov 2014 08:32:58 +0100
Message-ID: <1415950378.25732.0.camel@AMDC1943>
References: <1415368439-23642-1-git-send-email-k.kozlowski@samsung.com>
 <1415368439-23642-3-git-send-email-k.kozlowski@samsung.com>
 <54656E9A.8040702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <54656E9A.8040702@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kevin Hilman <khilman@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gcGnEhSwgMjAxNC0xMS0xNCBhdCAxMTo1MyArMDkwMCwgSW5raSBEYWUgd3JvdGU6Cj4gT24g
MjAxNOuFhCAxMeyblCAwN+ydvCAyMjo1MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+
IEFkZCBydW50aW1lIFBvd2VyIE1hbmFnZW1lbnQgdG8gdGhlIEV4eW5vcyBEU0kgZHJpdmVyIHNv
IHRoZSBMQ0QgcG93ZXIKPiA+IGRvbWFpbiBjb3VsZCBiZSB0dXJuZWQgb2ZmLgo+ID4gCj4gPiBU
aGlzIHNsaWdodGx5IHJlZHVjZXMgdGhlIGVuZXJneSBjb25zdW1wdGlvbiB3aGVuIHNjcmVlbiBp
cyBjb21wbGV0ZWx5Cj4gPiB0dXJuZWQgb2ZmLiBPbiBUcmF0czIgYm9hcmQgd2hlbiB0aGUgc3lz
dGVtIHdhcyBpZGxlIHRoZSBlbmVyZ3kKPiA+IGNvbnN1bXB0aW9uIGRyb3BwZWQgYnkgMSUgKGZy
b20gOTIuMiBtQSB0byA5MS4xIG1BKS4KPiA+IAo+ID4gQmVmb3JlIHRoZSBwYXRjaDoKPiA+ICQg
Y2F0IGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9wbV9nZW5wZC9wbV9nZW5wZF9zdW1tYXJ5Cj4gPiBs
Y2QwLXBvd2VyLWRvbWFpbiAgICAgICAgICAgICAgIG9uCj4gPiAgICAgL2RldmljZXMvMTFjMDAw
MDAuZmltZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN1c3BlbmRlZAo+ID4gICAgIC9k
ZXZpY2VzLzExYzgwMDAwLmRzaSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnN1cHBv
cnRlZAo+ID4gCj4gPiBBZnRlciBhcHBseWluZyB0aGUgcGF0Y2g6Cj4gPiBsY2QwLXBvd2VyLWRv
bWFpbiAgICAgICAgICAgICAgIG9mZgo+ID4gICAgIC9kZXZpY2VzLzExYzAwMDAwLmZpbWQgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdXNwZW5kZWQKPiA+ICAgICAvZGV2aWNlcy8xMWM4
MDAwMC5kc2kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3VzcGVuZGVkCj4gCj4gUmVh
c29uYWJsZSBidXQgdGhpcyBwYXRjaCBpbmN1cnMgcGFnZSBmbGlwIHRlc3QgdGltZW91dCBsaWtl
IGJlbG93LAo+ICMgbW9kZXRlc3QgLXYgLXMgMTVAMTI6NzIweDEyODAKPiB0cnlpbmcgdG8gb3Bl
biBkZXZpY2UgJ2k5MTUnLi4uZmFpbGVkLgo+IHRyeWluZyB0byBvcGVuIGRldmljZSAncmFkZW9u
Jy4uLmZhaWxlZC4KPiB0cnlpbmcgdG8gb3BlbiBkZXZpY2UgJ25vdXZlYXUnLi4uZmFpbGVkLgo+
IHRyeWluZyB0byBvcGVuIGRldmljZSAndm13Z2Z4Jy4uLmZhaWxlZC4KPiB0cnlpbmcgdG8gb3Bl
biBkZXZpY2UgJ29tYXBkcm0nLi4uZmFpbGVkLgo+IHRyeWluZyB0byBvcGVuIGRldmljZSAnZXh5
bm9zJy4uLnN1Y2Nlc3MuCj4gc2V0dGluZyBtb2RlIDcyMHgxMjgwLTBIekBYUjI0IG9uIGNvbm5l
Y3RvcnMgMTUsIGNydGMgMTIKPiBzZWxlY3QgdGltZWQgb3V0IG9yIGVycm9yIChyZXQgMCkKPiAK
PiBJJ20gbm90IHN1cmUgd2h5IHRoaXMgaXNzdWUgaXMgaW5jdXJyZWQgd2l0aCB0aGlzIHBhdGNo
IGV2ZW4gdGhyb3VnaAo+IHRoaXMgcGF0Y2ggaXMgcmVhc29uYWJsZSBhbmQgY29ycmVjdC4gU28g
d2UgbmVlZCBtb3JlIGNoZWNraW5nLgo+IAo+IFAuUy4gSSB0ZXN0ZWQgaXQgb24gZXh5bm9zLWRy
bS1uZXh0IGFuZCBtMCBib2FyZC4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBpc3N1ZS4gSSds
bCBpbnZlc3RpZ2F0ZSBpdC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
