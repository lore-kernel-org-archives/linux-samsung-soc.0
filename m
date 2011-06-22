From: JinGoo Han <jg1.han@samsung.com>
Subject: [PATCH V6 0/5] ARM: EXYNOS4: Add support EXYNOS4 FIMD
Date: Wed, 22 Jun 2011 12:21:40 +0000 (GMT)
Message-ID: <27061283.131341308745300255.JavaMail.weblogic@epv6ml03>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60295 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757561Ab1FVMVm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 08:21:42 -0400
Received: from epcpsbge6.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN6009CDYC4TKN0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 21:21:40 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-f>
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
dGhlIGlmIHN0YXRlbWVudA0KdjU6IGFkZCBjbGtfZW5hYmxlL2Rpc2FibGUoc2ZiLT5sY2RfY2xr
KSB0byBzM2NfZmJfcnVudGltZV9zdXNwZW5kL3Jlc3VtZSgpLg0KdjY6IHJlbmFtZSBkZXYtZmlt
ZC0yNGJwcC5jIHRvIGRldi1maW1kMC5jDQogICAgIGFkZCAnZXh5bm9zNF9maW1kMF9zZXR1cF9j
bG9jaygpJyB0byBkZXYtZmltZDAuYyB0byBzZXR1cCBwYXJlbnQgY2xvY2suDQoNCm8gVG8gS3Vr
amluIEtpbQ0KW1BBVENIIFY2IDEvNV0gQVJNOiBFWFlOT1M0OiBDaGFuZ2UgY2xvY2sgbmFtZSBm
b3IgRklNRA0KW1BBVENIIFY2IDIvNV0gQVJNOiBFWFlOT1M0OiBBZGQgRklNRCByZXNvdXJjZSBk
ZWZpbml0aW9uDQpbUEFUQ0ggVjYgMy81XSBBUk06IEVYWU5PUzQ6IEFkZCBwbGF0Zm9ybSBkZXZp
Y2UgYW5kIGhlbHBlciBmdW5jdGlvbnMgZm9yIEZJTUQNCltQQVRDSCBWNiA1LzVdIEFSTTogRVhZ
Tk9TNDogQWRkIHBsYXRmb3JtIGRhdGEgZm9yIEVYWU5PUzQgRklNRCBhbmQgTFRFNDgwV1YgcGxh
dGZvcm0tbGNkDQoNCm8gVG8gUGF1bCBNdW5kdA0KW1BBVENIIFY2IDQvNV0gdmlkZW86IHMzYy1m
YjogQWRkIHN1cHBvcnQgRVhZTk9TNCBGSU1E
