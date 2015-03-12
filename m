From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH] devfreq: event: Add 'const' keyword for devfreq_event_ops
 structure
Date: Thu, 12 Mar 2015 01:28:42 +0000 (GMT)
Message-ID: <1281236635.1678801426123720852.JavaMail.weblogic@epmlwas01c>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33729 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750858AbbCLB2o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 21:28:44 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NL200DUJS3UQ0B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Mar 2015 10:28:42 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?=EC=B5=9C=EC=B0=AC=EC=9A=B0?= <cw00.choi@samsung.com>
Cc: =?utf-8?Q?=EB=B0=95=EA=B2=BD=EB=AF=BC?= <kyungmin.park@samsung.com>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, =?utf-8?Q?=EA=B9=80=EA=B5=AD=EC=A7=84?= <kgene.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

PiAgIA0KPiAgVGhpcyBwYXRjaCBhZGRzIHRoZSAnY29uc3QnIGtleXdvcmQgZm9yIGRldmZyZXFf
ZXZlbnRfb3BzIHN0cnVjdHVyZQ0KPiBiZWNhdXNlIHRoZSBvcHMgb2YgZGV2ZnJlcV9ldmVudF9k
ZXNjIHN0cnVjdHVyZSBzaG9sZCBub3QgYmUgY2hhbmdlZA0KPiBhZnRlciBpbml0aWFsaXphdGlv
bi4NCj4gDQo+IENjOiBNeXVuZ2pvbyBIYW0gPG15dW5nam9vLmhhbUBzYW1zdW5nLmNvbT4NCj4g
Q2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZGV2ZnJlcS9ldmVudC9leHlub3MtcHBtdS5jIHwgMiArLQ0KPiAgaW5jbHVkZS9saW51
eC9kZXZmcmVxLWV2ZW50LmggICAgICAgfCAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQoNCk1lcmdlZCB3aXRoIGEgbGl0dGxlIHJl
cGhyYXNpbmcuDQoNClNpZ25lZC1vZmYtYnk6IE15dW5nSm9vIEhhbSA8bXl1bmdqb28uaGFtQHNh
bXN1bmcuY29tPg0KDQoNCg==
