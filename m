Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CA2C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95AC160EE9
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236297AbhHEJWX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:22:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59100 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236825AbhHEJWX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:22:23 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CF3B040C23;
        Thu,  5 Aug 2021 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1628155329; bh=sB7bxPxYLhOSCJUlqZaHorD23szwXuAT37xh33E4zps=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jPAoehWR5HjdniGAkHyN0ZeLk+KSpWYwrdKF1Sur7m2k7xX3io1EI4Eb22e7NJsBH
         b8a6aA1VZ3XLcWAmlKL5QTOa62aTHeJQ0GuIMIFc0QT6VNdB29W/h927qEy+ibTYs3
         6IpbzCtCP2o7fmL2FzqA0tiGvPVFNZK1/ZVENomgsmERLJqpvPtuZD/O+EZmxBKOXy
         f13JEzNni845NsDUKNIjRchJ8kDe2JrkN9LI9mAzlOVQNIhZdf5zBhM97w4rjhvEC4
         0vh3C/WfGm3vF3CZU8lmtBs/DhWB/fTIb2+4BvZp6TK2RYh2wCGLC93/+si9BsbRdw
         6IbKNF7szscqg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4E231A0081;
        Thu,  5 Aug 2021 09:22:07 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 71E0180219;
        Thu,  5 Aug 2021 09:22:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="DE5R0s2/";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqWbnuWOEHrO4VlHxXovvse6efNw2no/3umHgSSQ+ILnbnOFXFhM8OGnvTHhsOE4zswvWvrufQ2F/rpCKuu5IYoElXCXEaVmOSfR6gipzxXkinIV+bHkaaA0GfhRs5+JG0cjbMU9mkoyX6zTQJ19XTTgncz3183NZKPJ8znDYgjPyl4elhfaBKJR9Eyc/jhzLmWSb0zn8+OP6gDRBrhWeWnBMYltTdFS9Si3tH2UgPjE1qpcV57l3tzN49Sa3kyG/va53waF5NYs/oUUoucwRNJxRxs6XuXKNupaRzlyz45Fou1eZmpBt0VwT4NX4cNhZHCEI8RuKRNIHXuVcywDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB7bxPxYLhOSCJUlqZaHorD23szwXuAT37xh33E4zps=;
 b=Hag+/HgCwmSenB5EM9t4ZXF4peWmFn9KF7xoMV0nYmQflQCnMxetOX3PZQ93bDDDaeEbBNXTaxdEe6HD6BRe447VAtggbrYswmnFF0dXuogmuc+lY9yivA/Qp/KF7n2RSnUMMjDtd4KaqlS7njIWQ0Ixh7T7kFHn/3wWYtBeDTni6lg0bvdKv8omxqsPD3o4Rzl+2XMTPho00kQmuJyod2Lwp5UeIB692ABQfyOpfkLSuihkSbyXlcGDaktyJZ9S42h+GanHp4xL+eln6inCgutnZWZeQmyRIX/oXElSk59zNaxNcAhUyMeuw8jGtQEcv5gaHtkuu11+1s7qQdtVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB7bxPxYLhOSCJUlqZaHorD23szwXuAT37xh33E4zps=;
 b=DE5R0s2/vUbTUkwh2pixA+t2DqConVJM9jSGW52MbFlVwHczsPsDYr16Q77OlY5AD7GVj0omlxVWk5mhw0Hq70xsREUgWNyIVfpiAYVWEe7O/o/AzmWXixuoWy/fRIzEWFlPM9/XNlfePIb4hpH+RKdRL+eEWCCgkkaohcXqEDU=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 09:22:05 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 09:22:05 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] usb: dwc2: rename DWC2_POWER_DOWN_PARAM_NONE state
