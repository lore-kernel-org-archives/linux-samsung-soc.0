From: =?euc-kr?B?wbaw5sij?= <pullip.cho@samsung.com>
Subject: [PATCH 4/4] iommu/exynos: Use bus_set_iommu instead of register_iommu
Date: Sat, 24 Sep 2011 07:31:04 +0000 (GMT)
Message-ID: <24779929.49931316849463377.JavaMail.weblogic@epml24>
Reply-To: pullip.cho@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13459 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750857Ab1IXHbF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Sep 2011 03:31:05 -0400
Received: from epcpsbge5.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS0003EVNIZVK20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Sep 2011 16:31:04 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, iommu@lists.linux-foundatio
Cc: =?euc-kr?Q?=C1=B6=B0=E6=C8=A3?= <pullip.cho@samsung.com>, "joerg.roedel@amd.com" <joerg.roedel@amd.com>, =?euc-kr?Q?=C0=CC=BB=F3=C7=F6?= <sanghyun75.lee@samsung.com>, =?euc-kr?Q?=B1=E8=B1=B9=C1=F8?= <kgene.kim@samsung.com>, =?euc-kr?Q?=B1=E8=BF=B5=B6=F4?= <younglak1004.kim@samsung.com>, "ohad@wizery.com" <ohad@wizery.com>

VGhpcyByZXBsYWNlcyByZWdpc3Rlcl9pb21tdSgpIHdpdGggYnVzX3NldF9pb21tdSgpIGFjY29y
ZGluZyB0byB0aGUNCnN1Z2dlc3Rpb24gb2YgSm9lcmcgUm9lZGVsLg0KDQpDYzogSm9lcmcgUm9l
ZGVsIDxqb2VyZy5yb2VkZWxAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEt5b25nSG8gQ2hvIDxw
dWxsaXAuY2hvQHNhbXN1bmcuY29tPg0KLS0tDQogZHJpdmVycy9pb21tdS9leHlub3NfaW9tbXUu
YyB8ICAgIDIgKy0NCiAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvZXh5bm9zX2lvbW11LmMgYi9kcml2
ZXJzL2lvbW11L2V4eW5vc19pb21tdS5jDQppbmRleCBmZTViNWQ4Li4xNDhlMjM4IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9pb21tdS9leHlub3NfaW9tbXUuYw0KKysrIGIvZHJpdmVycy9pb21tdS9l
eHlub3NfaW9tbXUuYw0KQEAgLTg1Miw3ICs4NTIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBleHlu
b3NfaW9tbXVfaW5pdCh2b2lkKQ0KIAlpZiAoIWwydGFibGVfY2FjaGVwKQ0KIAkJcmV0dXJuIC1F
Tk9NRU07DQogDQotCXJlZ2lzdGVyX2lvbW11KCZleHlub3NfaW9tbXVfb3BzKTsNCisJYnVzX3Nl
dF9pb21tdSgmcGxhdGZvcm1fYnVzX3R5cGUsICZvbWFwX2lvbW11X29wcyk7DQogDQogCXJldHVy
biAwOw0KIH0NCi0tIA0KMS43LjENCg0K
