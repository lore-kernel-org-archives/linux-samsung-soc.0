Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4229CC54E94
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 20:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbjAXUsp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjAXUsm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 15:48:42 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EED50859
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 12:48:41 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2B2D9856BA;
        Tue, 24 Jan 2023 21:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674593318;
        bh=WVpS/DpfijLPaldGb0rLinGbY/mOUR1ozJZtlgBxQko=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IfmJ2k5F8uLGPtT6of+furiEeOQ74Y5cTbae88JPEr71MIpt/YlcxdRkx/XzhjsDR
         s62s315u1QenmocLpWvSD6j5Pv22VfzMd965q/E2pf9pWw0D5BxwaKOLcoF/1Ce5vs
         z2KT1BKtvs/xPDodC+fzzTXVwHE2DgW+BsdqpHkG2TP3vZTLz28id6ITYrC77lFlSi
         M7TR9BchQXfgKK5jiKG78mxVHibQyzFd/JkLPV+kNdBFqWbFikkm8dj45K4dY3YUhT
         BaSkZfxDhkEbnkiovcn3w6LIHb2UqLPgm7PPBq4STpljDj/Fs7e7fnIvT7Kpl6cRue
         pJSnywIS4VlQQ==
Message-ID: <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
Date:   Tue, 24 Jan 2023 21:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
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
 <20230123151212.269082-14-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-14-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:
> Enable and disable of te_gpio's are Exynos platform specific
> irq handling, so add the exynos based irq operations and hook
> them for exynos plat_data.

If this is just an optional generic GPIO IRQ, why not keep it in the 
core code ? TE (tearing enable?) should be available on MX8M too.
