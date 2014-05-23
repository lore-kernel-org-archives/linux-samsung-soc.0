From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove redundant mutex_unlock
Date: Fri, 23 May 2014 23:27:16 +0900
Message-ID: <537F5AC4.8080102@samsung.com>
References: <1400842674-20499-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400842674-20499-1-git-send-email-a.hajda@samsung.com>
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAwNeyblCAyM+ydvCAxOTo1NywgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBUaGUg
cGF0Y2ggZml4ZXMgdW5sb2NraW5nIGluIGV4eW5vc19kcm1fY29tcG9uZW50X2RlbC4KCkFwcGxp
ZWQuCgpUaGFua3MsCklua2kgRGFlCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gSGkgSW5raSwKPiAKPiBUaGlzIHBhdGNoIGlz
IGJhc2VkIG9uIGV4eW5vc19kcm1fbmV4dCBicmFuY2guCj4gCj4gUmVnYXJkcwo+IEFuZHJ6ZWoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jIHwgMSAtCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9kcnYuYwo+IGluZGV4IDRjZWY4OGYuLmM1YTQwMWFlIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYwo+IEBAIC00MTcsNyArNDE3LDYgQEAgdm9p
ZCBleHlub3NfZHJtX2NvbXBvbmVudF9kZWwoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJCWlmIChk
ZXYgPT0gY2Rldi0+ZGV2KSB7Cj4gIAkJCWxpc3RfZGVsKCZjZGV2LT5saXN0KTsKPiAgCQkJa2Zy
ZWUoY2Rldik7Cj4gLQkJCW11dGV4X3VubG9jaygmZHJtX2NvbXBvbmVudF9sb2NrKTsKPiAgCQkJ
YnJlYWs7Cj4gIAkJfQo+ICAJfQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
