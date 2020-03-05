Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07D6C3F2D1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 06:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDAC2208CD
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 06:47:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EcM/tqdj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="CczQIIOT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgCEGro (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 01:47:44 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:34754 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbgCEGro (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 01:47:44 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4B510C0F68;
        Thu,  5 Mar 2020 06:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583390863; bh=ZXJ8OuXv+4Ip4ICNldnB6y+QvbvPakKp3cP0QjhtcfI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=EcM/tqdj0dZ0fSE4jLz7tZJStea7zWqqtRNMaB9K7wlUd3zsXv7buXCk9gt7tAQ44
         Ps7KSKyL30VKzWVEGQuXJu4/XC6zFEFwYdRJtOSa+xDUGNRhqqTtVvJBXspa2hw2Kx
         MFJoUI9591DCZOpm1CM8BKtYzljEF2aGQd4jderJw/Z1139+CxqHQj4+ChQB4zZR8l
         yWQFJx48AfTTKe7yJ9Woj7tCkZ1INIq9gz5MZrFlX6ycxN1XbUOKF6LJR5znGgL5Fa
         EkKPTrfX+A1Nkk6PeVA7giFCxHxbYqFQsL/hB0OCrVaO7o4vR/6bOaLzJUWAFO4a5R
         Mz2Y++mYNcTwA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 93A61A007F;
        Thu,  5 Mar 2020 06:47:35 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 4 Mar 2020 22:47:19 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 4 Mar 2020 22:47:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtXWqkS1G/j6Ieo+6vgeJFDyvtcGdcFBoFu0IDZymlpoZdc5mC2HD7emV72DO+IMVggD8Z2P4oLTvCb5aHRHEDhdmhWM2gPcLmxbrmx12U2MuBVKaETZbmNhHJ7ZuWPJl7AOV5eaXjSRJNcF9RO8Qli0q5/ERFaI6DVjCznV8l93YuNl/fdOJNnYIdqkmf10h8fragZqTtsBvnP3VaiD1zqYOLAiXm0eJy2qm9othLqUiNX89JmRO3ugiwrzuOEGsSFj5nDbdZswreYj+GBWTtDWmF0iv0QBBetUTKI5hXek6hleCG3rZlhHEvmSy4enICMGzHD/MbGiCQ6IbV3p6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXJ8OuXv+4Ip4ICNldnB6y+QvbvPakKp3cP0QjhtcfI=;
 b=l9LIzl2UDZWYtY+oaX9IICjL1MgSzVSP+s0biktzmG3bhLrkg5LC3hZsLaFAzyxWI7I+kwtaGhxv/6W0GC3uQLFce2QR6PLFa/auTTMtQLR1YEZKXuajxJyEUs/Vhly6v37Geehb5AQPLepDbQPlI3uamuF+YhXciCZ4ubxOrg0pqLdjZAjmQz29zbIlj0tyJAt4tsPL6q3B87AgZxqz9osPFewp0eKuvnwOVJXBEHoEytY/SAhbZmDHJwiF9zhQI+hTrGUL1tepPpeiGOihttm01cBNGPZ1Orgc318dsMKyia9/dUWx7JX/0gkU9eClDAge2yAGP224tYC1JCCIZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXJ8OuXv+4Ip4ICNldnB6y+QvbvPakKp3cP0QjhtcfI=;
 b=CczQIIOToOCGOp07EldXA/XUlKBVnsx55NMWsi78sjT6Dof5qgjG8Q32HfL4ONqryxIddTNmb6+kKnqpsgOkocQWz1Vi1sn6XYQomEH6YEzePBblF8dLWVU/SEd+KADmOMrl6aHX6rvxP0Csfo4dUUqwepE1Lxby5aoN+Xk9XSg=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Thu, 5 Mar
 2020 06:47:17 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::111c:5382:5a76:21cb]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::111c:5382:5a76:21cb%4]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 06:47:17 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] usb: dwc2: Silence warning about supplies during deferred
 probe
Thread-Topic: [PATCH] usb: dwc2: Silence warning about supplies during
 deferred probe
Thread-Index: AQHV7hk38vEuWZjqfkyI2ELMCpgkJ6g5l54A
Date:   Thu, 5 Mar 2020 06:47:17 +0000
Message-ID: <b47785ca-365e-5d58-6422-8c15f573e593@synopsys.com>
References: <CGME20200228092607eucas1p20faf7fdabdf52586f18e8781e371f04d@eucas1p2.samsung.com>
 <20200228092557.31429-1-m.szyprowski@samsung.com>
