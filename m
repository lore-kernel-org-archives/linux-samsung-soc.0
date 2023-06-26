Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D449EB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Jun 2023 23:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjFZXUt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Jun 2023 19:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjFZXUs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Jun 2023 19:20:48 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E295E1998;
        Mon, 26 Jun 2023 16:20:46 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QNAg1V010490;
        Mon, 26 Jun 2023 16:20:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=oZiThrIaqjTbdszeJP/pSoNKyZlbQFCnvovwTYamyuY=;
 b=nK+2yhjvtDOG3aL7JqKTxzjmhOc9bemmAWe++u+Tp0MhPZNKxHvzxIXr6rrOCn/v8vMI
 WfLV7W1TPHd/CnsHEBPczm7SA0oVDFVeAkTvNYm9xe0HLJujbFSc7yDFsxsWCIGXqaO6
 hUwaB12niJhTUdH+Unu09Sii9ZeYcuvVbAldAuaDbrxQTB5hUpPnS0F7i8P9T5U2ew4p
 LVsMWGjbB6aepL+HLHUeZCIuP5w71XVx3A9hT0U3TUY2xzCaVhgAvpupdbvnJVzsu199
 puAq7+m0Md3zG+mui4FrktbunsGiYGuexOCioDOfzaASHeKFXg9wAeoT9xXxYx8cwTZ+ yw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rdygma4fu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Jun 2023 16:20:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1687821638; bh=oZiThrIaqjTbdszeJP/pSoNKyZlbQFCnvovwTYamyuY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=aGv6VDNDDVVMFrNeRzI5D687mqK6uLO85AQ5ZmWdKLKzY7qteJti5CsnB9OtJJysy
         XkW675Yat2/5Xj7QC5RewdPP8ygLvSa/NbkJvOplS8DX8bB58Wa2OXp0b6YMyHyI2v
         U9RpHpVbEWYI4EakWQXtXJ04nTGiakeyZsMa7fyVrDty74Ybk0HkmiGqk9t7SF8QeM
         biURYw3ESD+x18N0EjTO8tVeBgfldt4E/W+zVTSw+8CPJQcrNZqmacktXAv/gQIcLQ
         3yx63BK5Xnr949OfrY3GcwQeM+unVB6IdUSef81IWjja1+8+mgMVK6ivQHP5ttWEo4
         +Gi05FutpDZ2Q==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8814A4013C;
        Mon, 26 Jun 2023 23:20:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E1D3BA008A;
        Mon, 26 Jun 2023 23:20:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=icXiLFYF;
        dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id EDB4E4012B;
        Mon, 26 Jun 2023 23:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAHgmLTFF6PmJMdmm9UlsK3Qqhdh53lfYHEETOzYwN1sB/udnT9Gx3SQ1fDM53ocNjKFdns/dko7xjVHnP9xggWxlCIY7fIP0wQAx9iU64i7IAnSFgKmCSd5UOQ8H3eLzOCCwsf2Qj4VNph6Sgv4yu9OYAu+pL3P0CBhifcq0tAHmK+BJlx2kbtjJ6tL1LpMceXO6gaNVKqtL/cTvafpIlUS2vRPeo849fpKxWg0y5Dux8n7u6jrNYvlr7PVhGnaYy3VAPR6altHD5w3C9aHcAz4W4otIaWeVFHZZds2ZG+eOHo14sErmhCMyzyaVhysh1gTezVevGNYHTJ0f4zWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZiThrIaqjTbdszeJP/pSoNKyZlbQFCnvovwTYamyuY=;
 b=hka0S46xPquof+RTU4aaGLRmSVF2BgeuOp5Ann8mvJKleTM9+yQh3yH6czMmPzzj+ugA1sIko3XYrzgxCvWToHHXUQlMAHfaxo/AHnz5UTz4ocKw74NiIf8ec5nQRvfMRLAubMkRlMsCJwkTCBJyZqU2fdIZctTTLLMVMo+KShC3ZV4orxXwM4Hih2mL12lc45JnSHxNo221O2CziD0NeKy2dV+QevwQM3nBxD+eepWIGu2Y+7izC4nMXT7iX1ZVHxV5HyCk9WWqn2iflYiq6CRe0g6ORmdgCGBs4ydXgx6gGy40ydVrjUb3nx3nw9wzLAhm9xakVFuYTmCmC1DWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZiThrIaqjTbdszeJP/pSoNKyZlbQFCnvovwTYamyuY=;
 b=icXiLFYFa+07xKwf2llmsEJaW2mGgJTDmqKt+5uqbONmiJ9OnYADahAW7QJrYd+PwS7u1gDVtN4Klpjc3ZzSCBUoXF0sPJXH4DCv79cum0L2JVkIdRdcTMomrPcOXiCtL8RWf2k8avsV2Lp9MkbBahXCpjByn6dkr/FSVToLE4c=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 23:20:34 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 23:20:34 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?SmFrdWIgVmFuxJtr?= <linuxtardis@gmail.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "mauro.ribeiro@hardkernel.com" <mauro.ribeiro@hardkernel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: usb: dwc3: HC dies under high I/O load on Exynos5422
