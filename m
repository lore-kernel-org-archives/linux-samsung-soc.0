From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [patch] PM / devfreq: exynos-ppmu: fix load_count calculation
Date: Tue, 18 Aug 2015 00:52:26 +0000 (GMT)
Message-ID: <1584679179.174361439859146206.JavaMail.weblogic@ep2mlwas01a>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37298 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbbHRAw3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Aug 2015 20:52:29 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NT9014RY6FEWA90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Aug 2015 09:52:26 +0900 (KST)
MIME-version: 1.0
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, =?utf-8?Q?=EC=B5=9C=EC=B0=AC=EC=9A=B0?= <cw00.choi@samsung.com>
Cc: =?utf-8?Q?=EB=B0=95=EA=B2=BD=EB=AF=BC?= <kyungmin.park@samsung.com>, =?utf-8?Q?=ED=81=AC=EC=89=AC=EC=8B=9C=ED=86=A0=ED=94=84?= <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, linux-pm@lists.linux-foundation.org

PiAicG1jbnRfaGlnaCAmIDB4ZmYiIGlzIGEgdTMyIHNvIHdlIHNoaWZ0aW5nIGl0IDMyIHNwYWNl
cyBpcyB6ZXJvLiAgR0NDDQo+IGNhdGNoZXMgdGhpcyBidWc6DQo+IA0KPiBkcml2ZXJzL2RldmZy
ZXEvZXZlbnQvZXh5bm9zLXBwbXUuYzogSW4gZnVuY3Rpb24g4oCYZXh5bm9zX3BwbXVfdjJfZ2V0
X2V2ZW504oCZOg0KPiBkcml2ZXJzL2RldmZyZXEvZXZlbnQvZXh5bm9zLXBwbXUuYzozMjI6Mzog
d2FybmluZzogbGVmdCBzaGlmdCBjb3VudCA+PSB3aWR0aCBvZiB0eXBlDQo+ICAgIGxvYWRfY291
bnQgPSAodTY0KSgocG1jbnRfaGlnaCAmIDB4ZmYpIDw8IDMyKSArICh1NjQpcG1jbnRfbG93Ow0K
PiANCj4gRml4ZXM6IDNkODdiMDIyODFhMiAoJ1BNIC8gZGV2ZnJlcTogZXh5bm9zLXBwbXU6IEFk
ZCB0aGUgc3VwcG9ydCBvZiBQUE1VdjIgZm9yIEV4eW5vczU0MzMnKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQoNClRoaXMgcGF0Y2gg
aGFzIGJlZW4gd2FpdGluZyBpbiBkZXZmcmVxIHRyZWUgZm9yIHNvbWUgZGF5cy4NCkl0IHdpbGwg
YmUgc2VudCB3aXRoIHRoZSBuZXh0IHB1bGwgcmVxdWVzdC4NCg0KaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvbXp4L2RldmZyZXEuZ2l0L2NvbW1pdC8/aD1mb3It
cmFmYWVsJmlkPThlMjlhYmViYmRiMzJhMzBkODdhNTgyMDFhYzliNzdmOGE4N2ZkODQNCg0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZGV2ZnJlcS9ldmVudC9leHlub3MtcHBtdS5jIGIvZHJp
dmVycy9kZXZmcmVxL2V2ZW50L2V4eW5vcy1wcG11LmMNCj4gaW5kZXggZjk5MDFmNS4uZGFmMmNk
YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kZXZmcmVxL2V2ZW50L2V4eW5vcy1wcG11LmMNCj4g
KysrIGIvZHJpdmVycy9kZXZmcmVxL2V2ZW50L2V4eW5vcy1wcG11LmMNCj4gQEAgLTMxOSw3ICsz
MTksNyBAQCBzdGF0aWMgaW50IGV4eW5vc19wcG11X3YyX2dldF9ldmVudChzdHJ1Y3QgZGV2ZnJl
cV9ldmVudF9kZXYgKmVkZXYsDQo+ICAJY2FzZSBQUE1VX1BNTkNOVDM6DQo+ICAJCXBtY250X2hp
Z2ggPSBfX3Jhd19yZWFkbChpbmZvLT5wcG11LmJhc2UgKyBQUE1VX1YyX1BNQ05UM19ISUdIKTsN
Cj4gIAkJcG1jbnRfbG93ID0gX19yYXdfcmVhZGwoaW5mby0+cHBtdS5iYXNlICsgUFBNVV9WMl9Q
TUNOVDNfTE9XKTsNCj4gLQkJbG9hZF9jb3VudCA9ICh1NjQpKChwbWNudF9oaWdoICYgMHhmZikg
PDwgMzIpICsgKHU2NClwbWNudF9sb3c7DQo+ICsJCWxvYWRfY291bnQgPSAoKCh1NjQpcG1jbnRf
aGlnaCAmIDB4ZmYpIDw8IDMyKSArIHBtY250X2xvdzsNCj4gIAkJYnJlYWs7DQo+ICAJfQ0KPiAg
CWVkYXRhLT5sb2FkX2NvdW50ID0gbG9hZF9jb3VudDsNCj4gDQo=
