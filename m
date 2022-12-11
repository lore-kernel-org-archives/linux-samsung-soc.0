Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2033C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 11 Dec 2022 02:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiLKC2z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 10 Dec 2022 21:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbiLKC2t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2022 21:28:49 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09F113E0A
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 18:28:45 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 69AAB85310;
        Sun, 11 Dec 2022 03:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670725724;
        bh=PR09U3y+R+YdZq5prMeTG0Ox7PAgTIFkMw+NnKXTozI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=0NGNSlOjpw/8ZJSisoipuCm+/ylUBMxkyZRbZFKv5NJ06f2sxTRXHcugpzn37BBM9
         oyiaOyrmiIj9eVp1RMlYX1Wi3QRRu8bXnAptZGwxBEWXZTV+oiEf2T1VosB7SzyefF
         AbSmMTvTxFmxHq3cTWoNHDUiakKMMpkMLBm4w0/v9kl6yZQJPJ/x5WCbhmGySG8hw7
         DJxffnXCX4BL5RemflHlatjegIfb3NqA7e7g/Z6B9RQFoMwO1MGASPCOm0D7cXaqh8
         4RfRVO3mTsFMRhZfQ2oYK+iQXUU2PPsFnlzyWB7jfBdi9ESKDCxubgH1ygCHUg2hmN
         HOEWGYu0fENJA==
Message-ID: <7b77deb9-858c-7dd9-110e-3590dff9c4d6@denx.de>
Date:   Sun, 11 Dec 2022 03:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 05/18] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE
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
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Nicolas Boichat <drinkcat@chromium.org>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-6-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221209152343.180139-6-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/9/22 16:23, Jagan Teki wrote:
> HSA/HBP/HFP/HSE mode bits in Processor Reference Manuals specify
> a naming conversion as 'disable mode bit' due to its bit definition,
> 0 = Enable and 1 = Disable.
> 
> For HSE bit, the i.MX 8M Mini/Nano/Plus Applications Processor
> Reference Manual named this bit as 'HseDisableMode' but the bit
> definition is quite opposite like
> 0 = Disables transfer
> 1 = Enables transfer
> which clearly states that HSE is not a disable bit.
> 
> HSE is named as per the manual even though it is not a disable
> bit however the driver logic for handling HSE is based on the
> MIPI_DSI_MODE_VIDEO_HSE flag itself.
> 
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
