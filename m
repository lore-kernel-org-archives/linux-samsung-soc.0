Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC004C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Nov 2022 00:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiKIAdr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Nov 2022 19:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiKIAdq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 19:33:46 -0500
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1FC6238C;
        Tue,  8 Nov 2022 16:33:45 -0800 (PST)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A8LlZgw015556;
        Tue, 8 Nov 2022 16:33:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=TYccSppG5dsEUWuRW727/eAUYJYcbN5KaL356JFGWFg=;
 b=CPCx965HCM1kaElWo2lKzfcVZ9FODmDLvSAuwc0VTgvti33wUbBfaQiFHTNXDLQKJcHR
 nHZDdI3ZSYNJNFKJsyxOF9/gq4mwPA1KQSDqWXdbAJvLvCJ2dWv95r+cd1CXMTs2v3uK
 cNP3KteFu2UYHJ+R6crjRxY5IL6ByFkHA91k2JmdQjxie4DVvcVC68D7fIiorQ1kv6wl
 e/2SfRHzWfaIK/49S/10mbxcm+ZX41Nbvnv4ftjEjixrX0txBsSWhbtduNBpWv1VksWC
 v1Tq2Z/P3/BW6SUsTfLCOVyk71ItqOqp97KynrT8qJgmEjl1fWmN0bLBZKvJ8csfUwRU Aw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kqkhgw537-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Nov 2022 16:33:37 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 764DEC0101;
        Wed,  9 Nov 2022 00:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1667954014; bh=TYccSppG5dsEUWuRW727/eAUYJYcbN5KaL356JFGWFg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=OuLhNQmOtuF6tWuXtHIP5W26wYM/7JBRF21vNuUwhtWvqfckSgDDdrBog6AbwAf2t
         SxXcud8dK8v47zy32h/EaXgSby46yNfKA9FCv7sVV+WInR6B7MVZ+UTwZ58JrCFCy/
         Wt3BrZPMqzy4d934sINYSvIEPrDTlEWacUceOWfJjnKRCWo8P2Ixd6D4CifO9XgWYT
         SZWUGYu+6AqUeUH6zdXvcncgNl469W4xwFiEm0XFTlIZ1i9HxhnSDU/4MVUoSxEpw3
         /l9YFs151LtjF9DDLX4NCVUEktUkoYRIqeaUFFM+AkjyxxYi6Vbhm96StUqezmU3dn
         ZCTqe9zbA509A==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id C8C10A00A9;
        Wed,  9 Nov 2022 00:33:33 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9B45A400D9;
        Wed,  9 Nov 2022 00:33:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="utmbe05t";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrluLvvZLbAAJ6QZtFur9OloDCKs+Jy69do3jpsVgbJ4ZXIa7uI/3mpfV+IGxoub1GMj/Wz1bICAw85b+lK2N8wPyos8lcafg235a8Lg+8ZzrjrR3AvtWy55NSu0zwRqTq6TwStl1nKU7iisYBmJDToS4HPE7Erbx2MA5LfV9D7t58aZCXXlluMPP238RgiXo15ES/+n+hNSu1XS8aG7+qNK0+m3QhWjCg1aV6RNxJD44MtSeAewyh60oOoawjRzkIAHz6E7pfp0jxo8FZDmb8NtQD71w+8I35NnCkrmxufp9GdUHYYKDGqJwaR9JL6NtVwi9Rf3C9FHBNXOu6YSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYccSppG5dsEUWuRW727/eAUYJYcbN5KaL356JFGWFg=;
 b=G9Xpr7taQc8Ok2Pm/yXEoh+YfUIHaomvZik2WA28D5709tgWI39nk8N6Z8D1mQHRK7kK0pGhwBlMRy3HmVSoHxQht6VMghBXnu6rOMdrfV5BisOuJJij3bBHysFVCRIeEY9cuvpzNHnIKsdtXDXETc1ujMfB/k4622S+yOuT0I57zE64Dm1uyg5oBM5U3s/ucAukI8VoVr12URd8e3KPLlv7sLpEgXoKCkYJfZerKxILGoxiLTZCWr6Wxgc/vhG+oRTCbn8lKD6mPYy0CHgSVpUi4Azk4bdMddDgug56ZJSrO+KSLYjguKLCFiVDyLoCEpNdXxpINWensAknpMFeLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYccSppG5dsEUWuRW727/eAUYJYcbN5KaL356JFGWFg=;
 b=utmbe05tGnAaWsTUSrARe77dlTWp+wDk9BsnIBea3VsCRhRR7Re8/ytvmJGOb/oHEXS+akCvd340asi8yZiHFPle8sUQu/esb2kM0R0BaH7Q4960NsNOVchu/5Mz7/QEvxs1ZQ0QtVAxJmVv4lIANkWDsf/RJJJU3voAsx9zGD4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Wed, 9 Nov
 2022 00:33:30 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9f62:5df9:ad93:5a1f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9f62:5df9:ad93:5a1f%2]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 00:33:30 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] usb: dwc3: exynos: Fix remove() function
