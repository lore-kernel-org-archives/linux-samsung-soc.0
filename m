From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/bridge: analogix dp: Fix runtime PM state in
 get_modes() callback
Date: Tue, 05 Dec 2017 15:12:05 +0100
Message-ID: <580cfc6f-863e-d977-b1f7-4c96df0ba6ff@samsung.com>
References: <CGME20171121074940eucas1p17779b35232466785d43c56382dad01b7@eucas1p1.samsung.com>
 <20171121074936.22520-1-m.szyprowski@samsung.com>
 <5ae5ce53-d15d-c18e-ec47-4a579e039e3a@codeaurora.org>
 <CANLc0-bR00kRu6M6BNu5zv4zmT8S=TjhfPOhWDbyKwkEre9UJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CANLc0-bR00kRu6M6BNu5zv4zmT8S=TjhfPOhWDbyKwkEre9UJg@mail.gmail.com>
Content-language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Misha Komarovskiy <zombah@gmail.com>, Archit Taneja <architt@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Yakir Yang <ykk@rock-chips.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgTWlzaGEsCgpPbiAyMDE3LTEyLTA1IDE1OjA2LCBNaXNoYSBLb21hcm92c2tpeSB3cm90ZToK
PiBPbiBNb24sIE5vdiAyNywgMjAxNyBhdCA2OjQwIEFNLCBBcmNoaXQgVGFuZWphIDxhcmNoaXR0
QGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPj4gT24gMTEvMjEvMjAxNyAwMToxOSBQTSwgTWFyZWsg
U3p5cHJvd3NraSB3cm90ZToKPj4+IGdldF9tb2RlcygpIGNhbGxiYWNrIG1pZ2h0IGJlIGNhbGxl
ZCBhc3luY2hyb25vdXNseSBmcm9tIHRoZSBEUk0gY29yZSBhbmQKPj4+IGl0IGlzIG5vdCBzeW5j
aHJvbml6ZWQgd2l0aCBicmlkZ2VfZW5hYmxlKCksIHdoaWNoIHNldHMgcHJvcGVyIHJ1bnRpbWUg
UE0KPj4+IHN0YXRlIG9mIHRoZSBtYWluIERQIGRldmljZS4gRml4IHRoaXMgYnkgY2FsbGluZyBw
bV9ydW50aW1lX2dldF9zeW5jKCkKPj4+IGJlZm9yZSBjYWxsaW5nIGRybV9nZXRfZWRpZCgpLCB3
aGljaCBpbiB0dXJuIGNhbGxzIGRybV9kcF9pMmNfeGZlcigpIGFuZAo+Pj4gYW5hbG9naXhfZHBf
dHJhbnNmZXIoKSB0byBlbnN1cmUgdGhhdCBtYWluIERQIGRldmljZSBpcyBydW50aW1lIGFjdGl2
ZQo+Pj4gd2hlbiBkb2luZyBhbnkgYWNjZXNzIHRvIGl0cyByZWdpc3RlcnMuCj4+IExvb2tzIGdv
b2QgdG8gbWUuIFdvdWxkIGJlIG5pY2UgdG8gZ2V0IGFuIGFjayBmcm9tIHJvY2tjaGlwIHRvby4g
V2lsbCBxdWV1ZQo+PiBpdAo+PiB0byBkcm0tbWlzYy1maXhlcyAoc28gdGhhdCBpdCdzIG1lcmdl
ZCBmb3IgNC4xNS1yYzIpIGlmIG5vIG9uZSBoYXMgYW55Cj4+IG9iamVjdGlvbnMuCj4gQWZ0ZXIg
dGhpcyBwYXRjaCBhY2NlcHRlZCB0byA0LjE1LXJjMiBhbnkgY2hhbmNlcyB0byBoYXZlIGl0IGFs
c28gaW4KPiA0LjE0IHN0YWJsZT8KPgo+IEkgdGVzdGVkIGl0IG1hbnVhbHkgYW5kIGl0IGZpeGVz
IGJvb3QgZnJlZXplIG9uIHNub3cgd2l0aCA0LjE0Lgo+IElmIHJlcXVpcmVkLAo+IFRlc3RlZC1i
eTogTWlzaGEgS29tYXJvdnNraXkgPHpvbWJhaEBnbWFpbC5jb20+CgpUaGUgcGF0Y2ggaXMgdGFn
Z2VkIGNjOiBzdGFibGUsIHNvIGl0IHNob3VsZCBhdXRvbWF0aWNhbGx5IGdldCBpbnRvIHY0LjE0
LnkKc2VyaWVzIG9uY2UgaXQgZmluYWxseSBsYW5kcyBpbiB2NC4xNS1yY1ggc2VyaWVzLgoKID4g
Li4uCgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJ
bnN0aXR1dGUgUG9sYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
