From: RAHUL SHARMA <rahul.sharma@samsung.com>
Subject: Re: Re: [PATCH 6/8] arm: exynos: config exynos5 hdmi-hpd gpio
Date: Fri, 05 Oct 2012 03:36:14 +0000 (GMT)
Message-ID: <6144318.564701349408174292.JavaMail.weblogic@epml07>
Reply-To: rahul.sharma@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28376 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970Ab2JEDgQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 23:36:16 -0400
Received: from epcpsbge2.samsung.com (epcpsbge2 [203.254.230.12])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBE0004GI06O930@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Oct 2012 12:36:14 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, In-Ki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, PRASHANTH GODREHAL <prashanth.g@samsung.com>, SUNIL JOSHI <joshi@samsung.com>, SHIRISH S <s.shirish@samsung.com>, FAHAD KUNNATHADI <fahad.k@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, "r.sh.open@gmail.com" <r.sh.open@gmail.com>

U3VyZSBNci4gcGFyaywNCg0KSSB3aWxsIGNvcnJlY3QgdGhpcyBpbiB2Mi4NCkkgd2FudCB0byBy
ZXF1ZXN0IHlvdSBmb3IgcmV2aWV3aW5nIHRoZSBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXQuDQoN
CnJlZ2FyZHMsDQpSYWh1bCBTaGFybWENCg0KT24gVGh1LCBPY3QgNCwgMjAxMiBhdCAxOjQ1IFBN
LCBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPiB3cm90ZToNCj4gT24g
MTAvNS8xMiwgUmFodWwgU2hhcm1hIDxyYWh1bC5zaGFybWFAc2Ftc3VuZy5jb20+IHdyb3RlOg0K
Pj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBjb25maWd1cmF0aW9uIG9mIGV4eW5v
czUgaGRtaS1ocGQgZ3Bpby4NCj4+IEl0IHNldHMgdGhlIGdwaW8gZnVjbnRpb24gdG8gRUlOVCB3
aGljaCBpcyByZXF1aXJlZCBmb3IgcmVjaWV2aW5nDQo+PiBleHRlcm5hbCBocGQgaW50ZXJydXB0
IGluIGRybSBoZG1pIGRyaXZlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaGFybWEg
PHJhaHVsLnNoYXJtYUBzYW1zdW5nLmNvbT4NCj4+IC0tLQ0KPj4gIGFyY2gvYXJtL21hY2gtZXh5
bm9zL21hY2gtZXh5bm9zNS1kdC5jIHwgICAgOSArKysrKysrKysNCj4+ICAxIGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vbWFjaC1leHlub3MvbWFjaC1leHlub3M1LWR0LmMNCj4+IGIvYXJjaC9hcm0vbWFj
aC1leHlub3MvbWFjaC1leHlub3M1LWR0LmMNCj4+IGluZGV4IDAwMzk2M2MuLjlhNmQ1NjkgMTAw
NjQ0DQo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLWV4eW5vcy9tYWNoLWV4eW5vczUtZHQuYw0KPj4g
KysrIGIvYXJjaC9hcm0vbWFjaC1leHlub3MvbWFjaC1leHlub3M1LWR0LmMNCj4+IEBAIC0xMSw2
ICsxMSw3IEBADQo+Pg0KPj4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPg0KPj4gICNp
bmNsdWRlIDxsaW51eC9zZXJpYWxfY29yZS5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvLmg+
DQo+Pg0KPj4gICNpbmNsdWRlIDxhc20vbWFjaC9hcmNoLmg+DQo+PiAgI2luY2x1ZGUgPGFzbS9o
YXJkd2FyZS9naWMuaD4NCj4+IEBAIC0xOCw2ICsxOSw3IEBADQo+Pg0KPj4gICNpbmNsdWRlIDxw
bGF0L2NwdS5oPg0KPj4gICNpbmNsdWRlIDxwbGF0L3JlZ3Mtc2VyaWFsLmg+DQo+PiArI2luY2x1
ZGUgPHBsYXQvZ3Bpby1jZmcuaD4NCj4+DQo+PiAgI2luY2x1ZGUgImNvbW1vbi5oIg0KPj4NCj4+
IEBAIC04MSwxMCArODMsMTcgQEAgc3RhdGljIHZvaWQgX19pbml0IGV4eW5vczUyNTBfZHRfbWFw
X2lvKHZvaWQpDQo+PiAgICAgICBzM2MyNHh4X2luaXRfY2xvY2tzKDI0MDAwMDAwKTsNCj4+ICB9
DQo+Pg0KPj4gK3N0YXRpYyB2b2lkIHNtZGtfaHBkX3NldHVwKHZvaWQpDQo+PiArew0KPj4gKyAg
ICAgczNjX2dwaW9fY2ZncGluKEVYWU5PUzVfR1BYMyg3KSwgUzNDX0dQSU9fU0ZOKDB4ZikpOw0K
Pj4gKyAgICAgczNjX2dwaW9fc2V0cHVsbChFWFlOT1M1X0dQWDMoNyksIFMzQ19HUElPX1BVTExf
RE9XTik7DQo+PiArfQ0KPiB0aGVzZSBzaG91bGQgYmUgZGVzY3JpYmVkIGF0IGR0cyBmaWxlIGlu
c3RlYWQgb2YgaGVyZS4gYW5kIG5hbWUgaXMgbm90DQo+IGdvb2QuIHNtZGsuLi4NCj4NCj4gVGhh
bmsgeW91LA0KPiBLeXVuZ21pbiBQYXJrDQo+PiArDQo+PiAgc3RhdGljIHZvaWQgX19pbml0IGV4
eW5vczUyNTBfZHRfbWFjaGluZV9pbml0KHZvaWQpDQo+PiAgew0KPj4gICAgICAgb2ZfcGxhdGZv
cm1fcG9wdWxhdGUoTlVMTCwgb2ZfZGVmYXVsdF9idXNfbWF0Y2hfdGFibGUsDQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBleHlub3M1MjUwX2F1eGRhdGFfbG9va3VwLCBOVUxMKTsN
Cj4+ICsgICAgIHNtZGtfaHBkX3NldHVwKCk7DQo+PiAgfQ0KPj4NCj4+ICBzdGF0aWMgY2hhciBj
b25zdCAqZXh5bm9zNTI1MF9kdF9jb21wYXRbXSBfX2luaXRkYXRhID0gew0KPj4gLS0NCj4+IDEu
Ny4wLjQNCj4+DQo+PiAtLQ0KPj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQg
dGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXNhbXN1bmctc29jIg0KPj4gaW4NCj4+IHRoZSBi
b2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnDQo+PiBNb3JlIG1h
am9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0
bWwNCj4+DQoNCg==
