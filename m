From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 0/3] Support Samsung S5P OHCI device and driver
Date: Tue, 15 Nov 2011 06:49:58 +0000 (GMT)
Message-ID: <1473398.119441321339796993.JavaMail.weblogic@epml28>
Reply-To: jg1.han@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62605 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753395Ab1KOGuH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 01:50:07 -0500
Received: from epcpsbge1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUO00483WB4NL20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 15:49:58 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@suse.de, stern@rowland.harvard.edu, kgene.kim@samsung.com
Cc: yulgon.kim@samsung.com, jy0922.shim@samsung.com, jg1.han@samsung.com

SGVsbG8uDQoNClRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgVVNCIE9IQ0kgZGV2aWNlIGFuZCBpbml0
aWFsIGRyaXZlciBmb3IgU2Ftc3VuZw0KUzVQIFNvQ3MgYW5kIGlzIGJhc2VkIGZyb20gTGludXgg
My4yLXJjMS4gSSBoYXZlIHRlc3RlZCBvbiBTTURLVjMxMCBib2FyZA0KdXNpbmcgRVhZTk9TNC4N
Cg0KVGhhbmtzLg0KDQpKaW5nb28gSGFuICg0KToNCiAgICAgICBBUk06IFNBTVNVTkc6IEFkZCBV
U0IgT0hDSSBkZXZpY2UNCiAgICAgICBBUk06IEVYWU5PUzogQWRkIFVTQiBPSENJIHN1cHBvcnQg
dG8gU01ES1YzMTAgYm9hcmQNCiAgICAgICBVU0I6IEFkZCBTNVAgT0hDSSBkaXZlcg0KDQogIGFy
Y2gvYXJtL21hY2gtZXh5bm9zL0tjb25maWcgICAgICAgICB8ICAgIDEgKw0KICBhcmNoL2FybS9t
YWNoLWV4eW5vcy9tYWNoLXNtZGt2MzEwLmMgfCAgIDEzICsrKysrKysrKysrKysNCiAgYXJjaC9h
cm0vbWFjaC1leHlub3MvaW5jbHVkZS9tYWNoL21hcC5oICAgfCAgICAyICsNCiAgYXJjaC9hcm0v
cGxhdC1zNXAvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgICA1ICsrKysNCiAgYXJjaC9hcm0v
cGxhdC1zYW1zdW5nL2RldnMuYyAgICAgICAgICAgICAgfCAgIDM0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQogIGFyY2gvYXJtL3BsYXQtc2Ftc3VuZy9pbmNsdWRlL3BsYXQvZGV2cy5o
IHwgICAgMSArDQogIGFyY2gvYXJtL3BsYXQtc2Ftc3VuZy9pbmNsdWRlL3BsYXQvb2hjaS5oIHwg
ICAyMSArKysrKysrKysrKysrKysrKw0KICBkcml2ZXJzL3VzYi9LY29uZmlnICAgICAgICAgfCAg
ICAxICsNCiAgZHJpdmVycy91c2IvaG9zdC9LY29uZmlnICAgIHwgICAgNiArDQogIGRyaXZlcnMv
dXNiL2hvc3Qvb2hjaS1oY2QuYyB8ICAgIDUgKw0KICBkcml2ZXJzL3VzYi9ob3N0L29oY2ktczVw
LmMgfCAgMjczICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiAg
MTEgZmlsZXMgY2hhbmdlZCwgMzYyIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQogIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9wbGF0LXNhbXN1bmcvaW5jbHVkZS9wbGF0L29oY2ku
aA0KICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy91c2IvaG9zdC9vaGNpLXM1cC5jDQoNCg==
