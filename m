From: NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>
Subject: Re: Re: [PATCH 4/6] ARM: S3C64XX: Adds Touch Screen Driver Support for
 S3C6410
Date: Fri, 07 May 2010 11:29:31 +0000 (GMT)
Message-ID: <1054428.61651273231771063.JavaMail.weblogic@epml16>
Reply-To: ch.naveen@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41955 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604Ab0EGL3d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 May 2010 07:29:33 -0400
Received: from ep_ms13_bk (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L21008LIRX7W8@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 May 2010 20:29:31 +0900 (KST)
Received: from ep_spt02 (ms13.samsung.com [203.254.225.109])
 by ms13.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2100I8WRX7KH@ms13.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 May 2010 20:29:31 +0900 (KST)
Content-return: prohibited
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: "ben-linux@fluff.org" <ben-linux@fluff.org>, NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>

SGksIE1hdXJ1cw0KDQotLS0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0tLQ0KU2VuZGVyIDog
TWF1cnVzIEN1ZWxlbmFlcmU8bWN1ZWxlbmFlcmVAZ21haWwuY29tPiANCkRhdGUgICA6IE1heSAw
NywgMjAxMCAxNDo1NSAoR01UKzA1OjAwKQ0KVGl0bGUgIDogUmU6IFtQQVRDSCA0LzZdIEFSTTog
UzNDNjRYWDogQWRkcyBUb3VjaCBTY3JlZW4gRHJpdmVyIFN1cHBvcnQgZm9yDQogUzNDNjQxMA0K
DQpIaSBOYXZlZW4sDQoNCiJLdWtqaW4gS2ltIiA8a2dlbmUua2ltQHNhbXN1bmcuY29tPiB3cm90
ZToNCg0KPkZyb206IE5hdmVlbiBLcmlzaG5hIDxjaC5uYXZlZW5Ac2Ftc3VuZy5jb20+DQo+DQo+
U2lnbmVkLW9mZi1ieTogTmF2ZWVuIEtyaXNobmEgQ2ggPGNoLm5hdmVlbkBzYW1zdW5nLmNvbT4N
Cj5TaWduZWQtb2ZmLWJ5OiBLdWtqaW4gS2ltIDxrZ2VuZS5raW1Ac2Ftc3VuZy5jb20+DQo+LS0t
DQo+IGFyY2gvYXJtL21hY2gtczNjNjR4eC9LY29uZmlnICAgICAgICAgIHwgICAgMSArDQo+IGFy
Y2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtZGs2NDEwLmMgIHwgICAxMiArKysrKysrDQo+IGFy
Y2gvYXJtL21hY2gtczNjNjR4eC9zM2M2NDEwLmMgICAgICAgIHwgICAgMSArDQo+IGFyY2gvYXJt
L3BsYXQtc2Ftc3VuZy9LY29uZmlnICAgICAgICAgIHwgICAgNSArKysNCj4gYXJjaC9hcm0vcGxh
dC1zYW1zdW5nL01ha2VmaWxlICAgICAgICAgfCAgICAxICsNCj4gYXJjaC9hcm0vcGxhdC1zYW1z
dW5nL2Rldi10cy5jICAgICAgICAgfCAgIDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+IGRyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vS2NvbmZpZyAgICAgIHwgICAgMyArLQ0K
PiBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3MzYzI0MTBfdHMuYyB8ICAgMTkgKysrKysrKysr
LS0NCj4gOCBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
PiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vcGxhdC1zYW1zdW5nL2Rldi10cy5jDQo+DQoN
CkknbSBzdXJlIHlvdSd2ZSBzZWVuIG15IHBhdGNoIHdoaWNoIGRvZXMgcHJldHR5IG11Y2ggdGhl
IHNhbWUgd3J0IGFkanVzdGluZyBzM2MyNDEwX3RzLmMuDQpUaG91Z2ggdGhhdCBvbmUgaGFzIGFs
cmVhZHkgYmVlbiBhY2tlZCBieSBCZW4gc28gSSdtIHVuc3VyZSB3aGF0IHNob3VsZCBoYXBwZW46
IHlvdSBhZGp1c3RpbmcgeW91ciBwYXRjaHNldCBvciBtZSBkcm9wcGluZyBtaW5lIChvYnZpb3Vz
bHkgSSBwcmVmZXIgdGhlIGZvcm1lciA6KSApLg0KTXkgcGF0Y2ggd2FzIHVuZGVyIHJldmlldyBm
b3Igb3ZlciBhIHdlZWssIGl0cyBhIGNvaW5jaWRlbmNlIHRoYXQgaSBzYXcgeW91ciBwYXRjaCBh
bmQgbXkgcGF0Y2ggd2FzIHBvc3RlZCBvbiBtYWlubGluZS4gDQpJJ2lsbCByZXdvcmsgbXkgcGF0
Y2hlcyBhbnl3YXksIEknaWxsIHdhaXQgZm9yIGEgZGF5IG9uIEJlbiBEb29rJ3MgQ29tbWVudHMg
b24gbXkgcGF0Y2ggc2V0Lg0KDQpQLlMuOiBJJ2QgcmVjb21tZW5kIHNwbGl0dGluZyB0aGlzIHBh
dGNoIGFuZCBzZW5kaW5nIHRoZSBkcml2ZXJzL2lucHV0IHBhcnQgdG8gdGhlIGxpbnV4LWlucHV0
IG1haWxpbmcgbGlzdC4NCkknaWxsIHRha2UgdGhpcyBvcHRpb24uDQoNCi0tDQpNYXVydXMgQ3Vl
bGVuYWVyZQ0KDQoNClRoYW5rcyAmIEJlc3QgUmVnYXJkcywNCk5hdmVlbiBLcmlzaG5hIENoDQpT
RSBAIFNMRyBEaXYsIERTIExBQnMsIFNhbXN1bmcsIEluZGlhLg0K
