From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: linux-4.11-rc1/drivers/gpu/drm/exynos/exynos5433_drm_decon.c:681:
 suspicious mask ?
Date: Wed, 08 Mar 2017 10:01:41 +0100
Message-ID: <c489ede9-aca6-bee9-4d82-b35cf720dcbd@samsung.com>
References: <CGME20170307005334epcas4p22a43a5c4e8348ec53d8b0fbc58cde358@epcas4p2.samsung.com>
 <DB5PR08MB0967CD7B84545DE129126A619C2C0@DB5PR08MB0967.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <DB5PR08MB0967CD7B84545DE129126A619C2C0@DB5PR08MB0967.eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Binderman <dcb314@hotmail.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "airlied@linux.ie" <airlied@linux.ie>, "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, "javier@osg.samsung.com" <javier@osg.samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgRGF2aWQsIElua2ksCgpUaGFua3MgZm9yIHJlcG9ydGluZy4KCk9uIDA2LjAzLjIwMTcgMTE6
MDUsIERhdmlkIEJpbmRlcm1hbiB3cm90ZToKPiBIZWxsbyB0aGVyZSwKPgo+IGxpbnV4LTQuMTEt
cmMxL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYzo2ODFdOiAo
d2FybmluZykgUmVzdWx0IG9mIG9wZXJhdG9yICd8JyBpcyBhbHdheXMgdHJ1ZSBpZiBvbmUgb3Bl
cmFuZCBpcyBub24temVyby4gRGlkIHlvdSBpbnRlbmQgdG8gdXNlICcmJz8KPgo+IFNvdXJjZSBj
b2RlIGlzCj4KPiAgICAgaWYgKGN0eC0+b3V0X3R5cGUgfCBJODBfSFdfVFJHKSB7Cj4KPiBBbHNv
IGluIHRoZSBzYW1lIGZpbGU6Cj4KPiBbZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMz
X2RybV9kZWNvbi5jOjEzMV06IChzdHlsZSkgU2FtZSBleHByZXNzaW9uIG9uIGJvdGggc2lkZXMg
b2YgJ3wnLgo+Cj4gU291cmNlIGNvZGUgaXMKPgo+ICAgICAgICB3cml0ZWwoVFJJR0NPTl9URV9B
VVRPX01BU0sgfCBUUklHQ09OX1NXVFJJR0VOCj4gICAgICAgICAgICAgICAgfCBUUklHQ09OX1RF
X0FVVE9fTUFTSyB8IFRSSUdDT05fU1dUUklHRU4sCgpUaGlzIHR5cG8gd2FzIGFscmVhZHkgcmVw
b3J0ZWQgYnk6Ci0gSWxpYSBNaXJraW4sIEkgaGF2ZSB1cGxvYWRlZCAybmQgZml4ZWQgdmVyc2lv
biBvZiB0aGUgcGF0Y2gsCmFwcGFyZW50bHkgdGhlIDFzdCB2ZXJzaW9uIGhhcyBiZWVuIG1lcmdl
ZCBbMV0sCi0gRGFuIENhcnBlbnRlciwgaGUgcG9zdGVkIGFsc28gdGhlIGZpeFsyXSwKLSBhbmQg
bm93IERhdmlkLgoKSSBndWVzcyBhdCB0aGUgbW9tZW50IHRoZSBiZXN0IHNvbHV0aW9uIGlzIHRv
IGdldCBEYW4ncyBwYXRjaC4KClsxXTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC85NDkzMTc3LwpbMl06IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTU3MTM3
NS8KClJlZ2FyZHMKQW5kcnplagoKPgo+IFJlZ2FyZHMKPgo+IERhdmlkIEJpbmRlcm1hbgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
