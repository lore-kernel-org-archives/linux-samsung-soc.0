From: JinGoo Han <jg1.han@samsung.com>
Subject: [PATCH V4 0/5] ARM: EXYNOS4: Add support EXYNOS4 FIMD
Date: Wed, 22 Jun 2011 03:19:50 +0000 (GMT)
Message-ID: <11032485.109331308712790030.JavaMail.weblogic@epml08>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55558 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757626Ab1FVDTw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 23:19:52 -0400
Received: from epcpsbge8.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN600A2D992IXH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 12:19:50 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-fbdev@vger.kernel.org, Jong-Hun
Cc: ANAND KUMAR N <anand.kn@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, JinGoo Han <jg1.han@samsung.com>

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
IGRhdGEgc3RydWN0dXJlDQp2NDogbW92ZSBjbGtfZW5hYmxlKHNmYi0+bGNkX2NsaykgdW5kZXIg
dGhlIGlmIHN0YXRlbWVudA0KDQpvIFRvIEt1a2ppbiBLaW0NCltQQVRDSCBWNCAxLzVdIEFSTTog
RVhZTk9TNDogQ2hhbmdlIGNsb2NrIG5hbWUgZm9yIEZJTUQNCltQQVRDSCBWNCAyLzVdIEFSTTog
RVhZTk9TNDogQWRkIEZJTUQgcmVzb3VyY2UgZGVmaW5pdGlvbg0KW1BBVENIIFY0IDMvNV0gQVJN
OiBFWFlOT1M0OiBBZGQgcGxhdGZvcm0gZGV2aWNlIGFuZCBoZWxwZXIgZnVuY3Rpb25zIGZvciBG
SU1EDQpbUEFUQ0ggVjQgNS81XSBBUk06IEVYWU5PUzQ6IEFkZCBwbGF0Zm9ybSBkYXRhIGZvciBF
WFlOT1M0IEZJTUQgYW5kIExURTQ4MFdWIHBsYXRmb3JtLWxjZA0KDQpvIFRvIFBhdWwgTXVuZHQN
CltQQVRDSCBWNCA0LzVdIHZpZGVvOiBzM2MtZmI6IEFkZCBzdXBwb3J0IEVYWU5PUzQgRklNRA==
