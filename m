Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8280C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Jul 2021 17:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E94060F11
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Jul 2021 17:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhGYQdi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 25 Jul 2021 12:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhGYQdi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 25 Jul 2021 12:33:38 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DD5C061757
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Jul 2021 10:14:08 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id oz16so4104966ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Jul 2021 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3RPOWBRf2k2synG3wrZwitti/PedojQEmKKrIh2UUo=;
        b=TH2gxgFULV3Btg8IqnkRewzfEIxAXYMpVn2yzlu582rw3Tkd6LO0hyYodBGl+z3oOG
         FCCEjmdxW1A8AOt5F8w+i6QkbHU5HZJ6cl68r8LuL4Tj7K2bwik3XqCiX4ybx0XqDenN
         voy9QGTXoRAhRVXYCmsSBDR824M8vqCCNStoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3RPOWBRf2k2synG3wrZwitti/PedojQEmKKrIh2UUo=;
        b=UzXj2VptOrL1872i16XXmf3G0Z53suUUVWuw8lhYlcCv199yCZH86SUuummBreF13n
         QiQUZunWs3Xk9Fhm7XYG/4dl8/cpvJVQdVAUzFGP8eZABpNh17BBYCqQPZL6LBTlRYs/
         GSRLSBZ3viieHVSyQ/GHE3gL8yNP2mWyfQZCC8le513AsBhHpuTLde1a8V2eNuWjQ1MA
         WkUl09pGN1LB5Zu6iC7lj4XzE7jYxV0lOWJ7auO6+kyRAn/gx4PUGW/wh3vlwJuvpi77
         rbDfk8/dfLDjOo17h6KNdti2117NK5N1Ihn5VFV1Gw4IYisaZjfws9Nej2aroj8Q6vbk
         Uz2Q==
X-Gm-Message-State: AOAM530xO7eJQT7tCRmI5eScY1whKq8vjt3HfAv34dCWbYH7E0Rn4o+a
        wJRoxof+UZNgs6BJkM+D+Rj9egM9FBfQqUkRYTm7yA==
X-Google-Smtp-Source: ABdhPJxHwHQXUhyRK5a5X9ubPP7qAlXX/q2WPa8HKt6EPPQlN1ZOYkiGslGAR5j+VSADs9ttExe8DXD7AN113IbTGAQ=
X-Received: by 2002:a17:906:368e:: with SMTP id a14mr14034879ejc.60.1627233247000;
 Sun, 25 Jul 2021 10:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com> <YP2ZvoVQyvwTXP++@ravnborg.org>
In-Reply-To: <YP2ZvoVQyvwTXP++@ravnborg.org>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sun, 25 Jul 2021 22:43:55 +0530
Message-ID: <CAMty3ZANJz=HSKFzZ8gn896uw98iVwMEpGhmanXNbj77Ren4hw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sam,

On Sun, Jul 25, 2021 at 10:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jagan,
>
> On Sun, Jul 04, 2021 at 02:32:13PM +0530, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> >
> > Right now bridge offers two sets of implementations.
> >
> > A. With component_ops and exynos specific code exclusively for
> >    exynos dsi drivers and it's legacy bindings.
> >
> > B. Without componenet_ops for newly implemented bridges and its
> >    users like i.MX8MM.
> >
> > The future plan is to fix the implementation A) by dropping
> > component_ops and fixing exynos specific code in order to make
> > the bridge more mature to use and the same is mentioned in
> > drivers TODO.
> >
> > Patch 0001 - 0006: Bridge conversion
> > Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions
> >
> > Tested in Engicam i.Core MX8M Mini SoM.
> >
> > Anyone interest, please have a look on this repo
> > https://github.com/openedev/linux/tree/070421-imx8mm-dsim
> >
> > Would appreciate anyone from the exynos team to test it on
> > the exynos platform?
> >
> > Any inputs?
>
> I really like where you are headign with this!
> No testing - sorry. But I will try to provide a bit of feedback on the
> individual patches.
>
> I hope you find a way to move forward with this.

Thanks for the response.

We have found some issues with Bridge conversion on existing exynos
drivers. The component based DSI drivers(like exynos) are difficult to
attach if it involves kms hotplug. kms hotplug would require drm
pointer and that pointer would only available after the bind call
finishes. But the bridge attach in bind call will defer till it find
the attached bridge.

Right now I'm trying to find the proper way to attach the bridges for
component based DSI drivers which involves kms hot-plug.

If you have any ideas on this, please let me know.

Thanks,
Jagan.
