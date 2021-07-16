Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEC7C07E95
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 14:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E61A8613F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 14:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240492AbhGPO5L (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Jul 2021 10:57:11 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51876 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240459AbhGPO5K (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jul 2021 10:57:10 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4628C0C44;
        Fri, 16 Jul 2021 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1626447255; bh=Mfq5WOVHdPsk1eFpVc/GgnIdM3JiM9jSM/YWD/qfpXs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=e5YwAbcdlIoE37JVb6ZmenhzStx1GszDg3WndtTVX6iE1jqb45AX/LKbPDHLA5Gqt
         JboIGGDRGisYqyWFEPhDktLopVyoFiX+C+TaIvG4hsrM/uzCU0PSm/rdaSLiypVzo6
         XObbGerjv+Tr1GpPJSAoH0eJnXMTS7Oz3ITZn+U7dghD6e+IDvZHdIHNcQkMGi/rMT
         NjiWGA3yyLq5217cRNoe5uzcLsMwuYSeWYDMElDvjDrJ3DQNslZlQBQJVb1SVhKZvI
         yj+qmsh7cAL7MIpKGyvge8nHfY8zTUCeNvTyspgUMqSfeQQJXUppOsI7PT6ejUfxeb
         Hzr+bPhVR01Gg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 075DEA0083;
        Fri, 16 Jul 2021 14:54:13 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E205A80026;
        Fri, 16 Jul 2021 14:54:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="HlaxY/bS";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHmfjrkPH+9iEkrQ3QDzbbaLPwLaMte+qgVgNiV2L9f9pb0+W7JTZIcepm9/TQC+XkBmUC8mdBllKzwgpNJeWHc0XuD1UDHAaeaVEdsOw0UJQxf+DUV2LN1MVAPYKtIM7B6GMZn17me2tePKstOBH3yNzl1baqbT7EoBoSUREOIdZ/8OuhMFECECbn4i7BHGm5Xg5OkXrXGKmiwc+CuP5hJht98hshTkFdzn3Dt6E78hYEF25f6rUw1DPlXpczuUDleucKkCTQtorYMqdjinePe81ZtmF9qyyf0yoV716u49Mi9yXQGYJpQZqUAyOykBCfP5brpeHWjBllXWr8f8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfq5WOVHdPsk1eFpVc/GgnIdM3JiM9jSM/YWD/qfpXs=;
 b=F5VbeyV9JjbvjgGH88v6fPDijeU6PM4rVkFEztZxod2yAhAseFTrwXPMVdY1CnF3sOfl4CYrRWjkI7ezTewoY1kSKU06DwKg2TQke3STwzI3errayvIZ6tHYPUbgiz4AbhsX8chpsf/kc+SkblV59q/UrFRg6HhGkFR8QLeghXB3NvNXWQeBPac5+ulwev/XEA44lAf2Z341I6hJBLu/HbnZ1njA+x/d49o+EoZ+/TL2KbJelGukRQsYeQSNIoa/k02Ypctha3reU6t/PGMFICKZhiPrryHk0iLqiSrOzPfV5iolccy9GMTK/aiLyp+pMI54B+7nqaOL6EB6hEoSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfq5WOVHdPsk1eFpVc/GgnIdM3JiM9jSM/YWD/qfpXs=;
 b=HlaxY/bSnIsYHoU6C98L7o1FJ8j/pY5Kc2gZu4pYWsr3dRtsX4CJc+iicawdw2Rx8jfVLxZrQOv8ShXe7Zz36FBd+mk6tkZHsqnCeHEqkzbws5arpUnjXYwp695xH69c1/qJHmm6cZYE4zfHp846wyEkz803/d9tWZtFzmRpSJg=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Fri, 16 Jul
 2021 14:54:11 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 14:54:11 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
Thread-Topic: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
Thread-Index: AQHXef+pNOqQl/JGqEq/TztwoCjZgatFsN2A
Date:   Fri, 16 Jul 2021 14:54:10 +0000
Message-ID: <a7efdf13-48bb-db21-5755-ebbbe2614f78@synopsys.com>
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
 <20210716050127.4406-1-m.szyprowski@samsung.com>
In-Reply-To: <20210716050127.4406-1-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0636b0d3-8c5e-42ab-7351-08d94869922d
x-ms-traffictypediagnostic: DM4PR12MB5200:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5200A4900B8D9B433397E5ADA7119@DM4PR12MB5200.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3AKA6xTmHtpKHb+iKyIursS2puk5dLFw7ThLGKLIR6KoUhxkN05j9cMHOfX+6Va+DdskcmAbEEgViP5dBSR05IVr1U40H7sGdP3UOzKxd677XcaYup2LAVHpMzsPFkPfHOk02UwFtnSIFlns+05nZdaOpSqCoZu9xJeH3MW+iUA59KAnucpg3fnqE3vFFjRGuvg8rzrw7YBkC/xTouACMLnT7sabNmHydm6g0w7iQJnTXWkLqttgEecKnLJC/DdvdLHsNLhYiuKuihho4Y3tl/tc/iu8EDHeY857lLoUwyLGIBS+i7etVDz7OqazSXKGEEJb7kno3ViOb09wVtD6+8PcSRqyGqkD8Iig333CT1lBmguxgQk7md7su/ytQbl5e1J+wcD6Z3tNyazw+0kSY9AJ3pI5GGmUXvDDKrzs5SAYjaydnpiE8qt9LNJ0v/U6B9eUu9MryaPJEyN2FCJq56Plsz28pIut+3g3KKI1eanWmZBllhzsYoL1anshjFUwaqa1K9t1z5qko9l/Kx4uu6jnhETC5165msiyUXY05Z3DHDzwAYzae/Z+CueLlVF8UkWLZehFzflkC3oQdXetxtQbh/4NpRrZTPIgdlHod7piU43bb+isevtOzEO9BpJoVd0FjvfBI5+jDUHoWBI7zRONxkpQxesi2oAZpTqYAXYT9lqZ6Hg7yNJeH6euUxux60u7witc85KBK5YtcZFhZWFUt7Hmq8KAoI1Lt7Je1DfiaOM8vLrpnJvclurS7XjdoI/EV2b9hdJbJ9pvC5F6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(396003)(376002)(39860400002)(366004)(136003)(346002)(4326008)(31686004)(36756003)(8936002)(6512007)(71200400001)(478600001)(122000001)(54906003)(110136005)(2616005)(83380400001)(66556008)(38100700002)(66476007)(66446008)(316002)(5660300002)(2906002)(6486002)(64756008)(186003)(76116006)(66946007)(31696002)(86362001)(8676002)(91956017)(26005)(6506007)(53546011)(38070700004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVExa2xyY0Qrem5KQkoyNDJqajlDTFE3ZURzN1Fhd0lMbHgyQVJpRmZIMzVJ?=
 =?utf-8?B?aHFmUEtlQWRkckxGWGorMzAwaUlIcnhjTFVHK2NXVmlQUWdGU1FUT2RTNWZ1?=
 =?utf-8?B?SzlrbFl0ak1HM2FNdHhUSU84cnUvRE4vSTJlbmZObEFYZEh5YXhGVGhRZ1Jo?=
 =?utf-8?B?a0VZWnJaWFNZSm9DS1k5TnJyYnFpb0lxYjhudHhBdndVVzJFSnoyZ0c5eXdm?=
 =?utf-8?B?RlRyTEJWZ0s1WjA3V2cwMzNaYnFDT0tOOFJ2YWNBNzJ1Rk9ZUitvZUxRenVy?=
 =?utf-8?B?clByNi9LNzE1Z01kdW5Rajlqc3lKaUdhcDhUcW45TXh1ZEljSGE2R3VRcUx3?=
 =?utf-8?B?cGNoQXVFb3dJbHFPZE42R09aQUVoY3RoU1dPUFJkcGR0bnFRTG5sd1owdE4x?=
 =?utf-8?B?eldCQVg3M1REZmwzOFJYMmhYMzExbm9TdHR5ei9jWC9LbTMvMW4zT2gvSTB5?=
 =?utf-8?B?VkpOdllMcUF5WEcwUDFvWHZabjU3MmV1YTVKeHpPNUFiSUx1bEVHOThuR3NM?=
 =?utf-8?B?OUlhTVlZdGkyR0phWStNTXNSMXlwdThvclp5OWVQQmJOam5FMTl4LzFiQ2tu?=
 =?utf-8?B?enlYNVAvWUdudE9lcnNNY1VsczBpYjhUZ2lTcHNXcjAwVlhEaUM0dGZSN0Ri?=
 =?utf-8?B?eGhtSmpEQjN0SWZKWUVXSVl0Y3JCWUdmbmJSaTYwakorSVI1cHVRb2o4TUpw?=
 =?utf-8?B?MGpROEdlRlZTT3FmVy9ZaFlKYWRBYmcvekMwMDJNNkJpZnc1dVJXaTV1Y1Fh?=
 =?utf-8?B?SlBUZmJwZXllS1ludHVlbnFNOGhSaHVUVWRNbm5ZK2FhOTRTdmozSm14a0I2?=
 =?utf-8?B?bjIrVGtqaStHdEJaREFMQVB2RDlieWc3NHFtNytTenRPdkNHSlozSHRsQ2Ix?=
 =?utf-8?B?N0ZpaWNTTmJuT0xiVEZUaTgxRTdwUlJncmFPdEhWSFBsWlVkdkhrTXZYY2Zz?=
 =?utf-8?B?SngrTktMMVhtQWhyUHh1RGUvYmNvc3lQa1FNR1lxelMzSHdOR3lYQTN6ZFpF?=
 =?utf-8?B?TkFwNDN5SFJNTUR5bEYvY0hqVVFnSWllaFBBNWhqSjAyTXNrekMrclkzdVJE?=
 =?utf-8?B?N25IQ2VsdzV1LzZaSkN6azArWC9OcER4SGtWTEZ2czZqTlE3NU14MTR1aWVX?=
 =?utf-8?B?S3pSalh5TXprS2RlZUVkazFqN05GbUQ0akxiZGpqRzNveWU5MWcyekFQSFNO?=
 =?utf-8?B?aVd6RjY3MkdDVjN1dmt3WnVGVnU2ZWJjdnBRK1hiTWJmSmhkQURUeHcrTnFx?=
 =?utf-8?B?bC9CNlZnU2pSRStYVGk0dG9SdFVrQVlXNmpyTytKRnRiM0FReTdla2hYYWgr?=
 =?utf-8?B?Vit0NU9WTTZlTk02RHhiVXRUQWRTMjV1Wk1oenZuUkhQd0RMeDZhdUVMU0RY?=
 =?utf-8?B?Vy9qVnprZDFMNm8rK3JwdlJJYW5EdFZPQnMyL3ltK01Qd24yUGxoVnBrTVBB?=
 =?utf-8?B?QnZycDU5bzJ6Qm9POHVUcm80c2U4WEhkT1ZzNXRWMzVDUm5sYlRpZUpydXAz?=
 =?utf-8?B?Vjl4Y1c2OFlDeE1PeVN2U3E2VDR5YjU4OEFVaStIcVZRcFRXZE9zNzcrNFFZ?=
 =?utf-8?B?Z0RSK0xrRnhTL1htZ050ME41ZGhNZzlGUFZsdXJteGN3cEhMdEN2KzZESWJK?=
 =?utf-8?B?RU9rR3NFZjhnOWFNSFdCKy9GRWVrM1F6RVo0N0lkWjl3eGdxRGgvZU1tcTNV?=
 =?utf-8?B?T3p0UUI2Q3grRW93WDJqRXQyYnFKSVp5b2puQXAzUXNDZHRZbm83NlVYTHEx?=
 =?utf-8?Q?4CRsiqhEsmh+pgh8LM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D614F1D926AAE641AC1F725CCFFA5F1D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0636b0d3-8c5e-42ab-7351-08d94869922d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 14:54:10.9947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YdGJ3xMXsYsVtAFpD72irmL7NTujsee+01D2wXnzU9vy5ujpdjx3In6zTyB7ac+b+todecaxpWFJzRTuw9vRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SGkgTWFyZWssDQoNCk9uIDcvMTYvMjAyMSA5OjAxIEFNLCBNYXJlayBTenlwcm93c2tpIHdyb3Rl
Og0KPiBDb21taXQgMDExMmI3Y2U2OGVhICgidXNiOiBkd2MyOiBVcGRhdGUgZHdjMl9oYW5kbGVf
dXNiX3N1c3BlbmRfaW50cg0KPiBmdW5jdGlvbi4iKSBjaGFuZ2VkIHRoZSB3YXkgdGhlIGRyaXZl
ciBoYW5kbGVzIHBvd2VyIGRvd24gbW9kZXMgaW4gYSBzdWNoDQo+IHdheSB0aGF0IGl0IHVzZXMg
Y2xvY2sgZ2F0aW5nIHdoZW4gbm8gb3RoZXIgcG93ZXIgZG93biBtb2RlIGlzIGF2YWlsYWJsZS4N
Cj4gDQo+IFRoaXMgaG93ZXZlciBkb2Vzbid0IHdvcmsgd2VsbCBvbiB0aGUgRFdDMiBpbXBsZW1l
bnRhdGlvbiB1c2VkIG9uIHRoZQ0KPiBTYW1zdW5nIFNvQ3MuIFdoZW4gYSBjbG9jayBnYXRpbmcg
aXMgZW5hYmxlZCwgc3lzdGVtIGhhbmdzLiBJdCBsb29rcyB0aGF0DQo+IHRoZSBwcm9wZXIgY2xv
Y2sgZ2F0aW5nIHJlcXVpcmVzIHNvbWUgYWRkaXRpb25hbCBnbHVlIGNvZGUgaW4gdGhlIHNoYXJl
ZA0KPiBVU0IyIFBIWSBhbmQvb3IgU2Ftc3VuZyBnbHVlIGNvZGUgZm9yIHRoZSBEV0MyLiBUbyBy
ZXN0b3JlIGRyaXZlcg0KPiBvcGVyYXRpb24gb24gdGhlIFNhbXN1bmcgU29DcyBzaW1wbHkgc2tp
cCBlbmFibGluZyBjbG9jayBnYXRpbmcgbW9kZQ0KPiB1bnRpbCBvbmUgZmluZHMgd2hhdCBpcyBy
ZWFsbHkgbmVlZGVkIHRvIG1ha2UgaXQgd29ya2luZyByZWxpYWJseS4NCj4gDQo+IEZpeGVzOiAw
MTEyYjdjZTY4ZWEgKCJ1c2I6IGR3YzI6IFVwZGF0ZSBkd2MyX2hhbmRsZV91c2Jfc3VzcGVuZF9p
bnRyIGZ1bmN0aW9uLiIpDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5
cHJvd3NraUBzYW1zdW5nLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy91c2IvZHdjMi9jb3JlLmgg
ICAgICB8IDQgKysrKw0KPiAgIGRyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMgfCAzICsrLQ0K
PiAgIGRyaXZlcnMvdXNiL2R3YzIvaGNkLmMgICAgICAgfCA2ICsrKystLQ0KPiAgIGRyaXZlcnMv
dXNiL2R3YzIvcGFyYW1zLmMgICAgfCAxICsNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMi9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmUuaA0KPiBpbmRleCBhYjZiODE1ZTAw
ODkuLjQ4M2RlMmJiZmFhYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9jb3JlLmgN
Cj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9jb3JlLmgNCj4gQEAgLTM4Myw2ICszODMsOSBAQCBl
bnVtIGR3YzJfZXAwX3N0YXRlIHsNCj4gICAgKgkJCTAgLSBObyAoZGVmYXVsdCkNCj4gICAgKgkJ
CTEgLSBQYXJ0aWFsIHBvd2VyIGRvd24NCj4gICAgKgkJCTIgLSBIaWJlcm5hdGlvbg0KPiArICog
QG5vX2Nsb2NrX2dhdGluZzoJU3BlY2lmaWVzIHdoZXRoZXIgdG8gYXZvaWQgY2xvY2sgZ2F0aW5n
IGZlYXR1cmUuDQo+ICsgKgkJCTAgLSBObyAodXNlIGNsb2NrIGdhdGluZykNCj4gKyAqCQkJMSAt
IFllcyAoYXZvaWQgaXQpDQo+ICAgICogQGxwbToJCUVuYWJsZSBMUE0gc3VwcG9ydC4NCj4gICAg
KgkJCTAgLSBObw0KPiAgICAqCQkJMSAtIFllcw0KPiBAQCAtNDgwLDYgKzQ4Myw3IEBAIHN0cnVj
dCBkd2MyX2NvcmVfcGFyYW1zIHsNCj4gICAjZGVmaW5lIERXQzJfUE9XRVJfRE9XTl9QQVJBTV9O
T05FCQkwDQo+ICAgI2RlZmluZSBEV0MyX1BPV0VSX0RPV05fUEFSQU1fUEFSVElBTAkJMQ0KPiAg
ICNkZWZpbmUgRFdDMl9QT1dFUl9ET1dOX1BBUkFNX0hJQkVSTkFUSU9OCTINCj4gKwlib29sIG5v
X2Nsb2NrX2dhdGluZzsNCj4gICANCj4gICAJYm9vbCBscG07DQo+ICAgCWJvb2wgbHBtX2Nsb2Nr
X2dhdGluZzsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMgYi9k
cml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQo+IGluZGV4IGE1YWIwMzgwOGRhNi4uYTVjNTJi
MjM3ZTcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRyLmMNCj4gQEAgLTU1Niw3ICs1NTYsOCBAQCBz
dGF0aWMgdm9pZCBkd2MyX2hhbmRsZV91c2Jfc3VzcGVuZF9pbnRyKHN0cnVjdCBkd2MyX2hzb3Rn
ICpoc290ZykNCj4gICAJCQkJICogSWYgbmVpdGhlciBoaWJlcm5hdGlvbiBub3IgcGFydGlhbCBw
b3dlciBkb3duIGFyZSBzdXBwb3J0ZWQsDQo+ICAgCQkJCSAqIGNsb2NrIGdhdGluZyBpcyB1c2Vk
IHRvIHNhdmUgcG93ZXIuDQo+ICAgCQkJCSAqLw0KPiAtCQkJCWR3YzJfZ2FkZ2V0X2VudGVyX2Ns
b2NrX2dhdGluZyhoc290Zyk7DQo+ICsJCQkJaWYgKCFoc290Zy0+cGFyYW1zLm5vX2Nsb2NrX2dh
dGluZykNCj4gKwkJCQkJZHdjMl9nYWRnZXRfZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3RnKTsNCj4g
ICAJCQl9DQo+ICAgDQo+ICAgCQkJLyoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIv
aGNkLmMgYi9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQo+IGluZGV4IDAzNWQ0OTExYTNjMy4uMmE3
ODI4OTcxZDA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzIvaGNkLmMNCj4gQEAgLTMzMzgsNyArMzMzOCw4IEBAIGludCBkd2My
X3BvcnRfc3VzcGVuZChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIHUxNiB3aW5kZXgpDQo+ICAg
CQkgKiBJZiBub3QgaGliZXJuYXRpb24gbm9yIHBhcnRpYWwgcG93ZXIgZG93biBhcmUgc3VwcG9y
dGVkLA0KPiAgIAkJICogY2xvY2sgZ2F0aW5nIGlzIHVzZWQgdG8gc2F2ZSBwb3dlci4NCj4gICAJ
CSAqLw0KPiAtCQlkd2MyX2hvc3RfZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3RnKTsNCj4gKwkJaWYg
KCFoc290Zy0+cGFyYW1zLm5vX2Nsb2NrX2dhdGluZykNCj4gKwkJCWR3YzJfaG9zdF9lbnRlcl9j
bG9ja19nYXRpbmcoaHNvdGcpOw0KPiAgIAkJYnJlYWs7DQo+ICAgCX0NCj4gICANCj4gQEAgLTQ0
MDIsNyArNDQwMyw4IEBAIHN0YXRpYyBpbnQgX2R3YzJfaGNkX3N1c3BlbmQoc3RydWN0IHVzYl9o
Y2QgKmhjZCkNCj4gICAJCSAqIElmIG5vdCBoaWJlcm5hdGlvbiBub3IgcGFydGlhbCBwb3dlciBk
b3duIGFyZSBzdXBwb3J0ZWQsDQo+ICAgCQkgKiBjbG9jayBnYXRpbmcgaXMgdXNlZCB0byBzYXZl
IHBvd2VyLg0KPiAgIAkJICovDQo+IC0JCWR3YzJfaG9zdF9lbnRlcl9jbG9ja19nYXRpbmcoaHNv
dGcpOw0KPiArCQlpZiAoIWhzb3RnLT5wYXJhbXMubm9fY2xvY2tfZ2F0aW5nKQ0KPiArCQkJZHdj
Ml9ob3N0X2VudGVyX2Nsb2NrX2dhdGluZyhoc290Zyk7DQo+ICAgDQo+ICAgCQkvKiBBZnRlciBl
bnRlcmluZyBzdXNwZW5kLCBoYXJkd2FyZSBpcyBub3QgYWNjZXNzaWJsZSAqLw0KPiAgIAkJY2xl
YXJfYml0KEhDRF9GTEFHX0hXX0FDQ0VTU0lCTEUsICZoY2QtPmZsYWdzKTsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMgYi9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5j
DQo+IGluZGV4IDY3YzVlYjE0MDIzMi4uNTllMTE5MzQ1OTk0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MyL3BhcmFtcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMN
Cj4gQEAgLTc2LDYgKzc2LDcgQEAgc3RhdGljIHZvaWQgZHdjMl9zZXRfczNjNjQwMF9wYXJhbXMo
c3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiAgIAlzdHJ1Y3QgZHdjMl9jb3JlX3BhcmFtcyAq
cCA9ICZoc290Zy0+cGFyYW1zOw0KPiAgIA0KPiAgIAlwLT5wb3dlcl9kb3duID0gRFdDMl9QT1dF
Ul9ET1dOX1BBUkFNX05PTkU7DQo+ICsJcC0+bm9fY2xvY2tfZ2F0aW5nID0gdHJ1ZTsNCj4gICAJ
cC0+cGh5X3V0bWlfd2lkdGggPSA4Ow0KPiAgIH0NCj4gICANCj4gDQpJbiB3aGljaCBtb2RlIGhv
c3QvZGV2aWNlIHlvdSBzZWUgdGhlIGlzc3VlPw0KV2hhdCBpcyB5b3VyIGNvcmUgdmVyc2lvbj8g
UGxlYXNlIHByb3ZpZGUgR0hXQ0ZHMS00IHJlZ2lzdGVycyB2YWx1ZXMuDQpJcyB0aGUgaXNzdWUg
c2VlbiBiZWNhdXNlIG9mIHByb2dyYW1taW5nIFBDR0NUTC5QQ0dDVExfR0FURUhDTEsgYml0IA0K
b25seT8gVG8gY2hlY2sgaXQsIGNvdWxkIHlvdSBwbGVhc2UgY29tbWVudCB0aGlzIGJpdCBzZXR0
aW5nL3Jlc2V0dGluZyANCmluIGNsb2NrIGdhdGluZyBmdW5jdGlvbnM6DQpkd2MyX2hvc3RfZXhp
dF9jbG9ja19nYXRpbmcoKQ0KZHdjMl9ob3N0X2VudGVyX2Nsb2NrX2dhdGluZygpDQpkd2MyX2dh
ZGdldF9leGl0X2Nsb2NrX2dhdGluZygpDQpkd2MyX2dhZGdldF9lbnRlcl9jbG9ja19nYXRpbmco
KQ0KDQpUaGFua3MsDQpNaW5hcw0KDQoNCg==
