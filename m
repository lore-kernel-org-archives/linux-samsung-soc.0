Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6125C77B73
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 May 2023 00:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbjEWAkF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 May 2023 20:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235459AbjEWAa6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 May 2023 20:30:58 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D91198;
        Mon, 22 May 2023 17:20:51 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34MNNw2u003230;
        Mon, 22 May 2023 17:20:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=k3IN0VfIMYxh3gq2OjEFvfTVVqviUPFzMRbEtDF1j8U=;
 b=ewoTzVo9+qbga6YR4imuAPNNmGz4/oQXF2rPOZaQpFHeLq1JzlgCXix7+QxCV/P8VAdo
 MAyNx9cHC9yl2kiY1bArXElidx748GfDFTK3ICrC9FOlUb8WVph+xtr9D0qqMpqJFbJ0
 XPw4z+CP72+g7xPvUkvRYLm9ah8jmU0/TrKCTtwQTpUOZjha+xPrFY28YPQZZW4Ov2bs
 bGzMaFaw6osmpQnvp9VQdC83gB6kfcqYLhLQlmtJyiHcIIL38qK36CAgD5VmB3ABbsrl
 VAchgdTswkUy/F6I2tvfug5CQcYfy9+rUoyk1KMR62NDNivBDtMmyAwExgV2ECFBt35e Sg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3qpwf4rtk7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 May 2023 17:20:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1684801236; bh=k3IN0VfIMYxh3gq2OjEFvfTVVqviUPFzMRbEtDF1j8U=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fNau1qNSOgF+cICnncDVjRc28pP0NdIn0STIDY9jIxc4TN5Sc2P4JG3nCiEX7hm18
         1SK7vxrg3MahE/YpnXcZ78w5VGNpaKBvG1iVWew6Iekde+TUEY9TvJ+R0sAzmYwT1B
         sXmkOWaoY3Og8BQD6Ag/48c57q5N8CQm5luTiXEuEaJ8PgCmzddV2iEjgY7kUBsro2
         psQzZD05jTWbKPv3AkhSclqmdPCgUHzRQ0JrKTLX+L2Ew2qNS0MDUkW11Ld6AAhVn/
         4mHYenZ2SvxDIab/VQ6MRVvv39Qpzxh0t6QHBsWfInnvDc83iTd0A/dCsMjiqXZMCG
         x0zch6aoO/l3A==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A38BF40757;
        Tue, 23 May 2023 00:20:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7F437A005E;
        Tue, 23 May 2023 00:20:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UpJhWDGt;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C85D44063A;
        Tue, 23 May 2023 00:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StXGHatp6Fzoub0fjcf8S/yLAtyo17m6wbkrIALhh5pm3SKy+MXBnrFkm6N5Q54EpdQC4x1+gUVi7+0ymi8b/3lX9ycvFAbNXcLFXdR78AE5ZMK3pgEruBeodzFwToXo37gYqwCbEAEOdvul9LjgUjJl5ykGeDXfFc9gzafhaw/UQwzLqTWXqrpuaM0dSGScWQRMt5mA8L26/zLxu1031wOa9aXBxJKZBgCaDjJwr9S90SpD6riGbQ/R3hC+kaIG+osVr9rgRjgK+nB0iVDUYiO1f36gwq4BVrAx7C9VyeJBOE1wyV1CG6BkyLb+uZhCHZjjQt1HGsSFqfcWhR9S2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3IN0VfIMYxh3gq2OjEFvfTVVqviUPFzMRbEtDF1j8U=;
 b=biE6scBHZsXvAzdEt3B7s28qRV7io5KnNRNfJ6Yb+po4nF+gDL1B+nSItoZXYmosW5PMrnT+JS2EaEo6mJyiZjnwYgAzlIcqmA58MlKTa4nvC89DeMnWT++YfKh8svuQhK6CysF8fu5behQQWRLYbTpMgsAodZNYAH50rMcK2UA/Rq49Mk8jEgS8+uy6kRUIlLnJIaLVhGwu4MX1la8KJlm1RbQmjUWUsbKt63DPoy+oKRM+pJ18LBFXOOMT3/MOKawiC78RG6IxZa+F3KzI6Pg02811rXThwtXHuO7NMzVcmy2xAYGhHXF6Q2joBKc9zPkmORelPMPrHET5hrxZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3IN0VfIMYxh3gq2OjEFvfTVVqviUPFzMRbEtDF1j8U=;
 b=UpJhWDGtj9y5ocdOFKy0yYBJFCiSQ7bTiFhagrfT95qzb3Xwdbjj8EkUH3PyThpJtDIu2Pe3IYijxhH0WbMrHSAJfydk6FedTxaiBC2yJ10llhlvB6FHjEizPZhHtuwljcZ62YjwPnt0ND2eYjHbS4LxSr3ldKIPNh1W0w6vl/c=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ0PR12MB6808.namprd12.prod.outlook.com (2603:10b6:a03:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 00:20:27 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3400:81ff:f191:b312%6]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 00:20:27 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 14/97] usb: dwc3-exynos: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 14/97] usb: dwc3-exynos: Convert to platform remove
 callback returning void
