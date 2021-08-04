Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51435C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 17:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3504561004
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 17:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239866AbhHDRTr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Aug 2021 13:19:47 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:35058 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239832AbhHDRTp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 13:19:45 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1F15BC0BDA;
        Wed,  4 Aug 2021 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628097572; bh=gjJyLyLbZcfq5akZpCHfclPNY/F5c8jElXtRO0eh3bk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KCcJ4Fgmeeqcl0hdD4mOi8ksvjUDDqajtIG5mKkQ7hbXC+XWHIMKEbPf65iY+wAVx
         lm2lILkR6LLmV1G9NPxGxnXGfbAU7viktUzVwBzm+qmz/Zw0Ll3tMz8rvY3szdBYJL
         cssui7UX2AgB785waE6MMbBDGxPNyyh0RAIIXSIZSWJhrx0Y7VK+mVDMJ4Ue1bzwZe
         OAsw/2scqbcTV6XExdsLIFzbBhTF/mSZJitJ/n0yUY6f7seaJfsg0HnrP/017ieN6E
         MKLk9W7mgIg9ilT4pbMmsX7j6/8/uk8Y+UeIVIkjldFJgUh1jdFAKM6msNI6YgxWoR
         XLWM0EaqxCrKQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C22FDA0068;
        Wed,  4 Aug 2021 17:19:31 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0204580026;
        Wed,  4 Aug 2021 17:19:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="MO16qVP3";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SI233+LJyIPRZNFkz7TxDMDuV/sookAnuf2C7nyPbFcXZEBWkAUAr/4AeaqxvZ0gY2wlxtkLa6YrAe92GJZPyZ5gFmIYM78yPHmGuu2N4E0humCQXPM+FyplFbwHWGbnqLxrXR1ChNBCXtFFRb1szvuNYyIVmhmPr+1MGHhLWaUtWuZi9k2v/Fpy9UMr3jFYZ8QSq7vvA9BHNa93KsE+WlBJLslfgVcEHyZC7UXlJYGFRn7Lx6YaHIH2h6Y4Ah7+K2l9uKvaIIM4gvwJou8OU2KiGJv80ZGMM2Kg4H7eviP9yKda48pzHdCk9rQA302XefXEEJR5Oq6mM766oITYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjJyLyLbZcfq5akZpCHfclPNY/F5c8jElXtRO0eh3bk=;
 b=i4BT0y//9xgsfekwzMLzaZGMSZGP7KMHcC1qFQbyOvjZlMs1iQPigW4OQ27096hlggp0pvThOCFcffH6wWvAnC9idVNLn3G7TF4cFlh7dJvLNbwgUNqsGsooikCp+NZaKBk8zloAAPpqCNpZYvbJyC4xTdc8Za9zczOu27fGpi4NRoqlU5oYNLx5cZejq4pawv3/s2majk1wfS/Qq8anck5KOCSbZLgYiJKScPkVOHEhlndUtrY+Q38dqDEhkmZXPNqTm9c2riMAwev+sN9q9BEIS64EeV57OgURnobKdBweyeBJ2jLp4uB6E8Gy6oWwQ6+xdr6TmiJDtVoZlCKUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjJyLyLbZcfq5akZpCHfclPNY/F5c8jElXtRO0eh3bk=;
 b=MO16qVP39R2TOuWuiDMphcN762df6ClPF3aFzVcqhdvGM0CcgIc5whqdQ++Byc+trk7vx2/mc8rEdY70ugokt35UT78t7jqrbiTlc0+7TcoJgrjbZj+w20Wh0034vWC+8jqJRX5wJK2/MCm1P7sQae9Mqi+Oz1qFPWT3tVS+l4A=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5181.namprd12.prod.outlook.com (2603:10b6:5:394::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 17:19:29 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 17:19:29 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
Thread-Topic: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
Thread-Index: AQHXef+pNOqQl/JGqEq/TztwoCjZgatFsN2AgBvyMQCAAAgHAIABqOeAgABhxwA=
Date:   Wed, 4 Aug 2021 17:19:29 +0000
Message-ID: <ac24da82-c132-a440-77ec-d5086e9ea29b@synopsys.com>
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
 <20210716050127.4406-1-m.szyprowski@samsung.com>
 <a7efdf13-48bb-db21-5755-ebbbe2614f78@synopsys.com>
 <0d8de3e0-341b-f751-909d-22aa16e91717@samsung.com>
 <19ddcd51-1f1c-52a8-8eaf-dabf7425d395@synopsys.com>
 <26099de1-826f-42bf-0de7-759a47faf4a0@samsung.com>
In-Reply-To: <26099de1-826f-42bf-0de7-759a47faf4a0@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38f3da7e-8e9b-449f-9549-08d9576c04c7
x-ms-traffictypediagnostic: DM4PR12MB5181:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5181C2CEAD1CDEC8049AB26CA7F19@DM4PR12MB5181.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M20Za5Vg3IRW515FIrTXMV0KrAE7YCT6a1aWDWW++Wi847xyynx9TTAiwTc0OuR58Bg3C7VczZ6RSAGmGRyJTJUw1Rq/AnFdTjGlpmVKw6OiGI/CnDI2xjAcoyhpKfEKHlBdc6A/kkAM635irgEQALqE6CWXHve42H0shNI8E2xmdXPSyAdjgtDLsfVutVTg+2NWoRdCMx2QQzXyO9rbIOieF0MH42xYtuk8xh6FgZfnmqR8jnommS9J5JLIoE5J4XAQjUtR68Jiqrt68BkxY3cUc5FhTGEMuOBmubFpeXsJEJrYgJtXBZmT/wNvI+6amU9juoicoTjrR4P7TF8pLDGozEB1EW6CTpvQOEZymAWZfB7kMsFaYxVSBHNrRT4T/V/Poe2irMAvjVsG/ImJ1jyz+DAyDO12DmDm/oBxJETRzBFuarCtG9EJZgfURgLyAR49Ju5Yg0a0hsxuq7zwnmcUU9inlSOH+UNvvJvKvqbmAXSC0knS7IET1jGZEFF/aSsZ05LDr4yMjBnOAfKDlEHiZ0pIjV6OElMUKawGARYtpOIjL0XsIl6U/KslZ3n8XMnN/s1NQ49qjbJRMoCUweWIZ6XnXhL/GwF5lKbWsRUWpt8uVMXecBQr6E2TBqM54FMbcoWiThJ7DdRGIdUxpWBh9U7iXbTv7duDVs+DTAXstg1Ef4K9v5Kw2c+mhaA8B3Bjz5cMHTESbhaqt5aOp4W/57C/I7RY21xVoUy/1CNI7zV8CYvBv1k6v06z3Vv8sYhC3mbHu2bu3b1/Hw+cJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(39860400002)(366004)(396003)(346002)(136003)(376002)(86362001)(76116006)(53546011)(6512007)(478600001)(2906002)(36756003)(186003)(38070700005)(31696002)(122000001)(5660300002)(316002)(66446008)(110136005)(54906003)(2616005)(66946007)(66556008)(66476007)(31686004)(64756008)(38100700002)(8936002)(4326008)(8676002)(6486002)(71200400001)(6506007)(26005)(91956017)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGp0UlpFdzV1dXpwVWJ6RC9zTHBORFIrOE03clROU3o3alZXRHQvMVhPNmQ0?=
 =?utf-8?B?OGFncXIvUUtZdDl0NUJ4VGpDTnovMHNyMU5TTWcxa2JoSVMyMnBIUTE5MWZz?=
 =?utf-8?B?K3NUbTIxUE9USGJOM1Q2UnZ0ZGg4QTIwWlRQa0lub2ludVlCbkNxeE40cmpI?=
 =?utf-8?B?UUQ4NktIcjNOblE0bWM2YTlpWXdDNnQyd1g3blJuaW1HYWRHcjhyTjFSdVhH?=
 =?utf-8?B?WnNOOG1LQUJMMlljU0VxazN5T2VZZ1pXR1owTzF3Z1gvMXVZWnl4eU1naVdI?=
 =?utf-8?B?U0s0NWFHdXBEL0lFSnFhLzRlQUN1UXRtMFhEVlgxYmRmSVJ3YVRFbnVFZTlE?=
 =?utf-8?B?dUlwaUQ3Mm5yME1xbW9HL3A5c2Q4TW5JdDJPbEVXNDlRbTFpaHJpN3dTbEtt?=
 =?utf-8?B?TmdjeXhpRlkvQ3piYWJWNTc3VytFUitJTFdyU2N1NXludWpkMml1bWF2ajBi?=
 =?utf-8?B?ZWJwaDFQaDBYM1hsZGVKVURRU2M1QzluK3kyV3ZSM2ZpSDdvNWk1ZXRTWkxZ?=
 =?utf-8?B?dUI1dzc5UmVFcXVxUk84aVdqdmxockFwYXo0UzF6SC9qSldwMVRnUzl4OElH?=
 =?utf-8?B?VWZISG1FVmpFeXdWb0MzSjhMYmQ2ZzZHSWtTWXEzS1hBSTZ6OEVYa0ZZZjV4?=
 =?utf-8?B?QnRDTUxVdEdIQmtZWDJlekZIK1JFTXN5TnFlZjA1YUlNRy9UOXc2ZERnL0JE?=
 =?utf-8?B?TDlkeGFnZGxzczI4SkZlck9QUVVZM1ZRdXVGWnFGZDFiTitaTTVtN09OZjM5?=
 =?utf-8?B?SmltZXQxSEYyOVFIc2FobWwyai8xSHM0bE9FMDlGOG1MMG1ISDZrSFVrZzdD?=
 =?utf-8?B?eEJCLys1Y2U5WWNwTzBRUlp0OHFkMFQ5OUhYYU82REJncDJ1OHRRdHEycHBk?=
 =?utf-8?B?OUhGUmwxSk02SGNDc0tMM29aYkt0VG1ManA1RXR1ZExqeUd5LzBvU0ZQVFox?=
 =?utf-8?B?L25rQXhzcTFKMzRDb1k3NHl1cnV3RkxWKzBqVE4xNksxdlFDd1hPOXBDZ0ZY?=
 =?utf-8?B?RnJuMFQ0bVVmcEpsck1rZ0xhbmVNTisxbGZ4OG9LRjRHTHM0SEdVWWV3MklW?=
 =?utf-8?B?NDRyc1hOYnlmNWZWbk5BWEVvQjl1dFczajl2eHN2WXdiUW5VY0FXWTVyaFVE?=
 =?utf-8?B?SU1LU2s1RXgvbmdJeVAwb3NyUEhrSGRQY090M1kvT2wzazlQZE8zTWF1c1Rj?=
 =?utf-8?B?Y3ZaN0pYZGc4a01NV0dXbHNZVThUd0ZXbXFkYUNTZmVxVThVakNzNm1HMzNY?=
 =?utf-8?B?SVo2RzAvcGV3c3B1a3ZKNHlXRitLSXBWZmJQOHgrbzFDOHFhUnhacUtnK0Fm?=
 =?utf-8?B?d1JTMlVtNDArL2xrbDF0cG8yTmJKQ3E1bzIweWptSW9Jc1JPV2dCdWw0c2pN?=
 =?utf-8?B?bFBaQUVoOHE3S0JCOVRENCtqKzd1WkFUMk43a0FBc3MvWEU0amI1QXhaYlJn?=
 =?utf-8?B?Wm9UNC9ENEVuMDZSczd5d1NRZzlDUFcrM0NGS1p4b2JlVlBDRzVYK3l2UmUr?=
 =?utf-8?B?aDJKY3ZCRU9wS0R4SElxQUNtTjBNWkl2K1BXVWJPRE5vb1NrQTFaWmVCeXkv?=
 =?utf-8?B?azNxK2FuZlZOU3lvSHd0TDRqdFFXWk92RTI3YlRRRXVBOStiMUltbDJ0eEVq?=
 =?utf-8?B?Rm42bG8wcnRPelJaNGtNbGg5amNZNUF4MWZmNzU2TmtkbUVuclRReUJIckl0?=
 =?utf-8?B?bHlCb294U29RZmtlc3F0TllwT2RoYk5OZ1RxQXQrWEZTZ1dZclFrV1FQSnFO?=
 =?utf-8?Q?nexPa+XvQ4j7dW+hJY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <625903C3CB171147B8F45EF8631398F2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f3da7e-8e9b-449f-9549-08d9576c04c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 17:19:29.6316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: moRqCkfsqdJEGoO1XT/pdJtdnIuQjdoajU+IghqqI1aa3uFB3KGDxOXr05cKPiZjawSkWPr02ofcGS91jGEBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5181
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SGkgTWFyZWssDQoNCk9uIDgvNC8yMDIxIDM6MjkgUE0sIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6
DQo+IEhpDQo+IA0KPiBPbiAwMy4wOC4yMDIxIDEyOjA4LCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90
ZToNCj4+IE9uIDgvMy8yMDIxIDE6NDAgUE0sIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6DQo+Pj4g
T24gMTYuMDcuMjAyMSAxNjo1NCwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+Pj4+IE9uIDcv
MTYvMjAyMSA5OjAxIEFNLCBNYXJlayBTenlwcm93c2tpIHdyb3RlOg0KPj4+Pj4gQ29tbWl0IDAx
MTJiN2NlNjhlYSAoInVzYjogZHdjMjogVXBkYXRlIGR3YzJfaGFuZGxlX3VzYl9zdXNwZW5kX2lu
dHINCj4+Pj4+IGZ1bmN0aW9uLiIpIGNoYW5nZWQgdGhlIHdheSB0aGUgZHJpdmVyIGhhbmRsZXMg
cG93ZXIgZG93biBtb2RlcyBpbiBhIHN1Y2gNCj4+Pj4+IHdheSB0aGF0IGl0IHVzZXMgY2xvY2sg
Z2F0aW5nIHdoZW4gbm8gb3RoZXIgcG93ZXIgZG93biBtb2RlIGlzIGF2YWlsYWJsZS4NCj4+Pj4+
DQo+Pj4+PiBUaGlzIGhvd2V2ZXIgZG9lc24ndCB3b3JrIHdlbGwgb24gdGhlIERXQzIgaW1wbGVt
ZW50YXRpb24gdXNlZCBvbiB0aGUNCj4+Pj4+IFNhbXN1bmcgU29Dcy4gV2hlbiBhIGNsb2NrIGdh
dGluZyBpcyBlbmFibGVkLCBzeXN0ZW0gaGFuZ3MuIEl0IGxvb2tzIHRoYXQNCj4+Pj4+IHRoZSBw
cm9wZXIgY2xvY2sgZ2F0aW5nIHJlcXVpcmVzIHNvbWUgYWRkaXRpb25hbCBnbHVlIGNvZGUgaW4g
dGhlIHNoYXJlZA0KPj4+Pj4gVVNCMiBQSFkgYW5kL29yIFNhbXN1bmcgZ2x1ZSBjb2RlIGZvciB0
aGUgRFdDMi4gVG8gcmVzdG9yZSBkcml2ZXINCj4+Pj4+IG9wZXJhdGlvbiBvbiB0aGUgU2Ftc3Vu
ZyBTb0NzIHNpbXBseSBza2lwIGVuYWJsaW5nIGNsb2NrIGdhdGluZyBtb2RlDQo+Pj4+PiB1bnRp
bCBvbmUgZmluZHMgd2hhdCBpcyByZWFsbHkgbmVlZGVkIHRvIG1ha2UgaXQgd29ya2luZyByZWxp
YWJseS4NCj4+Pj4+DQo+Pj4+PiBGaXhlczogMDExMmI3Y2U2OGVhICgidXNiOiBkd2MyOiBVcGRh
dGUgZHdjMl9oYW5kbGVfdXNiX3N1c3BlbmRfaW50ciBmdW5jdGlvbi4iKQ0KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPg0KPj4+
Pj4gLS0tDQo+Pj4+PiAgICAgICBkcml2ZXJzL3VzYi9kd2MyL2NvcmUuaCAgICAgIHwgNCArKysr
DQo+Pj4+PiAgICAgICBkcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jIHwgMyArKy0NCj4+Pj4+
ICAgICAgIGRyaXZlcnMvdXNiL2R3YzIvaGNkLmMgICAgICAgfCA2ICsrKystLQ0KPj4+Pj4gICAg
ICAgZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYyAgICB8IDEgKw0KPj4+Pj4gICAgICAgNCBmaWxl
cyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzIv
Y29yZS5oDQo+Pj4+PiBpbmRleCBhYjZiODE1ZTAwODkuLjQ4M2RlMmJiZmFhYiAxMDA2NDQNCj4+
Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5oDQo+Pj4+PiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MyL2NvcmUuaA0KPj4+Pj4gQEAgLTM4Myw2ICszODMsOSBAQCBlbnVtIGR3YzJfZXAwX3N0
YXRlIHsNCj4+Pj4+ICAgICAgICAqCQkJMCAtIE5vIChkZWZhdWx0KQ0KPj4+Pj4gICAgICAgICoJ
CQkxIC0gUGFydGlhbCBwb3dlciBkb3duDQo+Pj4+PiAgICAgICAgKgkJCTIgLSBIaWJlcm5hdGlv
bg0KPj4+Pj4gKyAqIEBub19jbG9ja19nYXRpbmc6CVNwZWNpZmllcyB3aGV0aGVyIHRvIGF2b2lk
IGNsb2NrIGdhdGluZyBmZWF0dXJlLg0KPj4+Pj4gKyAqCQkJMCAtIE5vICh1c2UgY2xvY2sgZ2F0
aW5nKQ0KPj4+Pj4gKyAqCQkJMSAtIFllcyAoYXZvaWQgaXQpDQo+Pj4+PiAgICAgICAgKiBAbHBt
OgkJRW5hYmxlIExQTSBzdXBwb3J0Lg0KPj4+Pj4gICAgICAgICoJCQkwIC0gTm8NCj4+Pj4+ICAg
ICAgICAqCQkJMSAtIFllcw0KPj4+Pj4gQEAgLTQ4MCw2ICs0ODMsNyBAQCBzdHJ1Y3QgZHdjMl9j
b3JlX3BhcmFtcyB7DQo+Pj4+PiAgICAgICAjZGVmaW5lIERXQzJfUE9XRVJfRE9XTl9QQVJBTV9O
T05FCQkwDQo+Pj4+PiAgICAgICAjZGVmaW5lIERXQzJfUE9XRVJfRE9XTl9QQVJBTV9QQVJUSUFM
CQkxDQo+Pj4+PiAgICAgICAjZGVmaW5lIERXQzJfUE9XRVJfRE9XTl9QQVJBTV9ISUJFUk5BVElP
TgkyDQo+Pj4+PiArCWJvb2wgbm9fY2xvY2tfZ2F0aW5nOw0KPj4+Pj4gICAgICAgDQo+Pj4+PiAg
ICAgICAJYm9vbCBscG07DQo+Pj4+PiAgICAgICAJYm9vbCBscG1fY2xvY2tfZ2F0aW5nOw0KPj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MyL2NvcmVfaW50ci5jDQo+Pj4+PiBpbmRleCBhNWFiMDM4MDhkYTYuLmE1YzUyYjIzN2U3
MiAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMNCj4+Pj4+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMNCj4+Pj4+IEBAIC01NTYsNyArNTU2
LDggQEAgc3RhdGljIHZvaWQgZHdjMl9oYW5kbGVfdXNiX3N1c3BlbmRfaW50cihzdHJ1Y3QgZHdj
Ml9oc290ZyAqaHNvdGcpDQo+Pj4+PiAgICAgICAJCQkJICogSWYgbmVpdGhlciBoaWJlcm5hdGlv
biBub3IgcGFydGlhbCBwb3dlciBkb3duIGFyZSBzdXBwb3J0ZWQsDQo+Pj4+PiAgICAgICAJCQkJ
ICogY2xvY2sgZ2F0aW5nIGlzIHVzZWQgdG8gc2F2ZSBwb3dlci4NCj4+Pj4+ICAgICAgIAkJCQkg
Ki8NCj4+Pj4+IC0JCQkJZHdjMl9nYWRnZXRfZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3RnKTsNCj4+
Pj4+ICsJCQkJaWYgKCFoc290Zy0+cGFyYW1zLm5vX2Nsb2NrX2dhdGluZykNCj4+Pj4+ICsJCQkJ
CWR3YzJfZ2FkZ2V0X2VudGVyX2Nsb2NrX2dhdGluZyhoc290Zyk7DQo+Pj4+PiAgICAgICAJCQl9
DQo+Pj4+PiAgICAgICANCj4+Pj4+ICAgICAgIAkJCS8qDQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMi9oY2QuYyBiL2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMNCj4+Pj4+IGluZGV4
IDAzNWQ0OTExYTNjMy4uMmE3ODI4OTcxZDA1IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMi9oY2QuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9oY2QuYw0KPj4+Pj4g
QEAgLTMzMzgsNyArMzMzOCw4IEBAIGludCBkd2MyX3BvcnRfc3VzcGVuZChzdHJ1Y3QgZHdjMl9o
c290ZyAqaHNvdGcsIHUxNiB3aW5kZXgpDQo+Pj4+PiAgICAgICAJCSAqIElmIG5vdCBoaWJlcm5h
dGlvbiBub3IgcGFydGlhbCBwb3dlciBkb3duIGFyZSBzdXBwb3J0ZWQsDQo+Pj4+PiAgICAgICAJ
CSAqIGNsb2NrIGdhdGluZyBpcyB1c2VkIHRvIHNhdmUgcG93ZXIuDQo+Pj4+PiAgICAgICAJCSAq
Lw0KPj4+Pj4gLQkJZHdjMl9ob3N0X2VudGVyX2Nsb2NrX2dhdGluZyhoc290Zyk7DQo+Pj4+PiAr
CQlpZiAoIWhzb3RnLT5wYXJhbXMubm9fY2xvY2tfZ2F0aW5nKQ0KPj4+Pj4gKwkJCWR3YzJfaG9z
dF9lbnRlcl9jbG9ja19nYXRpbmcoaHNvdGcpOw0KPj4+Pj4gICAgICAgCQlicmVhazsNCj4+Pj4+
ICAgICAgIAl9DQo+Pj4+PiAgICAgICANCj4+Pj4+IEBAIC00NDAyLDcgKzQ0MDMsOCBAQCBzdGF0
aWMgaW50IF9kd2MyX2hjZF9zdXNwZW5kKHN0cnVjdCB1c2JfaGNkICpoY2QpDQo+Pj4+PiAgICAg
ICAJCSAqIElmIG5vdCBoaWJlcm5hdGlvbiBub3IgcGFydGlhbCBwb3dlciBkb3duIGFyZSBzdXBw
b3J0ZWQsDQo+Pj4+PiAgICAgICAJCSAqIGNsb2NrIGdhdGluZyBpcyB1c2VkIHRvIHNhdmUgcG93
ZXIuDQo+Pj4+PiAgICAgICAJCSAqLw0KPj4+Pj4gLQkJZHdjMl9ob3N0X2VudGVyX2Nsb2NrX2dh
dGluZyhoc290Zyk7DQo+Pj4+PiArCQlpZiAoIWhzb3RnLT5wYXJhbXMubm9fY2xvY2tfZ2F0aW5n
KQ0KPj4+Pj4gKwkJCWR3YzJfaG9zdF9lbnRlcl9jbG9ja19nYXRpbmcoaHNvdGcpOw0KPj4+Pj4g
ICAgICAgDQo+Pj4+PiAgICAgICAJCS8qIEFmdGVyIGVudGVyaW5nIHN1c3BlbmQsIGhhcmR3YXJl
IGlzIG5vdCBhY2Nlc3NpYmxlICovDQo+Pj4+PiAgICAgICAJCWNsZWFyX2JpdChIQ0RfRkxBR19I
V19BQ0NFU1NJQkxFLCAmaGNkLT5mbGFncyk7DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMi9wYXJhbXMuYyBiL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMNCj4+Pj4+IGluZGV4
IDY3YzVlYjE0MDIzMi4uNTllMTE5MzQ1OTk0IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMi9wYXJhbXMuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYw0K
Pj4+Pj4gQEAgLTc2LDYgKzc2LDcgQEAgc3RhdGljIHZvaWQgZHdjMl9zZXRfczNjNjQwMF9wYXJh
bXMoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPj4+Pj4gICAgICAgCXN0cnVjdCBkd2MyX2Nv
cmVfcGFyYW1zICpwID0gJmhzb3RnLT5wYXJhbXM7DQo+Pj4+PiAgICAgICANCj4+Pj4+ICAgICAg
IAlwLT5wb3dlcl9kb3duID0gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX05PTkU7DQo+Pj4+PiArCXAt
Pm5vX2Nsb2NrX2dhdGluZyA9IHRydWU7DQo+Pj4+PiAgICAgICAJcC0+cGh5X3V0bWlfd2lkdGgg
PSA4Ow0KPj4+Pj4gICAgICAgfQ0KPj4+Pj4gICAgICAgDQo+Pj4+Pg0KPj4+PiBJbiB3aGljaCBt
b2RlIGhvc3QvZGV2aWNlIHlvdSBzZWUgdGhlIGlzc3VlPw0KPj4+IEkgZG8gbXkgdGVzdCBpbiBt
eSBkZXZpY2UgbW9kZS4NCj4+Pj4gV2hhdCBpcyB5b3VyIGNvcmUgdmVyc2lvbj8gUGxlYXNlIHBy
b3ZpZGUgR0hXQ0ZHMS00IHJlZ2lzdGVycyB2YWx1ZXMuDQo+Pj4gVGhpcyBpcyBhIHJlc3VsdCBv
ZiBkd2MyX2R1bXBfZ2xvYmFsX3JlZ2lzdGVycygpIGFkZGVkIGp1c3QgYWZ0ZXINCj4+PiBkd2My
X2xvd2xldmVsX2h3X2VuYWJsZSgpIGluIGR3YzJfZHJpdmVyX3Byb2JlKCk6DQo+Pj4NCj4+PiBk
d2MyIDEyNDgwMDAwLmhzb3RnOiBDb3JlIEdsb2JhbCBSZWdpc3RlcnMNCj4+Pg0KPj4+IGR3YzIg
MTI0ODAwMDAuaHNvdGc6IEdPVEdDVEzCoMKgwqDCoMKgIEAweEUwMjYwMDAwIDogMHgwMDBEMDAw
MA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdPVEdJTlTCoMKgwqDCoMKgIEAweEUwMjYwMDA0
IDogMHgwMDAwMDAwMA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdBSEJDRkfCoMKgwqDCoMKg
IEAweEUwMjYwMDA4IDogMHgwMDAwMDAyNw0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdVU0JD
RkfCoMKgwqDCoMKgIEAweEUwMjYwMDBDIDogMHgwMDAwNTQwRg0KPj4+IGR3YzIgMTI0ODAwMDAu
aHNvdGc6IEdSU1RDVEzCoMKgwqDCoMKgIEAweEUwMjYwMDEwIDogMHg4MDAwMDA0MA0KPj4+IGR3
YzIgMTI0ODAwMDAuaHNvdGc6IEdJTlRTVFPCoMKgwqDCoMKgIEAweEUwMjYwMDE0IDogMHg1NDAw
ODQyOA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdJTlRNU0vCoMKgwqDCoMKgIEAweEUwMjYw
MDE4IDogMHg4MDBDMzgwMA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdSWFNUU1LCoMKgwqDC
oMKgIEAweEUwMjYwMDFDIDogMHg2MTZFQzc3RA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdS
WEZTSVrCoMKgwqDCoMKgIEAweEUwMjYwMDI0IDogMHgwMDAwMDQwMA0KPj4+IGR3YzIgMTI0ODAw
MDAuaHNvdGc6IEdOUFRYRlNJWsKgwqDCoCBAMHhFMDI2MDAyOCA6IDB4MDQwMDA0MDANCj4+PiBk
d2MyIDEyNDgwMDAwLmhzb3RnOiBHTlBUWFNUU8KgwqDCoMKgIEAweEUwMjYwMDJDIDogMHgwMDA4
MDQwMA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdJMkNDVEzCoMKgwqDCoMKgIEAweEUwMjYw
MDMwIDogMHgwMDAwMDAwMA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdQVk5EQ1RMwqDCoMKg
wqAgQDB4RTAyNjAwMzQgOiAweDAwMDAwMDAwDQo+Pj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogR0dQ
SU/CoMKgwqDCoMKgwqDCoCBAMHhFMDI2MDAzOCA6IDB4MDAwMDAwMDANCj4+PiBkd2MyIDEyNDgw
MDAwLmhzb3RnOiBHVUlEwqDCoMKgwqDCoMKgwqDCoCBAMHhFMDI2MDAzQyA6IDB4MDAwMDAwMDAN
Cj4+PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHU05QU0lEwqDCoMKgwqDCoCBAMHhFMDI2MDA0MCA6
IDB4NEY1NDI4MUENCj4+PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHSFdDRkcxwqDCoMKgwqDCoCBA
MHhFMDI2MDA0NCA6IDB4MDAwMDAwMDANCj4+PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHSFdDRkcy
wqDCoMKgwqDCoCBAMHhFMDI2MDA0OCA6IDB4MjI4RkZDNTANCj4+PiBkd2MyIDEyNDgwMDAwLmhz
b3RnOiBHSFdDRkczwqDCoMKgwqDCoCBAMHhFMDI2MDA0QyA6IDB4MUU4MDg0RTgNCj4+PiBkd2My
IDEyNDgwMDAwLmhzb3RnOiBHSFdDRkc0wqDCoMKgwqDCoCBAMHhFMDI2MDA1MCA6IDB4RkZGMDgw
MzANCj4+PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHTFBNQ0ZHwqDCoMKgwqDCoCBAMHhFMDI2MDA1
NCA6IDB4MDAwMDAwMDANCj4+PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHUFdSRE7CoMKgwqDCoMKg
wqAgQDB4RTAyNjAwNTggOiAweDAwMDAwMDAwDQo+Pj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogR0RG
SUZPQ0ZHwqDCoMKgIEAweEUwMjYwMDVDIDogMHgwMDAwMDAwMA0KPj4+IGR3YzIgMTI0ODAwMDAu
aHNvdGc6IEhQVFhGU0lawqDCoMKgwqAgQDB4RTAyNjAxMDAgOiAweDAwMDAwMDAwDQo+Pj4gZHdj
MiAxMjQ4MDAwMC5oc290ZzogUENHQ1RMwqDCoMKgwqDCoMKgIEAweEUwMjYwRTAwIDogMHgwMDAw
MDAwMA0KPj4+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IGR3YzJfY2hlY2tfcGFyYW1zOiBJbnZhbGlk
IHBhcmFtZXRlciBiZXNsPTENCj4+PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBkd2MyX2NoZWNrX3Bh
cmFtczogSW52YWxpZCBwYXJhbWV0ZXINCj4+PiBnX25wX3R4X2ZpZm9fc2l6ZT0xMDI0DQo+Pj4g
ZHdjMiAxMjQ4MDAwMC5oc290ZzogRVBzOiAxNiwgZGVkaWNhdGVkIGZpZm9zLCA3ODA4IGVudHJp
ZXMgaW4gU1BSQU0NCj4+Pj4gSXMgdGhlIGlzc3VlIHNlZW4gYmVjYXVzZSBvZiBwcm9ncmFtbWlu
ZyBQQ0dDVEwuUENHQ1RMX0dBVEVIQ0xLIGJpdA0KPj4+PiBvbmx5PyBUbyBjaGVjayBpdCwgY291
bGQgeW91IHBsZWFzZSBjb21tZW50IHRoaXMgYml0IHNldHRpbmcvcmVzZXR0aW5nDQo+Pj4+IGlu
IGNsb2NrIGdhdGluZyBmdW5jdGlvbnM6DQo+Pj4+IGR3YzJfaG9zdF9leGl0X2Nsb2NrX2dhdGlu
ZygpDQo+Pj4+IGR3YzJfaG9zdF9lbnRlcl9jbG9ja19nYXRpbmcoKQ0KPj4+PiBkd2MyX2dhZGdl
dF9leGl0X2Nsb2NrX2dhdGluZygpDQo+Pj4+IGR3YzJfZ2FkZ2V0X2VudGVyX2Nsb2NrX2dhdGlu
ZygpDQo+Pj4gQWZ0ZXIgcmVtb3ZpbmcgcHJvZ3JhbW1pbmcgUENHQ1RMLlBDR0NUTF9HQVRFSENM
SyBiaXQgaW4gdGhlIGFib3ZlDQo+Pj4gZnVuY3Rpb25zLCBldmVyeXRoaW5nIHdvcmtzIGZpbmUu
DQo+Pj4NCj4+PiBCZXN0IHJlZ2FyZHMNCj4+Pg0KPj4gVGhhbmsgeW91IGZvciB0ZXN0aW5nIGFu
ZCBjb25maXJtIG15IGV4cGVjdGF0aW9ucy4NCj4+DQo+PiBUaGVyZSBhcmUgMyBvcHRpb25zOg0K
Pj4gMS4gRG8gbm90IHVwZGF0ZSB5b3VyIHBhdGNoIGFuZCBhY2NlcHQgaXQNCj4+IDIuIFVwZGF0
ZSB5b3VyIHBhdGNoIHRvIGV4Y2x1ZGUgcHJvZ3JhbW1pbmcgb2YgUENHQ1RMLlBDR0NUTF9HQVRF
SENMSw0KPj4gYml0IGJhc2VkIG9uIGhzb3RnLT5wYXJhbXMubm9fY2xvY2tfZ2F0aW5nIGluIGFs
bA0KPj4gLi4uX2V4aXQvZW50ZXJfY2xvY2tfZ2F0aW5nIGZ1bmN0aW9ucw0KPj4gMy4gTW9yZSBy
YWRpY2FsIHNvbHV0aW9uLCB0byBoYXZlIHJlYWxseSAuLi5QT1dFUl9ET1dOX05PTkUgY2FzZToN
Cj4+IC0gcmVuYW1lIERXQzJfUE9XRVJfRE9XTl9QQVJBTV9OT05FIHRvIERXQzJfUE9XRVJfRE9X
Tl9DTE9DS19HQVRJTkcgaW4NCj4+IHdob2xlIGRyaXZlcjsNCj4+IC0gZGVmaW5lIG5ldyBwb3dl
ciBzdGF0ZSAiI2RlZmluZSBEV0MyX1BPV0VSX0RPV05fUEFSQU1fTk9ORQktMSINCj4+IC0gYW5k
IGZvciBhbGwgcGxhdGZvcm1zIHdobyBkb2Vzbid0IHdhbnQgdG8gaGF2ZSBhbnkgcG93ZXIgb3B0
aW1pemF0aW9uDQo+PiBrZWVwOg0KPj4gICAgICAgIHAtPnBvd2VyX2Rvd24gPSBEV0MyX1BPV0VS
X0RPV05fUEFSQU1fTk9ORTsNCj4+DQo+Pg0KPj4gSSB3b3VsZCBwcmVmZXIgb3B0aW9uIDMuIFdo
YXQgeW91IHRoaW5rIGFib3V0IHRoaXMgc29sdXRpb24/IENhbiB5b3UNCj4+IGltcGxlbWVudCBp
dCAoSSBndWVzcyBpdCByZXF1aXJlZCA1IG1pbikgYW5kIHRlc3Qgb24geW91ciBwbGF0Zm9ybS4N
Cj4gDQo+IE9rYXksIEkgd2lsbCBkbyB0aGUgM3JkIG9wdGlvbi4gSG93ZXZlciwgdGhlICRzdWJq
ZWN0IHBhdGNoIGhhcyBiZWVuDQo+IGFscmVhZHkgbWVyZ2VkIHRvIHY1LjE0LXJjMyBzb21lIHRp
bWUgYWdvLCBzbyBJIHdpbGwgZG8gdGhhdCBvbiB0b3Agb2YNCj4gdjUuMTQtcmMzLg0KPiANCj4g
QmVzdCByZWdhcmRzDQo+IA0KDQpUaGFuayB5b3UgZm9yIHBhdGNoLiBHaXZlIG1lIDEtMiBkYXlz
IHRvIHJldmlldyBhbmQgdGVzdCBvbiBvdXIgcGxhdGZvcm0uDQoNClRoYW5rcywNCk1pbmFzDQoN
Cg==
