Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113DDC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Nov 2022 08:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbiKNIrv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Nov 2022 03:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236612AbiKNIrl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 03:47:41 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBD81C924
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Nov 2022 00:47:40 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id o13so5386593ilc.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Nov 2022 00:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vQZaGyGGRMG9WSnxx0EKgQyP34O/zWxUK3kr2RIAKt8=;
        b=m3Ypy7jgqA7HJ9d03+D79kNjn4LqBSbI1ZO72wNhweOHOKxwJ5xgtLNQx8zsqXpziZ
         cHaEix1EjrZKwkv9ovN3KJlQapuaDvkifJk0Q21Q+h1B9sy09P7NhQSsZO+hONpGmZhP
         NJhdDokKiIab2LPAaegj09Usq+SKIkLga/FdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQZaGyGGRMG9WSnxx0EKgQyP34O/zWxUK3kr2RIAKt8=;
        b=H0zzDYVHHdglT0tpUXC/s+BLI0fm5ouFXDvbDn9rfyyymAGeAF1KDR9ub2NEfPyY4c
         rhkguEiGfCYeM3VnbpoMJWA/1Gbq0tVAOjDGyg2WlAMmCqWtHIZJ/nNjbZa73Us+TgM9
         f0mdk+hxD5lPDTCqiAeiqdBoaVBWYOE/8GlC0lHFDvXfFiRDkEOUL84EQ2i5QfbLwKK3
         S/67WNnC2BQCB2eiWtgKAcB6v6ackN5Fj+Qq9opG2x4gejKN/5kiwUm7FBOc8sO5TOoN
         SEZVKiOCDTK/4+QtVZE8hVy/eQtgq7ALpwr2SG9eEsZ3s8hoJVWF7z6P34Mfqioyab5T
         Xzyw==
X-Gm-Message-State: ANoB5pnq2sSaNAIJir1EZXC60IhVBNH/ZpBycgoVEHuHBS24Ke6rNWEH
        Kt6qmM3xPVPzW4s0de/gsnNhxESBC8Ka2EYklkcxdQ==
X-Google-Smtp-Source: AA0mqf6GVlTdNStkdafmYuPoOe6C9UIZRwut/dQ2SxahOodAVWaxTbIKNBB/R2sQ7J7EZ4sAvFSSNLxReqypBpNsYo8=
X-Received: by 2002:a05:6e02:1a4b:b0:302:43b8:d42f with SMTP id
 u11-20020a056e021a4b00b0030243b8d42fmr5359490ilv.64.1668415660226; Mon, 14
 Nov 2022 00:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com> <abfb3397-a0b4-ce31-3b49-172d8256bee1@kontron.de>
In-Reply-To: <abfb3397-a0b4-ce31-3b49-172d8256bee1@kontron.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 14 Nov 2022 14:17:29 +0530
Message-ID: <CAMty3ZCcm8nPrP+0z6AVkN7TK3OEeDDdUogQuEpr8gKt0x+vSw@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] drm: bridge: Add Samsung MIPI DSIM bridge
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
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

Hi Frieder,

On Mon, Nov 14, 2022 at 2:12 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Jagan,
>
> On 10.11.22 19:38, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >
> > Changes for v8:
> > * fixed comment lines
> > * fixed commit messages
> > * fixed video mode bits
> > * collect Marek Ack
> > * fixed video mode bit names
> > * update input formats logic
> > * added imx8mplus support
>
> Did you miss to collect all the Tested-by tags from v7, or did you drop
> them deliberately?

Few changes in v8 compared to v7, so I've not picked these tags as code changes.

Jagan.
