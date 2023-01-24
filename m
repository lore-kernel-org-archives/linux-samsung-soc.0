Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA20AC54E94
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbjAXVNp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbjAXVNn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:13:43 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE20245225
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:13:41 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3A2DB85666;
        Tue, 24 Jan 2023 22:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674594820;
        bh=DkuTSr1Aaum7C2MYEKAnRZ0UIMSpdipVQufqreKZcEQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sp6kBegY36caLn7cLPgQnM5guKiAi0gtzZOCYSh4lqn++DXRv0nGm5AoCUJ3lx444
         SX/U6hcwNZCNb6ACKxxMYCni9SnL6XBOYFviPGlybXwC+36wMU0ckgaOyKqe7GmbHK
         yo6fHyKNoTMjt4QcZVFupuTMsHDPWbkqNqLe5eNJNVIL7I9q9t6wQ9zR1woz0/HUPk
         osw08GtrRhySnacm5W/5ijknwdOLPhAxPKlz8R0H4qUUNDR5J25irA58N90suQ2loR
         qGzKtkrpq+mAXyhbzyMrelj5SMSqLCYgxnqT8IZJive1Oycj4VvOYAFl5Q6D2tOHAf
         yButK63HfgGKA==
Message-ID: <b32cd2c9-c286-c4b7-2ea3-98c21a92fc0e@denx.de>
Date:   Tue, 24 Jan 2023 22:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 00/18] drm: Add Samsung MIPI DSIM bridge
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:11, Jagan Teki wrote:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> 
> Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge
> 
> Patch 0005 - 0006: optional PHY, PMS_P offset
> 
> Patch 0007       : introduce hw_type
> 
> Patch 0008	 : fixing host init
> 
> Patch 0009	 : atomic_check
> 
> Patch 0010	 : input_bus_flags
> 
> Patch 0011	 : atomic_get_input_bus_fmts
> 
> Patch 0012 - 0013: component vs bridge
> 
> Patch 0014	 : DSIM bridge
> 
> Patch 0015 - 0016: i.MX8M Mini/Nano
> 
> Patch 0017 - 0018: i.MX8M Plus

Please drop chen.fang@nxp.com, narmstrong@linaro.org, 
jy0922.shim@samsung.com from CC, they bounce.