Thread-Index: AQHZiRO3uqnD/ur2lEO5yBJxwJDSLq9nBo8A
Date:   Tue, 23 May 2023 00:20:26 +0000
Message-ID: <20230523002020.ebbrjxqlpk4bhzt5@synopsys.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-15-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-15-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ0PR12MB6808:EE_
x-ms-office365-filtering-correlation-id: c7439062-a1cf-4f8e-fedd-08db5b238232
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nfBAjQm56uU3pu1ssr/DXpxz8MPgaohc2N5gGXxcAwH42RqNqAMKIfpw06mg7sW8aeBWvW0gOTzqryAFYUJwxI07c1Brv8xN2TeK4scpptfJARRI2JGfMOlUz4955HS7rs0mqUu9ioHR3Mv2YJyzUgTx702tKZZALVh65jihAGAn9iOZEErBwU4xnkdnxSkgp3xTlR7l4ITjirjqWsku51GzWG1XR4SKxvwY6eIQ87QSj6LtvXzQfgOdglxyeBZ4uFFTWn3M6T6UZ0naE1dQh258T2RNLYaHTePn5I7ek7qH2zK6LpFTSUoaS775JDH2CDurWgjsQuvYHGZpxJ2Vu9pQzVePH/ZA0vEyXEJt5hlXNcj5CzyC/3xtfBdbqC8u1sHj/01vH/tKLCKQkHsl46N9nLHyX1mJGzVOIK2P7fNb5CHxkuDKYhtGNFbqRM9wLDRdUJoqZ4EymPNtpFav66iHU2mFFtUFH7n9XW4Df//h/9IMqbe3sSDv7hnblSzT7koRB5ODzQYl7TUu+t9tUlgKWOQ1A3lcBMO1adzZipoTvnZW/aSltG8+PkjpOReOBwBv92rCNhxaNHTh3YIOlv97fw3Z0zfo32vevhuDr/P1nmBfT2SLFh13VAxy2+o8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(66574015)(83380400001)(2906002)(36756003)(186003)(2616005)(122000001)(38100700002)(38070700005)(86362001)(6512007)(6506007)(1076003)(26005)(54906003)(71200400001)(316002)(478600001)(66446008)(64756008)(66476007)(6916009)(4326008)(66556008)(76116006)(66946007)(6486002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0g3elo1UHhHTkttSk15THJFOVU4dDFTcmVUaVRHaEJiNHFrM09zd1dvSk1Y?=
 =?utf-8?B?U1VDRzZXV3NGT1dOWUZKRHNuRGl4aHFLR1IySHAvazdKSldjM0kvSGQ3c2Zh?=
 =?utf-8?B?Nk5oZzVnbHBsSVFaVlpUemRmSnpRZ2FybHBIZTNRNCtJNWlTN0NHaTZNVDcx?=
 =?utf-8?B?UmN5N05MTzhGbllKaWlhZjRQcUlCR2xEOTRvSG5SQTJ6ZjNwS2V2MTc2cVJ6?=
 =?utf-8?B?Rm5SN09NakttL3JtdGJTUy9CZkJ1bENEZ3V4REcyZ3hnOE5EN2RsdlZydWY3?=
 =?utf-8?B?TnNvRnhjMlpMcFZIUHc4SEoxcnkrbHh5N0pwbmRJZDNpRnhETXg4RVVHV0Q5?=
 =?utf-8?B?SHV5MVIwczRlcnlCeHAreHZkczRoMzgxaVR3NGFqNlpqMjd5RG4weVVaV3Fx?=
 =?utf-8?B?RWQvakpUaUNMLzZ2M2tja2JIbWI1MVUzd0dpdjhZck16Sm4rSFI1enBkcFZD?=
 =?utf-8?B?a3pSRVhsVm9DcUtxWmF4T29nQnBBOTFIT1ZGVHJla0xiT2dvMjEwbDVxS0gw?=
 =?utf-8?B?cGtFMmpHRStqaDlQcUM3VXpGM1JiUzNrSXcra2Y3dWFLakljdUlCcTNRQjVX?=
 =?utf-8?B?K3NiUEFMalJCd216OTBuZytIcWlMZkU0UE9JWTZjUVFZc3lMaXRYOXVINXg4?=
 =?utf-8?B?Si85V1FIMmROQTgrc1VlK3VNWFlaR0cvekp3b3ZCOHBWQUtWK2VwUUlUNzNy?=
 =?utf-8?B?N09WeEU3b1dsRnV3MUx0N3BsNm1qbUJ5M292dlNOMWcvOHJtZU5haDJTanFn?=
 =?utf-8?B?R09rUEttL2hwRjRRNjk1azhxdElWWFRIYTBjbmk3U2hVajBMVXBacTlheXpQ?=
 =?utf-8?B?czJ6U0trMzlNODE3cGZudGkwRlB5b0lSTm5xcElBNG1tTlJTbys5Si93WWVZ?=
 =?utf-8?B?Mk4wU3VnNk42eVcyQnFwRnJoOUFWaWd5cHVuZWVHeVVMaVRBWjB0UVl3R1A3?=
 =?utf-8?B?eUl3NDE0STZTYkRKSlZxZlV0d045d0RyYVNiZEh5ZkZ4V1hkVGZMaC9TQVdJ?=
 =?utf-8?B?NnhJT3BtcW9RRGJuK0xHZFNMS0FMTGI1QmZhWUcrQXZEWXhhYnpDN0xSMDR4?=
 =?utf-8?B?NVRYMjlVeC9rODZxeU1UYWlHa2xrWTlDQUdhSlZBR1h2QjV4cmd6UW5PaXlM?=
 =?utf-8?B?Z29BWkp3dWxDU3lGUDRBb1RzWm1pVHJadnA1SzdFU3hySGdJdk82WUdXei8w?=
 =?utf-8?B?QTg2Tm05N0hBazNXTFNLOU1uaGZjRGRrVktzR1IrSVZlZEVaVGdOUWdsK3py?=
 =?utf-8?B?QmtwTXVJa0VYNUZJYUI5MkFsRFRqSjRqN09vdkkxaUkyc1YvVUlQSy93R3NP?=
 =?utf-8?B?UVhETi9vK2xjbnRPSG42L2hxb2g3K3BqelZIWnNibkZiRERHanlRODdSdEMz?=
 =?utf-8?B?aTgzQkdVZ0FnWlRGQ1lCY0JzWGVRdk5zNk8rMGdleUNYdTF0YThEOGtjdFdu?=
 =?utf-8?B?TkZjYk1hSk02eVdXRTVyQVR0eS9UR2YxOXZ6RDJYOFZTV20rS090Z2gzVS9Z?=
 =?utf-8?B?d0JOVUF3cTY1OG1ZNC9qZFBJRWJlODdhSW1YK29mV1FKUTEwenE5TjJEcUpa?=
 =?utf-8?B?Zm5NSitHNkRvNjRVT1NaQmVrdlJsWng3VUhoQStza2loTkRJN29GNys1OVZM?=
 =?utf-8?B?Q3BKVWJ3TXg4dGhibi9lMjFRcm13NnMwZSsvN3R6ZmN4Wlp4Mzg5U1dCTEVp?=
 =?utf-8?B?U2hKVU1QMGxaUDg1ZmdRSlFacnhXUjJ3RUJYWVlzSnlMNm9SNU9yWlBxY3BG?=
 =?utf-8?B?dk1MU1FzNmlwS0txdGJDelJIL2pvQmNXdGVNYnlXNGoyMlZHNDAxWVlOaU5F?=
 =?utf-8?B?WFBBUnFYbHNVNmE1OUFPQlZHV25BNUpEdFhtS2g1MW0zaWFYRllJTlBhaVhB?=
 =?utf-8?B?bjFuRW9zQlg1TCtIQ1FlV1dpTEZoTW45RE1CdXpwRW85WThMemY1T0h5NmJN?=
 =?utf-8?B?bkRDck1KZjBrMkdmZkEvY3R0ZUNTdHN5NEJSTjk3K0UyMGI4N3YyMW5NMDN6?=
 =?utf-8?B?T0wrc0QwVUVQbEpEZGh0UmZCWGJvTzZ1VXd4RmRFOVFGUnNVVFZzc2Z6TEs1?=
 =?utf-8?B?dS9aZDFwOG9BYmZ1Q0REQU9MZVpIdWVxdHNmZ3NiQklxS0RoWjJMYmh5TURH?=
 =?utf-8?Q?js6mcRV/LvQ4oRJkpVfpwJe2S?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C71ED55162E8AF4FBC94C70AAD76ACF6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?cUFiUElJRmhrcWREaXZzMkJGcXZETGFRajR2TjFFemVUOS9GdGsyamhEbldS?=
 =?utf-8?B?OGo5ZTAvbkIvL1JaOFNSQkZNTms4OThubS8ycCsvZkxGSnVvTTl3b1UvUWgy?=
 =?utf-8?B?VzRobU8yQUpZU0VUR1ptZnJ6aDVab1RjWnd6K2FxM1MyK1JuQk5GeVNRSTQ3?=
 =?utf-8?B?aUhqTklWR1V0U1hLR2FWZHFVTDRBVlE5SGhUTndGc3I5ckhwb0YzL3RKWHIw?=
 =?utf-8?B?eDB5c3RWRHRUVzVQUFFuanlXa1U4dlA4K2toMWRrRzJNbXgrMVhubGVtWmpU?=
 =?utf-8?B?YlBEY3hZQ1VuZHF3dUpoQVBQUXNUaVlMc2ZqTGNCQmt4ZzQrTjl5WUtzRWd5?=
 =?utf-8?B?NW4yelNVSTU1UG5jaitvRjVIRFFISWNiWkp1eGhsOFQ1bkh5MS9POHdSUmQ4?=
 =?utf-8?B?QXpDRGk1cXhCNVY1YWJIMkUvajA3VG56c1U0NHhQMEZrY1ZlVngzOEF4UXBE?=
 =?utf-8?B?ZzNYMlROWFdVclNPRERGRkJhNEhIZ1ViSVhVWDJ0U1VHc3FPTlhwUDhJZEdY?=
 =?utf-8?B?QmZKbk05N3ZFMERzUUEvTkJGdmw0c1o2Q21KVXBrc0VWNjRiSFZwUXo4RlBn?=
 =?utf-8?B?bVEwUEYyc1ljK1ZBdTlyeTBTSEV2TGVQd0p1Vnd2K3VLT3c5NVJNUnhXNThS?=
 =?utf-8?B?L1JYZ09kT0IvMks5bHlLKzNUM0hhZm94azc5Q2FqL0RicDdxZkJNTU9GSzFj?=
 =?utf-8?B?ZVlZN2xhMjAwYmxOV05tVGN4N1plWElwdXU5OEJNNlVtSmtndkNpRFNuN242?=
 =?utf-8?B?RzZGaU8xQTBsL0ZRZTZvMU1EL0kxMHFyakNrQ3FUcHJMOG9hZFVGQm9XY09I?=
 =?utf-8?B?ZEgyaUx6SDYwK1RlcXU3OHdrV1pjQ2luTjEzdVZZOVJ4TUV6Z0dQRkFXdm14?=
 =?utf-8?B?VVZzeTh2R1RmenJwLy9MSWRaR0N3QnZxclErYlhMT3I2eUFwYmtPemc1R2tP?=
 =?utf-8?B?R3QrVWNNUG9ZM3JTZWZXeHp6Vm9KVEkyWEtaSWRDMXh2NkpmNFp0QzVTOTN5?=
 =?utf-8?B?cHExbVdJR1JYdlZVMitHVHFBTTQ5ZWFPUU91M2ZkWFpXY21CQytZUmdVZmhX?=
 =?utf-8?B?WGpmSWd5L01nL3N6L3JadkRuT1U0MWpCVmRwNWduWHg2ajFWVXRtL2ZOQWZN?=
 =?utf-8?B?VnRGYVdnUDVNdkNRSm1oSVBPbU5RL1Y4ZzV6TFN3WmduUVhWclpTTFBTMXdQ?=
 =?utf-8?B?aVBJeVB3WVpxYi9uSXllR3pxblhyc1dZSERuNFh4TnVUZDlYb08vbUtCem5Z?=
 =?utf-8?B?TW1zN2NveW11NmUxMnpnYnRuaCtYOFlVMEhoSHNVUEhRZlU3R2pkOXdJeWli?=
 =?utf-8?Q?bQUdqTR64/FtnS7HSVBJPx68H3u+wy5rXb?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7439062-a1cf-4f8e-fedd-08db5b238232
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 00:20:26.8887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awkcil6ORQs4feK59EWn8ibSxZQQnw7bpKwhJnqeeJQYZ3Rksj0fT5cxGtOEYFChhugxp6RBzZnZFJ8ObioITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6808
X-Proofpoint-GUID: h23ccE_U24NbUZXhgW_kCQ8dYNzgIcYI
X-Proofpoint-ORIG-GUID: h23ccE_U24NbUZXhgW_kCQ8dYNzgIcYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230000
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

