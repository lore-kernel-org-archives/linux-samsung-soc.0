Return-Path: <SRS0=2oIG=43=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191A7C10F25
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Mar 2020 02:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFF052464B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Mar 2020 02:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G4KZOYec"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgCJChg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Mar 2020 22:37:36 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:27354 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726521AbgCJChg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 22:37:36 -0400
X-UUID: f7731083a6bb467bbae773dcdd098d58-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=hLjlW65hQN7C6KTZ0z09rF1NUbZS3I5Rt9C9E6AC1dM=;
        b=G4KZOYec4ghBtwfsRhvrArSWXtZAwYe4JjBpGHXb9+7rCrAdo9glAWfc+rs29ZiVD/VFgnBHP5+ZyGA5D5YH/qzIflNEDnMJiZqom53+YHdzLinubIkWdcK9EtM/HqZHjASUg19eGgFkpWhXt+M8gLjkwl1HyaMN2aF1avXJQpA=;
X-UUID: f7731083a6bb467bbae773dcdd098d58-20200310
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2051755948; Tue, 10 Mar 2020 10:37:26 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 10:36:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Mar 2020 10:36:31 +0800
Message-ID: <1583807844.30143.0.camel@mtksdaap41>
Subject: Re: [PATCH 10/22] drm/mediatek: Use simple encoder
From:   CK Hu <ck.hu@mediatek.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
CC:     <airlied@linux.ie>, <daniel@ffwll.ch>, <sam@ravnborg.org>,
        <abrodkin@synopsys.com>, <bbrezillon@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <jingoohan1@gmail.com>, <inki.dae@samsung.com>,
        <jy0922.shim@samsung.com>, <sw0312.kim@samsung.com>,
        <kyungmin.park@samsung.com>, <kgene@kernel.org>, <krzk@kernel.org>,
        <stefan@agner.ch>, <alison.wang@nxp.com>,
        <patrik.r.jakobsson@gmail.com>, <xinliang.liu@linaro.org>,
        <zourongrong@gmail.com>, <john.stultz@linaro.org>,
        <kong.kongxinwei@hisilicon.com>, <puck.chen@hisilicon.com>,
        <linux@armlinux.org.uk>, <p.zabel@pengutronix.de>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <paul@crapouillou.net>, <matthias.bgg@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham+renesas@ideasonboard.com>, <hjc@rock-chips.com>,
        <heiko@sntech.de>, <wens@csie.org>, <jernej.skrabec@siol.net>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <jsarha@ti.com>, <tomi.valkeinen@ti.com>, <eric@anholt.net>,
        <kraxel@redhat.com>, <rodrigosiqueiramelo@gmail.com>,
        <hamohammed.sa@gmail.com>, <sebastian.reichel@collabora.com>,
        <dri-devel@lists.freedesktop.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>
Date:   Tue, 10 Mar 2020 10:37:24 +0800
In-Reply-To: <20200305155950.2705-11-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
         <20200305155950.2705-11-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SGksIFRob21hczoNCg0KT24gVGh1LCAyMDIwLTAzLTA1IGF0IDE2OjU5ICswMTAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4gVGhlIG1lZGlhdGFrIGRyaXZlciB1c2VzIGVtcHR5IGltcGxl
