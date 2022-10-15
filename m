Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F5EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 15 Oct 2022 21:23:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJOVXK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 15 Oct 2022 17:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiJOVXJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 17:23:09 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4A23DBC7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Oct 2022 14:23:06 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C3BAD81F4E;
        Sat, 15 Oct 2022 23:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665868983;
        bh=lPgtUCPpTa/WL34EWEkiQDRyFdwHRUOwPPDz/2rd0vc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=trp4E3fp7WAf8pMqQg+O5akB4FIYqBU8gEEqcZ3BkFhVQUfIRXsiIQ7irodGligEI
         1X7OFGZIeomcAID9bx2oX/haCd/dFKKdXiitx8DsKKIagafPKsEZa6MweTimr/97On
         zotWM9/koL1ysSMTS/5iB0jI3p3u/IuREW/QJFfm+hxYFNRAAEJ+D+lqC3B5WmeGWu
         02oq0QC2TtP/4W7orjMZ7g8IDH2pufgnWl54OdF8OG6AV5PYNYzLDCb2SilOe3gb77
         kvBXIMWPaFvGiV5Bah1qSXZgGrAKnRlcQ6ru7GhUT4gac/qF6QKaBIA/sVEecRGFhS
         dm2LnlAWuGazg==
Message-ID: <acc210c6-f3ae-a836-e2fc-5b1872b5bbd7@denx.de>
Date:   Sat, 15 Oct 2022 23:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 05/10] drm: bridge: samsung-dsim: Add atomic_check
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
 <20221005151309.7278-6-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-6-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/5/22 17:13, Jagan Teki wrote:
> Look like an explicit fixing up of mode_flags is required for DSIM IP
> present in i.MX8M Mini/Nano SoCs.
> 
> At least the LCDIF + DSIM needs active low sync polarities in order
> to correlate the correct sync flags of the surrounding components in
> the chain to make sure the whole pipeline can work properly.
> 
> On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
> Rev. 3, 11/2020 says.
> "13.6.3.5.2 RGB interface
>   Vsync, Hsync, and VDEN are active high signals."
> 
> No clear evidence about whether it can be documentation issues or
> something, so added a comment FIXME for this and updated the active low
> sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.

[...]

> +static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state)
> +{
> +	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
> +
> +	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
> +		/**
> +		 * FIXME:
> +		 * At least LCDIF + DSIM needs active low sync,
> +		 * but i.MX 8M Mini Applications Processor Reference Manual,
> +		 * Rev. 3, 11/2020 says
> +		 *
> +		 * 13.6.3.5.2 RGB interface
> +		 * Vsync, Hsync, and VDEN are active high signals.
> +		 */
> +		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +	}

It would be good to explain what exactly is going on here in the 
comment, the comment says "Vsync, Hsync, and VDEN are active high 
signals." and the code below does exact opposite and sets NxSYNC flags.

Yes, the MX8MM/MN does need HS/VS/DE active LOW, it is a quirk of that 
MXSFB-DSIM glue logic. The MX8MP needs the exact opposite on all three, 
active HIGH.

It would also be good to mention both MX8MM and MX8MN are affected, not 
only MX8MM.
