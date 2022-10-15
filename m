Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330F9C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 15 Oct 2022 22:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiJOWBv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 15 Oct 2022 18:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJOWBt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 18:01:49 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4583B96C
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Oct 2022 15:01:47 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3170184D45;
        Sun, 16 Oct 2022 00:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665871305;
        bh=5RizyXD0uBD/KJYAOrgaaQ82URsfpCiastxnkITJOzc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=q8/gE9DdVNOn7S1q84SZIwimPE7gVl5387Gmc8rz7i7heCVnFQhD+lj2iQVqv/fab
         +ulNW3vS+3OED/AKBYHMDgaPv51HuDlHaYTjp+SEzDFR9uhXEB1M+BCiEmsnV+agdb
         3dsPWxLwJHJXJSYHgXIDAEgjvn1V6gn2pGKba5LQgUTPN3yZ8RHNbO7hbvcNsnIqWT
         k4omQKCIbK41540a1p5qAxXx0E+tSGc1DNvVs0kjE6U4yU2/I3Yy9s3QDcrDsvybRj
         CVlbBPwHtZkRy12GwfBrdTIFtN1uB548sN9LGPBFeOVq9e3eLWn/T9g4+FMWS5BGwL
         J4iJjXrNsMqpQ==
Message-ID: <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
Date:   Sun, 16 Oct 2022 00:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 07/10] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
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
 <20221005151309.7278-8-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-8-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/5/22 17:13, Jagan Teki wrote:

[...]

> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> +#define MAX_INPUT_SEL_FORMATS	1
> +
> +static u32 *
> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state,
> +				       u32 output_fmt,
> +				       unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	/* This is the DSI-end bus format */
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;

Is this the only supported format ? NXP AN13573 lists the following:

i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
3.7.4 Pixel formats
Table 14. DSI pixel packing formats

Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
Packed Pixel Stream, 24-bit YCbCr, 4:2:2
Packed Pixel Stream, 16-bit YCbCr, 4:2:2
Packed Pixel Stream, 30-bit RGB, 10-10-10
Packed Pixel Stream, 36-bit RGB, 12-12-12
Packed Pixel Stream, 12-bit YCbCr, 4:2:0
Packed Pixel Stream, 16-bit RGB, 5-6-5
Packed Pixel Stream, 18-bit RGB, 6-6-6
Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
Packed Pixel Stream, 24-bit RGB, 8-8-8 Format

The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP 
LCDIFv3 can also generate the 16bit YCbCr .

It seems there should be more formats here.
