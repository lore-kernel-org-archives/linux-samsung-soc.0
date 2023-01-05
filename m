Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877F8C3DA7A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Jan 2023 10:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbjAEKbY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Jan 2023 05:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233210AbjAEKbH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2023 05:31:07 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799BC5E0BA
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jan 2023 02:25:25 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 203so39558264yby.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jan 2023 02:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/dyLLm8QMU71DT4o1jiDbUQdJSSz8sU5W2KpVdkZ64=;
        b=D3awVxbC7TZHFowV5KAHADuWFawsgvCiL6kxdAU0yhWIZdsorHAhRax36xD0K/wFnf
         sC8wyWUJu2DyNHbs/wAdfwGdSKo52d+7zt8QLfZxdV4IxTEwwUiyMoGUg3PcClbhp2K4
         ylybLxvFXkE/X5u7lSg9y1qCPSrnLMJLdhsAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/dyLLm8QMU71DT4o1jiDbUQdJSSz8sU5W2KpVdkZ64=;
        b=QexHyj7NRyJkvIQUsEXAyOwC5GVlOCwhqZ7KwFIXp2BW20tM8YlwqUi1knqtsLkWYC
         eKuiePVprvfS34Ax0I/E8UGMslJWoV6wdqK5VbOLgR9b16fQ5feK6Kp5go0HsNIds7dk
         o/W1Swgrm1ItCE6YlZhPumOGxa6oroY+ZQfXBw8QV9ah9bDqGDV83MF9JJRdCzdIj8bD
         7pFIA8rL241pDmhnjQYsF5N1lS7wKLjyyi2eSnrTzmwp526RnXevM/dlP7qZ4oKs5myE
         hQt22vZMeuO4eBklFpt9XauWFWjDvHXZsNow61H3qzsr73DhJ8s2fPd6H2o8OFd1yxID
         Y+WQ==
X-Gm-Message-State: AFqh2kozOFE/AralGMIrDDJRtXbNa1CMGL4UzptHFHNUM8w+7us3jWCZ
        ZlIMMsZhkYj+0J8bTujdZX2YyRfSEclykTAAgKMoDw==
X-Google-Smtp-Source: AMrXdXvvCa38KG+MoU104XU9a3F25FbeTIXhowtBchKRQjzNAjAw0U2JlO8CqPNavOr8WmZbX19nSnbMFTg9PHlWAzc=
X-Received: by 2002:a25:ca02:0:b0:6f2:bad:1be7 with SMTP id
 a2-20020a25ca02000000b006f20bad1be7mr5741604ybg.84.1672914286159; Thu, 05 Jan
 2023 02:24:46 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 5 Jan 2023 15:54:34 +0530
Message-ID: <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Dec 14, 2022 at 6:29 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
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
> Patch 0008       : fixing host init
>
> Patch 0009       : atomic_check
>
> Patch 0010       : input_bus_flags
>
> Patch 0011       : atomic_get_input_bus_fmts
>
> Patch 0012 - 0013: component vs bridge
>
> Patch 0014       : DSIM bridge
>
> Patch 0015 - 0016: i.MX8M Mini/Nano
>
> Patch 0017 - 0018: i.MX8M Plus
>
> Changes for v10:
> - rebase on drm-misc-next
> - add drm_of_dsi_find_panel_or_bridge
> - add devm_drm_of_dsi_get_bridge
> - fix host initialization (Thanks to Marek Szyprowski)
> - rearrange the tiny patches for easy to review
> - update simple names for enum hw_type
> - add is_hw_exynos macro
> - rework on commit messages
>
> Changes for v9:
> - rebase on drm-misc-next
> - drop drm bridge attach fix for Exynos
> - added prepare_prev_first flag
> - added pre_enable_prev_first flag
> - fix bridge chain order for exynos
> - added fix for Exynos host init for first DSI transfer
> - added MEDIA_BUS_FMT_FIXED
> - return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
>   list is unsupported.
> - added MEDIA_BUS_FMT_YUYV10_1X20
> - added MEDIA_BUS_FMT_YUYV12_1X24
>
> Changes for v8:
> * fixed comment lines
> * fixed commit messages
> * fixed video mode bits
> * collect Marek Ack
> * fixed video mode bit names
> * update input formats logic
> * added imx8mplus support
>
> Changes for v7:
> * fix the drm bridge attach chain for exynos drm dsi driver
> * fix the hw_type checking logic
>
> Changes for v6:
> * handle previous bridge for exynos dsi while attaching bridge
>
> Changes for v5:
> * bridge changes to support multi-arch
> * updated and clear commit messages
> * add hw_type via plat data
> * removed unneeded quirk
> * rebased on linux-next
>
> Changes for v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> * update init handling to ensure host init done on first cmd transfer
>
> Changes for v3:
> * fix the mult-arch build
> * fix dsi host init
> * updated commit messages
>
> Changes for v2:
> * fix bridge handling
> * fix dsi host init
> * correct the commit messages
>
> Tested in Engicam i.Core MX8M Mini SoM.
>
> Repo:
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> v9:
> https://lore.kernel.org/all/20221209152343.180139-1-jagan@amarulasolutions.com/
>
> Any inputs?
> Jagan.
>
> Jagan Teki (16):
>   drm: of: Lookup if child node has DSI panel or bridge
>   drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
>   drm: exynos: dsi: Drop explicit call to bridge detach
>   drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
>   drm: exynos: dsi: Mark PHY as optional
>   drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
>   drm: exynos: dsi: Introduce hw_type platform data
>   drm: exynos: dsi: Add atomic check
>   drm: exynos: dsi: Add input_bus_flags
>   drm: exynos: dsi: Add atomic_get_input_bus_fmts
>   drm: exynos: dsi: Consolidate component and bridge
>   drm: exynos: dsi: Add Exynos based host irq hooks
>   drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
>   drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
>   dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
>
> Marek Szyprowski (1):
>   drm: exynos: dsi: Handle proper host initialization
>
> Marek Vasut (1):
>   drm: bridge: samsung-dsim: Add i.MX8M Plus support

Does anyone have any other comments on this? I would like to send v11
with a few nits on v10. Please let me know.

Thanks,
Jagan.
