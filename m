Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Dec 2020 15:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D86532310D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Dec 2020 15:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgLJPCa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Dec 2020 10:02:30 -0500
Received: from mail-eopbgr50125.outbound.protection.outlook.com ([40.107.5.125]:15174
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730966AbgLJPC1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 10:02:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyb8XB/sHzQgWUcRq4fdVIVO71WzFHUz6r+kWMejzviJwNEEIokjg2aRN7mKRM5bMKrxx37u5Vka0TY8OmVs/6HuOYhE31eU+TsNiO3JV6ysDqx2FELDu/arMjNWjYNWyCf2qxVxcjUV17UymVoWj00fYpf9RCl0yWBrecppT1+noKPeEPW7sMxVd+OITQ1efdafcAC0kQaLXZKWftAu/Cu/Kd5Be7QseLg/V4+Yn/cWJOYIHgrC0Y6tkuuh14qCtiixMLrwWLpxYQenWDx6YS5oOYYnL6qwCJ06vmMYXikmTs2mwhU+1nfoWgh1oxkz/DjjZ1IdfoEa+xTpAD/gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/w6DGfBZaqRXK0w0HB0dcft/3aTxTOjArxX/m39zMw=;
 b=XQoBAhOVK+oqkF0WgLXXs4aVrO8s5/ywa9ObJPxauudnrCFG0HYkTSSUSmojZv2p97chyzTuAT6wMaV11L9KTQ4Wq/DOALhjmvhq/HJ9kAAYSm12V/mX0LlOck3oP70y2kMeYMvofkJ4vWndMfquOZMMjIi0PsYbgqFAYLmKoHg78vDeKAquWK2Vi9u0+Qq37axaPKEKElP+su8n0zRl4ENWEZ6K9CZy0wqBLrMZXOr2T75Sl0Ni7I8T5KJG6uCVqcuyeQ6SKvJqgMRCC06U09PjLYMuu2ffXIGm/X6kR2JlsDyN+5e4wRBnNhrotbOuOjEoSmaQ6TZzr8FmuPi1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/w6DGfBZaqRXK0w0HB0dcft/3aTxTOjArxX/m39zMw=;
 b=BBhxecqd5CPPW5WbTpcj2AZWdDyU926JqLJGLhAlbnUVvhZEP2EbFz9p4iy/YE5YaG5vVKm8tDfo6L4KmR/jUr3ESwoq6fwo2QZtbBdEjcRpuYL2hU+nkJWHSwWvuxLVS96AU7x17DNNXBXefASl5KN5Tkg2wFi/7jg3YI4UHck=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4312.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:01:38 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9d5:953d:42a3:f862%7]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 15:01:38 +0000
Subject: Re: [PATCH 2/3] drm/exynos: Scale the DSIM PHY HFP/HBP/HSA to lanes
 and bpp
To:     Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc:     linux-samsung-soc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20201005134250.527153-1-marex@denx.de>
 <20201005134250.527153-2-marex@denx.de>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <117ac9a9-3355-7d00-8e2b-2af05157b2f7@kontron.de>
