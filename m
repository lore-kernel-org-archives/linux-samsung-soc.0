Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74399C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 11 Dec 2022 05:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiLKFs2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 11 Dec 2022 00:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiLKFs1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 11 Dec 2022 00:48:27 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF69DE0EE
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 21:48:23 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3b48b139b46so104287537b3.12
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2022 21:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k65HKQ4QsOLEKRFSAAwmrlaySPBMcA+krHdRpgmUHq8=;
        b=WT5FmpHx3gP/2F9fOP/OzTFEOuB/reCESWb8Gz+V0Av4ZCCdeJ2noh8MhG9h/xeiDZ
         uhWWRSCZgtN5IN7p7u/rWFSEi4GhNLneqvDXI41q+0jDm9bwQXIwIDONauFA5uDjJYOG
         H/rqtRQCyQlxq5PJC/oRggsAf8usmN6dJf2V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k65HKQ4QsOLEKRFSAAwmrlaySPBMcA+krHdRpgmUHq8=;
        b=JUT41DblKS6v7peAxNKNONuzYx+1addYa7VeicDveg19RdWh4Ijz8PX3DiNxyGdBWb
         z9/raiFQqXwxMm17X4gEgMzjc3vdtY+lwGu2j8DfpfGMCpcpKPv/zrIDLUKu9HHbTu0T
         ET3xJiX1PDgpu/6Kt6zXtDtsm+h8dEaKfP0thdsErMGm09O1zmbK4z8HAICmHKadpoSg
         if1Z8R4FmZsEeGe1WDv+kF6dbJ5bPfUXtCkfnrU2tRWEYzpc40mCbDKK1pFDInD6Lz/x
         Mi8BCQFGCbJvYQXR2ZHlBusIEEdSZlrNogppYZEXV4GDKMyoQa8f1fIuWHt3s3P3Nh36
         ctKg==
X-Gm-Message-State: ANoB5pl322O6eRunjb8qm8uXzhdOkyVJX3zfpem/cvsvzusV4XHZNWJy
        mGwatE4L1gmcZtE5voINSZ+jNdblsmi/9vkJQOlBjA==
X-Google-Smtp-Source: AA0mqf7NJDIXXb3U/76yXnuQAR4j2ELErehHZxueLD1ipjEBOHDsiXw/utcM1K3c4TqRcJToedbz0rxKDVSqiG0LF4M=
X-Received: by 2002:a81:1a4d:0:b0:368:75ab:a50e with SMTP id
 a74-20020a811a4d000000b0036875aba50emr24993783ywa.235.1670737702965; Sat, 10
 Dec 2022 21:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com> <90c2e63d-138b-502d-5188-da49196e0ff1@denx.de>
In-Reply-To: <90c2e63d-138b-502d-5188-da49196e0ff1@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sun, 11 Dec 2022 11:18:11 +0530
Message-ID: <CAMty3ZB7imKgS4ovyPfi5OMSHeBN=-hesTk6K+kuM-a+SvxbAQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/18] drm: bridge: Add Samsung MIPI DSIM bridge
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

On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
>
> On 12/9/22 16:23, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>
> I wonder if it would rather make sense to split the series up and submit
> all the various partial fixes and additions separately, instead of
> piling them up in this series and ever growing the series.
>
> It seems to me 3..5 and 7..14 can just go in before the rest.

Only 4 and 5 come under fixes and the rest of them seem dependent on
the series. However, 4, and 5 are reproduced in i.MX8M platform hence
I have added it as part of this series.

Jagan,
