Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37931C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 20:55:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjAXUzd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:55:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234433AbjAXUzc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 15:55:32 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6720593EC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 12:55:25 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C51E581F59;
        Tue, 24 Jan 2023 21:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674593724;
        bh=1C5ObJ1CCeRkMXuRMUxJFeHDmh5wJ/LWIMtalUq8giQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qQPu4T7Sz7b69ghhkwBYwGO1AdHUeWXbivIddBYnQLOTjJDJCnJ2Jla5GJs3Gg9oP
         AAdATaZzWpbW0x5omCrKK+yFdQ1fc8cvE9rwxvq9S7CxH2lutmJzznJDeIIyZZIVV9
         xaNlDXoMpBE10K8Oz/tLvoy1SmDrmUNk/9M+px1XzbyDLytkdCHrzY/gZh6VZka8G0
         49O2Q+mUcRIWXof/unajgIa+JepUmALrb7FmZFaPlm6Ci2BFqD8fSzXRNVXKO8hAht
         tM/d0ddVB9q9dDZamAxblIfoEGN7ZJKuQBYSuc3JGBQkeKfoinZax1H/Vsq3vkymYR
         EhrLPuTx1SUtA==
Message-ID: <9475963f-233a-d976-f337-923dfc2066be@denx.de>
Date:   Tue, 24 Jan 2023 21:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 09/18] drm: exynos: dsi: Add atomic check
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
 <20230123151212.269082-10-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-10-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:
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
> i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
> 3.6.3.5.2 RGB interface
> i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
> 13.6.2.7.2 RGB interface
> both claim "Vsync, Hsync, and VDEN are active high signals.", the
> LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
> 
> No clear evidence about whether it can be documentation issues or
> something, so added proper comments on the code.
> 
> Comments are suggested by Marek Vasut.
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
