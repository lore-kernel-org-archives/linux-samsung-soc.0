Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3257FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Dec 2022 13:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbiLMNSm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Dec 2022 08:18:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbiLMNSd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 08:18:33 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7FE201A5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 05:18:29 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id o127so17534656yba.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 05:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VLMxgoikVOmCxyahgCaGxcW5rOJTm3fYXRkHu4umSkw=;
        b=JmO/5K9SOl/nS/dO59Uj5RJhwMyzWpv8W7oxY6Yc4/1CCl25YK+2TQtD/tSkRHeaDe
         UheTU5yLV/O+LJ1DRl2bJisVmK+j99VOUqhnKDIuVU50plNaOp0+RL4O8OQDB0c2XScK
         DcWszgSbbqYdsI6q0Qgshc+3C38lkaw4xt30c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLMxgoikVOmCxyahgCaGxcW5rOJTm3fYXRkHu4umSkw=;
        b=ZAkAaFIGA0DSxMXFcYXJ8rhal6ZkxLRxVn1xHua0KqE01UMxoOPgMV4qvRnKsQfySc
         r6W0itPuP9gKEGSYf4ofDcEbDVoCiqcCgZezTHbM6VDCZecJgokgReyRSTFDVMczej7Q
         /TRtegR6CNuxcTMnhK8IJaYlkvL63InsHetl1mwp5FlHiKx+YYCI4BAtAs+IxqbSNbhg
         d2+2K/h6scHwYQfva9AD5Sm6G69hlo9S9eCtQG7AEKmiIUVyJKL6+dnLhpderSa7UnSP
         08R7wmVH6xivpJov8TgXYM/qRmADAw/E78BrjQkcsfapXY+A0yr4z/accuV2KDvmZ4Mt
         MbOg==
X-Gm-Message-State: ANoB5pkw+4P4GB9JItA2PID7M7Ambfw7LnKpGifLto5zf0K2QNbSPKhK
        3K9O8FEoGAUs0Td+vvg++qbZe4ViYrqtHe0USWcuHg==
X-Google-Smtp-Source: AA0mqf4WkSESAF6OdxVztaQINMrmrDVORh6un+kH8oEGvFLObb59fueD4BzQLBF2loe2An6x4iD0bc+7OC4DOVRop6Q=
X-Received: by 2002:a25:d8c9:0:b0:6fc:c36a:1d06 with SMTP id
 p192-20020a25d8c9000000b006fcc36a1d06mr28663675ybg.462.1670937508657; Tue, 13
 Dec 2022 05:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com> <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com> <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com> <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
 <CAMty3ZD6fVps-PE=iNR2Zr0_qz--h4wcjO5Wa1czA7w7VN2SqQ@mail.gmail.com> <9913c39b-5a52-0b45-eed7-4bdc860aa877@denx.de>
In-Reply-To: <9913c39b-5a52-0b45-eed7-4bdc860aa877@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 13 Dec 2022 18:48:17 +0530
Message-ID: <CAMty3ZDpYRSTN2u7jg4faKRZwP-CvR52FYe4dZ5GPCpQyuPHXw@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
To:     Marek Vasut <marex@denx.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Dec 13, 2022 at 6:44 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/13/22 11:53, Jagan Teki wrote:
> > Hi Fabio,
>
> Hi,
>
> > On Tue, Dec 13, 2022 at 4:17 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
> >>
> >> Please preserve the authorship of the patches.
> >>
> >> This one is from Marek Vasut:
> >> https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680
> >
> > The original patch was changed with respect to this one and that is
> > the reason I have to keep his signed-off-by.
>
> You did change the authorship of the patch, not just a SoB line.
> It seems that the only change is dropped comment, which was squashed
> into earlier patch in this series, see the original submission:

OKay. I will update it on V10 or if you want to send it from your side
then I will exclude it from the series. let me know.

>
> https://patchwork.freedesktop.org/patch/507166/
>
> btw. it seems hunk 3 has disappeared, the samsung_dsim_attach() hw_type
> check.

Do you mean previous = NULL; addition?

Jagan.
