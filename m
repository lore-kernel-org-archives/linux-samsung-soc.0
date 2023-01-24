Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFDDC54E94
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjAXVYc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjAXVYb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:24:31 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D0D4C6D0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:24:29 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d30so25558602lfv.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2iPkwkhcnBowRQHKIi36TY+p4NIF9M/qZNlpyR+HwW8=;
        b=MhwyQzParKqr1uuB0R3T6yUcEvJGRcoJ0sfabAiJMLPlOuj96wNiRFJQ+VwIjvAe74
         5Nk1Knxp00JP8J4m5j/Pfbhnml6UBeX7ptyiGiD71v9ayxN6Dvr0aQBbwUVGgdEPnqCb
         B4TCUoEWG95mVljltCtIaeXNX/HkvmeKSWlRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iPkwkhcnBowRQHKIi36TY+p4NIF9M/qZNlpyR+HwW8=;
        b=eRv04lVkyW6o7CPG10UAeBeQHrvd2q1M+73dFn2P3O7H5R0SwTGyqOD05CqR349/t+
         epVrrWEW7v5A6/RA7LUqaPXndLM+jEndtOIY2FYlUHZMxhNAe1riFs8QvDSwRoGqhKZN
         CoOn6a8J5Y8SvZsPk0xRPiojv+TMeYS1AJNXeUcPMBPnfI8bqvWBl8dy/kGeszqvoA7c
         OhjeXwqwgAS900ZGeoeWdBLj/qlW6Sx8c1k7a4Q/O9qQwcbYzbu0dXweJAhvJuJtbeaV
         PNTjVrLY8z27iV52vUJDqR+Fh66USwsWfNkGHGNtx/qXPOFa6pLSADi7oDoNslDFz54l
         orEw==
X-Gm-Message-State: AFqh2koPhGN98EVin4zZcxP3Av2AsFYOB8qn1f5Z0C33zU9o6wT2vZVH
        a83F9W3UGc+QKMP1AavRfTKqR4IFJa1NRCUuAcC9Bg==
X-Google-Smtp-Source: AMrXdXtcl+2cMljDftQoH/N1RiskSCdfF6R1azWAx9xkgbRFfRy4sBrycF55b24pNNRkCASmifsvpPBgFx+smhVFrYM=
X-Received: by 2002:a19:7517:0:b0:4cc:9907:359c with SMTP id
 y23-20020a197517000000b004cc9907359cmr1174121lfe.465.1674595468042; Tue, 24
 Jan 2023 13:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com> <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
In-Reply-To: <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 02:54:14 +0530
Message-ID: <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
To:     Marek Vasut <marex@denx.de>
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
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/24/23 22:01, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/23/23 16:12, Jagan Teki wrote:
> >>> Enable and disable of te_gpio's are Exynos platform specific
> >>> irq handling, so add the exynos based irq operations and hook
> >>> them for exynos plat_data.
> >>
> >> If this is just an optional generic GPIO IRQ, why not keep it in the
> >> core code ? TE (tearing enable?) should be available on MX8M too.
> >
> > So far the discussion (since from initial versions) with Marek
> > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > from the DSIM core.
>
> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .



-- 
Jagan Teki,
Amarula Solutions India Pvt. Ltd.
Co-Founder & Embedded Linux Architect
405/E-Block, Sri Lakshmi Shubham Arcade, Chandanagar, Hyderabad - 500050, India
M. (+91) 910 009 0959
[`as] http://www.amarulasolutions.com
