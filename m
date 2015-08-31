From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 10/14] exynos/fimg2d: remove default case from
 g2d_get_blend_op()
Date: Mon, 31 Aug 2015 22:25:43 +0900
Message-ID: <55E455D7.8060101@samsung.com>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1440425649-9768-11-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1440425649-9768-11-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: gustavo.padovan@collabora.co.uk, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNeuFhCAwOOyblCAyNOydvCAyMzoxNCwgVG9iaWFzIEpha29iaSB3cm90ZToKPiBXZSBu
b3cgdmFsaWRhdGUgdGhlIGJsZW5kaW5nIG1vZGUgdmlhIGcyZF92YWxpZGF0ZV9tb2RlKCkKPiBw
cmlvciB0byBmZWVkaW5nIGl0IHRvIGcyZF9nZXRfYmxlbmRfb3AoKS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2JpQG1hdGgudW5pLWJpZWxlZmVsZC5kZT4KPiAtLS0K
PiAgZXh5bm9zL2V4eW5vc19maW1nMmQuYyB8IDUgLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2V4eW5vcy9leHlub3NfZmltZzJkLmMgYi9l
eHlub3MvZXh5bm9zX2ZpbWcyZC5jCj4gaW5kZXggNDI3NGE5NC4uZDcwOGU5MSAxMDA2NDQKPiAt
LS0gYS9leHlub3MvZXh5bm9zX2ZpbWcyZC5jCj4gKysrIGIvZXh5bm9zL2V4eW5vc19maW1nMmQu
Ywo+IEBAIC05MSwxMSArOTEsNiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGcyZF9nZXRfYmxlbmRf
b3AoZW51bSBlX2cyZF9vcCBvcCkKPiAgCQlTRVRfQkYodmFsLCBHMkRfQ09FRkZfTU9ERV9TUkNf
QUxQSEEsIDAsIDAsIDAsCj4gIAkJCQlHMkRfQ09FRkZfTU9ERV9TUkNfQUxQSEEsIDEsIDAsIDAp
Owo+ICAJCWJyZWFrOwo+IC0JZGVmYXVsdDoKPiAtCQlmcHJpbnRmKHN0ZGVyciwgIk5vdCBzdXBw
b3J0IG9wZXJhdGlvbiglZCkuXG4iLCBvcCk7Cj4gLQkJU0VUX0JGKHZhbCwgRzJEX0NPRUZGX01P
REVfT05FLCAwLCAwLCAwLCBHMkRfQ09FRkZfTU9ERV9aRVJPLAo+IC0JCQkJMCwgMCwgMCk7Cj4g
LQkJYnJlYWs7CgpXaXRoIHRoaXMsIGhvdyBhYm91dCBjaGFuZ2luZyBhYm92ZSBzd2l0Y2ggYW5k
IGNhc2Ugc3RhdGVtZW50IHRvIGlmCnN0YXRlbWVudD8KClRoYW5rcywKSW5raSBEYWUKCgo+ICAJ
fQo+ICAKPiAgCXJldHVybiB2YWwudmFsOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