T24gVGh1LCBNYXkgMTgsIDIwMjMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcw0KPiBtYW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2li
bGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcgYnkNCj4gcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhv
d2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIGlnbm9yZWQgKGFwYXJ0IGZyb20NCj4gZW1pdHRp
bmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZQ0KPiBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3Zl
IGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3QNCj4gc3RlcCBvZiB0aGlzIHF1ZXN0
IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5
DQo+IHJldHVybnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycyBhcmUgY29udmVy
dGVkLCAucmVtb3ZlX25ldygpIGlzDQo+IHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jIHwg
NiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jDQo+IGluZGV4IDRiZTZhODczYmQwNy4uZjg4
MmRkNjQ3MzQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZXh5bm9zLmMN
Cj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWV4eW5vcy5jDQo+IEBAIC0xMjgsNyArMTI4
LDcgQEAgc3RhdGljIGludCBkd2MzX2V4eW5vc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyBpbnQgZHdjM19l
eHlub3NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9p
ZCBkd2MzX2V4eW5vc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsN
Cj4gIAlzdHJ1Y3QgZHdjM19leHlub3MJKmV4eW5vcyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBk
ZXYpOw0KPiAgCWludCBpOw0KPiBAQCAtMTQzLDggKzE0Myw2IEBAIHN0YXRpYyBpbnQgZHdjM19l
eHlub3NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlyZWd1
bGF0b3JfZGlzYWJsZShleHlub3MtPnZkZDMzKTsNCj4gIAlyZWd1bGF0b3JfZGlzYWJsZShleHlu
b3MtPnZkZDEwKTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IGR3YzNfZXh5bm9zX2RyaXZlcmRhdGEgZXh5bm9zNTI1MF9kcnZkYXRhID0gew0K
PiBAQCAtMjM0LDcgKzIzMiw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd2Mz
X2V4eW5vc19kZXZfcG1fb3BzID0gew0KPiAgDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBkd2MzX2V4eW5vc19kcml2ZXIgPSB7DQo+ICAJLnByb2JlCQk9IGR3YzNfZXh5bm9zX3By
b2JlLA0KPiAtCS5yZW1vdmUJCT0gZHdjM19leHlub3NfcmVtb3ZlLA0KPiArCS5yZW1vdmVfbmV3
CT0gZHdjM19leHlub3NfcmVtb3ZlLA0KPiAgCS5kcml2ZXIJCT0gew0KPiAgCQkubmFtZQk9ICJl
eHlub3MtZHdjMyIsDQo+ICAJCS5vZl9tYXRjaF90YWJsZSA9IGV4eW5vc19kd2MzX21hdGNoLA0K
PiAtLSANCj4gMi4zOS4yDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
