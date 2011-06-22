From: JinGoo Han <jg1.han@samsung.com>
Subject: [PATCH V4 1/5] ARM: EXYNOS4: Change clock name for FIMD
Date: Wed, 22 Jun 2011 03:42:17 +0000 (GMT)
Message-ID: <16187978.109931308714136278.JavaMail.weblogic@epml08>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64593 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756750Ab1FVDmS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 23:42:18 -0400
Received: from epcpsbge4.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN600AV9AA6IXH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 12:42:17 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Paul Mundt <lethal@linux-sh.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-f>
Cc: ANAND KUMAR N <anand.kn@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, THOMAS P ABRAHAM <thomas.ab@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kmpark@infradead.org>, In-Ki Dae <inki.dae@samsung.com>, ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, JinGoo Han <jg1.han@samsung.com>

VGhpcyBwYXRjaCBjaGFuZ2VzIGNsb2NrIG5hbWUgZm9yIEZJTUQgZnJvbSAiZmltZCIgdG8gImxj
ZCIuDQoNClNpZ25lZC1vZmYtYnk6IEppbmdvbyBIYW4gPGpnMS5oYW5Ac2Ftc3VuZy5jb20+DQot
LS0NCiBhcmNoL2FybS9tYWNoLWV4eW5vczQvY2xvY2suYyB8ICAgIDQgKystLQ0KIDEgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vbWFjaC1leHlub3M0L2Nsb2NrLmMgYi9hcmNoL2FybS9tYWNoLWV4eW5vczQvY2xv
Y2suYw0KaW5kZXggODcxZjlkNS4uMTJlNjg1MyAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtL21hY2gt
ZXh5bm9zNC9jbG9jay5jDQorKysgYi9hcmNoL2FybS9tYWNoLWV4eW5vczQvY2xvY2suYw0KQEAg
LTQzMywxMiArNDMzLDEyIEBAIHN0YXRpYyBzdHJ1Y3QgY2xrIGluaXRfY2xvY2tzX29mZltdID0g
ew0KIAkJLmVuYWJsZQkJPSBleHlub3M0X2Nsa19pcF9jYW1fY3RybCwNCiAJCS5jdHJsYml0CT0g
KDEgPDwgMyksDQogCX0sIHsNCi0JCS5uYW1lCQk9ICJmaW1kIiwNCisJCS5uYW1lCQk9ICJsY2Qi
LA0KIAkJLmlkCQk9IDAsDQogCQkuZW5hYmxlCQk9IGV4eW5vczRfY2xrX2lwX2xjZDBfY3RybCwN
CiAJCS5jdHJsYml0CT0gKDEgPDwgMCksDQogCX0sIHsNCi0JCS5uYW1lCQk9ICJmaW1kIiwNCisJ
CS5uYW1lCQk9ICJsY2QiLA0KIAkJLmlkCQk9IDEsDQogCQkuZW5hYmxlCQk9IGV4eW5vczRfY2xr
X2lwX2xjZDFfY3RybCwNCiAJCS5jdHJsYml0CT0gKDEgPDwgMCksDQotLSANCjEuNy4xDQoNCg==
