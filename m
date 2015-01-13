From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCHv3 3/8] ARM: dts: Add memory bus node for Exynos3250
Date: Tue, 13 Jan 2015 09:14:07 +0000 (GMT)
Message-ID: <823139081.971381421140443531.JavaMail.weblogic@epmlwas05d>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46704 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751935AbbAMJOJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 04:14:09 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NI300HOUYZJG120@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Jan 2015 18:14:07 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=EC=B5=9C=EC=B0=AC=EC=9A=B0?= <cw00.choi@samsung.com>, "kgene@kernel.org" <kgene@kernel.org>
Cc: =?utf-8?Q?=EB=B0=95=EA=B2=BD=EB=AF=BC?= <kyungmin.park@samsung.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, ABHILASH KESAVAN <a.kesavan@samsung.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, =?utf-8?Q?=EB=8C=80=EC=9D=B8=EA=B8=B0?= <inki.dae@samsung.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

PiAgIA0KPiAgVGhpcyBwYXRjaCBhZGRzIHRoZSBtZW1vcnkgYnVzIG5vZGUgZm9yIEV4eW5vczMy
NTAgU29DLiBFeHlub3MzMjUwIGhhcw0KPiBmb2xsb3dpbmcgbWVtb3J5IGJ1c2VzIHRvIHRyYW5z
bGF0ZSBkYXRhIGJldHdlZW4gRFJBTSBhbmQgZU1NQy9zdWItSVBzLg0KPiANCj4gRm9sbG93aW5n
IGxpc3Qgc3BlY2lmaWVzIHRoZSBkZXRhaWxlZCByZWxhdGlvbiBiZXR3ZWVuIG1lbW9yeSBidXMg
Y2xvY2sgYW5kIERNQw0KPiBJUCBpbiBNSUYgKE1lbW9yeSBJbnRlcmZhY2UpIGJsb2NrOg0KPiAt
IERNQyBjbG9jayA6IERNQyAoRHluYW1pYyBNZW1vcnkgQ29udHJvbGxlcikNCj4gDQo+IEZvbGxv
d2luZyBsaXN0IHNwZWNpZmllcyB0aGUgZGV0YWlsZWQgcmVsYXRpb24gYmV0d2VlbiBtZW1vcnkg
YnVzIGNsb2NrIGFuZA0KPiBzdWItSVBzIGluIElOVCAoSW50ZXJuYWwpIGJsb2NrOg0KPiAtIEFD
TEsxMDAgY2xvY2sgOiBQRVJJTA0KPiAtIEFDTEsxNjAgY2xvY2sgOiBMQ0QwDQo+IC0gQUNMSzIw
MCBjbG9jayA6IEZTWVMNCj4gLSBBQ0xLMjY2IGNsb2NrIDogSVNQDQo+IC0gR0RML0dEUiBjbG9j
ayA6IGxlZnRidXMvcmlnaHRidXMNCj4gLSBTQ0xLX01GQyBjbG9jayA6IE1GQw0KPiANCj4gQ2M6
IEt1a2ppbiBLaW0gPGtnZW5lQGtlcm5lbC5vcmc+DQo+IENjOiBNeXVuZ2pvbyBIYW0gPG15dW5n
am9vLmhhbUBzYW1zdW5nLmNvbT4NCj4gQ2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtA
c2Ftc3VuZy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNh
bXN1bmcuY29tPg0KPiBBY2tlZC1ieTogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1z
dW5nLmNvbT4NCg0KQWNrZWQtYnk6IE15dW5nSm9vIEhhbSA8bXl1bmdqb28uaGFtQHNhbXN1bmcu
Y29tPg0KDQoNCg0KPiAtLS0NCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczMyNTAuZHRzaSB8
IDEyNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEyNSBpbnNlcnRpb25zKCspDQo+IA0K
