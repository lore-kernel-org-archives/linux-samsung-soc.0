Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4B7C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 20:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbjAXUpa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:45:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234364AbjAXUp1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 15:45:27 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F58D4F865
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 12:45:23 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B03D6817FB;
        Tue, 24 Jan 2023 21:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674593120;
        bh=5NTBROYdPWn9AnfsKxRDsXDu4LyTMFtmByE17bfoomM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wnhN7fesBIQye2m7qlmLA7eLXLnVxafGZ6Ub8c6rm+iFyJcEd2tV7oHbc6tcOojLi
         X3dIruMINR8OVdNeEmDnMr7RFKA3+/77+ufrgsj2Vet/qgLN04y0zhKBHo5yzqSBD2
         i+lyLCQ9xcn0ak35czLoQz6QCH9ZBoRWOZ5n+MHrCRaRLy2rHSIsP8ukm1ozKjeL8S
         h/BpM/nKhxdZgTX7KLDGG0782Z6XXJ6gQt0HRVfbEGuqRPSmRcqqLZCTJk3snQQMkL
         Moc1hYtu+lD4J1uH8Wyhs3REXsjz7mvI1QvBL/kHklnSGXFZ51MLUNKc6dZeWpAZkr
         TNZ4W7Zg63tpA==
Message-ID: <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
Date:   Tue, 24 Jan 2023 21:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 11/18] drm: exynos: dsi: Add
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
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-12-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-12-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:

[...]

> +static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
> +{
> +	int i;

if (fmt == MEDIA_BUS_FMT_FIXED)
  return false;

> +	for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
> +		if (exynos_dsi_pixel_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state,
> +				     u32 output_fmt,
> +				     unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
> +		/*
> +		 * Some bridge/display drivers are still not able to pass the
> +		 * correct format, so handle those pipelines by falling back
> +		 * to the default format till the supported formats finalized.
> +		 */
> +		output_fmt = MEDIA_BUS_FMT_RGB888_1X24;

You can move this ^ past the kmalloc() call, so in unlikely case the 
kmalloc() fails, it would fail first.

> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;

Delete from here ...

> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	default:
> +		input_fmts[0] = output_fmt;
> +		break;
> +	}

... until here, and do simple:

input_fmts[0] = output_fmt;

The effect should be the same, the code should be simpler and faster.

> +	*num_input_fmts = 1;

[...]
