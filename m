Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D07AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Dec 2022 10:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235241AbiLMKtG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Dec 2022 05:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbiLMKs3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 05:48:29 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700D31CB37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 02:47:24 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 79so1130522pgf.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 02:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cQfPd3sY76+GriFagt69g8yO/fYsmZo2htleo/DTyXg=;
        b=HcWEQ4/YYKY1L87gmHEPsAB51nHM3kcVs7WyXj1rhYN7iPela+nbm5/qM8OrKfWOGL
         p/h2/ZqMcsj+zeIWoFLKbasp32WJ9/OsGijr+WYpltoplozpAU2HUXe8MC8RD/pXz0X4
         x7QM8ePU+VQtGMBOrkdg/Sn36E4Td2BdscIBX0zIcmq655+JXfjb4+K/S1PtYYzrupJP
         gUzQy2utlw6vF/gIAcYYI3Lm0ccIYwmy3xkmRHhoW1d0/outdkPt8TcUMhAeFK7lkSSX
         SJOu8RWDR5YXAzA6SmfJD4QemxotzTpu1oOPN7KZdblHo+J7VZHQ+Ff2dG7eUVBxpMmb
         qwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQfPd3sY76+GriFagt69g8yO/fYsmZo2htleo/DTyXg=;
        b=jh/55IET4h0nUyHN4a/f5KBDgmCylJW/EEQbNW4IJgdUGGj0yeMkvosBNBenjL5yEJ
         KrTA9REk2fejdq1RVF9KUjn9GNiRQzkAXRDkJsoScMJibCu2D3J/pWymthf/bW2yyE12
         26a2jmwjxY2eBRrNm8AItSoK9jdWLmVskl7txZND9MHdHr2lIN3uzf3Yw0cMY8Y/NwN1
         sjeVRNfMbrciPiYCUCPAqxhRUIEvhKzgX+ry+5p9hxsgUfgI1Yj/FmFVFIJ/6cpv9aQI
         ftRWz7+6Ln7Ui4ZihuDs6HHRxTcyVn+7ERqb/q3Kr2kkiDI18dSm61eYrJfTySf5leoC
         sCrQ==
X-Gm-Message-State: ANoB5plOp70AjtmaeMoFUG4SiJgW30JbltgiZnsxml84itcYCkHfaM0C
        HqlALduyeU8wcWqh8evfWAHOqZ7IT98C1ATGcfs=
X-Google-Smtp-Source: AA0mqf5cjSYSfwCgGpiHT0EHWEdsMc+qO8x3mBFfeQBHED0YSfMKYuFexqgJyGH8RLfMPb+79yo9c8Us5Y8He0t/7g4=
X-Received: by 2002:a65:55cd:0:b0:479:3911:ef0a with SMTP id
 k13-20020a6555cd000000b004793911ef0amr512582pgs.603.1670928443865; Tue, 13
 Dec 2022 02:47:23 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com> <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com> <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com> <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
In-Reply-To: <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 13 Dec 2022 07:47:06 -0300
Message-ID: <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
To:     Jagan Teki <jagan@amarulasolutions.com>
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

Hi Jagan,

On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10

Please preserve the authorship of the patches.

This one is from Marek Vasut:
https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680

but in your tree, it appears as if you were the original author.

Please double-check globally.
