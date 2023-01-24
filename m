Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E83C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 20:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbjAXU46 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234433AbjAXU45 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 15:56:57 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD26213F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 12:56:57 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id ACE3885670;
        Tue, 24 Jan 2023 21:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674593816;
        bh=Z7JsYQQ8eOvkzFOQneb0FxckIGdulOBNsYrdlu5ng6k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mvF6plt/yUZeXiSmSw+4H0UL/zhzBx5A7Awzzc6wPfdVHoOGYhxPS67Hbvltmk6E/
         csRw9VKjA8tnDGFhkyWERWPC4BK125m4I+9qt2A3H5LpY5lw8fYkdx3Ht2EQOLM8wM
         cmemAtquCU9wrSk547mETTM3jDjj3sn9/8nbGHaNlPCtwXVcpDdz/Ctsn/aTDNtgSW
         Y/8VlYx//EoodI8nEztBQZcOjzd/CiAbt0s8Z2esZ4GrP/381zkzhsjel/gr0vaGDh
         P51flk+isE8xlO+dHEAAuWTh/MFDmymg1okHRMjG4CJFyJ0teEOFlLnh8JMoKKnDb4
         5VTSG5RUTWeCg==
Message-ID: <b05da0b2-f743-12dd-247e-4ddcaad0e622@denx.de>
Date:   Tue, 24 Jan 2023 21:56:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 15/18] dt-bindings: display: exynos: dsim: Add
 NXP i.MX8M Mini/Nano support
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
        Rob Herring <robh@kernel.org>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-16-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-16-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.
> 
> Add dt-bingings for it.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
