Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B627AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 May 2022 10:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiEKKb0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 May 2022 06:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiEKKbW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 May 2022 06:31:22 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCF331DE7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 May 2022 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652265080; x=1683801080;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dN+pXXDlupQvDGNruDZDQUFQnnUeguEFq9tC2UDQXjk=;
  b=F2f1Tp9mJ4qO6tJdxMEIjiGveS+fhogjDwN2XY7NY0TGwlVinZ7kgZmY
   la1rQhx74UWc0XiIS33qFVPg+0QUPlSSePB34JLr5MSXcRzi6c7ZacBL1
   MqOJiVi7w/37OCSgH5Asm+bsbuilfuFU9yKUBqe8FQjlR181yNL0lqkuX
   FAcHSSC57g2PM0cTOIFSvAwGfiR1n1qWS6KsAeUO0HTvyxmuTo5t1SNIZ
   bw9XdHJ9Uqz9L0IhhkNF4Lfq1IAISEUIZ0iGlKrLT21/pK5txDGTE+agU
   5HF3vdT0ZPpk2+9L/uFQU53oyxVgVvomjbnr+09APhIx5MkCe1p/ew9XF
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="268496322"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="268496322"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 03:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="895294529"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga005.fm.intel.com with ESMTP; 11 May 2022 03:31:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 03:31:19 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 03:31:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 11 May 2022 03:31:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 11 May 2022 03:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6aPmlyWVZuu7Bt1XglzMaLL4mGinl0rxwyVQQunmlwo+3L22DmzHFlrcYyYMHaCI4UOTkBwEV007M//DhI35siKxnJZVmyIPHc0BF51/MHGZxjHY9fnwzaPP6OSAk/scrpMRo8YpfZNpLfJK+ODmZjZu/YloS4Xo3qHH9OhMhY87mgSDrZGlE4iNjIHUxOhEdFn8nRHFFrgEYPilTIECPVrJNiqZT7PMJbiNRkpdAEtE5E8AcjUmn2vezWjNt3ZpgKLzjKGK4YdQdDqqF3PRnHtGyqRWhubOD90I7rFU5vMfHUF3LT89d2Z09AQ6ejOSvEfOTNrkbJnl9sr9HwqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgBUj+UzNvtxgT4r5QvEt5mF+KLYy1r97839FoCIykQ=;
 b=lBbaTJCLKzgBqrIJZbpLT6Y4AxzKLjwcvjeRMAz7QHf3JxWOQT8sBWikreNGknWvOHAEWVCG225at8RDpTwZ0mK8wi4WvtVUj+pyy4404ouA42CkIIPj6nX8ek3wX/T+jstxRddL8SOKhoYQqLEJcwaA2iaNZndMwd8R2wh4uCWQKGoUDnggvT9Faj9GT06nLq0EYmYZpp1bD42FeUZBURM8S9wZjiDXWrT96ImotXPPK0PHiBS1Zx+Fon67FP5V20kKEoDwkles0HN0QTvrQ7kLek2dNPlzIAf5461X3xmfeO0omAxVUJJT5v/xRVQX9YRFvlCxN0qmClz0MnRN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (20.176.122.77) by
 BN9PR11MB5276.namprd11.prod.outlook.com (13.101.156.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Wed, 11 May 2022 10:31:17 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b1fa:393c:9fb6:6871%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 10:31:16 +0000
Message-ID: <17782795-10f1-067d-c6af-f82d64c6273e@intel.com>
Date:   Wed, 11 May 2022 12:31:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        "Kyungmin Park" <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        "Neil Armstrong" <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
CC:     <linux-samsung-soc@vger.kernel.org>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        <dri-devel@lists.freedesktop.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-9-jagan@amarulasolutions.com>
From:   Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220504114021.33265-9-jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02545d58-7f0f-4d18-ee7b-08da33396156
X-MS-TrafficTypeDiagnostic: BN9PR11MB5276:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN9PR11MB5276B959D51D0416AD978014EBC89@BN9PR11MB5276.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4oboz+rqDiqhaHvoKKMCzqbveozavd0bmm5r3T4Y6OYu/o/2eUrwTwNKT9Vzbl7tF9dvO3H7BbWzNaSDeS+w5pkpDKC2rnuEYv2imGY/eHTnu7QP6SN1mlmM/x5iiJauS6guGHGBl6cTammy14vzR+SQG1TJnbETyYd0wQCnmuOXzjH2fFLp25xuRztwSHK1WjTNhMXY/Cdct68SExFf4jcWdVHE97j0+0in7RXXqn6F1Gr6XAvBG3onP0YgVzLojuXMooXKYz0AG8pSMNp+eu3HB5nmSCZRuOOwENRhDMa4tV7/qMKeIzn5cXRJk1URvLKo05p3oYJEYIVuUWxB1RQ42mjFW6FB+bYQtrYT/3Yi73weYn6sKnnxew7iIV2F++u3cx0JaGfneEHaEAZfv5l6kjoSYsBbga1Ikl1srtIljPxL2FAEUOAn/S5/v+kzIpFbSyGldsRtP2TrPx1GIWUQwkSXUNnNvjOLcRgvHf85bHwd+fSqtReYvqlqGMlBsFSxyoRf3PPLLOzkHYZIP1gjS3Qmo0Rby3aJj4bfPP0v066vbGb81+3Se6OikANpEgoKtGxAPjOUW4ZrPnxrHfQtKlk1Imc0v1rMGdtZE4G7yuLV7B+dUTVR9Hm9bz6BiLi2tpiEhplidTGPVtl/PuaVBZh2uBn54RZ3g/M34qSe8romUuZxZ2aWOTssMiHI6d4gU6QCjMl8LuxcIQ/ObCVBz38raBJ8zTYy3aENJyVpx/f5tAXG3Uo7n9nX/8ON
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(508600001)(82960400001)(6486002)(966005)(8936002)(316002)(38100700002)(31696002)(66476007)(921005)(110136005)(54906003)(4326008)(8676002)(86362001)(66946007)(7416002)(31686004)(83380400001)(26005)(44832011)(6666004)(6512007)(53546011)(36916002)(6506007)(2616005)(186003)(2906002)(36756003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWJPdWk3aThsMXRndXVxVTJKWEg0QU5TSHRMYkpkNDUxalBJTWtMb3ovbTVX?=
 =?utf-8?B?UlMxWnpMSHNvTWZjRXB5ZEV1OTZCdUlpYSsydWxoVzcyTkZPbWNDWE1GYk1w?=
 =?utf-8?B?ay9lVVY0NzhQWHdwNTc3YjVFOHpBTnBYbERFU3p0NDBtVVNqTjRDWW1xV0Fp?=
 =?utf-8?B?czdMZ09tZC95YWV4eEZzRFNhOHRaNHU3Tmo5cXdQZTZYd2xqNXhIU2JXbFJU?=
 =?utf-8?B?cGprRjZaRnBEZlZ2NE9MVGwzN3RmOWtvOHYzWFdlOWxXcjZJVlhocEx2VDB0?=
 =?utf-8?B?Y2xqM1BHRmpJNFBSVjMvcmFZZ094WE5jT3hHaXdjRVBCK3A5V2FqNXhZYURQ?=
 =?utf-8?B?N3FHQXBtdnI2d29hRnhZcElySFRvbHA4eTBJQ1JheS9XTFFBK05kTXB2WWpt?=
 =?utf-8?B?aytzaDA3YXBMRTFhNmJGM1QwTjQrVEdsMDArVXg2cnR3QlZmMzBkc001Y3A2?=
 =?utf-8?B?Y2pTZEdRM3pkcXdtNmlacW9qRnU3SkFzTzdlNTRDSzF2ZFRZWGU2NlBCSnVi?=
 =?utf-8?B?QUdVK24rRE1DcEd6RktUNVNUMXBTdFBzNWhGOFVDV3Z2ZVM3VmV6b1NOdmJr?=
 =?utf-8?B?YWc4cFhBQm9Wd0hmS050ampkbEZHMjJiL1JVYUFOR1M4WVNIcTh4NDRtWjNT?=
 =?utf-8?B?cmVjd1c4L0Z1VDNQeWNCVDh2K2JHWHFLVlFEVXNTc3NXeWo1eVQydzdXUDBE?=
 =?utf-8?B?cGRLTXBrTVJ4Q090aGhvUm5CQU4xcng4dFBvbmRDeDVuWitEZHY2dFRnNlRE?=
 =?utf-8?B?eTZFZjhNUHRQWXNsWWYrb2dmd2VBMC85azZiTDZicHF1RmZPOThnZUx1NCs3?=
 =?utf-8?B?b0ZTb3pmdUhqbmVJTk5jaVpGRDRvcVdpNVlBWUF5dE5OYXBhWTR5ZTVsWHJi?=
 =?utf-8?B?c21wSUovbHRxR2xoUHJ2aERDc3c2SFc4RXQ1UFZhQU54a2VxaFV5SVBmbVg0?=
 =?utf-8?B?TTFsU2dtSzlrV0gxYnhsR212bVBIY3IxRmdYTVdjajhsWW16MmFCOE5PL25x?=
 =?utf-8?B?ZWR1REdmRTFRK29oVVhZcEJOOWlJY200cytDYS8xTk5OanVNMXBXT3BiU2pE?=
 =?utf-8?B?eEs1OS82U3Q3S0x1a2ZDWk0wU3FLeWpKbWZEZFEvK0UwWmtTUVhOOTBLT1RD?=
 =?utf-8?B?SzAxd05id0JoN0FmSUhZQ0tMamltUXRHdDAraldsN1RTem90UlM1K3o0OWls?=
 =?utf-8?B?ZUFuTXlUcFgwaHVOTythc0Q3TGdRQmtZRVJ0aUJ3cUJmQ0FtZ2xHWk9LMHk3?=
 =?utf-8?B?aWg4akc1NnFnVEU1TDVwQmh3RmZYTjRjNWdaUWlSbW5KYnVlQ01SZHZ4S1dQ?=
 =?utf-8?B?blJCaW02ZmVwME9Ia1BNdHA5NUNyOExsRnNreE9hc1pXNGVSd0JWQk9xd2l4?=
 =?utf-8?B?TW1XaThGcXY2c21QSTByNW1vb2V4ekw5dEZSZVFuVC9aVmRYL2tKMUZQcy9L?=
 =?utf-8?B?SlZybHlhVTRPR1F2M1c1OGREZnVvRUhaZlRPOGRVWUx3SE4yN2x2Z3ozeXNO?=
 =?utf-8?B?YnZ0bEtXZHM2WFNGSGhaWVY0aGVFWWVrSlZpMjZkZDkya1BHaXVlaVh1dG03?=
 =?utf-8?B?YVVkeWVmTys3VHk5ZDVyWFZzR2FTZzZ4UEVncFFLUS8vUFBPN0V3dlFodEdi?=
 =?utf-8?B?bDR2MDI3cTVzNHc5MXdPcnoxY3BMTWt5akR2SlpCZDVuZ3kxZ0xKbHc4N2lO?=
 =?utf-8?B?QllEa2RJdnZ0dDVmOGRiVkxPUEo3TTdQNXM0c01UWHlCd2RSZlRPYlQ0eS8y?=
 =?utf-8?B?d0pFb05KOXFYVnJJNFduTUR2VkJUK0FoR0ZEVEFqYlFZZGhSWlVwUzhoN3JW?=
 =?utf-8?B?UHI2LzlOeG01QjBmTUZLQVp6czE4YnhPcyttOElYRCtJeVh1MTFqVXJHaUsv?=
 =?utf-8?B?S3dDVU94bkRVR216YmZnT0RmbGtQOE1IMWdIRHppN2VUQTBQNGpDd2pTbTNY?=
 =?utf-8?B?WEtLYzd1U1U2MTBtWXE2SncrL21VRkdwWjN6dk1JcUR4RlF3RjF5N1M4bmx2?=
 =?utf-8?B?UWtZMlR5K004M2xDaWlHRkZEMFhpQWxpaytybWUrYjZhUjBtVXYxWHBPZ3Jx?=
 =?utf-8?B?SXhFNytPZGJRVVJRREVRWmFFR2V4V2NmTVNLekw4ZTNrUStJK3dMdkpaUzRE?=
 =?utf-8?B?M3ZRcE4xUkQ1dS9wdFI2THJicGplOGMwR2kzOFVxYnRremI0MlI4cis4QjZK?=
 =?utf-8?B?MGVuNExpczJ3R2dyRkVYSlRkV1R0ZHpkQnZ0a3hkc2hRaGR5NlV6YnVCNDJj?=
 =?utf-8?B?aXdrK0E5VUhjaSt3NDYyYVMwaUpvTUNySHdIWjNFaHZpSCt1aStTUzhkclho?=
 =?utf-8?B?YUhEWGdwY09ZaGZHWWhVU0FOeHd3L0t6VXVUMUZES2pNU2hpUkZVK3UybUhF?=
 =?utf-8?Q?tD24efqiIW6IKA/Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02545d58-7f0f-4d18-ee7b-08da33396156
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 10:31:16.8242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4tzAguHWZylipRzZPznIAyWQLgnBIGt59N/QSlyKezEdaiXXwt+UK/4J2SYf+CAkxazLL6qqge54V7qjnih+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04.05.2022 13:40, Jagan Teki wrote:
> Fixing up the mode flags is required in order to correlate the
> correct sync flags of the surrounding components in the chain
> to make sure the whole pipeline can work properly.
> 
> So, handle the mode flags via bridge, atomic_check.
> 
> v2:
> * none
> 
> v1:
> * fix mode flags in atomic_check instead of mode_fixup
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index b618e52d0ee3..bd78cef890e4 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state)
> +{
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> +
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);


1. Shouldn't this be in mode_fixup callback?
2. Where this requirement comes from? As Marek says it breaks Samsung 
platforms and is against DSIM specification[1]:

"45.2.2.1.2 RGB Interface
Vsync, Hsync, and VDEN are active high signals"

[1]: 
https://chasinglulu.github.io/downloads/SEC_Exynos4412_Users%20Manual_Ver.1.00.00.pdf

Regards
Andrzej



> +
> +	return 0;
> +}
> +
>   static void samsung_dsim_mode_set(struct drm_bridge *bridge,
>   				  const struct drm_display_mode *mode,
>   				  const struct drm_display_mode *adjusted_mode)
> @@ -1361,6 +1374,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>   	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
>   	.atomic_reset			= drm_atomic_helper_bridge_reset,
> +	.atomic_check			= samsung_dsim_atomic_check,
>   	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
>   	.atomic_enable			= samsung_dsim_atomic_enable,
>   	.atomic_disable			= samsung_dsim_atomic_disable,

