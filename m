Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52098C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 21:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A31561247
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 21:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343811AbhI2Vxh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Sep 2021 17:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244748AbhI2Vxg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 17:53:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D26C061767
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Sep 2021 14:51:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z24so16518721lfu.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Sep 2021 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QyZa3HE5AzTnbENME0c+EUQpZhFABdDt4UxWcwk5TJM=;
        b=WWSFtRfbtLI608F0Gg2VZAh1FMB0Sw410UJ0duopP3lRsTt2hsmEipXag4AOmfxKDI
         7MKAWksjJLNofeIXURHWexv8M+/uA52YQKQkh6xlO2dp3qnuJcucj0QF0wlPnLL7G+CY
         vm2f8FUQ2HJroOq/HBQmmnTux3c0KCmIJ8SUs4luaUj+t+NA9kCp/3y39C1zf3Qvtwpf
         LaCbBmt7Fn2L7n4sydcITz+aUSsAAesmTGZv9p/uG9nxPdodqC85lWRJ+Bkcy3x5h7U+
         kvlhXXwiSiJTjoKUItoLWB52VKpFPFSnkHXcneT1iPORQErRMM0LTsgEQjrmGpj1t4WQ
         hDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QyZa3HE5AzTnbENME0c+EUQpZhFABdDt4UxWcwk5TJM=;
        b=XSIiGlHXTEEGxF3rboi5Q8VwoqTQEAEheANV/xcpT9gNA8SN92wawT4+Goy28riCiK
         EC969bojPA6GcEFPSLmueb3HcrCcq+svY1rU8xj8Shn2A6AD/XNCO8bpg29RPBTjZc63
         lPrOzk0qBdwK9vPmw/p4hds6OWSBYwS0z7/K28guFwyoLPXR61/yxjXmzdOLj0Uiuw4L
         fnhNwEOk2hohT9wwIJDWN5n1GqmkxXrSL54EGTvSAQbEUIkr5TCtRv00Ktd8JPcuevBw
         x3UMb14ZEmIRyo7EdEABDCOY5xoj79M7ImisRGkctn2tjz5aFuTM04NvTVPxuucJJaCX
         h2GQ==
X-Gm-Message-State: AOAM5301vW6n7vNtWHGV1b3FaeTDc7YrcNz6h0f4Sh3AQG5yk/gmc7Ld
        XTw9RXkVJQV6rwO+npXqMwQzfESdG6S09tRvjMGOIA==
X-Google-Smtp-Source: ABdhPJxGvqFYzY22yc3Fsk+wgOe6xikVy1hR2J76T+Qxsjp4YCP2wTkaTdeqY+ydE1oYOitVBr5bbHaK9AS6FwbyCYM=
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr2037444lfv.613.1632952312913;
 Wed, 29 Sep 2021 14:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech> <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
In-Reply-To: <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 29 Sep 2021 14:51:40 -0700
Message-ID: <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order consistent
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sean Paul <sean@poorly.run>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Inki Dae <inki.dae@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wrote:
> On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > The best practice to avoid those issues is to register its functions only after
> > > all its dependencies are live. We also shouldn't wait any longer than we should
> > > to play nice with the other components that are waiting for us, so in our case
> > > that would mean moving the DSI device registration to the bridge probe.
> > >
> > > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > > would be affected by this and wouldn't probe anymore after those changes.
> > > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > > requires to be tested), but the changes in msm seemed to be far more important
> > > and I wasn't confortable doing them.
> >
> >
> > Hey Maxime,
> >   Sorry for taking so long to get to this, but now that plumbers is
> > over I've had a chance to check it out on kirin
> >
> > Rob Clark pointed me to his branch with some fixups here:
> >    https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> >
> > But trying to boot hikey with that, I see the following loop indefinitely:
> > [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
> > [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
> > [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
> > [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
> > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
> > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
> > [    4.681898] adv7511 2-0039: failed to find dsi host
>
> I just realized Rob's tree is missing the kirin patch. My apologies!
> I'll retest and let you know.

Ok, just retested including the kirin patch and unfortunately I'm
still seeing the same thing.  :(

Will dig a bit and let you know when I find more.

thanks
-john
