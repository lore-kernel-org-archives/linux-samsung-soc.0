Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4120C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 20:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbjAXU7b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 15:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjAXU7a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 15:59:30 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B6040BF8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 12:59:29 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A77E98565F;
        Tue, 24 Jan 2023 21:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674593968;
        bh=iKRDFQ15uN8tLYe3RC6CmqdYouZewVn31rYOo+FBxIY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wDGch4snvMipmKB2H3Cu7H/fQvkfRXVHsu5wnCx1OLcQ3x90se0ifEMFQKqHj5Lae
         IGsorCfwSqoXfCNdeASnofnXwxaU2ZVRrLXaJloqrSQRlBL+FeYh6hWYGBY2wSNjwf
         abVxS5aTTAwRER/XMhcu0zqSvtj78WsmO7z1d+Mo6/WSRQmoK//O0he1gklKfcFCdg
         25ma/UHLKBsEfVPoHb5nG13fwo/qUChmbuoyAHZgY4sgPote660HDEiWhijMn5D5Z9
         y16aQNnvNSimr+g3Aq+QyTtdxDpwK2/pk7mkQY7peBXIw+LY9BC/q+glrnwYtIdf7n
         T4Tt78ubgC+3A==
Message-ID: <afcf15cc-2cc3-77f2-5de8-7b40121387cf@denx.de>
Date:   Tue, 24 Jan 2023 21:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 18/18] drm: bridge: samsung-dsim: Add i.MX8M
 Plus support
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
 <20230123151212.269082-19-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-19-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 1/23/23 16:12, Jagan Teki wrote:
> From: Marek Vasut <marex@denx.de>
> 
> Add extras to support i.MX8M Plus. The main change is the removal of
> HS/VS/DE signal inversion in the LCDIFv3-DSIM glue logic, otherwise
> the implementation of this IP in i.MX8M Plus is very much compatible
> with the i.MX8M Mini/Nano one.
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Self-review for completeness:

Reviewed-by: Marek Vasut <marex@denx.de>
