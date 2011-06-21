From: JinGoo Han <jg1.han@samsung.com>
Subject: Re: Re: [PATCH v2 5/5] ARM: EXYNOS4: Add platform data for EXYNOS4
 FIMD and LTE480WV platform-lcd
Date: Tue, 21 Jun 2011 04:08:32 +0000 (GMT)
Message-ID: <6930554.67931308629310902.JavaMail.weblogic@epml09>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14529 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072Ab1FUEIe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 00:08:34 -0400
Received: from epcpsbge5.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN40077IGTR5CF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 13:08:33 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, JinGoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>, ANAND KUMAR N <anand.kn@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

SGksIFR1c2hhciBCZWhlcmEuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogbGludXgtc2Ftc3VuZy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIFttYWlsdG86bGludXgt
c2Ftc3VuZy1zb2MtDQo+IG93bmVyQHZnZXIua2VybmVsLm9yZ10gT24gQmVoYWxmIE9mIFR1c2hh
ciBCZWhlcmENCj4gU2VudDogVHVlc2RheSwgSnVuZSAyMSwgMjAxMSAxMjo0NyBQTQ0KPiBUbzog
SmluZ29vIEhhbg0KPiBDYzogS3VramluIEtpbTsgUGF1bCBNdW5kdDsgbGludXgtc2Ftc3VuZy1z
b2NAdmdlci5rZXJuZWwub3JnOyBKb25naHVuIEhhbjsNCj4gQW5hbmQgS3VtYXIgTjsgVGhvbWFz
IEFicmFoYW07IFN5bHdlc3RlciBOYXdyb2NraTsgTWFyZWsgU3p5cHJvd3NraTsNCj4gS3l1bmdt
aW4gUGFyazsgSW5raSBEYWU7IEFSTSBMaW51eDsgQmVuIERvb2tzDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgNS81XSBBUk06IEVYWU5PUzQ6IEFkZCBwbGF0Zm9ybSBkYXRhIGZvciBFWFlOT1M0
DQo+IEZJTUQgYW5kIExURTQ4MFdWIHBsYXRmb3JtLWxjZA0KPiANCj4gSGksDQo+IA0KPiBPbiBG
cmlkYXkgMTcgSnVuZSAyMDExIDA2OjMyIFBNLCBKaW5nb28gSGFuIHdyb3RlOg0KPiA+IEZyb206
IEpvbmdodW4gSGFuPGpvbmdodW4uaGFuQHNhbXN1bmcuY29tPg0KPiA+DQo+ID4gVGhpcyBwYXRj
aCBhZGRzIHN1cHBvcnQgRVhZTk9TNCBGSU1EMCBhbmQgTFRFNDgwV1YgTENEIHBhbm5lbC4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmdodW4gSGFuPGpvbmdodW4uaGFuQHNhbXN1bmcuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEppbmdvbyBIYW48amcxLmhhbkBzYW1zdW5nLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIGFyY2gvYXJtL21hY2gtZXh5bm9zNC9tYWNoLXNtZGtjMjEwLmMgfCAgIDc0
DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgYXJjaC9hcm0vbWFj
aC1leHlub3M0L21hY2gtc21ka3YzMTAuYyB8ICAgNzQNCj4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE0OCBpbnNlcnRpb25zKCspLCAw
IGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBUaGVyZSBhcmUgdmFyaWFudHMgb2YgU01ES1YzMTAg
Ym9hcmRzIHRoYXQgZG9uJ3QgdXNlIExURTQ4MFdWIExDRCBwYW5lbC4NCj4gV29uJ3QgaXQgYmUg
YmV0dGVyIHRvIHByb3ZpZGUgYW4gb3B0aW9uIG9mIHNlbGVjdGluZyB0aGUgTENEIHBhbmVsDQo+
IHRocm91Z2ggY29uZmlnIGZpbGUgYW5kIGFkZGluZyB0aGUgcGFuZWwgY29kZSBhY2NvcmRpbmds
eT8NCj4NCj4gQWxzbywgdGhlIHBhbmVsIGNvZGUgY2FuIGJlIGNvbnNvbGlkYXRlZCBhdCBhIHNp
bmdsZSBsb2NhdGlvbiBhbmQgdXNlZA0KPiBpbiBhcHByb3ByaWF0ZSBtYWNoaW5lIGZpbGVzLg0K
PiANCkRvIHlvdSBoYXZlIGEgcGF0Y2ggYWJvdXQgdGhhdD8NCklmIHlvdSBtYWtlIGEgcGF0Y2gg
YWJvdXQgeW91ciBzdWdnZXN0aW9uLCBwbGVhc2Ugc3VibWl0IGl0Lg0K