Thread-Topic: [PATCH] usb: dwc3: exynos: Fix remove() function
Thread-Index: AQHY87sZhmmFg5CYb0GHEV6RayxIqa41vkKA
Date:   Wed, 9 Nov 2022 00:33:30 +0000
Message-ID: <20221109003317.trh5yw3ccmx4dica@synopsys.com>
References: <CGME20221108214300eucas1p22140957c56a1cf2f5203e171118e3d0b@eucas1p2.samsung.com>
 <20221108214249.32528-1-m.szyprowski@samsung.com>
In-Reply-To: <20221108214249.32528-1-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|PH7PR12MB6468:EE_
x-ms-office365-filtering-correlation-id: 3caa4c6c-aa10-469e-5b00-08dac1ea0679
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eqY9pgOa+fbT9ghpFz3WIdKaiapNt3vzc5ryt5YMjJuy/aR0UFYvF1JyaCCb/5eXHtbuejHpbzwp1pG07TOILZ6HHjTDN7yive8VEOsQzi3o0sfOgKrzoUgzCMThKCKpajNHtSqk5UZLSoL7dUXJR2kY5TFEQXlFL2qY/VqANj+MzsbK3C/rtksNNuIpL5dIXnPl6+jHPIKWd4WJ1UpwByI3I0TkyyZ+nvOV5M95T6l0nTc7ybutZHeoV6E63ET18mcbTX2VmgPxUlhDcbVRDbk+zkhnUcgZ31REbc3G7Atj0p4TMFjkKKjvpT7vUWZVVHM+afdwVsoPw0B52EbzLgVnYNGMgelxqnu1o2Ov46lGrV0bVqZVONNYqvPA7NcIIuL+azsgJX/P3m2w+nyUG4hUaChA5+DnZnIAEmINWuoUJjgNk7sSfwUlX8J37CRy6oE87pkMZOzdD1LD9MXcfRCJk+Dp7MKdBtrDEF2Sak7K58U+fD8Myv0HNwTr00YXcSnbLx9MawpYZblzk2kKwa0L5ZsLjmqukR+rYD2I5uRuADqXECO35B6GgQsR2LhKY1SWYMlvy00SIvfPMiPiTbJWSzCWe/hDg6vrWT/A25JLH5vA4Nz9lUBjDZwFuowxAIwqaY0l7yBDT1XEuNByZ1dZtg9Lek/XLhn+jhrUNM/bqGLVVS3GvECJpTnp8/3dCv5WLqH18tSgAQvN60WETkrqJxjNavKdgw7Bmg5ECQk+Z7dqQ+0v8kAwQzvi+eslamG/hSLEHZjUlwOSmg5r6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(1076003)(2616005)(6486002)(2906002)(54906003)(6512007)(26005)(316002)(478600001)(6506007)(36756003)(122000001)(38100700002)(6916009)(71200400001)(186003)(38070700005)(86362001)(83380400001)(76116006)(66946007)(66556008)(64756008)(66446008)(66476007)(4326008)(8676002)(5660300002)(41300700001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3RvRXlhQ0ovZkYzdnhtSzNVQWJGMGwwakFkek9GVFNlRzZJMmdBcUJCSEJt?=
 =?utf-8?B?TVd2dC9MRkdQL0RTTk5HbGFrUWJ2RXhvUldjaDRIKy93WjhLUUVKcVZhS3dQ?=
 =?utf-8?B?NFovT0I1MGt6dzc2MmtXQUR4LytvUkNnSkdRTFZrNERJdG5jMkhLYWxMZXpn?=
 =?utf-8?B?TTZzY0luaUVIQmVSOXdZNCs5SGlHY1hGYlJiRkRCR3YzdmtrNzBuTGJWSll4?=
 =?utf-8?B?QUZSTmRuU01EQnRhV1crSmlycTZBNTE5Q3VKeGxXV2xiQWkwWXVCRWdFbHh6?=
 =?utf-8?B?L28zZW9ZY2k2cWZHYk45cmVZdzVBTm5TT0tCNEdXZkx4YTVBS3R2bTVXMk5H?=
 =?utf-8?B?RnVuUVpKaXhFeFpMZ3JabHV4dWJSMmNXQk85OE9JenRjYjNMWkg0Q1FjQ1Jw?=
 =?utf-8?B?ZWZqbk1SZ2V3TWtpVlFlWWRsRlhMcEFpTWYwR3BRK2h1R1d0b2dySU9lUTJt?=
 =?utf-8?B?NklJTDN1OVVOamRCVm9QU2k4cFlaWVAzYi9JTlQ0UndHLzdwaWVncjJzbmhF?=
 =?utf-8?B?V2R3dnFUTklLd1BFNHJaZ255MjNBOFZIR1YxemtoM3dhUkpmSDBwaFVMa05B?=
 =?utf-8?B?Z1RlZGp0TFVMT0pQVjBlOVlwRlo0UGhBdExkY2VTWE5GQ2FudUU0MVg2SEZB?=
 =?utf-8?B?QnowdXFhNjFha0FCUllHMnFmc0xGWmU1bi9iMnJ5YVRHK1hMQkJST0dYdVp4?=
 =?utf-8?B?Y0dhTTh6WWNYbEU5RVdxaEw2RG0wVnpLdUxCaE0xQ0lEOUo2dkJYanB3RWNG?=
 =?utf-8?B?UXJtODYwOTg4alQrd0pJNENnUEM4NStHcUdxQ2JEZkNVVWlVL0lxcEgvMHVF?=
 =?utf-8?B?dFRyZW81VzVQMk1pK0JrMm9veWxkK241aTczSWtTTkxwY2E3dHRUR1NkcWVv?=
 =?utf-8?B?K2hjSkt0cUNmaXA3OW5vczB6S0ZHcmtJMGd3Q0k5RUx1QVIrZDYyMUh5VXJO?=
 =?utf-8?B?UUxadG5aMXdEcVhvc1M2eWcxMEh6d2gvc1M4Y1VXY0NTNVRmdWtrNVp1bnV4?=
 =?utf-8?B?QTdHVnU5YkQwQkFVTWhTdHdzbkdxK3FvRUdPMGVOODZKSFRSRXBsSThMYUlV?=
 =?utf-8?B?Vk1aZ3hLbE40SHVwOW9nWG0zYUJYUnRRaVJFT2FHOXoyaTFta1RoamJsOVJK?=
 =?utf-8?B?Qzk5MlVZLzBCcWpMaFlLS3NqNnVHdlI4dGNISFUxSm5BRU4rQWJRQk1MZmMz?=
 =?utf-8?B?a2hiVkhWaVc4R3lPd1E4ckU1S0tGTnhGWXE0N29KN1hBM1NVdVg1WXVMNGlH?=
 =?utf-8?B?Zi92cW5IZFRGYlMxNWFiS1N1QVRKb25ZZmdNYitFZjM4YVBYeDFJeEJLbmpy?=
 =?utf-8?B?RG8zVFRyWXVqaXNVY0doSWhBSXRFZ3FYbjBGbWF2aE9ncFdQYlNoNVlDM0pr?=
 =?utf-8?B?dmRLZXZNdStSRlBXODlxS2ZHc1dUazZtZFdMbnNIQ3YvUENXTk56RlhzclpZ?=
 =?utf-8?B?OUhUVk9JS2tZeThDVjMyYlNNa1NWY281TlFTNHpmcnl5MGNER0xneHVtVTdi?=
 =?utf-8?B?WWY3VkVmc05iMWlaUzJlL0JDOExFaElhTjdhaEY3dEZUS0NRQWxJczhDemRj?=
 =?utf-8?B?N3BMRzZ3dGc0cnFualRSckU2VFpNc0d2OUlhVmEzbnVSZkxkdVI5bE9RK0Ju?=
 =?utf-8?B?c3ZvZkdXRjZPUGFGeUtEYlEzYzdQWlNqZEh5M1ZNSGZJMk9oYjQvV1hCNEhK?=
 =?utf-8?B?S0pmd3ExVmxxVm5leUxHelFONWphVFJWa2FmemN3Z3NJOExRVGJhUXpYSnh2?=
 =?utf-8?B?L0JTMzE3aXZvTmpSMVNWd25sNnBzZVBBbGNzMU9RUzdmQ1hmSTlzQ2MxYzV3?=
 =?utf-8?B?VGFrRUtGOWxjY21sTFFEYUloVjRCMmdMd0xOWXFxSXBpa1RQbVAraTlNRlMy?=
 =?utf-8?B?LzhSQjN5SkVEbkd5cFVaNHg3aUQxYUJpWTdObU9DdGJ6Sm1SeVFUVVgza0Zs?=
 =?utf-8?B?SjlRdldKMFNvdG5xdHk5L3dwZ014cXpGdU4rWU90cVA5WEJNeHJWek4zR1Mw?=
 =?utf-8?B?WHJuMFhOVzlad24vbXhTeFBNZzNXdG5hMUJnbGJMVjBMRjdzTGppK285YkU1?=
 =?utf-8?B?cnY1bHUrY1pvSm1RV1k3QzlVQStuVVIwWjhydk95TG1nSHlPanY4TWNRdnZx?=
 =?utf-8?Q?ZNqlygwSoOwFq11tvzyus7lab?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <918FEBE453187141A473239BBA863D83@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caa4c6c-aa10-469e-5b00-08dac1ea0679
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 00:33:30.1158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlUD5wzr5M6AEtAajdywrAs8+dgHo4l/sYRhiRq53Xdp+wAOIpHLcIJXammc6ApPSRqwqUdSX2p1aGR3i4BCfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468
X-Proofpoint-ORIG-GUID: _pf8gREdE3uYccFtXtRPR8MCxZOvgSub
X-Proofpoint-GUID: _pf8gREdE3uYccFtXtRPR8MCxZOvgSub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 mlxlogscore=756 bulkscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211090000
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBOb3YgMDgsIDIwMjIsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6DQo+IFRoZSBjb3Jl
IERXQzMgZGV2aWNlIG5vZGUgd2FzIG5vdCBwcm9wZXJseSByZW1vdmVkIGJ5IHRoZSBjdXN0b20N
Cj4gZHdjM19leHlub3NfcmVtb3ZlX2NoaWxkKCkgZnVuY3Rpb24uIFJlcGxhY2UgaXQgd2l0aCBn
ZW5lcmljDQo+IG9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoKSB3aGljaCBkb2VzIHRoYXQgam9iIHJp
Z2h0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tp
QHNhbXN1bmcuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1leHlub3MuYyB8
IDExICstLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1leHlu
b3MuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1leHlub3MuYw0KPiBpbmRleCAwZWNmMjBlZWNl
ZWUuLjRiZTZhODczYmQwNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4
eW5vcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1leHlub3MuYw0KPiBAQCAtMzcs
MTUgKzM3LDYgQEAgc3RydWN0IGR3YzNfZXh5bm9zIHsNCj4gIAlzdHJ1Y3QgcmVndWxhdG9yCSp2
ZGQxMDsNCj4gIH07DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19leHlub3NfcmVtb3ZlX2NoaWxk
KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqdW51c2VkKQ0KPiAtew0KPiAtCXN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsNCj4gLQ0KPiAtCXBs
YXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKHBkZXYpOw0KPiAtDQo+IC0JcmV0dXJuIDA7DQo+IC19
DQo+IC0NCj4gIHN0YXRpYyBpbnQgZHdjM19leHlub3NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdjM19leHlub3MJKmV4eW5vczsNCj4gQEAg
LTE0Miw3ICsxMzMsNyBAQCBzdGF0aWMgaW50IGR3YzNfZXh5bm9zX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXN0cnVjdCBkd2MzX2V4eW5vcwkqZXh5bm9zID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICAJaW50IGk7DQo+ICANCj4gLQlkZXZpY2VfZm9y
X2VhY2hfY2hpbGQoJnBkZXYtPmRldiwgTlVMTCwgZHdjM19leHlub3NfcmVtb3ZlX2NoaWxkKTsN
Cj4gKwlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKCZwZGV2LT5kZXYpOw0KPiAgDQo+ICAJZm9yIChp
ID0gZXh5bm9zLT5udW1fY2xrcyAtIDE7IGkgPj0gMDsgaS0tKQ0KPiAgCQljbGtfZGlzYWJsZV91
bnByZXBhcmUoZXh5bm9zLT5jbGtzW2ldKTsNCj4gLS0gDQo+IDIuMTcuMQ0KPiANCg0KQ2FuIHlv
dSBhZGQgRml4ZXMgdGFnIGFuZCBwb3NzaWJseSBDYyBzdGFibGU/DQoNCkFmdGVyIGFkZGluZyB0
aGUgdGFncywgeW91IGNhbiBhZGQgbXkgQWNrOg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
