Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B4FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 13 Nov 2022 00:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiKMAZU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 12 Nov 2022 19:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiKMAZU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Nov 2022 19:25:20 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525A311459
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Nov 2022 16:25:19 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id ADAD885150;
        Sun, 13 Nov 2022 01:25:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668299117;
        bh=6W5Iw3FDDALHhAxkN8R/j9Y3oTSkSC1MVWnybXewZTA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aV4OfFRNnW9e8cz66tduDOtq4/bTS00vAT+8GIZVe2Gw2i3NdaseLKWnj1rjR6NyT
         qr67tKYOGrgB0r9MAIBgZLdj0U7hGS4wif0F5B6+4KD1NozaNNwW0RK88ARuKMvtdW
         ISsjgvEdyad0PUuwQftFaajKjz9QoJHxVz40gcz9mmlaKKHlR1oo9udvCbF1kyQkO5
         1R64RKVv3ApazQ78gBIOMAtgKoAwmXR8vEDWx8kZe1Hrm/GKWJlUdvzAgWS6xR3Sl/
         ULWIHa07mym5wsjkAvxxuAFTi4G4DdvfILVIC0Hl0T8Sy4Nts0udHDOfoHzKIQv+Ts
         vu9BWzi24vNLA==
Message-ID: <19761b19-72ac-249a-05f3-d99e27733ae0@denx.de>
Date:   Sun, 13 Nov 2022 01:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE
 bits
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-3-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221110183853.3678209-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/10/22 19:38, Jagan Teki wrote:
> HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
> conversion as 'disable mode bit' due to its bit definition,
> 0 = Enable and 1 = Disable.
> 
> Fix the naming convention of the mode bits.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index b5305b145ddb..fce7f0a7e4ee 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -75,10 +75,10 @@
>   #define DSIM_MAIN_PIX_FORMAT_RGB565	(0x4 << 12)
>   #define DSIM_SUB_VC			(((x) & 0x3) << 16)
>   #define DSIM_MAIN_VC			(((x) & 0x3) << 18)
> -#define DSIM_HSA_MODE			(1 << 20)
> -#define DSIM_HBP_MODE			(1 << 21)
> -#define DSIM_HFP_MODE			(1 << 22)
> -#define DSIM_HSE_MODE			(1 << 23)
> +#define DSIM_HSA_DISABLE		(1 << 20)
> +#define DSIM_HBP_DISABLE		(1 << 21)
> +#define DSIM_HFP_DISABLE		(1 << 22)
> +#define DSIM_HSE_DISABLE		(1 << 23)

Those four bits are called Hxx_DISABLE_MODE in the MX8M{M,N,P}RM at 
least, so keep both suffixes .

A separate patch which turns those bits to BIT() macro would be nice.
