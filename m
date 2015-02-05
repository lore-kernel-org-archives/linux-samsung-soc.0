From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH 1/3] arm/exynos: add asynchronous bridge clock bindings
Date: Thu, 05 Feb 2015 13:35:37 +0100
Message-ID: <1423139739-19881-2-git-send-email-a.hajda@samsung.com>
References: <1423139739-19881-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1423139739-19881-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Liquid.Acid@gmx.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, javier.martinez@collabora.co.uk, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIHBhdGNoIGFkZHMgYmluZGluZ3MgZm9yIGNsb2NrcyByZXF1aXJlZCBieSBhc3luYy1icmlk
Z2VzCnByZXNlbnQgaW4gdGhlIHBhcnRpY3VsYXIgcG93ZXIgZG9tYWluLgoKU2lnbmVkLW9mZi1i
eTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2V4eW5vcy9wb3dlcl9kb21haW4udHh0IHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2V4eW5vcy9wb3dlcl9kb21haW4udHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9leHlub3MvcG93ZXJfZG9tYWluLnR4
dAppbmRleCAxZTA5NzAzLi41ZGEzOGM1IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2V4eW5vcy9wb3dlcl9kb21haW4udHh0CisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZXh5bm9zL3Bvd2VyX2RvbWFpbi50eHQKQEAg
LTIyLDYgKzIyLDkgQEAgT3B0aW9uYWwgUHJvcGVydGllczoKIAktIHBjbGtOLCBjbGtOOiBQYWly
cyBvZiBwYXJlbnQgb2YgaW5wdXQgY2xvY2sgYW5kIGlucHV0IGNsb2NrIHRvIHRoZQogCQlkZXZp
Y2VzIGluIHRoaXMgcG93ZXIgZG9tYWluLiBNYXhpbXVtIG9mIDQgcGFpcnMgKE4gPSAwIHRvIDMp
CiAJCWFyZSBzdXBwb3J0ZWQgY3VycmVudGx5LgorCS0gYXNiTjogQ2xvY2tzIHJlcXVpcmVkIGJ5
IGFzeW5jaHJvbm91cyBicmlkZ2VzIChBU0IpIHByZXNlbnQgaW4KKwkJdGhlIHBvd2VyIGRvbWFp
bi4gVGhlc2UgY2xvY2sgc2hvdWxkIGJlIGVuYWJsZWQgZHVyaW5nIHBvd2VyCisJCWRvbWFpbiBv
bi9vZmYgb3BlcmF0aW9ucy4KIC0gcG93ZXItZG9tYWluczogcGhhbmRsZSBwb2ludGluZyB0byB0
aGUgcGFyZW50IHBvd2VyIGRvbWFpbiwgZm9yIG1vcmUgZGV0YWlscwogCQkgc2VlIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0CiAKLS0gCjEu
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
