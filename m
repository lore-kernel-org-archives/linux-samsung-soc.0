Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A12AC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Oct 2022 14:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiJAOKj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Oct 2022 10:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJAOKh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 10:10:37 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514CF21809
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 07:10:36 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dv25so14242790ejb.12
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rv9v4/MvmxXgWjEpXGV9Xie7FP+raCUsFY7ppiKksEw=;
        b=dFg8ghrgAKkB13/TtmR/Vjj721I+ko7PX0Hz7zoEKqWNh7c/pVdb8JhcTIGx2akXWN
         VD9OCcIfx98oziHI47xQL30633GzDV3Js9fHCpRfkoEtiLpVCa5cIf4RhoUH/P3lJufu
         riC3gXYWXEWIJMxm3Nw6/oZW7HThJEnUmWvA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rv9v4/MvmxXgWjEpXGV9Xie7FP+raCUsFY7ppiKksEw=;
        b=0Kvqfn5BrD8IQHOs0X4gW6ptQPO3s6ULjF7YID2NjCuNmVO8vbBh55srXVCAKw0Ue9
         IFkxgqBldqz4ViYo41Vs8Xw0tYbshPP/lV6VfiCcrkMcQlbrtYj/GyEUZAvBbWJCYMAh
         2dmV/V0Yx77yR2Q7gVHPPnMNiEC174ZSUXStkgg/AaUdpHplmIf7/aDe8j4zD0VvtvXI
         hTskiiokknb4KAgsOZYEsS7azvD7FFdJxsOG3cj72yq/oXVg7gOA8KfoHYZCYHS5dsqt
         SdxwuH4KxtEukedgQGApTi/zm+2OgH2ECYHdZQcekC06PvhMKtuFSBxvyj5AkN3deYmU
         IXSg==
X-Gm-Message-State: ACrzQf3f1wN0GtZL2PyxUW9gY6rGsni3wTGxqi+71BXGE91Q82F6E65e
        /FgaIHxa5xRMCcYnRfWQ5MVVgh50AsneIwWkSOgnkQ==
X-Google-Smtp-Source: AMsMyM5Bq2zk++cz6cWiLLFhqRnpHkI1zCBsNf0KdVzYn+L0vlghw/z5j5mMBy0amI480ZeRhNzsTwfyKhDeDlLAI+M=
X-Received: by 2002:a17:907:608d:b0:787:6e75:5111 with SMTP id
 ht13-20020a170907608d00b007876e755111mr9915872ejc.760.1664633434877; Sat, 01
 Oct 2022 07:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221001080650.1007043-1-jagan@amarulasolutions.com> <CAOMZO5CsDePtApxwU1RCJj+BJkDuWj-bCHx5SkWO-e5zf7PRBA@mail.gmail.com>
In-Reply-To: <CAOMZO5CsDePtApxwU1RCJj+BJkDuWj-bCHx5SkWO-e5zf7PRBA@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sat, 1 Oct 2022 19:40:23 +0530
Message-ID: <CAMty3ZDqKvqirC3WQ7cpVugF3aw9Uhte6H7bDkaa29ur+4NWqA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Fabio,

On Sat, Oct 1, 2022 at 4:04 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Sat, Oct 1, 2022 at 5:07 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > Repo:
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v6
>
> This URL returns an error. Please double-check.

Thanks for the notice. Now it is accessible.

Jagan.
