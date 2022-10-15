Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8302C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 15 Oct 2022 21:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJOVaU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 15 Oct 2022 17:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiJOVaT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 17:30:19 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985A736439
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Oct 2022 14:30:18 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E090B84C60;
        Sat, 15 Oct 2022 23:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665869416;
        bh=gGNhdSdYSgMq83bmJndDIz7hsraC7M6ZXTqA6z7FUb0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SSU71wsmJojX8P/dBJ2oSq/N0F5VZsQaYefNgCUQJ0TnrbnlMM74JFU4uQOuqtnA9
         eDvX2uEK7+PXKWN6d/AzTj48SvD/D7m5XoXEuw6X1uKpVkU34/hA9RENji3mevCfI9
         dYup5IGn7zf3UgEKqBmTDL0FKDeDDNEAjuE0d6V/gZMKAB3bHYidUI5XlY1b3+KG9b
         GMw7Hj2uFKYKzKlDPRyMweTPoXVNEMzJloFynKEF4YJviWjIcUFg9oXRux7HMGDJVE
         hWOhyN2cgsciT0CvB3PXnqcTJGRpiKjx/PeApcotEs1kO0zHBn3C5fItmh7gnlv9Ld
         tEeM9tRuf5nMg==
Message-ID: <f94cf5e8-740b-3db4-c934-f0a9e3d4ef2c@denx.de>
Date:   Sat, 15 Oct 2022 23:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 10/10] drm: bridge: samsung-dsim: Add i.MX8MM support
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
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-11-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-11-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/5/22 17:13, Jagan Teki wrote:

[...]

> +static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
> +	.reg_ofs = exynos5433_reg_ofs,
> +	.plltmr_reg = 0xa0,
> +	.has_clklane_stop = 1,
> +	.num_clks = 2,
> +	.max_freq = 2100,
> +	.wait_for_reset = 0,
> +	.num_bits_resol = 12,
> +	/**

Should this really be kerneldoc style /** comment or plain /* comment ?
If the later, please fix globally, there are multiple such FIXME comments.

> +	 * FIXME:
> +	 * Offset value used from downstream drivers/gpu/drm/bridge/sec-dsim.c
> +	 * remove this comment if it is true else update the logic.
> +	 */
> +	.pll_p_offset = 14,
> +	.reg_values = imx8mm_dsim_reg_values,
> +};

[...]