In-Reply-To: <20200228092557.31429-1-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87b7957b-e784-48cf-3a0c-08d7c0d10ba5
x-ms-traffictypediagnostic: MN2PR12MB4080:
x-microsoft-antispam-prvs: <MN2PR12MB4080C76562279D2F8368DCF5A7E20@MN2PR12MB4080.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(81156014)(6506007)(8936002)(8676002)(81166006)(4326008)(110136005)(31686004)(54906003)(4744005)(53546011)(2906002)(5660300002)(316002)(478600001)(6512007)(2616005)(36756003)(6486002)(66946007)(26005)(186003)(64756008)(66476007)(66556008)(71200400001)(31696002)(86362001)(66446008)(91956017)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4080;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vYFV4IpfLCW5jAP7lVOBPgaoZT66l6HII42Y34/UHJ/yvpqSRWdYHKXAKPNCm0W4fUJOJ0WlYomORL8h44HFEqEp7jo2sCMAP1QuBgDcjCCCmUHP/J36OmJzhwjjO5vbPwmTmqGIXGRS1eDmDcN2OGBNoCt5K8TNLLXDThVxqZt36zr86/MlJyCbY+3YSUSNy+gqINwSblCnajqtUIKC/kgUZac2NzQH7IQkQV65OojJLU0VjhXtJbycRntK6FTyiLDmKAScVPEB8azyxWaje4qBHsdpTxdBv+TVIoxkjtqT+eBfpOX2TKpetxmbsLmqOIrh53V8y2rhGSy7JFhnjCn6hxwPaukZPf6OldQeqUD7sGwO3Z7GOvK4AqtrY6vyEeTmct1IHCq876pEkwR1fmXp0nJ88wdckACk+j0r4ktOGLteCDS/Vot6gHxrUq+y
x-ms-exchange-antispam-messagedata: zbzle/sS8skQhgsXL0aBN0jwCfmS//CLLoMKt3cKSacrDGfvDzxyvcFgDqS5e0CaQnPYVlxWbsTbx58OPmwnYzTMUdxjXGfEeXYzcxEPPrIlssGil+m9Azop3I22VyoZ41Q3ntNexhlHTt7xeJXYwQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5374C4608ECE94F9DAA6005A9C08BA9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b7957b-e784-48cf-3a0c-08d7c0d10ba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 06:47:17.0259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87IP5KxFhMYgzGH8PJFZnxaV8Nyl/kwO+Q0HP3U75ASCQtUrNS5atW9QNJQxo+Q/rt+euF5++gDB7o0Xfjoz3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
X-OriginatorOrg: synopsys.com
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DQoNCk9uIDIvMjgvMjAyMCAxOjI1IFBNLCBNYXJlayBTenlwcm93c2tpIHdyb3RlOg0KPiBEb24n
dCBjb25mdXNlIHVzZXIgd2l0aCBtZWFuaW5nbGVzcyB3YXJuaW5nIGFib3V0IHRoZSBmYWlsdXJl
IGluIGdldHRpbmcNCj4gc3VwcGxpZXMgaW4gY2FzZSBvZiBkZWZlcnJlZCBwcm9iZS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNv
bT4NCg0KQWNrZWQtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYyB8IDQgKysrLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMgYi9kcml2ZXJzL3VzYi9kd2MyL3Bs
YXRmb3JtLmMNCj4gaW5kZXggM2M2Y2UwOWE2ZGI1Li5lYjExMGQzNjg2MjMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2My
L3BsYXRmb3JtLmMNCj4gQEAgLTI4NSw3ICsyODUsOSBAQCBzdGF0aWMgaW50IGR3YzJfbG93bGV2
ZWxfaHdfaW5pdChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+ICAgCXJldCA9IGRldm1fcmVn
dWxhdG9yX2J1bGtfZ2V0KGhzb3RnLT5kZXYsIEFSUkFZX1NJWkUoaHNvdGctPnN1cHBsaWVzKSwN
Cj4gICAJCQkJICAgICAgaHNvdGctPnN1cHBsaWVzKTsNCj4gICAJaWYgKHJldCkgew0KPiAtCQlk
ZXZfZXJyKGhzb3RnLT5kZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBzdXBwbGllczogJWRcbiIsIHJl
dCk7DQo+ICsJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikNCj4gKwkJCWRldl9lcnIoaHNvdGct
PmRldiwgImZhaWxlZCB0byByZXF1ZXN0IHN1cHBsaWVzOiAlZFxuIiwNCj4gKwkJCQlyZXQpOw0K
PiAgIAkJcmV0dXJuIHJldDsNCj4gICAJfQ0KPiAgIAlyZXR1cm4gMDsNCj4gDQo=
