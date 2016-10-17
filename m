From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] crygpu/drm/exynos/exynos_hdmi - Unmap region obtained by
 of_iomap
Date: Mon, 17 Oct 2016 13:33:59 +0200
Message-ID: <0147af61-e96e-ba43-55b9-6a58a1539666@samsung.com>
References: <CGME20161017111000eucas1p13f38f6daa20992f6aa3c9dfc8d2ab495@eucas1p1.samsung.com>
 <1476702562-24422-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1476702562-24422-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, airlied@linux.ie, krzk@kernel.org, kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

CkhpLAoKT24gMTcuMTAuMjAxNiAxMzowOSwgQXJ2aW5kIFlhZGF2IHdyb3RlOgo+IEZyZWUgbWVt
b3J5IG1hcHBpbmcsIGlmIGhkbWlfcHJvYmUgaXMgbm90IHN1Y2Nlc3NmdWwuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBcnZpbmQgWWFkYXYgPGFydmluZC55YWRhdi5jc0BnbWFpbC5jb20+CgpTdWJqZWN0
IHByZWZpeCBpcyBpbmNvcnJlY3QuCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19oZG1pLmMgfCAgICAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKPiBpbmRleCAyMjc1ZWZlLi45Yjc4
NTdiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2hkbWkuYwo+IEBAIC0xOTAxLDYg
KzE5MDEsOCBAQCBlcnJfZGlzYWJsZV9wbV9ydW50aW1lOgo+ICBlcnJfaGRtaXBoeToKPiAgCWlm
IChoZGF0YS0+aGRtaXBoeV9wb3J0KQo+ICAJCXB1dF9kZXZpY2UoJmhkYXRhLT5oZG1pcGh5X3Bv
cnQtPmRldik7Cj4gKwlpZiAoaGRhdGEtPnJlZ3NfaGRtaXBoeSkKPiArCQlpb3VubWFwKGhkYXRh
LT5yZWdzX2hkbWlwaHkpOwoKVGhhdHMgT0ssIHlvdSBjYW4gYWRkIGFsc28gdW5tYXAgdG8gaGRt
aV9yZW1vdmUuCgpSZWdhcmRzCkFuZHJ6ZWoKCj4gIGVycl9kZGM6Cj4gIAlwdXRfZGV2aWNlKCZo
ZGF0YS0+ZGRjX2FkcHQtPmRldik7Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
