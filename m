From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: devs: Add names to fimd0 IRQ resources
Date: Thu, 16 May 2013 08:12:07 +0000 (GMT)
Message-ID: <7583198.135661368691927231.JavaMail.weblogic@epml12>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52189 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753399Ab3EPIMK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 May 2013 04:12:10 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMV00JFBTG8KK80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 May 2013 17:12:08 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jg1.han@samsung.com>

VGh1cnNkYXksIE1heSAxNiwgMjAxMyAxMjoxMCBBTSwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IA0K
PiBTaW5jZSBjb21taXQgMTk3N2U2ZDggKGRybS9leHlub3M6IGNoYW5nZSB0aGUgbWV0aG9kIGZv
ciBnZXR0aW5nIHRoZQ0KPiBpbnRlcnJ1cHQpIHRoZSBFeHlub3MgRFJNIEZJTUQgZHJpdmVyIHJl
cXVpcmVzIElSUSByZXNvdXJjZXMgdG8gYmUNCj4gbmFtZWQuIFRoaXMgcGF0Y2ggZml4ZXMgcHJv
YmUgZmFpbHVyZSBpbiBub24tRFQgY2FzZXMgYnkgYWRkaW5nDQo+IGFwcHJvcHJpYXRlIHJlc291
cmNlIG5hbWVzIHRvIGZpbWQwIHBsYXRmb3JtIGRldmljZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFRvbWFzeiBGaWdhIDx0LmZpZ2FAc2Ftc3VuZy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEt5dW5n
bWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+DQoNCkl0IGxvb2tzIGdvb2QuDQpU
aGFuayB5b3UgZm9yIHNlbmRpbmcgdGhlIHBhdGNoLg0KDQpBY2tlZC1ieTogSmluZ29vIEhhbiA8
amcxLmhhbkBzYW1zdW5nLmNvbT4NCg0KDQpCZXN0IHJlZ2FyZHMsDQpKaW5nb28gSGFuDQoNCj4g
LS0tDQo+ICBhcmNoL2FybS9wbGF0LXNhbXN1bmcvZGV2cy5jIHwgNiArKystLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vcGxhdC1zYW1zdW5nL2RldnMuYyBiL2FyY2gvYXJtL3BsYXQtc2Ftc3Vu
Zy9kZXZzLmMNCj4gaW5kZXggMzBjMmZlMi4uMGY5YzNmNCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9h
cm0vcGxhdC1zYW1zdW5nL2RldnMuYw0KPiArKysgYi9hcmNoL2FybS9wbGF0LXNhbXN1bmcvZGV2
cy5jDQo+IEBAIC0zMTEsOSArMzExLDkgQEAgc3RydWN0IHBsYXRmb3JtX2RldmljZSBzNXBfZGV2
aWNlX2pwZWcgPSB7DQo+ICAjaWZkZWYgQ09ORklHX1M1UF9ERVZfRklNRDANCj4gIHN0YXRpYyBz
dHJ1Y3QgcmVzb3VyY2UgczVwX2ZpbWQwX3Jlc291cmNlW10gPSB7DQo+ICAJWzBdID0gREVGSU5F
X1JFU19NRU0oUzVQX1BBX0ZJTUQwLCBTWl8zMkspLA0KPiAtCVsxXSA9IERFRklORV9SRVNfSVJR
KElSUV9GSU1EMF9WU1lOQyksDQo+IC0JWzJdID0gREVGSU5FX1JFU19JUlEoSVJRX0ZJTUQwX0ZJ
Rk8pLA0KPiAtCVszXSA9IERFRklORV9SRVNfSVJRKElSUV9GSU1EMF9TWVNURU0pLA0KPiArCVsx
XSA9IERFRklORV9SRVNfSVJRX05BTUVEKElSUV9GSU1EMF9WU1lOQywgInZzeW5jIiksDQo+ICsJ
WzJdID0gREVGSU5FX1JFU19JUlFfTkFNRUQoSVJRX0ZJTUQwX0ZJRk8sICJmaWZvIiksDQo+ICsJ
WzNdID0gREVGSU5FX1JFU19JUlFfTkFNRUQoSVJRX0ZJTUQwX1NZU1RFTSwgImxjZF9zeXMiKSwN
Cj4gIH07DQo+IA0KPiAgc3RydWN0IHBsYXRmb3JtX2RldmljZSBzNXBfZGV2aWNlX2ZpbWQwID0g
ew0KPiAtLQ0KPiAxLjguMi4xDQo+IA0KDQo=