bWVudGF0aW9ucyBmb3IgaXRzIGVuY29kZXJzLiBSZXBsYWNlDQo+IHRoZSBjb2RlIHdpdGggdGhl
IGdlbmVyaWMgc2ltcGxlIGVuY29kZXIuDQo+IA0KDQpBY2tlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
aS5jIHwgMTQgKysrLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMgfCAxNCArKystLS0tLS0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5j
DQo+IGluZGV4IDE0ZmJlMWMwOWNlOS4uOWM5MGM1OGU1YWNkIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMNCj4gQEAgLTIwLDYgKzIwLDcgQEANCj4gICNpbmNsdWRlIDxkcm0v
ZHJtX2JyaWRnZS5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPg0KPiAgI2luY2x1ZGUg
PGRybS9kcm1fb2YuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+
DQo+ICANCj4gICNpbmNsdWRlICJtdGtfZHBpX3JlZ3MuaCINCj4gICNpbmNsdWRlICJtdGtfZHJt
X2RkcF9jb21wLmgiDQo+IEBAIC01MDksMTUgKzUxMCw2IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9z
ZXRfZGlzcGxheV9tb2RlKHN0cnVjdCBtdGtfZHBpICpkcGksDQo+ICAJcmV0dXJuIDA7DQo+ICB9
DQo+ICANCj4gLXN0YXRpYyB2b2lkIG10a19kcGlfZW5jb2Rlcl9kZXN0cm95KHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlcikNCj4gLXsNCj4gLQlkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIp
Ow0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIG10
a19kcGlfZW5jb2Rlcl9mdW5jcyA9IHsNCj4gLQkuZGVzdHJveSA9IG10a19kcGlfZW5jb2Rlcl9k
ZXN0cm95LA0KPiAtfTsNCj4gLQ0KPiAgc3RhdGljIGJvb2wgbXRrX2RwaV9lbmNvZGVyX21vZGVf
Zml4dXAoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLA0KPiAgCQkJCSAgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwNCj4gIAkJCQkgICAgICAgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUpDQo+IEBAIC01OTYsOCArNTg4LDggQEAgc3RhdGlj
IGludCBtdGtfZHBpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0
ZXIsIHZvaWQgKmRhdGEpDQo+ICAJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiAgDQo+IC0JcmV0ID0g
ZHJtX2VuY29kZXJfaW5pdChkcm1fZGV2LCAmZHBpLT5lbmNvZGVyLCAmbXRrX2RwaV9lbmNvZGVy
X2Z1bmNzLA0KPiAtCQkJICAgICAgIERSTV9NT0RFX0VOQ09ERVJfVE1EUywgTlVMTCk7DQo+ICsJ
cmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoZHJtX2RldiwgJmRwaS0+ZW5jb2RlciwNCj4g
KwkJCQkgICAgICBEUk1fTU9ERV9FTkNPREVSX1RNRFMpOw0KPiAgCWlmIChyZXQpIHsNCj4gIAkJ
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBkZWNvZGVyOiAlZFxuIiwgcmV0KTsN
Cj4gIAkJZ290byBlcnJfdW5yZWdpc3RlcjsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
DQo+IGluZGV4IDBlZGU2OTgzMGE5ZC4uYTlhMjUwODcxMTJmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAgLTIyLDYgKzIyLDcgQEANCj4gICNpbmNsdWRlIDxkcm0v
ZHJtX3BhbmVsLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiAgI2luY2x1ZGUg
PGRybS9kcm1fcHJvYmVfaGVscGVyLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21z
X2hlbHBlci5oPg0KPiAgDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIg0KPiAgDQo+
IEBAIC03ODcsMTUgKzc4OCw2IEBAIHN0YXRpYyB2b2lkIG10a19vdXRwdXRfZHNpX2Rpc2FibGUo
c3RydWN0IG10a19kc2kgKmRzaSkNCj4gIAlkc2ktPmVuYWJsZWQgPSBmYWxzZTsNCj4gIH0NCj4g
IA0KPiAtc3RhdGljIHZvaWQgbXRrX2RzaV9lbmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRybV9lbmNv
ZGVyICplbmNvZGVyKQ0KPiAtew0KPiAtCWRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rlcik7DQo+
IC19DQo+IC0NCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3MgbXRrX2Rz
aV9lbmNvZGVyX2Z1bmNzID0gew0KPiAtCS5kZXN0cm95ID0gbXRrX2RzaV9lbmNvZGVyX2Rlc3Ry
b3ksDQo+IC19Ow0KPiAtDQo+ICBzdGF0aWMgYm9vbCBtdGtfZHNpX2VuY29kZXJfbW9kZV9maXh1
cChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsDQo+ICAJCQkJICAgICAgIGNvbnN0IHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICptb2RlLA0KPiAgCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSkNCj4gQEAgLTg4OCw4ICs4ODAsOCBAQCBzdGF0aWMgaW50
IG10a19kc2lfY3JlYXRlX2Nvbm5fZW5jKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBt
dGtfZHNpICpkc2kpDQo+ICB7DQo+ICAJaW50IHJldDsNCj4gIA0KPiAtCXJldCA9IGRybV9lbmNv
ZGVyX2luaXQoZHJtLCAmZHNpLT5lbmNvZGVyLCAmbXRrX2RzaV9lbmNvZGVyX2Z1bmNzLA0KPiAt
CQkJICAgICAgIERSTV9NT0RFX0VOQ09ERVJfRFNJLCBOVUxMKTsNCj4gKwlyZXQgPSBkcm1fc2lt
cGxlX2VuY29kZXJfaW5pdChkcm0sICZkc2ktPmVuY29kZXIsDQo+ICsJCQkJICAgICAgRFJNX01P
REVfRU5DT0RFUl9EU0kpOw0KPiAgCWlmIChyZXQpIHsNCj4gIAkJRFJNX0VSUk9SKCJGYWlsZWQg
dG8gZW5jb2RlciBpbml0IHRvIGRybVxuIik7DQo+ICAJCXJldHVybiByZXQ7DQoNCg==

