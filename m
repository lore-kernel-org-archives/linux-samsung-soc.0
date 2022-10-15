Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4465C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 15 Oct 2022 21:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiJOVsz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 15 Oct 2022 17:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiJOVsy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 17:48:54 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A147143617
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Oct 2022 14:48:53 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id ED7C884D45;
        Sat, 15 Oct 2022 23:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665870532;
        bh=efO60EAuF7m+5LLMLcJOL1METMAdjZQ8wq2m3JU0vKQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oREpGIvumacvfwdguePBsTQ1frq46oe3uDW6qcHDHYfrwaqwNGeky4IvtRXRT53VP
         i9t1ks2E9s99KFNGBCVHOQxbC+/o6n/Xrv88LfqwAv/5ESmbViVj/qNFmpsCYy83ZM
         UKKhB+tG3uWRAH6mBTQuyhlBAY70GAaTrvByOGHMoelh83HOM/zFkjXCtVjZzhtxp8
         v7VtoU/5KqAcgvTXRQW9V5IR1iX0IE1splCTxh0pqoUFCeh7NXUsVoNfEdbN9qzy/J
         VE2w22APX6rAKrA/2LilLoQCD/UpVTKrLbeonSiN0OjuEZJdD6/ZHCML8hKY8VKwca
         SnNa02nfdXlAA==
Message-ID: <45f9065d-7257-1050-2664-5ad55d8c14ae@denx.de>
Date:   Sat, 15 Oct 2022 23:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 02/10] drm: bridge: samsung-dsim: Lookup OF-graph or
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
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-3-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-3-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/5/22 17:13, Jagan Teki wrote:
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

This looks like a good candidate for common/helper code which can be 
reused by other similar drivers.
