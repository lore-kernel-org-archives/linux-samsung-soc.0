From: HATIMALI RV <hatim.rv@samsung.com>
Subject: Re: Re: [RESEND PATCH 2/3] ARM: EXYNOS4: Update consistent DMA size to
 8MB
Date: Wed, 21 Sep 2011 07:22:14 +0000 (GMT)
Message-ID: <23185691.178841316589732769.JavaMail.weblogic@epv6ml02>
Reply-To: hatim.rv@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15368 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752379Ab1IUHWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 03:22:19 -0400
Received: from epcpsbge4.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRV005EF34WRE10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 16:22:18 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>, "mchehab@infradead.org" <mchehab@infradead.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, BANAJIT GOSWAMI <banajit.g@samsung.com>

SGVsbG8gTXIuIFBhcmssDQoNCkFzIEkgbWVudGlvbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIgb2Yg
djEgcGF0Y2ggc2V0IChodHRwOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2FybS1rZXJuZWwvbXNn
MTM4MDU0Lmh0bWwpLA0KdGhpcyBpcyBhIHRlbXBvcmFyeSBwYXRjaCB3aGljaCBpcyBqdXN0IGZv
ciB0ZXN0aW5nIEhETUkgb24gU01ES1YzMTAuDQpPbmNlIENNQSBnZXRzIG1lcmdlZCwgd2Ugd2ls
bCBiZSB1c2luZyB0aGF0IHRvIGFsbG9jYXRlIG1lbW9yeS4NCg0KVGhhbmtzIGZvciB5b3VyIHJl
dmlldy4NCg0KUmVnYXJkcywNCkhhdGltIEFsaQ0KDQotLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2Ug
LS0tLS0tLQ0KU2VuZGVyIDogS3l1bmdtaW4gUGFyazxrbXBhcmtAaW5mcmFkZWFkLm9yZz4gDQpE
YXRlICAgOiBTZXAgMjEsIDIwMTEgMTE6NTUgKEdNVCswNTozMCkNClRpdGxlICA6IFJlOiBbUkVT
RU5EIFBBVENIIDIvM10gQVJNOiBFWFlOT1M0OiBVcGRhdGUgY29uc2lzdGVudCBETUEgc2l6ZSB0
byA4TUINCg0KSGksDQoNCkFzIEkga25vdywgIENPTlNJU1RFTlRfRE1BX1NJWkUgaXMgcmVtb3Zl
ZCwgcGxlYXNlIHVzZSB0aGUgdXBkYXRlZCBBUElzLg0KDQpUaGFuayB5b3UsDQpLeXVuZ21pbiBQ
YXJrDQoNCk9uIFdlZCwgU2VwIDIxLCAyMDExIGF0IDI6NDQgUE0sIEhhdGltIEFsaSA8aGF0aW0u
cnZAc2Ftc3VuZy5jb20+IHdyb3RlOg0KPiBDaGFuZ2UgdGhlIGNvbnNpc3RlbnQgRE1BIGFsbG9j
YXRpb24gdG8gOE1CIHRvIHN1cHBvcnQgdGhlDQo+IFRWT1VUIGRyaXZlci4NCj4NCj4gTk9URTog
T25jZSBDTUEgc3VwcG9ydCBpcyBtZXJnZWQgaW50byBtYWlubGluZSwgd2Ugd2lsbCB1c2UgaXQg
Zm9yIG1lbW9yeQ0KPiBhbGxvY2F0aW9uLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBIYXRpbSBBbGkg
PGhhdGltLnJ2QHNhbXN1bmcuY29tPg0KPiAtLS0NCj4goGFyY2gvYXJtL21hY2gtZXh5bm9zNC9p
bmNsdWRlL21hY2gvbWVtb3J5LmggfCCgIKAyICsrDQo+IKAxIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21h
Y2gtZXh5bm9zNC9pbmNsdWRlL21hY2gvbWVtb3J5LmggYi9hcmNoL2FybS9tYWNoLWV4eW5vczQv
aW5jbHVkZS9tYWNoL21lbW9yeS5oDQo+IGluZGV4IDM3NGVmMmMuLjc1NDk3NDIgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvYXJtL21hY2gtZXh5bm9zNC9pbmNsdWRlL21hY2gvbWVtb3J5LmgNCj4gKysr
IGIvYXJjaC9hcm0vbWFjaC1leHlub3M0L2luY2x1ZGUvbWFjaC9tZW1vcnkuaA0KPiBAQCAtMTUs
NiArMTUsOCBAQA0KPg0KPiCgI2RlZmluZSBQTEFUX1BIWVNfT0ZGU0VUIKAgoCCgIKAgoCCgIKAg
VUwoMHg0MDAwMDAwMCkNCj4NCj4gKyNkZWZpbmUgQ09OU0lTVEVOVF9ETUFfU0laRSCgIKAgoCCg
IKAgoFNaXzhNDQo+ICsNCj4goC8qIE1heGltdW0gb2YgMjU2TWlCIGluIG9uZSBiYW5rICovDQo+
IKAjZGVmaW5lIE1BWF9QSFlTTUVNX0JJVFMgoCCgIKAgMzINCj4goCNkZWZpbmUgU0VDVElPTl9T
SVpFX0JJVFMgoCCgIKAyOA0KPiAtLQ0KPiAxLjcuMi4zDQo+DQo+IC0tDQo+IFRvIHVuc3Vic2Ny
aWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1zYW1z
dW5nLXNvYyIgaW4NCj4gdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtl
cm5lbC5vcmcNCj4gTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCCgaHR0cDovL3ZnZXIua2VybmVsLm9y
Zy9tYWpvcmRvbW8taW5mby5odG1sDQo+DQo=
