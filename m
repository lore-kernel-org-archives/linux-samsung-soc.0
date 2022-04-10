Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18A4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Apr 2022 18:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbiDJSOu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 10 Apr 2022 14:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233036AbiDJSOt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Apr 2022 14:14:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F95D60D98;
        Sun, 10 Apr 2022 11:12:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BDBE482;
        Sun, 10 Apr 2022 20:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649614356;
        bh=jX5Le6TCB9q6490TZDhc0xzt6OcdxmfvhJ4v0itjJg0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VldgW/moPWOythTuBPC5xGILucTXvchs1S+SzHc+XewE9FS4bpMGqz4LMJBWCT8rD
         bsdB8fodo/WycYgazUmkG7xeUub+SpFgkcyQxnXDQSEpOXo/U9E7QniIgd3prhTSPb
         sdKF3FdU9F7D1eshmFt6myXZdPI5eODsxnQfD4S4=
Date:   Sun, 10 Apr 2022 21:12:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: [PATCH 10/11] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8MM support
Message-ID: <YlMeEqhkQ6HuCKFE@pendragon.ideasonboard.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <20220408162108.184583-11-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220408162108.184583-11-jagan@amarulasolutions.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan,

Thank you for the patch.

On Fri, Apr 08, 2022 at 09:51:07PM +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8MM/i.MX8MN SoC.
> 
> Add dt-bingings for it.
> 
> v1:
> * new patch
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> index be377786e8cd..5133d4d39190 100644
> --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> @@ -7,6 +7,7 @@ Required properties:

May I try and ask you to convert the DT bindings to YAML as part of this
series ? :-)

>  		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
>  		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
>  		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
> +		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */

Should we have two different compatible strings for i.MX8MM and i.MX8MN
?

>    - reg: physical base address and length of the registers set for the device
>    - interrupts: should contain DSI interrupt
>    - clocks: list of clock specifiers, must contain an entry for each required

-- 
Regards,

Laurent Pinchart