Thread-Topic: [PATCH 1/2] usb: dwc2: rename DWC2_POWER_DOWN_PARAM_NONE state
Thread-Index: AQHXiSYbucVglw0ktUGxisP/QMlkOatkoqEAgAABxwA=
Date:   Thu, 5 Aug 2021 09:22:05 +0000
Message-ID: <b7855705-892c-14e5-0290-ce7c49b87121@synopsys.com>
References: <CGME20210804114433eucas1p134417b605abeb57728d358fc2f42162b@eucas1p1.samsung.com>
 <20210804114421.10282-1-m.szyprowski@samsung.com>
 <YQusPurbybrNly+b@kroah.com>
In-Reply-To: <YQusPurbybrNly+b@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1084e823-548e-4fc9-bbe2-08d957f27dbe
x-ms-traffictypediagnostic: DM4PR12MB5311:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5311C04100C22DB3465D0AB9A7F29@DM4PR12MB5311.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cVYbwiaSGurpk57Vrsfdy6EB3ycQh8Po+hEBlj7IYVWuZdKQBeozBRXjS88inhVcWoNHCoRo46B+JeKXRbvCfzewwXDp50em19Gm2j6FzFUVBCcW4xcxYBJmkMRPxgZqFU3fyIgTagKkUltH55Wdf2R7eiDJd1kaXLKgU462ggIkw0OTvAAgZgRAXYWZt2tHtDaBveXys669gm5U4SVTkeXoxbRdY2ipbaNdqKKqnhNJRq5peDNzg/LawdUXw7o43ZguI8pgYZxxrq5UFtTwbi3jwlXkFtQaLDb/oRsxeaiSR7wLknep8btZ8s4OUiO7W7Vq5kxHUUzE7wDfimfXDVhzwZX6vsKp0JjhUHFJ1jPieKw4N0iwtCwZDgTZlkc1V3bodnXoLe9YldVbs7/WEFLm4IFdyev6I2RlWn4NiYzyNPL5wtCFzxJ71n5t1Zii4FlnBGSz0/WVP1vGEMOwNHp5bbMYCCjFlzNdsNCPKKklayDbdB8Jo9M2gUSohj3HZ2FPFwladSOgNKT0yEKOs4uaVB+7TKoLIvjwwDYZF6/RlDf6k+dXWHHCGUdNccC8d+i4h0KJsWPv0VDmI+nVQrUl8LihWe1fY3tTFEx96IkZHDL4IAwXXbfYew1qyz/dlOsMpCH83Ls8vEWEPnhYcrTKacehotpzVQ/0me7tcq3oQehg9cAU0IeOw1K/QDDaKO51c13ZJJQ6it3g3GqZiCOZTVjgNigOLy2VuiGeeS162ntuWLVW7NWmx6fXhFd8q0JwzFuccfEceoFSHXOdX6lVKwNfy5xVjza7+AovaSQMCdSngRh5lgW9h+blCSVOX5uQOTMkumYOrTDbNjU4u8Wnl3EWh/ur32Gtc/un3n4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(26005)(38100700002)(122000001)(53546011)(966005)(66446008)(508600001)(186003)(4326008)(316002)(110136005)(64756008)(66556008)(76116006)(54906003)(91956017)(31686004)(83380400001)(2906002)(8936002)(66476007)(66946007)(71200400001)(38070700005)(36756003)(2616005)(31696002)(6486002)(86362001)(4744005)(5660300002)(8676002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTh5cVlkdXZ3SlYrZE9hK1BZRDNmWlVKNUFFbnJWTUUyczVhR0NMQ0lwOVF4?=
 =?utf-8?B?eE1kM1UrYkgzWnNYNTFqc3VxUjZYcEZEY3RjT3RqSTJ4UFpIUncxYnQ2UnVl?=
 =?utf-8?B?UzFtUTRRNjNNV0hKNkZnNHBrWUIrMUxuM0c0OFNSREdUUEpna2dEYzFhYjVs?=
 =?utf-8?B?QzU3UHlGRC91MlZmM01iWDlvVGZYRVpReThjalhqTGJSSUV3akpVSlBZRERX?=
 =?utf-8?B?eW5adm1jaE1LODl1NTlEUUowSmhNOCsvMmxMMnJLWUF0VlZmTEhURnlONGhP?=
 =?utf-8?B?Ylc5ZGJhT0NyWkkyODNHN2E3cS9LcHF3L2o4ZVFabnVkWVFZaGJhVHNPaXNO?=
 =?utf-8?B?K2V4bWZFaXdiZllTd2hEVE4vektHWDJZVmpjOFlMZVRIZ3p1cXBDN1dIajU0?=
 =?utf-8?B?b3VyM1lOK2h2dXI3RDNmUFhwOGN3NHZNRXZ5aGRnUHNoRjhMRWR6aFlscVpN?=
 =?utf-8?B?Q2ZhM2NsclVZQ093ckdma0dvaVJmNVlVUk41VS80WStoL0FmV3F2Vm5VTm1H?=
 =?utf-8?B?U3U2R3BQMHhkeUN3R0dTYlVuMDJJRlptSmxVRnBaWFJEcVJPSVZUR04zakla?=
 =?utf-8?B?Nm45WXBLd25mVlNBcWhJYzZuRnNDdXBFOGlwdzcvN2E4bDlrS1Fid3dzdHJu?=
 =?utf-8?B?dU9uL3l4KzZvc3pZSGNscWlPbXR6RGNSM0NQeElrRTlZWlFVemdqUm10dndj?=
 =?utf-8?B?dUZ5WnlEZTlhU2xhNEJ1ZStFb3cva2Y3bEx2MHRYUXQ5N0NKZWVlVW1yUUlN?=
 =?utf-8?B?dTQyZFZZTGk1WEh0dU0zSHE2OVpNckxCWXAyVTh2eFdWS3hzL1pSNmpoMFA2?=
 =?utf-8?B?YXlQdmE0a3JkUTYvYk1iQmppektUMnBvN2N1MFVnK3YxUThRaUhJRkRrMzlK?=
 =?utf-8?B?REQ5cHhzUVBpbXQ5ekNnUHh2akpGcnIzRmREMy9vZkd1bjVPZXJweEVJakhp?=
 =?utf-8?B?dG1zblRoRXoyejk1Tk53d0xwTmFSS2NCOStXTjRkT0NyTHZqWmppVHhwVUdh?=
 =?utf-8?B?cy9Vc1dMeGQzdWpDUDQrZWdvWnZJME9SZTZ5ZmNlYXBTZGpPaTJmUm92N2tN?=
 =?utf-8?B?WXZLTTdWWGloaXBVdGFEVDJmMWJMbVJ0dGZZUjlTd3JScy9jMjJtRWU4RERI?=
 =?utf-8?B?K0FQdjBFZE1jUVA4U0Rtdkp4T2picFlWdEJxVGQxRUlhQWljaVd1VzhUYUE2?=
 =?utf-8?B?cGI2Wk41VXNnR2hIZVFqbDhTWlRqbUdrMno1UkwvREFFWUN3NWdGaUFEL1BJ?=
 =?utf-8?B?Yi9ZVGliMURPUTlLMWlsbUtEWFJiUnlSdnNQd2hGcncxMXFrWWNraFZwQ1A3?=
 =?utf-8?B?L2xCNkpJVVA1Y2RYVzFyZWhHZ09XWkV6dWdtUGJ1QWI3Vjh4NnFOVGtEZU1m?=
 =?utf-8?B?ZDFwTmpHeGNZVTM5WGlPUytrcmYxOFcwYk5sbDJwdnlpbkhLMjJkdWFqQXQ3?=
 =?utf-8?B?a3FyV1hHbUQzT2F3cTR6Y1JBa1VEc3lFWjcyQzdIWE5tcHcyWDNscU9od2xX?=
 =?utf-8?B?SkMxa1NrMmZTbVZGSy96NWVCZ3UwZllDMUk3S0k0S01NdG9sdzFPZHpFQzlw?=
 =?utf-8?B?MHp4VXZoQzFCd0FFbDF5SG5qYURoNEZ0WHBtZDZpTDdlZjRNR2xDakMwL3lX?=
 =?utf-8?B?YnNQODY5NmgzZ0dwR2NpdzI4Yzk1RndJcVlCTnQ4cW9ua2tOUkFnaGhGSzJM?=
 =?utf-8?B?REhNVFRNWkFHQ2Jwcld3bzEyN2pFVzVmTFpBcDhlby9oT3dJS2pHeHhrOWV6?=
 =?utf-8?Q?aP92o0Ifnq4Q7xl0z2E/utOwspta0qXd+xPu4WT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AED39C068D195C4D950F6E3893E1B40A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1084e823-548e-4fc9-bbe2-08d957f27dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 09:22:05.2641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rhkdVnGgkztXA5mFnAvXRmKJv1QMkssC/HstIk0w4TSXvcC2poyqHedCtuRlQxM0u/FU3BBhNBJKKdsRxucreQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5311
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SGkgR3JlZywNCg0KT24gOC81LzIwMjEgMToxNSBQTSwgR3JlZyBLSCB3cm90ZToNCj4gT24gV2Vk
LCBBdWcgMDQsIDIwMjEgYXQgMDE6NDQ6MjBQTSArMDIwMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90
ZToNCj4+IERXQzJfUE9XRVJfRE9XTl9QQVJBTV9OT05FIHJlYWxseSBtZWFucyB0aGF0IHRoZSBk
cml2ZXIgc3RpbGwgdXNlcyBjbG9jaw0KPj4gZ2F0aW5nIHRvIHNhdmUgcG93ZXIgd2hlbiBoYXJk
d2FyZSBpcyBub3QgdXNlZC4gUmVuYW1lIHRoZSBzdGF0ZSBuYW1lIHRvDQo+PiBEV0MyX1BPV0VS
X0RPV05fUEFSQU1fQ0xPQ0tfR0FUSU5HIHRvIG1hdGNoIHRoZSBkcml2ZXIgYmVoYXZpb3IuDQo+
Pg0KPj4gU3VnZ2VzdGVkLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8TWluYXMuSGFydXR5dW55YW5A
c3lub3BzeXMuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlw
cm93c2tpQHNhbXN1bmcuY29tPg0KPj4gLS0tDQo+PiBUaGlzIGlzIGEgZm9sbG93LXVwIG9mIHRo
aXMgZGlzY3Vzc2lvbjoNCj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC11c2IvMjYwOTlkZTEtODI2Zi00MmJmLTBkZTctNzU5YTQ3ZmFm
NGEwQHNhbXN1bmcuY29tL19fOyEhQTRGMlI5R19wZyFMRzAxMkU0THpPNHFWZ1daSHVfM2VUYlo1
em1kSTRxRU5IYk91dUx3bS1JbGhIRjlLS0lhWXlKTmFZMnZYZWckDQo+Pg0KPj4gVGhpcyBzaG91
bGQgYmUgYXBwbGllZCBvbiB0b3Agb2YgdjUuMTQtcmMzLg0KPiANCj4gV2hhdCBlbHNlIHdvdWxk
IEkgYXBwbHkgaXQgb24gdG9wIG9mLCB3ZSBjYW4ndCBnbyBiYWNrIGluIHRpbWUgOikNCj4gDQo+
IFdoZXJlIGlzIHRoaXMgbmVlZGVkIGZvciA1LjE0LWZpbmFsLCBvciBmb3IgNS4xNS1yYzE/DQo+
IA0KDQpJIHdvdWxkIHByZWZlciB0byBhcHBseSB0byA1LjE0LWZpbmFsLiBKdXN0IEkgbmVlZCAx
IG1vcmUgZGF5IHRvIA0KY29tcGxldGUgdGVzdGluZy4gSGF2ZSBJIHRoaXMgYWRkaXRpb25hbCBk
YXk/DQoNClRoYW5rcywNCk1pbmFzDQoNCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBrLWgNCj4gDQoN
Cg==
