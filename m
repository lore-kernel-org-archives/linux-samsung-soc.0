Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3706C05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 18:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjATSy1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 13:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjATSy0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 13:54:26 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D5FB75B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 10:54:25 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4fda31c3351so56351787b3.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 10:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rHCw+jdQ+RwMyHJTKZZA6HBeTDpYJqecnOo4nlATkG0=;
        b=dqkuZKJe44Kp7grbAyJDy65BbqS7X/1+IOQSz09NVaDW/BR7V76Ab3VueI0E6penfO
         pM1aQgHim8cCUXaOpXhJ2V2CPT0tqnltGIaUL1SvrEwTARSt+QowJ1FZiSO+e8kkMcH+
         j1cPssuGq0f5kBWScYY+sJeIk+M6Z1c36ftf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHCw+jdQ+RwMyHJTKZZA6HBeTDpYJqecnOo4nlATkG0=;
        b=taAJkzlfJkbPiKiphIYelqxnBM7JsO/+QgUI8+VQgB3HR21FkPhzXtosmZSeqetUN/
         ca7slKyxkyibr/nzN7DKv/g9tKb11LsiikH9IBasS8XWPBP99gO5O2/wPOWYyx3XJelj
         wd45yIpji3NW5TihryvYAr8M56aVnzorS+8lpfZg8y8nRZa1L1JgmnddmZh2CcElahFY
         3rIg3HffTAwpOtjKVynkIhxNhqyGgbU/p+nJ4avoB262dMYmSXnGnxuB+u236IIYekFn
         ERpyUQuRcjr3GLLtPMQhBdvLOx4DZ3NJP650aVTGN03rZSZVVKc7ZpuTzfhfahql4PTg
         /xMw==
X-Gm-Message-State: AFqh2ko0ypSn4dIJ9z92IytYMqGFxhxEwuNB1Pd+Pi89pN6fDNf2wMYc
        ePrOMqUfD4SWwZOLsAYyQcb1f6RntYONRVqa75H5bg==
X-Google-Smtp-Source: AMrXdXuASJUoeRhn+a30lvvkLjD73slswxVrAoEEvYxTG3RHOaVnLvNm7JiLc274TLhoFaGzQmaXUFl+N2zqvC5IQAY=
X-Received: by 2002:a81:a146:0:b0:4ed:916b:d3e4 with SMTP id
 y67-20020a81a146000000b004ed916bd3e4mr1956512ywg.487.1674240865117; Fri, 20
 Jan 2023 10:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com> <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
In-Reply-To: <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sat, 21 Jan 2023 00:24:13 +0530
Message-ID: <CAMty3ZA6SBA4XAvSTgCTq_WC1Uq6jPXD5oP9MZisj3YdActoYw@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Marek Vasut <marex@denx.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 20, 2023 at 8:36 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/20/23 15:41, Jagan Teki wrote:
> > Hi Fabio,
>
> Hello all,
>
> > On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >>> There are two patch series prior to this need to apply.
> >>>
> >>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> >>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> >>
> >> Would it make sense to re-submit these two patches as part of your series?
> >
> > The previous version's comment was to separate them from the DSIM series.
>
> Hmmmmm, seems like those first two patches got stuck. I fixed up the
> malformed Fixes: line (it was split across two lines and had angular
> brackets around it) and picked the first series via drm-misc-next .

Thanks.

We have another series for Exynos, prior to DSIM
https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/

>
> Can you send a subsequent patch to convert the DSIM_* macros to BIT()
> macro , since checkpatch --strict complains about it ?

Okay.

>
> For the second series, you likely want a RB from Maxime Ripard and Dave
> Stevenson first about the probe order handling.

Do you mean for 01/18 and 02/18 patches?

Jagan.
