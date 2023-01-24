Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7861C25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 19:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjAXTNH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 14:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjAXTNG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 14:13:06 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E6112063
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 11:13:05 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 203so20145114yby.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 11:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dZlQnd1Ps/0Xsk7T1j6t5D52f6MhzQcFEYAGns4bZa8=;
        b=bmagdcu7XlzGpU70LABD8M5lxLdhXB3wkOKWSZPqyH4GTVU8JoSgHROWfoCexhHGwm
         xR+WxKbhO9XiouHFq3q9vrkFI+Lbq+iVRKA3eu5WGCgr05ppxAzJiLkQ0I+K+ZwmyAqN
         m1uO34/0FWHositfHFOaXDpuiqKLPi4JxAMBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZlQnd1Ps/0Xsk7T1j6t5D52f6MhzQcFEYAGns4bZa8=;
        b=00MEHZq6I66qXKp4YPhS+qrpoLBog4LetsKVPaYIjPGR255JWf9C2ORKnxTo5eTsZ2
         wagcUekeRFboG8xvEKA0BshyzqU2NJyrRXRb41y6rWU4hvGaZwNyzE8XoddCa4FGypKI
         0mm0j969dJu2LRk5CdHdqvlOCvuHyBmBjDBIDr9Zv2OFmYIToCoG2+iG3P3h9plloTvW
         eUwBH/gUbCGoX5DMo9ZNPmey39qRwUN/avBPfcRpv+Q2QyCbxwi5/F5IetKJFO98k1xf
         VL43VdXrvaXo6ptPQjOSpo+JGY4iuzA+4s8B+RvUUpe/6gxj4Rg9cJABcNDZeAa+lSzu
         ViEg==
X-Gm-Message-State: AO0yUKW2vPYwcBt2ITUh2k149OBxChMUjLrqdW3vIqRPw5CXkZB41N4a
        h97G83o3G3s5k8sng1fEVSnL856xIetPc3fjtjUfIw==
X-Google-Smtp-Source: AK7set+dvgIYsqjXszDD6gvJGJkbFtzPgeRu3GVbZ+V2Gz2p01ZAknJFQcCL43ZzIHSiF8zR9Q1b0VIFNXsC9Hdsl1k=
X-Received: by 2002:a25:d7d1:0:b0:80b:69cc:78d8 with SMTP id
 o200-20020a25d7d1000000b0080b69cc78d8mr386955ybg.475.1674587584433; Tue, 24
 Jan 2023 11:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 00:42:51 +0530
Message-ID: <CAMty3ZBurwPHZ3bCSV-L+Fk3NGjJKnM8r4gWHPdb3VnqWhzVtA@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 00/18] drm: Add Samsung MIPI DSIM bridge
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

On Mon, Jan 23, 2023 at 8:42 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
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
> Changes for v11:
> - collect RB from Frieder Schrempf
> - collect ACK from Rob
> - collect ACK from Robert
> - fix BIT macro replacements
> - fix checkpatch --strict warnings
> - fix unneeded commit text
> - drop extra lines
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
> https://github.com/openedev/kernel/tree/imx8mm-dsi-v11
>
> v10:
> https://lore.kernel.org/all/20221214125907.376148-1-jagan@amarulasolutions.com/
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

Can anyone pick this series?

Thanks,
Jagan.