Thread-Topic: usb: dwc3: HC dies under high I/O load on Exynos5422
Thread-Index: AQHZoAA7xJCmtd8rSk6hlKylfwPXx6+XcvmAgAK2VQCAA6BKAA==
Date:   Mon, 26 Jun 2023 23:20:34 +0000
Message-ID: <20230626232030.mwjrpxkfuziffvj6@synopsys.com>
References: <a21f34c04632d250cd0a78c7c6f4a1c9c7a43142.camel@gmail.com>
 <20230622223255.xawjfenb2tsjdmmg@synopsys.com>
 <f76fe9831beb9dce2f4f0d5f5055dfd4f67b5000.camel@gmail.com>
In-Reply-To: <f76fe9831beb9dce2f4f0d5f5055dfd4f67b5000.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4210:EE_
x-ms-office365-filtering-correlation-id: a1cc2ee9-863b-4f8b-5282-08db769bf16b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vhlf2w2EvPYyZ8QKDrQJipnDeJ0XSSXaNj7MaQUKXtJf87qBbdb9igz/WIj0FlA4QKdTdER56U/jbnDYM7VRFR38xhwvOXB/OntjfRufrXYApnAwYh0sQYAj+OU9rKd2uCnEKm7CF8QlJHkAzbr9xc48cS3DliugOVtvdvofj2kHwmM66P7fnVAwzlKLLUu1KyzBLy+9VO0GMiR+vU+OnSMHpRX1PZd7Th+GxJq2kbTAWfLVfgpgqDunsgmur9h8k1UUj6uDz6wZtFspw0SozL/G6VmEbihamS/u3L8wBa6A9f18sA1LxfA/y6ARHt4rs8Vek0sOGHbA+K7EPfm4tE0jwGlvaRQK0PBezuqZNq3YYLIdB+eIq74CSEj5q0iND4Ewl69YXVMZDeOkLwUDkkemBneDraFY5YNbpfpijXS6H8REsUc+p38L1QvDqrpc9DxltSF3TwEGQWgr3TNuFtzDIEi7FUzZmOinXV6vlcsry9TcS9QnNKvvW5XJJh+4/6jX+2Q3xP0+3WC7Nfs6+IgE0YR8TdkJcXCNxUDin7Nj1CxWSJ1CamX0GZUFUe4kSYNUo80vESvvGcQ/rHawoJ6EMIXT6mhISqhZy5k3DJiKnh/b0MJGD1Vv4o5mSYa3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(366004)(346002)(396003)(136003)(451199021)(66446008)(36756003)(5660300002)(64756008)(8936002)(8676002)(41300700001)(66556008)(86362001)(66476007)(76116006)(6916009)(38100700002)(316002)(4326008)(122000001)(66946007)(38070700005)(66574015)(6506007)(1076003)(26005)(2906002)(186003)(478600001)(2616005)(6512007)(71200400001)(54906003)(6486002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0JOd1hOREphdXIvU1BrS0tQVHpsbGY5WDQ0RnhjNnFrK0N1V25rd1pSTko0?=
 =?utf-8?B?cnR5N0hIeXNQZDFySkU0Q0xMUnlIM0VvM2dQbHN0TXFVTlFhb0V3YlpsLzBp?=
 =?utf-8?B?dzJZQU1USnB0WXlDdS9GNC9oWk5aWndEVHBYdkp4Mk5XdjR6OVBTS0hiY1Ev?=
 =?utf-8?B?aWw2SHRWSUdMOThTaVlVdnNPaXNCaWVudjFDV1l1K2ZxSThFNmxTcW9HSHVL?=
 =?utf-8?B?cHMwUjRHRWJ3NHJFMXJXcFhkWlh0RnZPVkRKRDBobDNybWNyVHhGdW9ER0VI?=
 =?utf-8?B?QnZVZDFXdkxSVE5yVnVKUGFCTTUrc01KQWljbmtMTm9HVlpXaFBEVS9Ja3BY?=
 =?utf-8?B?eDYvSHFLK2JZc25GTStlSjNEcjJ4Q2tnT0NtY2xoWnB1OEJ3N2svNFl5VGNP?=
 =?utf-8?B?ayt4U1JFRDRpcmptTEFLd1dTbERzdTZqZ1g2S1FvTkROeDJLd0MzTFBSWDUz?=
 =?utf-8?B?WkdGNWN3aStZcFNjd1NkdmR2bTVFWXlTZkhlZFdQc2N5djRoWjE4SkRTcjdB?=
 =?utf-8?B?eUY4MkxVazFzNUhRRjkwV1FFWUR0SjJNRGdjZ1dOQklBU1F6cnM3TkFGdkMr?=
 =?utf-8?B?RTlVbmdvanZ3Uk8zWXEvVDJhRGJnam1xcnFIcFNaTVZkVFBJaVZXWEh0eDBm?=
 =?utf-8?B?N0Q5TkQrT1dLYUJSMnJIUFNLeEJ2REdIM1hkTWVVUkFtdVFNQnFPNkNXUW5K?=
 =?utf-8?B?eEJCbUt5dlZLb2NJc3phS3pPL080aGl5YW9LN1FIVnJSN2Jvb0hmcUJCeHM1?=
 =?utf-8?B?SEhkQWF6UmJJT25zUDhFMWN5a0c2eGJ0R2lMTUIyKzBFTWY5MFBZallhaUtE?=
 =?utf-8?B?ZTdYRzVHQVZBYWJmTkxvTFgxaDBLWm9waVVCUFhYbXZDODlObnFyVFZXTmlj?=
 =?utf-8?B?RnFaVXIyaFpPOU41eWdBMy9jUFZBU0s5UmFyQWsreFY5SStBd0tBK0Z2cm1N?=
 =?utf-8?B?dzRqcTJ4SWlUVlI3b0ljaVNoNEY5YUdMWmdMM2xWRGM4SkxyZE45b0tuOGZz?=
 =?utf-8?B?Z2FDRGh5VlNGVnVDS05EUzZsTWxuY09oKzZweWNINFpnUG1yajZEZERDQ2VW?=
 =?utf-8?B?bjR5RW1SZ1RKMTI4UUxUY2ZlT1Bva3l4bHMzQzgxRk0vVnlDdHVQbm1MdVJY?=
 =?utf-8?B?Z1FpR2tzME0rR1VJby8rd2MzVW9rdHJreUZrZXhwamhGU2E5Tm9NS1l3NEhz?=
 =?utf-8?B?L0d2Q0tuM2pLb3hjcHRLVFpQa1ZNRWViZXhjTVloRXRJaU5Vbk4ycDV4ZU8v?=
 =?utf-8?B?RVpsZy9aSlFPNy8wYmFwSHBISlcvRm9iejVxZ3dpN2dqNnlkbUFHalpuZEFt?=
 =?utf-8?B?Nno3MUh0eXIvKzdRQXN1T0FSd1BvVVdSdDh1QnVMMjZaekUxZFJ2cUNNZEhy?=
 =?utf-8?B?c1ZnK2t4M1RXWXVmZDhMM25sTWpReS81bDROQ3hUZXVvZC93VEtLS3kyYVVx?=
 =?utf-8?B?MUdLeFZyTkViNWMzRUJmenRRUUNGZHNhSDRadDdmeHY0MVlnUnVrRG9md2pi?=
 =?utf-8?B?UENwSnFPQ1ZpMWc1Q045VnpjdGxsTmxSME5nYnNRSzdpTEtPSGdTZ1d5MDJo?=
 =?utf-8?B?ZDltOERZTVk3RzRMVkh4RFMzL24rTGpaUUJ1UFJqM0djUm1HMlNYUmREbm5M?=
 =?utf-8?B?L1luVWZVc1ZMcTJkaWw3bFVhWDUrdGE0UHR2SDNoMEVVVWdtbUVzby9wb1lr?=
 =?utf-8?B?MnJ0Y0hleFY0SU9DNzdRbmhhQ3FnZXpkVElqZ3JDcGhZOC95bzhJbjFUQ0h0?=
 =?utf-8?B?NXdxM3NmNm91K0p5NHR1YVUwbDRxWWo5UGlOVWtlNUlBaVNaMFdxQWNVdVg3?=
 =?utf-8?B?elM1RnlVa25XSW4rN3ZvS2lUWnA3QzVzWDFXSXlTNGhjaVdJeFpMZGhkek05?=
 =?utf-8?B?SGVuQlVmcWZ1V2pGcVNyREpmcDRpbEpCUGVEMHVReFk3ZDFyamE1UGNiZTFu?=
 =?utf-8?B?cVIxZHdUMm5qaExYajBvN2RGTHZHNkVGVGNQUC9BWHZEVVEzZkthUUVDSFZU?=
 =?utf-8?B?VytxMEJ5TnJkUmY5c0ZjVHE3RXJLQm5TZnh1TXRQeWNvcUU2T1o1OFlBeXlL?=
 =?utf-8?B?eGJUWlZQeERsNlJIbll4ZUx5L2Z5ZFJESzRSN0ttamRrRGk5bC9hdFBmVk1L?=
 =?utf-8?Q?ayNyjl1U0UOW5Z7uWuhitidXQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50120D3C3658F84D9E5E916740D9CA16@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fdDRZuB6RrKO+ZA3LXSUKkCxySjzdqdTgdly+FET89Q/TCL6mR85MNGxf/3Cec5Cty2Vkhn9FFMOpmuceJUgVecgFHpeXtRylZYZIsb3jFEXBNlN3Q6pgtzlQaHQITUagvzhzcf2UGbH5gxfwEXmSFnvmCrgOtBW+7lDeIHjWFROrmA+RwOYzIQ3xpCmUf9ApT2SW6SHlf7TvDhh7ubUjTy86iAJokjBeYxdvB7fsaPSwWuU70dmxDfrTHbuilx2V+QSOdeGSvLCSc+/98eswOykBsL6pTf3WmeX6ymCqtjChDkzuobob4iOxtcF11PDXeKfuviacKjkpyhzMvtHjYOSywfydOtoK0AWqYjmDnmDIUuD0iZ0J07GOUS7XRL++LgloKS0ar3qVs5dZ5m0HPrLeTPKyOzqQZTl7pnOISGg2kANK+9IoQEZE0/sfOUYWlRaAcJZYHXVtirIIYORQ/8Pi8PNS637IfoERG/xjwDXayFA/xjQ1XRu2NBOitTYNmcoj8pV7ZnXiO5qHqQfPcSlAO7u1QDfyFpLYF4NGx6UORc6xSCaZt7h4cGNldGmAtGYX1fe82kZFtIXLibiSZUbNivQ87jjmcONObAGoSdyPgAW7FL7dpuHBg02zZ+fjofUyOmBpzYtYLoMYj+Gj02taI9eUe412TKgEBUvsTezhwH3fDHA6S2IlYCa+g0HdoKFsu16+J6KLlxc3vlfjAoSlk9QV+r0QHuy5WkW6+1dr8rov/hirJVOhH4jtwoFGWLiCISgo/lGtmZ0qceN1AhtKmiA4eIwaUF4vky4xstvKmtMX7CQpyb+tt75UQi2TygEUq7USLMn4Bjmx+oDaQpfiRT/nu3HT+FAtgBBTKKRGwmpvo3kGDxgjM8Lyloal/6eZdbxZNdjLmCu20E12w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cc2ee9-863b-4f8b-5282-08db769bf16b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 23:20:34.5273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcTxi1dqCzRtdTqzm1GrihvU9pUGoTcwudpEUCiT2Ut0mnx4PtrXt9U4NGPl2uDx+hOxwq2LmnAFj9r62CGXvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210
X-Proofpoint-GUID: GcpMwSi0P9jXXXUjFxQzclqZsBT8hs_U
X-Proofpoint-ORIG-GUID: GcpMwSi0P9jXXXUjFxQzclqZsBT8hs_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_18,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 clxscore=1015 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260217
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

T24gU2F0LCBKdW4gMjQsIDIwMjMsIEpha3ViIFZhbsSbayB3cm90ZToNCg0KPHNuaXA+DQoNCj4g
PiA+IA0KPiA+ID4gSSBjYW4gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIG9uIG1haW5saW5lIDYuNC1y
YzYgd2l0aCBtdWx0aV92N19kZWZjb25maWcNCj4gPiA+ICgrIENPTkZJR19CVFJGUz15IGZvciB0
aGUgcm9vdGZzKS4gSSd2ZSBiaXNlY3RlZCB0aGUgcHJvYmxlbSBhIHdoaWxlDQo+ID4gPiBiYWNr
IGFuZCB0aGUgZmlyc3QgYnJva2VuIGNvbW1pdCBpcyBiMTM4ZTIzZDNkZmYgKCJ1c2I6IGR3YzM6
IGNvcmU6DQo+ID4gPiBFbmFibGUgQXV0b1JldHJ5IGZlYXR1cmUgaW4gdGhlIGNvbnRyb2xsZXIi
KS4gUmV2ZXJ0aW5nIHRoaXMgY29tbWl0DQo+ID4gPiBsb2NhbGx5IG1ha2VzIG15IGJvYXJkIHN0
YWJsZSBhZ2FpbiAoRklPIHRlc3QgYWJvdmUgY2FuIHJ1bg0KPiA+ID4gZm9yID4xMCBtaW51dGVz
IHdpdGhvdXQgYW55IGlzc3VlcykuDQo+ID4gDQo+ID4gVGhpcyBpbmZvIGhlbHBzIGEgbG90Lg0K
PiA+IA0KPiA+ID4gDQo+ID4gPiBUaGUgY3Jhc2ggaXMgaGFwcGVuaW5nIHdoZW4gdGhlIFVTQi1T
QVRBIGJyaWRnZSBpcyBjb250cm9sbGVkIGJ5IHRoZQ0KPiA+ID4gdWFzIGRyaXZlci4gSSBoYXZl
IG5vdCB0ZXN0ZWQgdGhlIHVzYi1zdG9yYWdlIGRyaXZlciB5ZXQuDQo+ID4gPiANCj4gPiA+IFdo
YXQgZG8geW91IHRoaW5rIHdvdWxkIGJlIGFuIGFwcHJvcHJpYXRlIGZpeCBoZXJlPyBPbmUgaWRl
YSBJIGhhZCBpcw0KPiA+ID4gdG8gYWRkIGEgT2Ryb2lkLXNwZWNpZmljIHF1aXJrIHRvIERXQzMg
dG8gbm90IGVuYWJsZSBBdXRvUmV0cnkgaGVyZS4NCj4gPiA+IEhvd2V2ZXIsIEknbSBub3QgZW50
aXJlbHkgc3VyZSB0aGlzIGlzIGlzb2xhdGVkIHRvIE9kcm9pZCBib2FyZHMuDQo+ID4gPiANCj4g
PiA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtZSB0byBkbyBzb21lIG1vcmUgZXhw
ZXJpbWVudHMuDQo+ID4gPiANCj4gPiANCj4gPiBUaGlzIGZhaWx1cmUgaW5kaWNhdGVzIHRoYXQg
d2hpY2hldmVyIGRldmljZSB5b3UncmUgdGVzdGluZyBhZ2FpbnN0DQo+ID4gY291bGQgbm90IHJl
dHJ5IHdpdGggYnVyc3QgKE51bVAgIT0gMCkgYWZ0ZXIgYSBDUkMgZXJyb3IuIEFmdGVyIGEgcGVy
aW9kDQo+ID4gb2YgdGltZSwgdGhlIGhvc3QgdGltZWQgb3V0IGFuZCBhdHRlbXB0ZWQgdG8gcmVz
dG9yZSBpdHMgb3BlcmF0aW9ucyBieQ0KPiA+IHN0b3BpbmcgdGhlIGFjdGl2ZSB0cmFuc2ZlcnMg
d2l0aCBhIFN0b3AtZXAgY29tbWFuZC4gSG93ZXZlciwgZm9yIHNvbWUNCj4gPiByZWFzb24sIHRo
ZSBob3N0IGRvZXNuJ3QgcmVzcG9uZCB0byB0aGlzIGNvbW1hbmQuIFRoZSBjcmFzaCB5b3Ugb2Jz
ZXJ2ZWQNCj4gPiBpcyBwcm9iYWJseSBhIHNlcGFyYXRlIGlzc3VlLiBUaGUgbWFpbiBpc3N1ZSBp
cyB3aHkgdGhlIGhvc3QgZG9lc24ndA0KPiA+IHJlY2VpdmUgYSBjb21tYW5kIGNvbXBsZXRpb24g
ZXZlbnQuIElmIHlvdSdyZSBvdXIgZGlyZWN0IGN1c3RvbWVyLCB5b3UNCj4gPiBjYW4gc3VibWl0
IGEgU1RBUiByZXF1ZXN0IGZvciBvdXIgc3VwcG9ydC4gSSdtIG5vdCBhd2FyZSBvZiB0aGlzIHR5
cGUgb2YNCj4gPiBmYWlsdXJlIHJlbGF0ZWQgdG8gQXV0b1JldHJ5LiBIb3dldmVyLCBnaXZlbiBo
b3cgb2xkIHRoaXMgY29udHJvbGxlcg0KPiA+IHZlcnNpb24gaXMgKG92ZXIgYSBkZWNhZGUgYWdv
KSwgSSBjYW4ndCBiZSBzdXJlLg0KPiANCj4gVGhhbmsgeW91LCB0aGlzIGV4cGxhbmF0aW9ucyBt
YWtlcyBzZW5zZSB0byBtZS4NCj4gDQo+ID4gSSB0aGluayBpZiB5b3UgdHJ5IHRvIHRlc3QgYWdh
aW5zdCBhIGRpZmZlcmVudCBkZXZpY2UsIHlvdSBtYXkgbm90DQo+ID4gb2JzZXJ2ZSB0aGlzIHNh
bWUgZmFpbHVyZS4NCj4gDQo+IEkgY2FuIHBhcnRpYWxseSBjb25maXJtIHRoaXMuIFRoZXJlIGlz
IGEgVVNCMyB0byAxR2JpdCBFdGhlcm5ldCBicmlkZ2UNCj4gb25ib2FyZCB0b28gYW5kIHRoaXMg
cGVyaXBoZXJhbCBhcHBlYXJzIHRvIHdvcmsgcmVsaWFibHkuIEkgYW0gdW5hYmxlDQo+IHRvIHRl
c3QgYSBkaWZmZXJlbnQgVVNCLXRvLVNBVEEgYnJpZGdlIHRob3VnaCAtIHRoZXJlIGFyZSBubyBw
aHlzaWNhbA0KPiBVU0IzIHBvcnRzIG9uIE9kcm9pZCBIQzIuIEl0IHdvdWxkIGJlIHBvc3NpYmxl
IHRvIHZlcmlmeSB0aGlzIG9uIE9kcm9pZA0KPiBYVTQgd2hpY2ggdXNlcyB0aGUgc2FtZSBjaGlw
IGFuZCBkb2VzIGhhdmUgcGh5c2ljYWwgVVNCIHBvcnRzLiBIb3dldmVyLA0KPiBJIGRvbid0IGhh
dmUgb25lIGF0IGhhbmQgbm93Lg0KPiANCj4gPiBUbyByZXNvbHZlIHRoaXMsIHBsZWFzZSBsb29r
IGludG8gb3VyIHN1cHBvcnQgdGVhbSB0byBpbnZlc3RpZ2F0ZQ0KPiA+IGZ1cnRoZXIgdG8gc2Vl
IHdoZXRoZXIgaXQncyBhIHNldHVwIGlzc3VlLiBPdGhlcndpc2UsIHdlIGNhbiBkaXNhYmxlDQo+
ID4gdGhpcyBmZWF0dXJlIGZvciBkd2NfdXNiMyB2Mi4wMGEuIERlcGVuZGluZyBvbiBob3cgYmFk
IHRoZSBDUkMgZXJyb3INCj4gPiByYXRlIGlzICh3aGljaCBzaG91bGQgYmUgbG93KSwgdGhpcyBz
aG91bGQgbm90IGFmZmVjdCBwZXJmb3JtYW5jZQ0KPiA+IG11Y2guDQo+IA0KPiBJIHVuZm9ydHVu
YXRlbHkgaGF2ZSBubyByZWxhdGlvbnNoaXAgd2l0aCBlaXRoZXIgU3lub3BzeXMsIFNhbXN1bmcg
b3INCj4gSGFyZGtlcm5lbC4gV291bGQgeW91IGJlIE9LIHdpdGggbWUgc3VibWl0dGluZyB0aGUg
cHJvcG9zZWQgcGF0Y2ggZXZlbg0KPiB3aXRob3V0IGZ1cnRoZXIgaW52ZXN0aWdhdGlvbj8gQWxz
bywgY2FuIEkgc3VibWl0IHRoaXMgZm9yIGJhY2twb3J0aW5nDQo+IHRvIC1zdGFibGU/DQoNClll
cy4gUGxlYXNlIHN1bW1hcml6ZSBhbGwgdGhlIGZpbmRpbmdzIGFuZCBleHBsYW5hdGlvbiBpbiB0
aGUgY2hhbmdlDQpsb2cuDQoNClRoYW5rcywNClRoaW5o
