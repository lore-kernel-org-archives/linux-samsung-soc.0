From: =?euc-kr?B?x9HB+LG4?= <jg1.han@samsung.com>
Subject: Re: [PATCH] rtc: max8998: Check for pdata presence before dereferencing
Date: Thu, 16 May 2013 01:54:08 +0000 (GMT)
Message-ID: <17870889.122861368669248723.JavaMail.weblogic@epml12>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60402 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752766Ab3EPByL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 21:54:11 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMV00DH1BY27T80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 16 May 2013 10:54:08 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, akpm@linux-foundation.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, =?euc-kr?Q?=BD=C9=C1=D8=BF=B5?= <jy0922.shim@samsung.com>, =?euc-kr?Q?=B9=DA=B0=E6=B9=CE?= <kyungmin.park@samsung.com>, jg1.han@samsung.com, linux-kernel@vger.kernel.org

VGh1cnNkYXksIE1heSAxNiwgMjAxMyAxMjoxNiBBTSwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IA0K
PiBDdXJyZW50bHkgdGhlIGRyaXZlciBjYW4gY3Jhc2ggd2l0aCBhIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBpZiBubyBwZGF0YQ0KPiBpcyBwcm92aWRlZCwgZGVzcGl0ZSBvZiBzdWNjZXNzZnVs
IHJlZ2lzdHJhdGlvbiBvZiBNRkQgcGFydC4gVGhpcyBwYXRjaA0KPiBmaXhlcyB0aGUgcHJvYmxl
bSBieSBhZGRpbmcgYSBOVUxMIGNoZWNrIGJlZm9yZSBkZXJlZmVyZW5jaW5nIHRoZSBwZGF0YQ0K
PiBwb2ludGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEZpZ2EgPHQuZmlnYUBzYW1z
dW5nLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0Bz
YW1zdW5nLmNvbT4NCg0KQ0MnZWQgQW5kcmV3IE1vcnRvbg0KDQpSZXZpZXdlZC1ieTogSmluZ29v
IEhhbiA8amcxLmhhbkBzYW1zdW5nLmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KSmluZ29vIEhhbg0K
DQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRjLW1heDg5OTguYyB8IDIgKy0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcnRjL3J0Yy1tYXg4OTk4LmMgYi9kcml2ZXJzL3J0Yy9ydGMtbWF4ODk5OC5jDQo+
IGluZGV4IDQ4YjY2MTIuLmQ1YWY3YmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1t
YXg4OTk4LmMNCj4gKysrIGIvZHJpdmVycy9ydGMvcnRjLW1heDg5OTguYw0KPiBAQCAtMjg1LDcg
KzI4NSw3IEBAIHN0YXRpYyBpbnQgbWF4ODk5OF9ydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gIAkJCWluZm8tPmlycSwgcmV0KTsNCj4gDQo+ICAJZGV2X2luZm8oJnBk
ZXYtPmRldiwgIlJUQyBDSElQIE5BTUU6ICVzXG4iLCBwZGV2LT5pZF9lbnRyeS0+bmFtZSk7DQo+
IC0JaWYgKHBkYXRhLT5ydGNfZGVsYXkpIHsNCj4gKwlpZiAocGRhdGEgJiYgcGRhdGEtPnJ0Y19k
ZWxheSkgew0KPiAgCQlpbmZvLT5scDM5NzRfYnVnX3dvcmthcm91bmQgPSB0cnVlOw0KPiAgCQlk
ZXZfd2FybigmcGRldi0+ZGV2LCAiTFAzOTc0IHdpdGggUlRDIFJFR0VSUiBvcHRpb24uIg0KPiAg
CQkJCSIgUlRDIHVwZGF0ZXMgd2lsbCBiZSBleHRyZW1lbHkgc2xvdy5cbiIpOw0KPiAtLQ0KPiAx
LjguMi4xDQo+IA0KPiAtLQ0KPiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0
aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtc2Ftc3VuZy1zb2MiIGluDQo+IHRoZSBib2R5IG9m
IGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnDQo+IE1vcmUgbWFqb3Jkb21v
IGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbA0K
