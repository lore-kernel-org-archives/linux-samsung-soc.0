Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D7CC07E95
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 09:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8266B613E8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 09:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhGPJKY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Jul 2021 05:10:24 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38600 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231143AbhGPJKY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jul 2021 05:10:24 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36FCFC0C33;
        Fri, 16 Jul 2021 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626426449; bh=49cOYxfih/gBkDyRFKKPjlu2s2oixY2Z4++lKk2GebA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=cKTX1kB1e516UiTIPDUMS1B2WJe8zEYvGP48WSMiHjcMphNRIL5RIqvMZA7gNq5fC
         tCMTwdqI8FKK7I96PTAu+qFxIItcgKrzRWedhzjJcIep3VT+QknPkf8R60K1zEewfm
         q2wgyilWtX/LAa/44ZsanooqhBe1b/84CMer4BoJUgAg9mQbbzTeXnFA2WifvePaaN
         66tUjrveivXxkzBamkf9i3K11E3tWIzRaSn+Xem7hEv2JKQJH6Bg+QtXThfyxASVMG
         JbjlM/GoHKlJaPWI5Xvnigm7uQCL/jFfCL/IbyFDiceiAvGuD4c4Cxb7Rf1Co8GBdI
         YH1eSsObhhDzw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 08998A0254;
        Fri, 16 Jul 2021 09:07:27 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 364574007B;
        Fri, 16 Jul 2021 09:07:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="BlRyVBwi";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPjRJ8ArnaURemD7VEEKzVtGud+KSE5HGCo5jXKdRceYSUEUWCq9MMRfmhUwtTd5gzebXl4e7RWWG6fzBuTsxwAAOSwvXlqAgHE3pUeD6RHArJXiV34e9Crfbo/uGOM9ZYyK3lDyKFcr381FvG4A2FMrqcKT6eF1u5zlkpzHY5C7L7V3yA4rfGABTc+Qt405qVpjllWinHjxUzvg1Ikgczxtv1/dxDS+WaZ8h+1MmLbUg2JGJ5j4LtaO5vIJwGcnXE9JGusKFBAUxOkLszIuDv9yA8UWCeHvJ8ULBk+k73rs0Agfnt1tFHp8rv4nqPxM2oTMGL1uth0v+ctBb5mstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49cOYxfih/gBkDyRFKKPjlu2s2oixY2Z4++lKk2GebA=;
 b=SV9B1VG2pLtd9IJtZtO0l/QBaj3w8ZyVzh3NUkOGpAFR9KDane1NuQQHUF88vM59AF13jmxauiVkqP5xUgmoT6aro2XXBUtad29lu7Bs/QY+1b0N/wT9ML4ODpyc+NK3IYVqu1X8fiEf+bd7xEoi7+pc/lKxsifjjSkH/Tk4zyI36Dw5Ke/U3VKYgtVegzY5ao96mbNwaKbl+Rc1oR9zBfXULeXASt6egf96nGbvB6MvDSH1Lu/OknJDKIr71E4t6NHD9mG9ibGHY50Vs3weG0wvbY18mBLFLzuNLRNJWPb0+3PqbeRn8I+0IWUydtsNgfG2Xahp14evNh2+w+o+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49cOYxfih/gBkDyRFKKPjlu2s2oixY2Z4++lKk2GebA=;
 b=BlRyVBwii0lKTHxB55glJZ7WO0n0Rv4Hp4x+cfvCJu2eYmGB76eGEuB7r7ygHmMKhLVYfOf9JeqirZvzOLQtL34c5NElcpLesvceJXboKsbQ33YF2e9M4vlXRcDVorPHUA1Ga+9aoF5oQ6dSq1uXuCM410I44hKm1t/xH7JiDvw=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5327.namprd12.prod.outlook.com (2603:10b6:5:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 16 Jul
 2021 09:07:25 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 09:07:25 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
Thread-Topic: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
Thread-Index: AQHXef+pNOqQl/JGqEq/TztwoCjZgatFQBEAgAAP6wA=
Date:   Fri, 16 Jul 2021 09:07:25 +0000
Message-ID: <6fb5313e-b2c0-7b3e-84f7-6333216f4292@synopsys.com>
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
 <20210716050127.4406-1-m.szyprowski@samsung.com>
 <e2fc4d3f-2f64-1d7e-5816-0275da23d6fa@canonical.com>
In-Reply-To: <e2fc4d3f-2f64-1d7e-5816-0275da23d6fa@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36348dd7-e849-4341-5f82-08d948392105
x-ms-traffictypediagnostic: DM4PR12MB5327:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5327494BA6F9E0D69FB4EEBCA7119@DM4PR12MB5327.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A5ilqWTeAZQB4S7FsZgAnrjMSRLOSF4//KvXZ4XSJd1reTH5MiI1dtClchTuRv/jnT+InFPBYC9R2t3YYlhmZoRS7Aey15dOonN4Z9mrsMtM0dAiVxe949XBoHe/WQgGIycmME3nstTz2peFDqUcIS7/5v9YGmveKkmqEx2CTWFNkCRf/wSzyTo/BAThEhX74d4yBJkq3L5NvQDBYVfLUiZ+Ty4NblM327BnU6VK10NhQzEpiyJ5z7QGxuBn0fte9fnk/ZRjVUYWVUtTsLafYYVLipiyPBGloyPwmiFF+Z6LoapjUm4sDud2xJIMvyUykCoY5udPSwRykx+Z1sM/llD5dxASukCDhCKJ5K/syqzdxV1e2+iC+oCmjsqwW8hLAqWReIqaOLTDCrjVFJYA8kWBSOXolFKTaSQXhWP0UlMHFxD25Rp0YIWu8xrpENGzlfx8wtPi+nJviv7yi2cPtxhes8/nvlzJ1knbGVKrK+OIkM9ivWzqcedRanqo4no6Yy1lIrJYckmHpBS9fePs9uv5cbZp4FgLFcVfH+R0UzD4rrenuj9xiw5BmmRfbOMMDWzhg1xKVvhVY6ZRMmPVDGNR4vltpiFXDYfqDUw4DckysD0Y6STnv8mI56W8j72u1YqXbh7NMEJ8dk8Ueluc7rkFmWks1UeRTv2BrMYtsjDCc9nDm+daUudfSu/bnC0/1HKh5KpmU5W/YJqqwj4X+4AOFgPRlzPj9sZ1AvJ7MdnQmmGbWfPCoM3mcFtQZlGq2RXJKxYb5C9O2zJius9r6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(396003)(136003)(346002)(376002)(366004)(39860400002)(71200400001)(86362001)(31696002)(91956017)(83380400001)(122000001)(8676002)(53546011)(5660300002)(66946007)(76116006)(8936002)(2906002)(36756003)(186003)(316002)(6512007)(4326008)(64756008)(66446008)(66556008)(54906003)(38100700002)(110136005)(478600001)(31686004)(6506007)(6486002)(66476007)(26005)(2616005)(43740500002)(38070700004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M05iNEUyT3MxMUxNWkd2dWJoM0FQTTE0MUsxZGRoTk9SMTQ2V2lmaUJvS2w5?=
 =?utf-8?B?Y1pKRlRxby9INVF6RVp0YklCRzJ3TUJwMVR1SkdyZWtMK1drNDdWd0RPUGla?=
 =?utf-8?B?MmpBTVUxbFBzNm9tSFZlUXNWVHNMSEg2ZkZtNTBlM09GQVJxYVJIekpMb29W?=
 =?utf-8?B?Z3I0UFRDU0NyQUUraHhzczBXRVp1dFVFZWg3WHBRWWo2ME0yRkE2MXM3c09h?=
 =?utf-8?B?N1V5dVpJUFcwL0ZhaGZ3bGhwSFhLemlMSmJQZk1ITHVCbFpxMDc0aUhReWVi?=
 =?utf-8?B?LzJGQ3krSXdrQU1ZdXBtLzhOL0NkbnRGZk5SaDVqRmZPRVZyY3dKd3hpVWFa?=
 =?utf-8?B?L0dsYmJsQjgranRpV1dqcFd0V3RFWXpSOWZYZlZMUUx6Y0R4ZHBScDFqaDFX?=
 =?utf-8?B?ZnlPbGRsN3FtanNFTFA1NGoyOTgwcWVqWHM2bkIyNktjeE4rVVlJdXAvU1dU?=
 =?utf-8?B?MUhvOXJlRGo5Y2h5VGZYeHhOaU5oQlZ3a3N2Um5VRDZCWXNtVkZmUEd3QkIv?=
 =?utf-8?B?U2MyL1N6VmRNZEJnODVZNzRuNURyRldvM1ZRQzRTTmNCb3FUK3RoQkl6UmdB?=
 =?utf-8?B?d3lSN2NGTFZRN2RsSWxJNTRHL0xkZ3F2SEw5b0pkUU41MUZZaHRJVEF3ZTJq?=
 =?utf-8?B?dURJWTZEUVhsSlpXWFRaRFF1ZEltSUpiNUFwenNKdVBQRnBDZ1NoMVEybEV1?=
 =?utf-8?B?aUtXbVlRT0NuVzNKcHNMcSszVnZpcFZMQlRFZnpxay9jNHNINjEzWENIYXZU?=
 =?utf-8?B?NDdScjczcExHblVSY1AvYUQ3SXFQbjJSOG9LS2pxSHM2Q1pZNnk3MnVkUXJV?=
 =?utf-8?B?OVJVTjBISmV2TVB6TytlSm1iTVVHeG5nWlA0NHdsVWhOVk92bDBpR2NqZld2?=
 =?utf-8?B?c1ZLQ2FFVEpPL21XNWx1MzZJZ2JiR1lWd3ZUTnRVRTVGVVo3SWg5bmFkTCtx?=
 =?utf-8?B?c09XN2M1L09tRnN0Sjl0ekV6SlQ2VU5tWEhDS3JrWU1VOWI1Q2hPQ3pDQm5H?=
 =?utf-8?B?ME1ZeDh4U3dSTDJNL3A5ZUVYMDgyL25OYVd5UWxCNllSbGFTbG5LS2h5Mmhm?=
 =?utf-8?B?QVUxeDNKWWt1bkxoWFRjc3IyZC9WMDlXTC9BYnZHTEFWemJsNTNFYzdjNTlh?=
 =?utf-8?B?N3NWK0hseWlJM0ZpRlJCdW1tUmdtaU02TmNuWG52KytiTWFMQUdVOTEveGo1?=
 =?utf-8?B?a3huUll3aEJSbUFSS0ZBSHduTEo4NzIxbm1qY1ZIQUhraWc0MGVxLzB5eUdk?=
 =?utf-8?B?K1hyb3Q4VFBWTDFvczVyWE4zak9sWFNsRzV5NXpiTUIwcThKLzBpWDltYjFF?=
 =?utf-8?B?MzNTMUdjcEpra093VCtzRnF1cXJSVU12Yis2RElIenlTd2F4OXZSOU1SM3Vo?=
 =?utf-8?B?cEpHREZJM3pTK29mcWJCSWVLemlwakxWZ0diZGtFbW1iM2FmNzdTalkrc1M5?=
 =?utf-8?B?UlJCZDgzS201Q0FxNk9PVmZyVjhoaVd0RWxCMWdpTjN5KzlDV0dKTkNTTVdH?=
 =?utf-8?B?TVNZYmhlOXptUmdLMnRJdTJvYXVOY2hSc051THB4T1RUa1E2TlFqMjFPL1Fq?=
 =?utf-8?B?VmFENE4xdEwrODVBQ29sUGFzeEVSaGg2SnhheU5uQ1hRR21YZVBNU3k2TDhq?=
 =?utf-8?B?WWFKM0tuWUl3SnJCQzdjT1ZRNUtKTDFYczd6SWJ3amFiZ1VuSEdXVFZVOHY0?=
 =?utf-8?B?S3cvQUhYeU9EUzdWemdkMGtPQUkrWnUvcFhxKzFlRlhLNlZTSVlBVnlQMnpV?=
 =?utf-8?Q?GBA0hzb1gf7s2EyVTw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <682AE45C528D4941ADF54074DACAF063@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36348dd7-e849-4341-5f82-08d948392105
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 09:07:25.2996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5+7pkJkQUGf23iQQqPPA4Sg7ydyRquWfU1F7YbsEpjhfHlHp6F/GgKq3u8tA6MTQS/CmC0JSpk39u9yR8B4DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5327
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiA3LzE2LzIwMjEgMTI6MTAgUE0sIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+IE9uIDE2LzA3LzIwMjEgMDc6MDEsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6
DQo+PiBDb21taXQgMDExMmI3Y2U2OGVhICgidXNiOiBkd2MyOiBVcGRhdGUgZHdjMl9oYW5kbGVf
dXNiX3N1c3BlbmRfaW50cg0KPj4gZnVuY3Rpb24uIikgY2hhbmdlZCB0aGUgd2F5IHRoZSBkcml2
ZXIgaGFuZGxlcyBwb3dlciBkb3duIG1vZGVzIGluIGEgc3VjaA0KPj4gd2F5IHRoYXQgaXQgdXNl
cyBjbG9jayBnYXRpbmcgd2hlbiBubyBvdGhlciBwb3dlciBkb3duIG1vZGUgaXMgYXZhaWxhYmxl
Lg0KPj4NCj4+IFRoaXMgaG93ZXZlciBkb2Vzbid0IHdvcmsgd2VsbCBvbiB0aGUgRFdDMiBpbXBs
ZW1lbnRhdGlvbiB1c2VkIG9uIHRoZQ0KPj4gU2Ftc3VuZyBTb0NzLiBXaGVuIGEgY2xvY2sgZ2F0
aW5nIGlzIGVuYWJsZWQsIHN5c3RlbSBoYW5ncy4gSXQgbG9va3MgdGhhdA0KPj4gdGhlIHByb3Bl
ciBjbG9jayBnYXRpbmcgcmVxdWlyZXMgc29tZSBhZGRpdGlvbmFsIGdsdWUgY29kZSBpbiB0aGUg
c2hhcmVkDQo+PiBVU0IyIFBIWSBhbmQvb3IgU2Ftc3VuZyBnbHVlIGNvZGUgZm9yIHRoZSBEV0My
LiBUbyByZXN0b3JlIGRyaXZlcg0KPj4gb3BlcmF0aW9uIG9uIHRoZSBTYW1zdW5nIFNvQ3Mgc2lt
cGx5IHNraXAgZW5hYmxpbmcgY2xvY2sgZ2F0aW5nIG1vZGUNCj4+IHVudGlsIG9uZSBmaW5kcyB3
aGF0IGlzIHJlYWxseSBuZWVkZWQgdG8gbWFrZSBpdCB3b3JraW5nIHJlbGlhYmx5Lg0KPj4NCj4+
IEZpeGVzOiAwMTEyYjdjZTY4ZWEgKCJ1c2I6IGR3YzI6IFVwZGF0ZSBkd2MyX2hhbmRsZV91c2Jf
c3VzcGVuZF9pbnRyIGZ1bmN0aW9uLiIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93
c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy91c2Iv
ZHdjMi9jb3JlLmggICAgICB8IDQgKysrKw0KPj4gICBkcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50
ci5jIHwgMyArKy0NCj4+ICAgZHJpdmVycy91c2IvZHdjMi9oY2QuYyAgICAgICB8IDYgKysrKy0t
DQo+PiAgIGRyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMgICAgfCAxICsNCj4+ICAgNCBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4gDQo+IA0KPiBB
Y2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmlj
YWwuY29tPg0KPiANCldoYXQgbWVhbiB5b3VyICJBY2tlZC1ieSIgdGFnPyBEbyB5b3Ugd2FudCB0
byBtZW50aW9uIHRoYXQgdGhpcyBjb21taXQgDQoiVGVzdGVkLWJ5IiBvciAiUmV2aWV3ZWQtYnki
IGJ5IHlvdT8NCg0KVGhhbmtzLA0KTWluYXMNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCj4gDQoNCg==
