Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81530C10F1B
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 11 Dec 2022 02:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiLKC2v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 10 Dec 2022 21:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiLKC2r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2022 21:28:47 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EE813E03
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 18:28:43 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E9DAB8530B;
        Sun, 11 Dec 2022 03:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670725719;
        bh=dRxVA2BQiDkM58w5Tnfym1n6XDaN6zBKm1jRyJvaf/A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vh45KXwq8fMqS5iSyqch529BuxrJU0nJfyJCV4eNyNXc9KPR3w8SCjDmqQiAAC4Zd
         ylY/ctnGZ8IqHes/8ianPrYEWXJvwhHzpnQPugIqTOL2cofLD4MRpbK36vorvlCb4c
         1qjy2WZxUD2JOkZ7YcVRn71M9Fn0USEl3eCywKgLWfOnaziarGFmC1Ql/1l+r52gPh
         hKqjEcdmkU6gyaGi6BI3NfF0oyv4uFphssqGEZQonnaWoNTiICVJqPEF5N9YbNLPGg
         NozaZdziCxthp+oT37KvD16ynG9xk5ujjt9pUGLQBJq1HpksccQ6K6pQYHPuVScyry
         v+pFXz6VR+3HQ==
Message-ID: <ae29a634-928b-3e77-3999-2a8d9b546432@denx.de>
Date:   Sun, 11 Dec 2022 03:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 03/18] drm: exynos: dsi: Restore proper bridge chain
 order
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
 <20221209152343.180139-4-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221209152343.180139-4-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/9/22 16:23, Jagan Teki wrote:
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Restore the proper bridge chain by finding the previous bridge
> in the chain instead of passing NULL.
> 
> This establishes a proper bridge chain while attaching downstream
> bridges.
> 
> v9, v4:
> * none
> 
> v3:
> * new patch
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
