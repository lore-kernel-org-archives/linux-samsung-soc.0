Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213E4C61D97
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbjAXVZN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Jan 2023 16:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjAXVZL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 16:25:11 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260304EC3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:25:10 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id y18so18151254ljk.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jan 2023 13:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vUBHr8D8GWJZ1r7Tn60/9dMtNgme2KiGS5XhvwJMhHM=;
        b=OKgs8tWykXM8n8HRcHyqr6gXj3ZTRfIsLgp9yw7SIEiufVzYzf3SDtgc2juwpFqoS5
         IGjYjYP7VFsW5VHnJR/A93svc0TSgf9oNOJNAIA4qR8ixxl/nN/fN5PXhgJ7xbPCDEJV
         i5tAvcA3rpCfgUw1LxOjYF5i/h82AdhgHTBGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUBHr8D8GWJZ1r7Tn60/9dMtNgme2KiGS5XhvwJMhHM=;
        b=41YUrBvXGzeY60saj5CeaNN3VGX2iMW6AErmF3gIBKvhILUFPWJW1jVtpA9DsBJEyX
         MNyhDUl1mA6EXwTIQyHWl8181TQTB7gXJb1yKpwgiuk8TAbN6uKJFsaCw1ad7Gy0V/qM
         Nld0yhUkCp5DP03jOj19UTCZCf4A6P/RDT3moLuElfNcj6DSy3GjGENs1tIXJL+F1gA6
         bDCNy0K2QAkegstTWQVuV32mlgJimw3Va/ufSFymMGN0xxtrSyvW9sh00sUwr6V2/lhy
         2GVDgFZTSawMMnpBXYocmhDi36fq0JHsHlw8QSrLKD51ipUV0NEAdCvJ0/vHjmzetaXw
         yftw==
X-Gm-Message-State: AFqh2kqvjs9hFcb1CWGExIrd7ADO5BcSxRfCrAzYVft0rWtQamzSASMm
        anRSFaXhVFizYwpu+761RMHrhiU1cG7XdSEtAVwjcg==
X-Google-Smtp-Source: AMrXdXvZEKxsRlr95LHEdUrninbUwoeQKjtH08GI54vYab+/kf5NUu8pnuUBXVuxQBBEemm5i5Ah1Vvg2BeuxdcC6K0=
X-Received: by 2002:a05:651c:218:b0:28b:7993:585b with SMTP id
 y24-20020a05651c021800b0028b7993585bmr2954286ljn.473.1674595508485; Tue, 24
 Jan 2023 13:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de> <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
In-Reply-To: <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 02:54:55 +0530
Message-ID: <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >
> > On 1/24/23 22:01, Jagan Teki wrote:
> > > On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> > >>
> > >> On 1/23/23 16:12, Jagan Teki wrote:
> > >>> Enable and disable of te_gpio's are Exynos platform specific
> > >>> irq handling, so add the exynos based irq operations and hook
> > >>> them for exynos plat_data.
> > >>
> > >> If this is just an optional generic GPIO IRQ, why not keep it in the
> > >> core code ? TE (tearing enable?) should be available on MX8M too.
> > >
> > > So far the discussion (since from initial versions) with Marek
> > > Szyprowski, seems to be available in Exynos. So, I keep it separate
> > > from the DSIM core.
> >
> > Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .

I will check this.

Jagan.