Date:   Thu, 10 Dec 2020 16:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201005134250.527153-2-marex@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [109.250.142.243]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (109.250.142.243) by AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 15:01:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77236acf-2444-42f0-f47a-08d89d1c7e8f
X-MS-TrafficTypeDiagnostic: AM9PR10MB4312:
X-Microsoft-Antispam-PRVS: <AM9PR10MB4312B27FC8B6778159521539E9CB0@AM9PR10MB4312.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0J480A/kGGycpDr/nL05Ige0p0rglvlzHvCaja0+civagTPRVDJ3zh8xzw4yGskKJYgmHpPECVoYf1GzTYIXd+ijIbA0Ex7TP/v4OcRjhWk0xDRckqUwRIG7pX/c9HsjDOZq9Rb9aRxSNvdgQ7qOHJuXe3g1pdRRC4vvaLIfPCR63WMc+HDD/syUpYaypnLwXOKxbgU96Lj1iru6X88C9PBSPKc+3EM94iZ6aQoTK+VRL6DCCzYogOIaBjoXO0F441Z0QSn42VAGVxUDFZi63KREs/SMHLt7S3+mmDM5j4TUioUQmhKKzOxR+XkO8cud5c6NbupkeGCO5TRJDyuBNGmomr5pRagg24UGQP9MCkXieZEDjZc7YGAHR3eYdJtFnLUZ2ZTezNZpZgWxSBQJT4qi7Ua6OLgxFqhLNr4UZmagtXCZo7UvXSp6cHiUjVKlBgPveDgvboSPwAW248LW+8Jf0Vbzo6ONYP+le9VgFps=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(31696002)(52116002)(53546011)(5660300002)(66476007)(31686004)(7416002)(44832011)(8936002)(66946007)(66556008)(956004)(86362001)(478600001)(2616005)(4326008)(26005)(45080400002)(36756003)(16526019)(16576012)(316002)(66574015)(966005)(83380400001)(2906002)(8676002)(6486002)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTRQM3NycW5CMmRTendIZWs3MUg0aGtnSGpJdC81eURRc0hoUWJZUXp1b2lC?=
 =?utf-8?B?KzliUklnM1lGNklMRk5Mci9ab25sWDBKRFFGMW5XcU4zOUZsTElzVWkwNEJ3?=
 =?utf-8?B?UndoTVkxYlhPcjVWanBkbFltM2hFM0Fva2NDWFFXYlI1SURaeVVFMVBqb1pX?=
 =?utf-8?B?aElYc0x6anlHT0sxSnZVSFJPcUUyWjdVSlcyRDQxaWgzdlhMS3JBQnNDcnVt?=
 =?utf-8?B?eElhL1hVWExRQ3lzVmIyY0J1TXJ2ck83TmZXcWVOcjZYSVhDN2lwb0V3akZx?=
 =?utf-8?B?cDRyck1QTFBQQmtuWXkrK0tLdE94VHYybGkxbHB2UDJpZDh1K1BvWnJrKzJD?=
 =?utf-8?B?UlozcjNFOFJ4OC9sOEg1d1hDMWVpK3dEWkx0Y1EySENPNS93bHhIY3c1c2Vz?=
 =?utf-8?B?SXZTcWduTjIyb2oycXdkc3NIRStwN3laZmpVQ3dseHBDYXE4UktZcnA3S1Bi?=
 =?utf-8?B?eks1VXp6Z1FFMHI4OUZrMEZGQ3RRSG50WUpRWW5aMW4wc20xSXJDWHFsdTJK?=
 =?utf-8?B?YVMwdDRoZXdGWk5mSWV0K28yZmh2MnF5RVk2RTk5RS9SODZsaktDajFUR3lU?=
 =?utf-8?B?VWRzWUNlZFVlak50VUcreVpDZUFXVzUzYzFMVlcvRGFSNkpxNlMxUEE0eVJz?=
 =?utf-8?B?ckcrTnJtUk9GYTdHUHluUjVnT3ord3VSS0ppcTJQQWJLMjJjbFFNM1Q1a1lP?=
 =?utf-8?B?UE42ci9pSU13S2gwQms2bHJ6WCtENStoWlFHeGFaUFN0TS9yckhSUW9RYW0v?=
 =?utf-8?B?dVFmTlBhcGJsSE9VWXkzYmVaT3JLeXNOY2hoeWdWSFZmeGxpUkpXVklIY21W?=
 =?utf-8?B?cUlLd09VNXgvczcySFlNL2QxYTNURzRtSWtxTHNLMytIbDE2emhkOEFkNU4v?=
 =?utf-8?B?alMzQ2oxZVdhV2MvVDk3RFY1UEZrc3pRUXNHb1I0a0h1cmpTc2JIOGhuYndv?=
 =?utf-8?B?UXZsemdIa2hBbFk2U3NWbFlub1BWZUtRcTNPdnUza3A4ZEJmU2djSjJIOUtW?=
 =?utf-8?B?dS9Kd0xsYWhzU3V5MSt4cm5Ya3Z6SmZZOVE2aU9NZ2RQSmxTWnZOdmtoeXRl?=
 =?utf-8?B?RHlVa05rU1NGeGI3ZXkzbWFjR3pQcmFhdlNGU2lDeHBDalBZdkk0eXRCUEpq?=
 =?utf-8?B?KzkrNjh3eEI1RXFuR2RZRHdWM2prTDRseUVDZkVXV250NnpDVW9XTHozaEVw?=
 =?utf-8?B?eHIvbS9pL0g4QlR2WXhmZUFaL1F5b0N5MVRFc211Q3VMWTlEQy9aWVQ2R29j?=
 =?utf-8?B?c3FyaEFkMk9vWGY5SWZCZ01mQTBrbjhFUUZxWDBJSXlQR3V2UmdLWURSTUxQ?=
 =?utf-8?Q?uooKBFvmZFCG6TztGdHHtF4CmRT9LZBt5i?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 15:01:38.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-Network-Message-Id: 77236acf-2444-42f0-f47a-08d89d1c7e8f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPlvN5OkAuBgbJn3hRPMcBagt9czi2kxVnYLrMO7mtZ2tvdsdNHwPIjgFOV/+JVXJAjX79E1xsWavV3vz9D0P55zduv/uc974qF5fp0eN28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4312
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05.10.20 15:42, Marek Vasut wrote:
> The value programmed into horizontal porch and sync registers must be
> scaled to the correct number of DSI lanes and bpp, make it so.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Michael Tretter <m.tretter@pengutronix.de>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> --
> NOTE: This depends on https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Flist%2F%3Fseries%3D347439&amp;data=02%7C01%7Cfrieder.schrempf%40kontron.de%7Ca88f0cdec137451033ab08d86934dbe6%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637375023034158708&amp;sdata=l2pnC0dfueaAGSfwHOK3OpBUJ%2FxnbFKrlpRWlBakVvo%3D&amp;reserved=0
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index fbd87a74eb9f..42b49546dd00 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -740,20 +740,23 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
>   {
>   	struct drm_display_mode *m = &dsi->mode;
>   	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
> +	int bpp;
>   	u32 reg;
>   
>   	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +		bpp = mipi_dsi_pixel_format_to_bpp(dsi->format) / 8;
> +
>   		reg = DSIM_CMD_ALLOW(0xf)
>   			| DSIM_STABLE_VFP(m->vsync_start - m->vdisplay)
>   			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
>   		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
>   
> -		reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
> -			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
> +		reg = DSIM_MAIN_HFP((m->hsync_start - m->hdisplay) * bpp / dsi->lanes)
> +			| DSIM_MAIN_HBP((m->htotal - m->hsync_end) * bpp / dsi->lanes);
>   		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
>   
>   		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
> -			| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
> +			| DSIM_MAIN_HSA((m->hsync_end - m->hsync_start) * bpp / dsi->lanes);
>   		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);

I did a bit of testing with the DSIM and BLK-CTL on i.MX8MM and I'm 
seeing some issues with these settings. I think your changes are 
correct, but to get my display configuration working I still need to add 
this [1] ported from the downstream driver [2]. Though, I can't really 
tell if this is a correct fix or something else is wrong.

[1] 
https://github.com/fschrempf/linux/commit/65e50ebc38706ca9b5b3dec8a6ab9b28907f5d3a
[2] 
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n932

>   	}
>   	reg =  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
> 
