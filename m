From: JinGoo Han <jg1.han@samsung.com>
Subject: [PATCH v3 0/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Tue, 21 Jun 2011 06:11:13 +0000 (GMT)
Message-ID: <14862342.74321308636673209.JavaMail.weblogic@epml09>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8929 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974Ab1FUGLQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 02:11:16 -0400
Received: from epcpsbge7.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN4006MCMIJDF30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Jun 2011 15:11:14 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jong-Hun Han <jonghun.han@samsung.com>
Cc: ANAND KUMAR N <anand.kn@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

VGhpcyBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIGxhdGVzdA0KZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LTIuNi5naXQNCg0KVGhpcyB3
YXMgb3JpZ2luYWxseSBzdWJtaXR0ZWQgYnkgSm9uZ2h1biBIYW4gPGpvbmdodW4uaGFuQHNhbXN1
bmcuY29tPg0KaHR0cDovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9hcm0ta2VybmVsL21zZzEwMTc4
MS5odG1sDQoNClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IEZJTUQoRnVsbHkgSW50ZXJhY3RpdmUg
TW9iaWxlIERpc3BsYXkpIG9uIEV4eW5vczQuDQpUaGUgNHRoIHBhdGNoIGlzIHVwZGF0ZSBmb3Ig
czNjLWZiIGFuZCBvdGhlcnMgYXJlIGZvciBwbGF0Zm9ybSBkYXRhLg0KDQp2MjogY2hhbmdlIGNs
b2NrIG5hbWUgb2YgZXh5bm9zNCBGSU1EOiAiZmltZCIgLT4gImxjZCINCiAgICAgdXNlICdoYXNf
Y2xrc2VsJyB2YXJpYWJsZSBpbiBvcmRlciB0byBkaXN0aW5ndWlzaCBGSU1EIHZlcnNpb24NCiAg
ICAgYWRkICdsY2RfY2xrJyB0aGF0IGNhbiBiZSB1c2VkIGZvciBvbmx5IGxjZCBwaXhlbCBjbG9j
aw0KICAgICBhZGQgY2FsbGJhY2sgJ2VuYWJsZV9jbGsoKScgdG8gZW5hYmxlIHBhcmVudCBjbG9j
ayAnc2Nsa19maW1kJy4NCnYzOiByZW1vdmUgdGhlIGNhbGxiYWNrIGZyb20gdGhlIHBsYXRmb3Jt
IGRhdGEgc3RydWN0dXJlDQoNCm8gVG8gS3VramluIEtpbQ0KW1BBVENIIHYzIDEvNV0gQVJNOiBF
WFlOT1M0OiBDaGFuZ2UgY2xvY2sgbmFtZSBmb3IgRklNRA0KW1BBVENIIHYzIDIvNV0gQVJNOiBF
WFlOT1M0OiBBZGQgRklNRCByZXNvdXJjZSBkZWZpbml0aW9uDQpbUEFUQ0ggdjMgMy81XSBBUk06
IEVYWU5PUzQ6IEFkZCBwbGF0Zm9ybSBkZXZpY2UgYW5kIGhlbHBlciBmdW5jdGlvbnMgZm9yIEZJ
TUQNCltQQVRDSCB2MyA1LzVdIEFSTTogRVhZTk9TNDogQWRkIHBsYXRmb3JtIGRhdGEgZm9yIEVY
WU5PUzQgRklNRCBhbmQgTFRFNDgwV1YgcGxhdGZvcm0tbGNkDQoNCm8gVG8gUGF1bCBNdW5kdA0K
W1BBVENIIHYzIDQvNV0gdmlkZW86IHMzYy1mYjogQWRkIHN1cHBvcnQgRVhZTk9TNCBGSU1EDQoN
Cg==
