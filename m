From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] ARM: Exynos fixes for v4.4
Date: Wed, 02 Dec 2015 01:04:07 +0000 (GMT)
Message-ID: <1138242734.132831449018245518.JavaMail.weblogic@epmlwas05a>
Reply-To: kgene.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57351 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbbLBBEJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Dec 2015 20:04:09 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYP015CEHMVHVC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Dec 2015 10:04:07 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=ED=81=AC=EC=89=AC=EC=8B=9C=ED=86=A0=ED=94=84?= <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, Olof Johansson <olof@lixom.net>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gDQpIaSBLcnp5c3p0b2YsDQoNCkxvb2tzIGdv
b2QgdG8gbWUsIGJ1dCBJIGhhdmUgbm8gb3RoZXIgZml4ZXMgaW4gbXkgdHJlZSBzbyB0aGlzIHdv
dWxkIGJlIHNlbnQgdG8NCm91dCBhcm0tc29jIGRpcmVjdGx5IDotKQ0KDQpIaSBBcm5kLCBPbG9m
LCBLZXZpbiwNClBsZWFzZSBwdWxsIHRoaXMgZm9yIHY0LjQuDQoNClRoYW5rcywNCkt1a2ppbg0K
DQo+IEhpIEt1a2ppbiwNCj4gDQo+IFR3byBmaXhlcyBmb3IgdjQuNCBjeWNsZS4gUmFmYWVsIHdh
bnRlZCB0aGUgY3B1ZnJlcSBmaXggdG8gZ28gdGhyb3VnaCBhcm0tc29jIHRyZWUuDQo+IA0KPiBQ
bGVhc2Ugbm90ZSB0aGF0IGxvY2F0aW9uIG9mIHJlcG9zaXRvcnkgaGFzIGNoYW5nZWQgdG8ga2Vy
bmVsLm9yZy4NCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCj4gDQo+
IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODAwNWM0OWQ5YWVhNzRkMzgyZjQ3
NGNlMTFhZmJiYzdkNzEzMGJlYzoNCj4gDQo+ICAgTGludXggNC40LXJjMSAoMjAxNS0xMS0xNSAx
NzowMDoyNyAtMDgwMCkNCj4gDQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5
IGF0Og0KPiANCj4gICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9rcnprL2xpbnV4LmdpdCB0YWdzL3NhbXN1bmctZml4ZXMtNC40DQo+IA0KPiBmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNjJmNDllZTI2ZjE0NzUzYmQ3ZmE2MzRmNTFkNTM3YTc5
MDYxYmYwZjoNCj4gDQo+ICAgY3B1ZnJlcTogczNjMjR4eDogRG8gbm90IG1hcmsgczNjMjQxMF9w
bGxzX2FkZCBhcyBfX2luaXQgKDIwMTUtMTEtMjcgMTA6MTA6MzIgKzA5MDApDQo+IA0KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+IEZpeGVzIGZvciBFeHlub3M6DQo+IDEuIEZpeCBwb3RlbnRpYWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlIGluIEV4eW5vcyBQTVUgZHJpdmVyLg0KPiAyLiBSZW1vdmUgaW5jb3JyZWN0
IF9faW5pdCBhbm5vdGF0aW9uIGZyb20gczNjMjR4eCBjcHVmcmVxIGRyaXZlcg0KPiAgICBzdHJ1
Y3R1cmVzLg0KPiANCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBBcm5kIEJlcmdtYW5uICgxKToNCj4gICAgICAgY3B1
ZnJlcTogczNjMjR4eDogRG8gbm90IG1hcmsgczNjMjQxMF9wbGxzX2FkZCBhcyBfX2luaXQNCj4g
DQo+IFBhbmthaiBEdWJleSAoMSk6DQo+ICAgICAgIEFSTTogRVhZTk9TOiBGaXggcG90ZW50aWFs
IE5VTEwgcG9pbnRlciBhY2Nlc3MgaW4gZXh5bm9zX3N5c19wb3dlcmRvd25fY29uZg0KPiANCj4g
IGFyY2gvYXJtL21hY2gtZXh5bm9zL3BtdS5jICAgICAgICAgICAgICAgICAgIHwgNiArKysrKy0N
Cj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9wbGwtczNjMjQ0MC0xMjAwMDAwMC5jIHwgMiArLSAg
YXJjaC9hcm0vbWFjaC1zM2MyNHh4L3BsbC1zM2MyNDQwLTE2OTM0NDAwLmMgfCAyDQo+ICstDQo+
ICBkcml2ZXJzL2NwdWZyZXEvczNjMjR4eC1jcHVmcmVxLmMgICAgICAgICAgICB8IDIgKy0NCj4g
IDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiAtLQ==
