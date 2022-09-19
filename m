Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663ACECAAD3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Sep 2022 21:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiISVn6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Sep 2022 17:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiISVne (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 17:43:34 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30D447B94
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Sep 2022 14:43:33 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id h9-20020a9d5549000000b0063727299bb4so466323oti.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Sep 2022 14:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sKtyENe86Q/OqlXN1O0gbexI0XpfGGGtAepGMCor+34=;
        b=IkGsimzJxr4hqy+Vfmjx30QA9nvDXkOEA8YDczvvQiAdYxDKkqy76p3hG+o+5R12tM
         IAlcyop9rO+MCRGVV4pgZNTqIu8EnCGdpHFW9aUHUYnSgIHdPmK2SXJL9WKgoS4mop7a
         PfCQ8xTqOviFdZz/LMEgdPN+H5SoaRFljnxPXv1eKl3S9cLdBlOqxZ5WX6gIVLtUETHi
         vC6y6UfRF/wycH6zu9n1hQEpm/J4qzRCg7afWGrzkMeOYXlqGg349LyHPu60rPnW2kP6
         kn4OnlidGxK+YdbMXs1H+/mAaCPpt9QzyXBObqrEka/JBGU2zM9Nm08dnPWA0YB2eP5L
         8mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sKtyENe86Q/OqlXN1O0gbexI0XpfGGGtAepGMCor+34=;
        b=ESNSEN96GfL8AkA7ZtgJGIaho6BOEYnGeijQ4T0ic89b6LhFT8b0AOMd+KNrTlrEzz
         TYVUorzIEt6/XfknXBRUrw/xSP72YhVQE91kLqTkJpg19PHUPfZ5ypzYHebMGL3lezf1
         nw38hZo26HyMRv9cNrwUVQucQ/yNXfmJnxOaq+o1sfeIO6EzbVhQfVlCHqxPH9lgnLge
         EvBZ/V42slICL3psQAk58065BCvgIG0T8+RTQE+UympMg5Q1cpWQaeO75ITbff/nO0G6
         wWfF7RM/4KGffDhu9mS02/578ceFhLJVFCMVIncaqPxFhD9AJD6CjOTnSXhtbBsFD8Uq
         OQGg==
X-Gm-Message-State: ACrzQf26plVoTUOb4dfmzo2tJWGtECHAdVd+PbB/KMGPu0nl8diTC9jz
        2T6aSfP058AgkhKz95HC1IPqj4mMPWhWqXyI/wARAQ==
X-Google-Smtp-Source: AMsMyM43Dxu8MAFsKgpb6em8MHC2r9PEgty88ZEsoPBRfo9rrredHoNCUpBQ6LZibyYt9OJAAPG2bCDGDPDg8xqgDOQ=
X-Received: by 2002:a9d:684e:0:b0:659:6461:a8d9 with SMTP id
 c14-20020a9d684e000000b006596461a8d9mr8971091oto.42.1663623813024; Mon, 19
 Sep 2022 14:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Mon, 19 Sep 2022 14:43:21 -0700
Message-ID: <CAJ+vNU2gLKm_Si7xUsRJuzbJyEFHpC_TqsiorBAT5ADTZjsPZg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 16, 2022 at 11:18 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
>
> Previous v4 can be available here [1], repo on linux-next [2] and
> Engicam i.Core MX8M Mini SoM boot log [3].
>
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
>
> Changes for v3:
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
> Patch 0001:     Restore proper bridge chain in exynos_dsi
>
> Patch 0002:     Samsung DSIM bridge
>
> Patch 0003:     PHY optional
>
> Patch 0004:     OF-graph or Child node lookup
>
> Patch 0005:     DSI host initialization
>
> Patch 0006:     atomic check
>
> Patch 0007:     PMS_P offset via plat data
>
> Patch 0008:     atomic_get_input_bus_fmts
>
> Patch 0009:     input_bus_flags
>
> Patch 0010:     document fsl,imx8mm-mipi-dsim
>
> Patch 0011:     add i.MX8MM DSIM support
>
> [3] https://gist.github.com/openedev/22b2d63b30ade0ba55ab414a2f47aaf0
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v5

Jagan,

I would like to try out this latest series a board I have here. It
looks like perhaps you did not push this imx8mm-dsi-v5 branch?

Best Regards,

Tim

> [1] https://patchwork.kernel.org/project/dri-devel/cover/20220829184031.1863663-1-jagan@amarulasolutions.com/
>
