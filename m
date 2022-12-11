Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36D1C10F1B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 11 Dec 2022 02:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiLKC24 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 10 Dec 2022 21:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiLKC2u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2022 21:28:50 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFF713DDC
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 18:28:47 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B1F3285378;
        Sun, 11 Dec 2022 03:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670725726;
        bh=6wbaUdRNRrW1XRilfBeFLxQUlSweBeTkrszbCp54Uxk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=izJmlasxQK/v8WnSyl+Ugp1ZapsnXYizz4xvpkHdS/l+eoMxN6mCAkXtsauUPkZiw
         5CQfvA+LV77L4aXmcfZBJfDtcdOeicITmcYBamVTjHj/ygoCGYr2Tqhj/3GAvI13MM
         v5Nb4KPUxqVU6YCRPVDcsNjvDeVpBH0KjVlaj0M/odbd0491Vw1PtTlg1j01M8ktb3
         ai0sIJTj9RFQXb1Cs+KFYoPSeHWskNORdEPsnnOERUjFJBfRzqoC9NYP+3LZhfSAie
         eG5WFBytWW++BI4ecE+8pxd11T9xKoZm1VhmQqUgcdaTc4L5iKB8SpuUnrxd+ALuov
         vYjcRjvUZVFNg==
Message-ID: <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
Date:   Sun, 11 Dec 2022 03:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 07/18] drm: bridge: samsung-dsim: Lookup OF-graph or
 Child node devices
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
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-8-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221209152343.180139-8-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/9/22 16:23, Jagan Teki wrote:
> The child devices in MIPI DSI can be binding with OF-graph
> and also via child nodes.
> 
> The OF-graph interface represents the child devices via
> remote and associated endpoint numbers like
> 
> dsi {
>     compatible = "fsl,imx8mm-mipi-dsim";
> 
>     ports {
> 	port@0 {
> 	     reg = <0>;
> 
> 	     dsi_in_lcdif: endpoint@0 {
> 		  reg = <0>;
> 		  remote-endpoint = <&lcdif_out_dsi>;
> 	     };
> 	};
> 
> 	port@1 {
> 	     reg = <1>;
> 
> 	     dsi_out_bridge: endpoint {
> 		  remote-endpoint = <&bridge_in_dsi>;
> 	     };
> 	};
> };
> 
> The child node interface represents the child devices via
> conventional child nodes on given DSI parent like
> 
> dsi {
>     compatible = "samsung,exynos5433-mipi-dsi";
> 
>     ports {
>          port@0 {
>               reg = <0>;
> 
>               dsi_to_mic: endpoint {
>                    remote-endpoint = <&mic_to_dsi>;
>               };
>          };
>     };
> 
>     panel@0 {
>          reg = <0>;
>     };
> };
> 
> As Samsung DSIM bridge is common DSI IP across all Exynos DSI
> and NXP i.MX8M host controllers, this patch adds support to
> lookup the child devices whether its bindings on the associated
> host represent OF-graph or child node interfaces.
> 
> v9, v8, v7, v6, v5, v4, v3:
> * none
> 
> v2:
> * new patch

This looks like a good candidate for common/helper code which can be 
reused by other similar drivers.
