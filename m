From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: Re: [PATCH] PM / devfreq: event: Remove incorrect property in
 exynos-ppmu DT binding
Date: Mon, 03 Aug 2015 04:58:52 +0000 (GMT)
Message-ID: <1733224792.341671438577931309.JavaMail.weblogic@epmlwas06d>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43828 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752612AbbHCE7F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 00:59:05 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NSH00NLLPU4LF60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Aug 2015 13:58:52 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: =?utf-8?Q?=EC=B5=9C=EC=B0=AC=EC=9A=B0?= <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?utf-8?Q?=ED=81=AC=EC=89=AC=EC=8B=9C=ED=86=A0=ED=94=84?= <k.kozlowski@samsung.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

PiBIZWxsbyBNeXVuZ2pvbywNCj4gDQo+IE9uIDA3LzIzLzIwMTUgMTA6MzAgQU0sIEphdmllciBN
YXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4gPiBIZWxsbyBDaGFud29vLA0KPiA+DQo+ID4gT24g
MDcvMjMvMjAxNSAxMDoxOSBBTSwgQ2hhbndvbyBDaG9pIHdyb3RlOg0KPiA+PiBIaSBKYXZpZXIs
DQo+ID4+DQo+ID4+IE9uIDA3LzEzLzIwMTUgMDM6NTggUE0sIEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyB3cm90ZToNCj4gPj4+IFRoZSBleHlub3MtcHBtdSBkcml2ZXIgaXMgb25seSBhIGNsb2Nr
IGNvbnN1bWVyIGFuZCBub3QgYSBjbG9jaw0KPiA+Pj4gcHJvdmlkZXIgYnV0IGl0cyBEZXZpY2Ug
VHJlZSBiaW5kaW5nIGxpc3RlZCAjY2xvY2stY2VsbHMgYXMgYW4NCj4gPj4+IG9wdGlvbmFsIHBy
b3BlcnR5Lg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4NCj4gPj4+DQpbXQ0KPiA+Pj4NCj4gPj4+IEV4
YW1wbGUxIDogUFBNVSBub2RlcyBpbiBleHlub3MzMjUwLmR0c2kgYXJlIGxpc3RlZCBiZWxvdy4N
Cj4gPj4+DQo+ID4+Pg0KPiA+Pg0KPiA+PiBSZXZpZXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAw
LmNob2lAc2Ftc3VuZy5jb20+DQo+ID4+DQo+ID4+ICsgRGV2ZnJlcSBtYWludGFpbmVyIChNeXVu
Z2pvbyBIYW0pDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIGZvciBjYydpbmcg
TXl1bmdqb28uIFRoZSBnZXRfbWFpbnRhaW5lci5wbCBzY3JpcHQNCj4gPiBkaWRuJ3QgdGVsbCBt
ZSB0aGF0IHNvIEkgdGhpbmsgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZy
ZXEvDQo+ID4gc3ViLWRpciBzaG91bGQgYmUgYWRkZWQgdG8gdGhlIERFVklDRSBGUkVRVUVOQ1kg
KERFVkZSRVEpIGVudHJ5IGluIHRoZQ0KPiA+IE1BSU5UQUlORVJTIGZpbGUuDQo+ID4NCj4gPj4g
SSB0aGluayB0aGF0IHRoaXMgcGF0Y2ggd2lsbCBiZSBtb3JlIGFwcHJvcHJpYXRlIG9uIGRldmZy
ZXEgZ2l0IHRyZWUNCj4gPj4gdGhhbiBsaW51eC1zYW1zdW5nIGdpdCB0cmVlLg0KPiA+Pg0KPiA+
DQo+ID4gQWdyZWVkLg0KPiA+DQo+IA0KPiBBbnkgY29tbWVudHMgYWJvdXQgdGhpcyBwYXRjaD8N
Cg0KTm9wZS4gSXQncyBhcHBsaWVkLg0KDQoNClRoYW5rcy4NCg0KDQoNCk15dW5nSm9vDQoNCj4g
DQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0K
