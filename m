Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37845C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 14:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjB0O6o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 09:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjB0O6n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 09:58:43 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AC6A25C
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 06:58:41 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8192885A85;
        Mon, 27 Feb 2023 15:58:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677509920;
        bh=ippo46f7aqJXwMzwrM2yyAKQrSgqV3tRUqYx1ZCTvZc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=R9hSMxbmwIYS0Aw/UnwASyIlfBZnx22/xIzD2abJu7pSRz/06QToqF2deBcLf7z3u
         bu8qZUKgDuBtebVOL9TNd1vXHDcj1ndmdUp4+RS0qf5lNLpBLTZGa8R1k5RDGP4SQU
         vADEfVS14sm97kya4vUwPotz3jCa3Jy9coFJ68YLCPNVY/OyL4Jb2Vcs8gXIv8p1NF
         eEEHRKPr+xlmvohrZ+e0/8WaJAFtiDOsFaivvcPDG8KthuuT5++qz20oka0ZJPqHGL
         WH9k1n7lpWWkDNYtkBtQHXpRIV+alrWZgSdUJR4zJ/pcbryzBK8SUmsPDzIrC1sKeV
         lOFVtB4A3g+jA==
Message-ID: <2c206fc9-5747-152d-c770-b9860c5f55eb@denx.de>
Date:   Mon, 27 Feb 2023 15:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 11/18] drm: exynos: dsi: Add atomic_get_input_bus_fmts
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-12-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20230227113925.875425-12-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2/27/23 12:39, Jagan Teki wrote:
> Finding the right input bus format throughout the pipeline is hard
> so add atomic_get_input_bus_fmts callback and initialize with the
> proper input format from list of supported output formats.
> 
> This format can be used in pipeline for negotiating bus format between
> the DSI-end of this bridge and the other component closer to pipeline
> components.
> 
> List of Pixel formats are taken from,
> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
> 
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Marek Vasut <marex@denx.de>
