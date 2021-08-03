Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDB8C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Aug 2021 10:08:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BF2960E09
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Aug 2021 10:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235221AbhHCKJA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Aug 2021 06:09:00 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:43424 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235199AbhHCKI7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Aug 2021 06:08:59 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DE13FC0AB0;
        Tue,  3 Aug 2021 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627985329; bh=rwwwQNoD8Z8zL1UCXuJbDVTPVLR8pZ4Y5DIzdAaOmwk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=A+GbHbnjqFwNlqW8S4DYhwMAcJnouJQYINUXNkAw1Ip3SKXk5Hxm9dkuA0PpltJMR
         4rQgcU5J//Uqqh6vI3ptoaWUa72nPeJEONmpnQ2URXBlK5xvoZAbyGOPsniyf9VlGt
         SjVc9rr26NX4/mZ6PWDgu+YL1OhMU9RYKijD8tDkkMDYXCOzggPWb743bjXTJpN28o
         HeRy+Z+thcEmmkw9sMetAACjS/WLNu/dL12EKEYzc1QOlciinV0iRHmwvHsMqJZqtG
         3rQjiPBoatgFOR/+irII5/fmBo1FDwukUYRZVyCnQH6WmKJSwp0X5DCe6BH1RpJELx
         aP+OaMSTosdqA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2AEE4A0071;
        Tue,  3 Aug 2021 10:08:47 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2CE8B40031;
        Tue,  3 Aug 2021 10:08:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sDmQcIOE";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdyNzXTUL5Gngs9srzS9btg2MbN6LOSsIWZeEfpQAsCNj0kDnLze880e7//xgY09NIbX3mio31NcXHPre7WoLgCnl77wMskYSu1XNK9CzdS0UTYHE7iiHGGSlt1xy/gJvkgnV8uH5NfXMR7zwLZwWGDfYEJ2lSXMCmf5nqRYsvD3Hdy6mfCZpZ1N0SzmPwkoMnNZXimlEQjg7Tu9Zm/+sTkp9Oy66itBPnvAFP61bvZOqT5j/y8XG248aQS8v3QGwkoz0vt/hwwnBzOl98MwITmv4YeiVHT+5rI0wxkWTxUDFDGrvRAn41QNMjfhBK219VUHzG7m7Aa0HvbNxt50Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwwwQNoD8Z8zL1UCXuJbDVTPVLR8pZ4Y5DIzdAaOmwk=;
 b=PASFA6i+BZ6vOvwpaDaCxNfr3e8yV1ocqA6Hn4p8D/ikzHXOa4KAI/xAOuUyv01OEANlUYDEArSrP8LyXoyO4WQzAs6/SwIZqmgtVPIP1KfHGUP5bYzy3wjvJ5hGqJwgog+yQcC9MblRMRdrcJ/4Re2FVUM5aX12AA4WruSdpzA/MxAWBmT7dd+RkKdNuekBfMNM/FFHACOnDqO2fsHmyyuub8sO9et3//Xag0yUpf/ZeH1Evh0gcrmxNLNcnTxVIQDMyvxLp67AQDhLbic6vMF2Lm3kCjvUzwkhXkQg0smk3i0oC6jDUbbf5S4cssMNIslcgcGRRGLN5xandANwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwwwQNoD8Z8zL1UCXuJbDVTPVLR8pZ4Y5DIzdAaOmwk=;
 b=sDmQcIOEoi42tSwzlwyxmLylXyhgYzTBcqJ7mwHXMSnww/A874WgPKxG8NlWbAgwGt+BzPat72YGpAMfckObvD5IRxVsWzqrnGE1DC6j/JfQ9MmLWhUiC9Pn6U/TXJfzKKho7FwIwbVAZ3lpGOaMqGkm97tYCY9CVZ4jeH3dxGI=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5054.namprd12.prod.outlook.com (2603:10b6:5:389::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 10:08:46 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 10:08:45 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
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
Thread-Index: AQHXef+pNOqQl/JGqEq/TztwoCjZgatFsN2AgBvyMQCAAAgHAA==
Date:   Tue, 3 Aug 2021 10:08:45 +0000
Message-ID: <19ddcd51-1f1c-52a8-8eaf-dabf7425d395@synopsys.com>
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
 <20210716050127.4406-1-m.szyprowski@samsung.com>
 <a7efdf13-48bb-db21-5755-ebbbe2614f78@synopsys.com>
 <0d8de3e0-341b-f751-909d-22aa16e91717@samsung.com>
In-Reply-To: <0d8de3e0-341b-f751-909d-22aa16e91717@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78324c32-58af-4d16-c5f4-08d95666ae3e
x-ms-traffictypediagnostic: DM4PR12MB5054:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5054E37E85E40F5D9973A7A3A7F09@DM4PR12MB5054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HJlZTJlkxelY1B34vd4LymeNn2w0fQTx0oK7+R9QDoYmmhncfTGzjSmGGKxVmzwDd7klxCGSP+ZL/xdALiCDAzgEzMXyVacbdY6EVZUjHaFQ5WHBQA+zvj/VodpnQR9xRKaBSvusMaUz8E3/o9Uxwf/ZgjYPy2cDP+JqGifP2L4PM2VFjKnDM/Q3PDTBuHF5GI80ehjMD8dUk4gLhrMeaFWHmeWOPquvsqBtg4W+NieFknBDj84MSOsQCrzPfRSdY3kJFpJY15Bj9wjkiJpzhamCf5NKCH7JPdmnjtBB89OpJ9LBD4AcR512XKB70GBFO+L6KIKxiw5rrCkYsyLYPTltKbFmf2wf+YwWJ7E1ZvJQUU7+Q49he1Z0EnMzCjssi6LJ5BKqC3MBNH+X4hTnOe0VshTX1Znj0HY+axAXepr7Yk3EOLcvGtSqTq02CXZCQCx6UHC6BJ4i2v0SF1PFsp7bvaBWmfL0FC5rCg2xTP6JHxDzD9/U0oCRVeREON0UqY+KFkOyRP/ONYsBrut5j3u7iag5zuYn+GKtiEcTNnRUJjOKyTrM6c0/eBFOHxAU0LdBTJ3AT00PyIYPmYX/SC3JXBrzV/4cR5rvJ8nOdTamC1dfCn/uYHaCFe1aFDv1dC/f4cdfT6hXgH7nVS/m9A/mXNMrkcBtwtyeXwaliObHgWbXaptcxgup/m2QIJxDBTHhenM8kRZLdSA/4nSJIVqCwM7Y6ffXfq2K+jin1iZhLFRYLwZlXpSN/GS/lnysGrGX0rdiBlLE6SWtC/nyVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(396003)(376002)(136003)(366004)(346002)(39860400002)(38100700002)(71200400001)(2616005)(5660300002)(6506007)(53546011)(316002)(2906002)(54906003)(6486002)(31686004)(478600001)(110136005)(4326008)(8676002)(66556008)(66476007)(186003)(66946007)(66446008)(64756008)(8936002)(86362001)(31696002)(91956017)(76116006)(83380400001)(122000001)(38070700005)(26005)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHZ2YW5tSE5ucmZOUE02MEJXREFaWFAxcy9COTB5OGlRaXRlREw1emVxczVQ?=
 =?utf-8?B?SUZyZ0NLV2ZHd2tidG1hcVdsRWdaMVQyMzBYSU9KcjdWbzUvakFreE9jYlJF?=
 =?utf-8?B?Y3ZhQXBEVmlpMjNkNE1WWUN4Sk91R0ZpU1VVVGsyTjQ4SG1hVkhoY1FvdWRr?=
 =?utf-8?B?cFU1dnp2Si9WYWdXakg1c2lpQWNGYkp3MW8zc2M2UEY3OCtHQjdYUnhvb255?=
 =?utf-8?B?ak5tMTFCRm41NGVRTEFYekFoV2tSYjJaNTNXRld4M1RMdDRKVzUvdU55S2Mw?=
 =?utf-8?B?ZE44VUJIVmFRd2NKUVZ1MmtyK2dDZDlYVkhVRVFJVWtLNEN0dXlwQzNQTW9X?=
 =?utf-8?B?eWlQK1lYeXIzbnYrcEh6Tk5ncUlTWFp1M3pGYkhDTmRnMFNtZGZBRnNkeE5G?=
 =?utf-8?B?OHN2ZXlMQ0ZMYmJCNWp5RUttdkgycnBXQ0NVVE0zUXNoc3dWNUdId0Ftd0NR?=
 =?utf-8?B?L0Rzck9FdVNaa1V0WW50RG1CZ0lpMmZ4aldXdjFSZWg4NW5hRnJpSmJoYzJ0?=
 =?utf-8?B?TDZ5RkNzaC9hNDJwQ1daTEljR1dwSHNhS1cycCtTaHRQbGNPblI2RElyenpx?=
 =?utf-8?B?bXVMVFdmbHRxZDJzZHU0dStPcjk4RVU0YXhYeE9KdkNmT1JkTXkrRUw1Qk56?=
 =?utf-8?B?ZEpkZnY5dEFodkdhYzFxTHpHQmg2M0FTSXpMWGZaWmlLMDRCN2FGK3hwNlBh?=
 =?utf-8?B?K3BuQ0dub3VCYzVPMzV4R1BJaUlkeVRSR094cmJIMVhUVWt2VUlocWp5Mk1M?=
 =?utf-8?B?OE9lVW5sell6NWR6YmsrS1hNRks4MGdYTGw4c0tEZzV4dE0wUDRHSEU5S1p1?=
 =?utf-8?B?YVN5ZE0xaEsrQ1BsdlhsbHVnQWVIQUhhYnp2MWhlYXdFcjRZMzArUU0va3BV?=
 =?utf-8?B?NkVzemkzRENQYVordjdhZnBJdUZOLzZIU2R5ckdPd3ZqQnV4enRzZFJpNGhF?=
 =?utf-8?B?bDJkV1dkZDMwcWNLNEp5OEV1MjFrUXZUWGtnMytNSGM5VmxNZzFkVGlkdEg1?=
 =?utf-8?B?eVNrMUNIeUttWE1uVzl6YzhweDdMOWhnWktHSEVtZEw2RTk0T3NQakcrWDJi?=
 =?utf-8?B?blFCQnE4NythOGVYNDZUR2NrSHpXV0oyK1Y4NlQzMHVVRHZDV0phcGlCTklQ?=
 =?utf-8?B?UmliOUJ0bnd4eFJha0dEN2lLS3lFdFBPai9xMWQ3QzhPa1d2QUpRd0U3S1ZO?=
 =?utf-8?B?a09qRSs0RUMxMUhtdEFXdjJwL0JlK0g5MWhLTVdjYys0VnB2cFArOU5relJm?=
 =?utf-8?B?QVVuRStza1VKaUNBdGxnck40ZU5jVFlmVXB5MHk4R0F3MlVYcHdHNEw5R1ly?=
 =?utf-8?B?NFh6UWxOUTdjei9FZG16aDMrZEhVb0pUSWpBNWJmR2xjbGZrQWlFajNHZFN4?=
 =?utf-8?B?N0xURXZ1Y0ZFc09kU2F5aENKNGVHNGN6N1lBcy92S0QxSlg2VUVIbFgzbUYx?=
 =?utf-8?B?ZmtlTkZYVVZCcXczbzJXODRMNzFNR2tZUTcrRmJBYTEvZVB1a2dDcS94V1lJ?=
 =?utf-8?B?YUNPaG12STI2NWQ1bnprZnpTMndXNDA1Z0tUMEsvSTNCTHQwNE5ZeXdpSGZ6?=
 =?utf-8?B?SW94dW16bFVoSkJCeVBORllUYUpkNXNOMWFYcFZ4RXZ0cnRoMG5pOFdnNjd0?=
 =?utf-8?B?ZytkVHU3RVZScjdMVy9CdTI2dXpLdW9rUVJBZm5jdEVvaU8zVWFoZE85MkdY?=
 =?utf-8?B?d3JOaUpOajlNdmMrV2ltaFBjY2Fld3JvNTdDNmtvSldTV0NWaU5UUXJTeVdp?=
 =?utf-8?Q?ROnm3dAblBEkxBxYuc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C685FE0F036A454D9F4E6B32CDF98650@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78324c32-58af-4d16-c5f4-08d95666ae3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 10:08:45.8782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LpJr4vZyFr6RVAqg9QNARX+/3f9m+j3yiMh5+EM2QkgKsbopvbLyoiFKHKUMZipHUwS+bPizo5/lOt04mZ/+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5054
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SGkgTWFyZWssDQoNCk9uIDgvMy8yMDIxIDE6NDAgUE0sIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6
DQo+IEhpIE1pbmFzLA0KPiANCj4gT24gMTYuMDcuMjAyMSAxNjo1NCwgTWluYXMgSGFydXR5dW55
YW4gd3JvdGU6DQo+PiBPbiA3LzE2LzIwMjEgOTowMSBBTSwgTWFyZWsgU3p5cHJvd3NraSB3cm90
ZToNCj4+PiBDb21taXQgMDExMmI3Y2U2OGVhICgidXNiOiBkd2MyOiBVcGRhdGUgZHdjMl9oYW5k
bGVfdXNiX3N1c3BlbmRfaW50cg0KPj4+IGZ1bmN0aW9uLiIpIGNoYW5nZWQgdGhlIHdheSB0aGUg
ZHJpdmVyIGhhbmRsZXMgcG93ZXIgZG93biBtb2RlcyBpbiBhIHN1Y2gNCj4+PiB3YXkgdGhhdCBp
dCB1c2VzIGNsb2NrIGdhdGluZyB3aGVuIG5vIG90aGVyIHBvd2VyIGRvd24gbW9kZSBpcyBhdmFp
bGFibGUuDQo+Pj4NCj4+PiBUaGlzIGhvd2V2ZXIgZG9lc24ndCB3b3JrIHdlbGwgb24gdGhlIERX
QzIgaW1wbGVtZW50YXRpb24gdXNlZCBvbiB0aGUNCj4+PiBTYW1zdW5nIFNvQ3MuIFdoZW4gYSBj
bG9jayBnYXRpbmcgaXMgZW5hYmxlZCwgc3lzdGVtIGhhbmdzLiBJdCBsb29rcyB0aGF0DQo+Pj4g
dGhlIHByb3BlciBjbG9jayBnYXRpbmcgcmVxdWlyZXMgc29tZSBhZGRpdGlvbmFsIGdsdWUgY29k
ZSBpbiB0aGUgc2hhcmVkDQo+Pj4gVVNCMiBQSFkgYW5kL29yIFNhbXN1bmcgZ2x1ZSBjb2RlIGZv
ciB0aGUgRFdDMi4gVG8gcmVzdG9yZSBkcml2ZXINCj4+PiBvcGVyYXRpb24gb24gdGhlIFNhbXN1
bmcgU29DcyBzaW1wbHkgc2tpcCBlbmFibGluZyBjbG9jayBnYXRpbmcgbW9kZQ0KPj4+IHVudGls
IG9uZSBmaW5kcyB3aGF0IGlzIHJlYWxseSBuZWVkZWQgdG8gbWFrZSBpdCB3b3JraW5nIHJlbGlh
Ymx5Lg0KPj4+DQo+Pj4gRml4ZXM6IDAxMTJiN2NlNjhlYSAoInVzYjogZHdjMjogVXBkYXRlIGR3
YzJfaGFuZGxlX3VzYl9zdXNwZW5kX2ludHIgZnVuY3Rpb24uIikNCj4+PiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+DQo+Pj4gLS0tDQo+
Pj4gICAgIGRyaXZlcnMvdXNiL2R3YzIvY29yZS5oICAgICAgfCA0ICsrKysNCj4+PiAgICAgZHJp
dmVycy91c2IvZHdjMi9jb3JlX2ludHIuYyB8IDMgKystDQo+Pj4gICAgIGRyaXZlcnMvdXNiL2R3
YzIvaGNkLmMgICAgICAgfCA2ICsrKystLQ0KPj4+ICAgICBkcml2ZXJzL3VzYi9kd2MyL3BhcmFt
cy5jICAgIHwgMSArDQo+Pj4gICAgIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2Nv
cmUuaCBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5oDQo+Pj4gaW5kZXggYWI2YjgxNWUwMDg5Li40
ODNkZTJiYmZhYWIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMi9jb3JlLmgNCj4+
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmUuaA0KPj4+IEBAIC0zODMsNiArMzgzLDkgQEAg
ZW51bSBkd2MyX2VwMF9zdGF0ZSB7DQo+Pj4gICAgICAqCQkJMCAtIE5vIChkZWZhdWx0KQ0KPj4+
ICAgICAgKgkJCTEgLSBQYXJ0aWFsIHBvd2VyIGRvd24NCj4+PiAgICAgICoJCQkyIC0gSGliZXJu
YXRpb24NCj4+PiArICogQG5vX2Nsb2NrX2dhdGluZzoJU3BlY2lmaWVzIHdoZXRoZXIgdG8gYXZv
aWQgY2xvY2sgZ2F0aW5nIGZlYXR1cmUuDQo+Pj4gKyAqCQkJMCAtIE5vICh1c2UgY2xvY2sgZ2F0
aW5nKQ0KPj4+ICsgKgkJCTEgLSBZZXMgKGF2b2lkIGl0KQ0KPj4+ICAgICAgKiBAbHBtOgkJRW5h
YmxlIExQTSBzdXBwb3J0Lg0KPj4+ICAgICAgKgkJCTAgLSBObw0KPj4+ICAgICAgKgkJCTEgLSBZ
ZXMNCj4+PiBAQCAtNDgwLDYgKzQ4Myw3IEBAIHN0cnVjdCBkd2MyX2NvcmVfcGFyYW1zIHsNCj4+
PiAgICAgI2RlZmluZSBEV0MyX1BPV0VSX0RPV05fUEFSQU1fTk9ORQkJMA0KPj4+ICAgICAjZGVm
aW5lIERXQzJfUE9XRVJfRE9XTl9QQVJBTV9QQVJUSUFMCQkxDQo+Pj4gICAgICNkZWZpbmUgRFdD
Ml9QT1dFUl9ET1dOX1BBUkFNX0hJQkVSTkFUSU9OCTINCj4+PiArCWJvb2wgbm9fY2xvY2tfZ2F0
aW5nOw0KPj4+ICAgICANCj4+PiAgICAgCWJvb2wgbHBtOw0KPj4+ICAgICAJYm9vbCBscG1fY2xv
Y2tfZ2F0aW5nOw0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5j
IGIvZHJpdmVycy91c2IvZHdjMi9jb3JlX2ludHIuYw0KPj4+IGluZGV4IGE1YWIwMzgwOGRhNi4u
YTVjNTJiMjM3ZTcyIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZV9pbnRy
LmMNCj4+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmVfaW50ci5jDQo+Pj4gQEAgLTU1Niw3
ICs1NTYsOCBAQCBzdGF0aWMgdm9pZCBkd2MyX2hhbmRsZV91c2Jfc3VzcGVuZF9pbnRyKHN0cnVj
dCBkd2MyX2hzb3RnICpoc290ZykNCj4+PiAgICAgCQkJCSAqIElmIG5laXRoZXIgaGliZXJuYXRp
b24gbm9yIHBhcnRpYWwgcG93ZXIgZG93biBhcmUgc3VwcG9ydGVkLA0KPj4+ICAgICAJCQkJICog
Y2xvY2sgZ2F0aW5nIGlzIHVzZWQgdG8gc2F2ZSBwb3dlci4NCj4+PiAgICAgCQkJCSAqLw0KPj4+
IC0JCQkJZHdjMl9nYWRnZXRfZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3RnKTsNCj4+PiArCQkJCWlm
ICghaHNvdGctPnBhcmFtcy5ub19jbG9ja19nYXRpbmcpDQo+Pj4gKwkJCQkJZHdjMl9nYWRnZXRf
ZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3RnKTsNCj4+PiAgICAgCQkJfQ0KPj4+ICAgICANCj4+PiAg
ICAgCQkJLyoNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9oY2QuYyBiL2RyaXZl
cnMvdXNiL2R3YzIvaGNkLmMNCj4+PiBpbmRleCAwMzVkNDkxMWEzYzMuLjJhNzgyODk3MWQwNSAx
MDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL2hjZC5jDQo+Pj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMi9oY2QuYw0KPj4+IEBAIC0zMzM4LDcgKzMzMzgsOCBAQCBpbnQgZHdjMl9wb3J0
X3N1c3BlbmQoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnLCB1MTYgd2luZGV4KQ0KPj4+ICAgICAJ
CSAqIElmIG5vdCBoaWJlcm5hdGlvbiBub3IgcGFydGlhbCBwb3dlciBkb3duIGFyZSBzdXBwb3J0
ZWQsDQo+Pj4gICAgIAkJICogY2xvY2sgZ2F0aW5nIGlzIHVzZWQgdG8gc2F2ZSBwb3dlci4NCj4+
PiAgICAgCQkgKi8NCj4+PiAtCQlkd2MyX2hvc3RfZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3RnKTsN
Cj4+PiArCQlpZiAoIWhzb3RnLT5wYXJhbXMubm9fY2xvY2tfZ2F0aW5nKQ0KPj4+ICsJCQlkd2My
X2hvc3RfZW50ZXJfY2xvY2tfZ2F0aW5nKGhzb3RnKTsNCj4+PiAgICAgCQlicmVhazsNCj4+PiAg
ICAgCX0NCj4+PiAgICAgDQo+Pj4gQEAgLTQ0MDIsNyArNDQwMyw4IEBAIHN0YXRpYyBpbnQgX2R3
YzJfaGNkX3N1c3BlbmQoc3RydWN0IHVzYl9oY2QgKmhjZCkNCj4+PiAgICAgCQkgKiBJZiBub3Qg
aGliZXJuYXRpb24gbm9yIHBhcnRpYWwgcG93ZXIgZG93biBhcmUgc3VwcG9ydGVkLA0KPj4+ICAg
ICAJCSAqIGNsb2NrIGdhdGluZyBpcyB1c2VkIHRvIHNhdmUgcG93ZXIuDQo+Pj4gICAgIAkJICov
DQo+Pj4gLQkJZHdjMl9ob3N0X2VudGVyX2Nsb2NrX2dhdGluZyhoc290Zyk7DQo+Pj4gKwkJaWYg
KCFoc290Zy0+cGFyYW1zLm5vX2Nsb2NrX2dhdGluZykNCj4+PiArCQkJZHdjMl9ob3N0X2VudGVy
X2Nsb2NrX2dhdGluZyhoc290Zyk7DQo+Pj4gICAgIA0KPj4+ICAgICAJCS8qIEFmdGVyIGVudGVy
aW5nIHN1c3BlbmQsIGhhcmR3YXJlIGlzIG5vdCBhY2Nlc3NpYmxlICovDQo+Pj4gICAgIAkJY2xl
YXJfYml0KEhDRF9GTEFHX0hXX0FDQ0VTU0lCTEUsICZoY2QtPmZsYWdzKTsNCj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYyBiL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1z
LmMNCj4+PiBpbmRleCA2N2M1ZWIxNDAyMzIuLjU5ZTExOTM0NTk5NCAxMDA2NDQNCj4+PiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jDQo+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9w
YXJhbXMuYw0KPj4+IEBAIC03Niw2ICs3Niw3IEBAIHN0YXRpYyB2b2lkIGR3YzJfc2V0X3MzYzY0
MDBfcGFyYW1zKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4+PiAgICAgCXN0cnVjdCBkd2My
X2NvcmVfcGFyYW1zICpwID0gJmhzb3RnLT5wYXJhbXM7DQo+Pj4gICAgIA0KPj4+ICAgICAJcC0+
cG93ZXJfZG93biA9IERXQzJfUE9XRVJfRE9XTl9QQVJBTV9OT05FOw0KPj4+ICsJcC0+bm9fY2xv
Y2tfZ2F0aW5nID0gdHJ1ZTsNCj4+PiAgICAgCXAtPnBoeV91dG1pX3dpZHRoID0gODsNCj4+PiAg
ICAgfQ0KPj4+ICAgICANCj4+Pg0KPj4gSW4gd2hpY2ggbW9kZSBob3N0L2RldmljZSB5b3Ugc2Vl
IHRoZSBpc3N1ZT8NCj4gSSBkbyBteSB0ZXN0IGluIG15IGRldmljZSBtb2RlLg0KPj4gV2hhdCBp
cyB5b3VyIGNvcmUgdmVyc2lvbj8gUGxlYXNlIHByb3ZpZGUgR0hXQ0ZHMS00IHJlZ2lzdGVycyB2
YWx1ZXMuDQo+IA0KPiBUaGlzIGlzIGEgcmVzdWx0IG9mIGR3YzJfZHVtcF9nbG9iYWxfcmVnaXN0
ZXJzKCkgYWRkZWQganVzdCBhZnRlcg0KPiBkd2MyX2xvd2xldmVsX2h3X2VuYWJsZSgpIGluIGR3
YzJfZHJpdmVyX3Byb2JlKCk6DQo+IA0KPiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBDb3JlIEdsb2Jh
bCBSZWdpc3RlcnMNCj4gDQo+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdPVEdDVEzCoMKgwqDCoMKg
IEAweEUwMjYwMDAwIDogMHgwMDBEMDAwMA0KPiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHT1RHSU5U
wqDCoMKgwqDCoCBAMHhFMDI2MDAwNCA6IDB4MDAwMDAwMDANCj4gZHdjMiAxMjQ4MDAwMC5oc290
ZzogR0FIQkNGR8KgwqDCoMKgwqAgQDB4RTAyNjAwMDggOiAweDAwMDAwMDI3DQo+IGR3YzIgMTI0
ODAwMDAuaHNvdGc6IEdVU0JDRkfCoMKgwqDCoMKgIEAweEUwMjYwMDBDIDogMHgwMDAwNTQwRg0K
PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHUlNUQ1RMwqDCoMKgwqDCoCBAMHhFMDI2MDAxMCA6IDB4
ODAwMDAwNDANCj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogR0lOVFNUU8KgwqDCoMKgwqAgQDB4RTAy
NjAwMTQgOiAweDU0MDA4NDI4DQo+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdJTlRNU0vCoMKgwqDC
oMKgIEAweEUwMjYwMDE4IDogMHg4MDBDMzgwMA0KPiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHUlhT
VFNSwqDCoMKgwqDCoCBAMHhFMDI2MDAxQyA6IDB4NjE2RUM3N0QNCj4gZHdjMiAxMjQ4MDAwMC5o
c290ZzogR1JYRlNJWsKgwqDCoMKgwqAgQDB4RTAyNjAwMjQgOiAweDAwMDAwNDAwDQo+IGR3YzIg
MTI0ODAwMDAuaHNvdGc6IEdOUFRYRlNJWsKgwqDCoCBAMHhFMDI2MDAyOCA6IDB4MDQwMDA0MDAN
Cj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogR05QVFhTVFPCoMKgwqDCoCBAMHhFMDI2MDAyQyA6IDB4
MDAwODA0MDANCj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogR0kyQ0NUTMKgwqDCoMKgwqAgQDB4RTAy
NjAwMzAgOiAweDAwMDAwMDAwDQo+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdQVk5EQ1RMwqDCoMKg
wqAgQDB4RTAyNjAwMzQgOiAweDAwMDAwMDAwDQo+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdHUElP
wqDCoMKgwqDCoMKgwqAgQDB4RTAyNjAwMzggOiAweDAwMDAwMDAwDQo+IGR3YzIgMTI0ODAwMDAu
aHNvdGc6IEdVSUTCoMKgwqDCoMKgwqDCoMKgIEAweEUwMjYwMDNDIDogMHgwMDAwMDAwMA0KPiBk
d2MyIDEyNDgwMDAwLmhzb3RnOiBHU05QU0lEwqDCoMKgwqDCoCBAMHhFMDI2MDA0MCA6IDB4NEY1
NDI4MUENCj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogR0hXQ0ZHMcKgwqDCoMKgwqAgQDB4RTAyNjAw
NDQgOiAweDAwMDAwMDAwDQo+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdIV0NGRzLCoMKgwqDCoMKg
IEAweEUwMjYwMDQ4IDogMHgyMjhGRkM1MA0KPiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHSFdDRkcz
wqDCoMKgwqDCoCBAMHhFMDI2MDA0QyA6IDB4MUU4MDg0RTgNCj4gZHdjMiAxMjQ4MDAwMC5oc290
ZzogR0hXQ0ZHNMKgwqDCoMKgwqAgQDB4RTAyNjAwNTAgOiAweEZGRjA4MDMwDQo+IGR3YzIgMTI0
ODAwMDAuaHNvdGc6IEdMUE1DRkfCoMKgwqDCoMKgIEAweEUwMjYwMDU0IDogMHgwMDAwMDAwMA0K
PiBkd2MyIDEyNDgwMDAwLmhzb3RnOiBHUFdSRE7CoMKgwqDCoMKgwqAgQDB4RTAyNjAwNTggOiAw
eDAwMDAwMDAwDQo+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEdERklGT0NGR8KgwqDCoCBAMHhFMDI2
MDA1QyA6IDB4MDAwMDAwMDANCj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogSFBUWEZTSVrCoMKgwqDC
oCBAMHhFMDI2MDEwMCA6IDB4MDAwMDAwMDANCj4gZHdjMiAxMjQ4MDAwMC5oc290ZzogUENHQ1RM
wqDCoMKgwqDCoMKgIEAweEUwMjYwRTAwIDogMHgwMDAwMDAwMA0KPiBkd2MyIDEyNDgwMDAwLmhz
b3RnOiBkd2MyX2NoZWNrX3BhcmFtczogSW52YWxpZCBwYXJhbWV0ZXIgYmVzbD0xDQo+IGR3YzIg
MTI0ODAwMDAuaHNvdGc6IGR3YzJfY2hlY2tfcGFyYW1zOiBJbnZhbGlkIHBhcmFtZXRlcg0KPiBn
X25wX3R4X2ZpZm9fc2l6ZT0xMDI0DQo+IGR3YzIgMTI0ODAwMDAuaHNvdGc6IEVQczogMTYsIGRl
ZGljYXRlZCBmaWZvcywgNzgwOCBlbnRyaWVzIGluIFNQUkFNDQo+PiBJcyB0aGUgaXNzdWUgc2Vl
biBiZWNhdXNlIG9mIHByb2dyYW1taW5nIFBDR0NUTC5QQ0dDVExfR0FURUhDTEsgYml0DQo+PiBv
bmx5PyBUbyBjaGVjayBpdCwgY291bGQgeW91IHBsZWFzZSBjb21tZW50IHRoaXMgYml0IHNldHRp
bmcvcmVzZXR0aW5nDQo+PiBpbiBjbG9jayBnYXRpbmcgZnVuY3Rpb25zOg0KPj4gZHdjMl9ob3N0
X2V4aXRfY2xvY2tfZ2F0aW5nKCkNCj4+IGR3YzJfaG9zdF9lbnRlcl9jbG9ja19nYXRpbmcoKQ0K
Pj4gZHdjMl9nYWRnZXRfZXhpdF9jbG9ja19nYXRpbmcoKQ0KPj4gZHdjMl9nYWRnZXRfZW50ZXJf
Y2xvY2tfZ2F0aW5nKCkNCj4gDQo+IEFmdGVyIHJlbW92aW5nIHByb2dyYW1taW5nIFBDR0NUTC5Q
Q0dDVExfR0FURUhDTEsgYml0IGluIHRoZSBhYm92ZQ0KPiBmdW5jdGlvbnMsIGV2ZXJ5dGhpbmcg
d29ya3MgZmluZS4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiANClRoYW5rIHlvdSBmb3IgdGVzdGlu
ZyBhbmQgY29uZmlybSBteSBleHBlY3RhdGlvbnMuDQoNClRoZXJlIGFyZSAzIG9wdGlvbnM6DQox
LiBEbyBub3QgdXBkYXRlIHlvdXIgcGF0Y2ggYW5kIGFjY2VwdCBpdA0KMi4gVXBkYXRlIHlvdXIg
cGF0Y2ggdG8gZXhjbHVkZSBwcm9ncmFtbWluZyBvZiBQQ0dDVEwuUENHQ1RMX0dBVEVIQ0xLIA0K
Yml0IGJhc2VkIG9uIGhzb3RnLT5wYXJhbXMubm9fY2xvY2tfZ2F0aW5nIGluIGFsbCANCi4uLl9l
eGl0L2VudGVyX2Nsb2NrX2dhdGluZyBmdW5jdGlvbnMNCjMuIE1vcmUgcmFkaWNhbCBzb2x1dGlv
biwgdG8gaGF2ZSByZWFsbHkgLi4uUE9XRVJfRE9XTl9OT05FIGNhc2U6DQotIHJlbmFtZSBEV0My
X1BPV0VSX0RPV05fUEFSQU1fTk9ORSB0byBEV0MyX1BPV0VSX0RPV05fQ0xPQ0tfR0FUSU5HIGlu
IA0Kd2hvbGUgZHJpdmVyOw0KLSBkZWZpbmUgbmV3IHBvd2VyIHN0YXRlICIjZGVmaW5lIERXQzJf
UE9XRVJfRE9XTl9QQVJBTV9OT05FCS0xIg0KLSBhbmQgZm9yIGFsbCBwbGF0Zm9ybXMgd2hvIGRv
ZXNuJ3Qgd2FudCB0byBoYXZlIGFueSBwb3dlciBvcHRpbWl6YXRpb24gDQprZWVwOg0KICAgICBw
LT5wb3dlcl9kb3duID0gRFdDMl9QT1dFUl9ET1dOX1BBUkFNX05PTkU7DQoNCg0KSSB3b3VsZCBw
cmVmZXIgb3B0aW9uIDMuIFdoYXQgeW91IHRoaW5rIGFib3V0IHRoaXMgc29sdXRpb24/IENhbiB5
b3UgDQppbXBsZW1lbnQgaXQgKEkgZ3Vlc3MgaXQgcmVxdWlyZWQgNSBtaW4pIGFuZCB0ZXN0IG9u
IHlvdXIgcGxhdGZvcm0uDQoNClRoYW5rcywNCk1pbmFzDQoNCg==
