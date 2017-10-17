From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 10/11] drm/exynos/mixer: enable support for 1024x768
 and 1280x1024 modes
Date: Tue, 17 Oct 2017 10:09:20 +0200
Message-ID: <25c56ecb-09fc-df37-6963-bb5607c42d34@samsung.com>
References: <20170929100542.12849-1-a.hajda@samsung.com>
 <CGME20170929100549eucas1p29a39ec9db45d6009f23b89fd2d6b77f9@eucas1p2.samsung.com>
 <20170929100542.12849-11-a.hajda@samsung.com> <59E5B5BB.6080506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <59E5B5BB.6080506@samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Daniel Drake <drake@endlessm.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTcuMTAuMjAxNyAwOTo0OCwgSW5raSBEYWUgd3JvdGU6Cj4KPiAyMDE364WEIDA57JuUIDI5
7J28IDE5OjA17JeQIEFuZHJ6ZWogSGFqZGEg7J20KOqwgCkg7JO0IOq4gDoKPj4gU2luY2UgSERN
SSBjYW4gaGFuZGxlIHRoZXNlIG1vZGVzIGRlc3BpdGUgb2YgTUlYRVIgbGltaXRhdGlvbnMgbGV0
J3MKPj4gZW5hYmxlIHRoZW0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEgPGEu
aGFqZGFAc2Ftc3VuZy5jb20+Cj4+IFJldmlld2VkLWJ5OiBUb2JpYXMgSmFrb2JpIDx0amFrb2Jp
QG1hdGgudW5pLWJpZWxlZmVsZC5kZT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19taXhlci5jIHwgMyArKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19taXhlci5jCj4+IGluZGV4IDhiYWE5
M2Y4MDEwNi4uODVkMzMxMzdjZmQ4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19taXhlci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X21peGVyLmMKPj4gQEAgLTEwMTQsNiArMTAxNCw5IEBAIHN0YXRpYyBpbnQgbWl4ZXJfbW9kZV92
YWxpZChzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpjcnRjLAo+PiAgCSAgICAodyA+PSAxNjY0ICYm
IHcgPD0gMTkyMCAmJiBoID49IDkzNiAmJiBoIDw9IDEwODApKQo+PiAgCQlyZXR1cm4gTU9ERV9P
SzsKPj4gIAo+PiArCWlmICgodyA9PSAxMDI0ICYmIGggPT0gNzY4KSB8fCAodyA9PSAxMjgwICYm
IGggPT0gMTAyNCkpCj4+ICsJCXJldHVybiBNT0RFX09LOwo+IG1peGVyX21vZGVfdmFsaWQgZnVu
Y3Rpb24gaXMgY29tbW9uIHRvIGFsbCBFeHlub3MgU29DIG1hbmFnZWQgYnkgRXh5bm9zIERSTSBk
cml2ZXIuCj4gU28gaXMgaXQgdmFsaWQgZm9yIGFsbCBvZiB0aGVtPwoKSXQgaXMgdmFsaWQgZm9y
IGFsbCBTb0NzIGhhdmluZyBtaXhlciwgaXQgd2FzIHRlc3RlZCBvbiBPZHJvaWQKVTMoRXh5bm9z
NDQxMikgYW5kIFhVMyAoRXh5bm9zNTQyMikuCgpSZWdhcmRzCkFuZHJ6ZWoKCj4KPiBUaGFua3Ms
Cj4gSW5raSBEYWUKPgo+Cj4KPj4gKwo+PiAgCXJldHVybiBNT0RFX0JBRDsKPj4gIH0KPj4gIAo+
Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
