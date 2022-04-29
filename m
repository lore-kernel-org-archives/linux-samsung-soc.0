Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9579DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Apr 2022 09:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236114AbiD2Jnc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Apr 2022 05:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236487AbiD2Jna (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 05:43:30 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDF56175
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Apr 2022 02:40:13 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id be20so8391866edb.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Apr 2022 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wQ2UALvuYRSPgu0V8AOck6B5HmYCenVgKB78DwZPTwM=;
        b=P7M2zfxVjN+5Wd8MumYafWJIMBGQ0Jc6nQZZS4Ge63LJncxEXgHQ36SOaRkLum/PnK
         wrmfJI0E8VHoj6N1xEV7OwDo7oqIJkie9FcMbcneokGzkOxgiAXn6VvkoWAz7NVE5JjO
         S+NtNVIsxxLkv4KkJntQteu+zi8lQ2CZLJkLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wQ2UALvuYRSPgu0V8AOck6B5HmYCenVgKB78DwZPTwM=;
        b=Bz6X1IDgeMP5B1zJwLbl3z3qufCkNF0CjqI6Nf7AKp2DqV8YCVShlXnXX215Cfs/7N
         ZwD8aq5SWspRUHXpXhnB6LcZJF17HzZf2a3Bb5aslRV/82dG9C3nc8hZ27Lq/wOjeA5p
         aTAyGsfXjsiXw02LciSTPCbTALb4pqGsbokUW3V5nnYWxtEFgJP8Cm6cwaAGFDTDCjDO
         NEOoebDJyKmw8qynkiHVnYAHiaAmPI3l4xi0vrSWSccW3wG5v8YcDjss9DJ+RXNCcPE8
         zuEtXeI+O7+DSvBZ6dF3yALPCFwEnAvQKJC68PQjMhEVj8i8S3ENRTXHQGdKnzB7J8LQ
         X+hQ==
X-Gm-Message-State: AOAM5309pNHV4oI13OKhL4NSxuMC+NDbEIa63rH7DZI9y7cOranvddWO
        YUjOf6367TiDupxiSRj0gnq5JPb1piXUaIUdAndAmQ==
X-Google-Smtp-Source: ABdhPJwFHiC8+9gGoQCOlqBd9O/JCWXoLXnjI9sNzpOY4Sn0Ab0tEfaKdoFaOZoZ0O20swi8/cgfutmRm3BLt3bIscU=
X-Received: by 2002:a05:6402:2920:b0:425:d7c7:41f with SMTP id
 ee32-20020a056402292000b00425d7c7041fmr31226896edb.370.1651225211659; Fri, 29
 Apr 2022 02:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
 <20220408162108.184583-11-jagan@amarulasolutions.com> <YlMeEqhkQ6HuCKFE@pendragon.ideasonboard.com>
In-Reply-To: <YlMeEqhkQ6HuCKFE@pendragon.ideasonboard.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 29 Apr 2022 15:10:00 +0530
Message-ID: <CAMty3ZDg9chHXv1ZBw86TePxFFFoobMGffFG1gN9btnfkUb5AQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Laurent,

On Sun, Apr 10, 2022 at 11:42 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> Thank you for the patch.
>
> On Fri, Apr 08, 2022 at 09:51:07PM +0530, Jagan Teki wrote:
> > Samsung MIPI DSIM bridge can also be found in i.MX8MM/i.MX8MN SoC.
> >
> > Add dt-bingings for it.
> >
> > v1:
> > * new patch
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > index be377786e8cd..5133d4d39190 100644
> > --- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > +++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
> > @@ -7,6 +7,7 @@ Required properties:
>
> May I try and ask you to convert the DT bindings to YAML as part of this
> series ? :-)

I thought the same and I did it for RFC
https://patchwork.kernel.org/project/dri-devel/patch/20210704090230.26489-9-jagan@amarulasolutions.com/

But, I'm thinking of sending a separate patch series for updating yaml
as the existing binding is old that it has some properties need to
fix.

Let me know if you are okay or not for it?

>
> >               "samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
> >               "samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
> >               "samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
> > +             "fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
>
> Should we have two different compatible strings for i.MX8MM and i.MX8MN
> ?

Yes, MN is fallback to MM. I will update in next series or add it as
part of yaml conversion series.

Thanks,
Jagan.
