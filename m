Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780E3C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Jul 2021 10:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 585BB617E5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Jul 2021 10:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236269AbhG0K3X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Jul 2021 06:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236186AbhG0K3U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 06:29:20 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47312C061760
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jul 2021 03:29:20 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id d6so4731276uav.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jul 2021 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
        b=VA9XBSq4CQhlCAZrPbTm3nskntRBag7xfqyt0l5ZRi4tj4r7Nwmj7cH8Q//ULvZ68Y
         5rx6ds4fUh1cKyKjtK9DlDLoCmoMTBGuBTVGak7TJbutzKps51Gx+PW0a4zDeLzgCVRA
         7v+taAWoRMIo4GLW7W31F6kuP0wNC9VL3N8Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
        b=mr1rxGXJESwN8I8pBNggqkQt4BQniqFb3MjHGLzg9RYKZaBNVW1XKd7HwN0Ug7IOnQ
         07SXpxMRCPMu3PBf+WFooLblZcAGqVB+33baumPxLdVTaPYPTlqCZQ0tRmoo8d0lkYQQ
         8WNPL5KJEWwphKayOGooVSEHpNIgMYgtApEYWmMG/TKn9TKJ4UW94DpGtHFF5xcc9jrY
         Pb2D0v3Jskc8Z/vmFO2nuNDTkFrQGMHpttFueaD0JnAxp7JRnhwVRgL24oRyJ/FzQ6Tm
         XOJBdwVg/KZz3Q3mPEdU+6Rrc5FcHZbTTPa+ET3CqX/bwAH/vLN+vsDk0jvsD1ZY+yQY
         uIsA==
X-Gm-Message-State: AOAM530yzepljrAxw+wyIPFIUyTILvZy4xwhKQ3tFcvdS2UQnjji5CFQ
        nQwnTW7BLhq+3k5XSVLNjzr3VHICr1hJBD4WUCH/mA==
X-Google-Smtp-Source: ABdhPJyx7sQwhJ8UE8NDg2Kx4YHR88sGvEf5AH10FBKUxfscAE8LJuhcwnvw8wjRTLPiqyBoy6zqtE4uvHrV7c6EPNE=
X-Received: by 2002:ab0:2641:: with SMTP id q1mr16151134uao.82.1627381759398;
 Tue, 27 Jul 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210727094435.v3.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP/FMblLCPpR7Tgf@ravnborg.org>
In-Reply-To: <YP/FMblLCPpR7Tgf@ravnborg.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 27 Jul 2021 18:29:08 +0800
Message-ID: <CANMq1KAVA3LRXzcKrVoj30KtvwuA0hQ12JdMLu32-RD8h=UjFw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tzung-Bi Shih <tzungbi@google.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Yu Jiahua <yujiahua1@huawei.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jul 27, 2021 at 4:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Nicolas,
> On Tue, Jul 27, 2021 at 09:45:21AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
> >
> > Changes in v3:
> >  - Added all R-b tags from v1 and v2 (hopefully didn't miss any).
> >
> > Changes in v2:
> >  - Rebased on latest linux-next, after some of the flags got fixed
> >    (Linus Walleij).
>
> Thanks for the update, applied to drm-misc-next.

Thanks Sam!

>
>         Sam
