From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 00/12] drm/exynos/ipp: image post processing improvements,
 part three
Date: Wed, 09 Jul 2014 23:47:49 +0900
Message-ID: <53BD5615.8060900@samsung.com>
References: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAwN+yblCAwM+ydvCAyMjoxMCwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBUaGlz
IHNldCBvZiBpbmRlcGVuZGVudCBwYXRjaGVzIGNvbnRhaW5zIHZhcmlvdXMgaW1wcm92ZW1lbnQg
YW5kIGZpeGVzCj4gZm9yIGV4eW5vc19kcm0gaXBwIGZyYW1ld29yay4KPiBUaGUgcGF0Y2hzZXQg
aXMgYmFzZWQgb24gZXh5bm9zLWRybS1uZXh0IGJyYW5jaC4KPiAKCkRpZCB5b3UgdGVzdCBpcHAg
bW9kdWxlIHVzaW5nIGxpYmRybT8gSWYgc28sIGNhbiB5b3Ugc2hhcmUgdGhlIGFwcD8gSQp3b3Vs
ZCB0cnkgdG8gdGVzdCB0aGlzIHBhdGNoIHNlcmllcyBiZWZvcmUgbWVyZ2luZyB0aGVtLiBNYWlu
bGluZSBsaWJkcm0KaGFzIG5vIGFueSBpcHAgaW50ZXJmYWNlcy4KClRoYW5rcywKSW5raSBEYWUK
Cj4gUmVnYXJkcwo+IEFuZHJ6ZWoKPiAKPiAKPiBBbmRyemVqIEhhamRhICgxMik6Cj4gICBkcm0v
ZXh5bm9zL2lwcDogcmVtb3ZlIHR5cGUgY2FzdGluZwo+ICAgZHJtL2V4eW5vcy9pcHA6IHJlbW92
ZSB1bnVzZWQgZmllbGQgZnJvbSBleHlub3NfZHJtX2lwcF9wcml2YXRlCj4gICBkcm0vZXh5bm9z
L2lwcDogcmVtb3ZlIHN0cnVjdCBleHlub3NfZHJtX2lwcF9wcml2YXRlCj4gICBkcm0vZXh5bm9z
L2lwcDogY29ycmVjdCBhZGRyZXNzIHR5cGUKPiAgIGRybS9leHlub3MvaXBwOiByZW1vdmUgdGVt
cG9yYXJ5IHZhcmlhYmxlCj4gICBkcm0vZXh5bm9zL2lwcDogcmVtb3ZlIGluY29ycmVjdCBjaGVj
a3Mgb2YgbGlzdF9maXJzdF9lbnRyeSByZXN1bHQKPiAgIGRybS9leHlub3MvaXBwOiBzaW1wbGlm
eSBtZW1vcnkgY2hlY2sgZnVuY3Rpb24KPiAgIGRybS9leHlub3MvaXBwOiByZW1vdmUgdXNlbGVz
cyByZWdpc3RyYXRpb24gY2hlY2tzCj4gICBkcm0vZXh5bm9zL2lwcDogc2ltcGxpZnkgaXBwX2Zp
bmRfb2JqCj4gICBkcm0vZXh5bm9zL2lwcDogcmVtb3ZlIHJlZHVuZGFudCBtZXNzYWdlcwo+ICAg
ZHJtL2V4eW5vcy9pcHA6IHNpbXBsaWZ5IGlwcF9jcmVhdGVfaWQKPiAgIGRybS9leHlub3MvaXBw
OiBzaW1wbGlmeSBpcHBfZmluZF9kcml2ZXIKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2Rydi5oIHwgICA3ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9pcHAuYyB8IDI1OSArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1faXBwLmggfCAgIDQgKy0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCAxOTcgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
