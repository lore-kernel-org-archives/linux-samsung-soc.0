Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DF1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Dec 2022 10:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbiLMKyb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Dec 2022 05:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235217AbiLMKyY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 05:54:24 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3ADDBE17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 02:54:10 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3bf4ade3364so186387317b3.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 02:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MXsAlPTFFvncdyXw2byeMeo4fFQE5YBUhXEkgIML2YI=;
        b=am9Tg4PQBmIbp0qQ+gJHc4g1F/mNW/noZZqMWeRbdyoTLhuQDOU0IR6X45MX5R8rzL
         XeKQFa3Mh3Zs1U9s3WfKJoHs8XHaYF/vEFy3AbTZsJWjBVB2HOHHXf9QrFwaMTlgmduS
         bF2ljD3jsIZ1vKP4i26UzFNdIXqRRLolH+SXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXsAlPTFFvncdyXw2byeMeo4fFQE5YBUhXEkgIML2YI=;
        b=rt+r3yYGWur46u1QWxpTt0mMsjMktd6qDub9z5u4LNSN/FCS7l9oIbH8xkQegQbHE+
         HN+FHxd5eWrkM4l6IfcGnHPTGsy0O+xHp0rN8CipgQt3/KMiMPxZr/JjGEiCwug0kcxP
         BG1TPbC0x5/8LhWwI3qD6ZwgMhF7QZltmPFiXiF0dVqHMUOivMXkFPXR69fXndvx9r2b
         6ODMzdIm1fdGxQd/muLQRpuI6Zv9+jYJjK4wFyMYIPVV6fBOiCBTaHxGLkat88/RYolx
         JyIMt4EWxeyfz76XE/lxknZIiDoU5kJRnK+dWPWBgthHpoK8KSv0atR7LKzEtAxQDD2I
         y0jA==
X-Gm-Message-State: ANoB5pkykpd6MUQ00O2msHa1jCTdqYfCuNrS48BYhCsbD45vEb1k1nHA
        FTWxob4dfyLfn6GGd8T19tOjU/aXbyO0wE7ymiovuQ==
X-Google-Smtp-Source: AA0mqf7iw8iRtzG5evBmzQAbWdt7RxfkRTJ+sPenp2iurCIb0Z8UUU1DaUSR6lqSJdWaduAY4ptn8U2EQCZFzSb5c+Y=
X-Received: by 2002:a81:9a13:0:b0:398:ab7a:aba9 with SMTP id
 r19-20020a819a13000000b00398ab7aaba9mr21032401ywg.106.1670928849851; Tue, 13
 Dec 2022 02:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com> <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com> <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com> <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
In-Reply-To: <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 13 Dec 2022 16:23:58 +0530
Message-ID: <CAMty3ZD6fVps-PE=iNR2Zr0_qz--h4wcjO5Wa1czA7w7VN2SqQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
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

Hi Fabio,

On Tue, Dec 13, 2022 at 4:17 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan,
>
> On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> Please preserve the authorship of the patches.
>
> This one is from Marek Vasut:
> https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680

The original patch was changed with respect to this one and that is
the reason I have to keep his signed-off-by.

Jagan.
