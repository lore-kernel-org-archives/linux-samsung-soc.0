Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DC9C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Jul 2021 17:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8379A600D4
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Jul 2021 17:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhGYQuo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 25 Jul 2021 12:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhGYQuo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 25 Jul 2021 12:50:44 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED57C061760
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Jul 2021 10:31:14 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r16so7357490edt.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Jul 2021 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UkBtWhkl5JjlzgWjWjbI0oCul3smhswI+BT+jn3A+AY=;
        b=lBBlbVTgySrhfYF11i0DKiwn3+sSA7nyyo0yoTZTVFnYulOqwe3Wijrr0RpX8FDptS
         nDVJh/X1mD/yD8XHJOIaYurWvOcIO6GmVpnIcUqYI9L0pSi3Oq4H6TXmtA2Eu2EVDCt7
         ftUZ9aMRZdzcjyTEhRpFSadpe/L4hrOcUQ2fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UkBtWhkl5JjlzgWjWjbI0oCul3smhswI+BT+jn3A+AY=;
        b=I7jp0KuvDgoMqb+EFTzQM9A0nYsWSVZFV7SAxSmN4SePcHpMYA6LI9BHVHxobslrVd
         mrXepCvanbdhPwIVH5fdyeLoGWRTOBZ5SbSlAfui+AR0So5mwVJ6L6JBrYR1rDigAQHg
         rY2iB77VTrnVb+TJelG1cebZWWOWyrQPVDGJnzYJ/bOe05HvJJ7ZXmIh5xyzgCbbt489
         hbFpfBwDimJPRXPNN/a5bAHIxqnPLGDPYeXyHhiA4MVzY5lBm3n5zXI7bOEJzvCynahs
         qNT5xWv5RAkLPntsI1Q2iiKNsMg1OdTk/f/w37nYU65cVFNwbgPJUJsNB4nVBd8tQMsp
         iOiQ==
X-Gm-Message-State: AOAM533HNmOQbyEq3OU0/zIA/nakGaWB5VrxumycViQkyIE8JksWx2UB
        nXumuZd191Di/h5GmC0Hjnh1x/Ng0QGKnzdW6Qzg8w==
X-Google-Smtp-Source: ABdhPJx151WxgS05DBXIbJnohD/dbKLDBEbx/smB09iPx/aNJsLqRY1rRPuWytgxhRRXNS+9iqhHYx5oieQg99TAJ7Q=
X-Received: by 2002:a05:6402:144f:: with SMTP id d15mr17294723edx.27.1627234271837;
 Sun, 25 Jul 2021 10:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-7-jagan@amarulasolutions.com> <YP2el40V3K4R7ner@ravnborg.org>
In-Reply-To: <YP2el40V3K4R7ner@ravnborg.org>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sun, 25 Jul 2021 23:01:00 +0530
Message-ID: <CAMty3ZAw9ZNYCm=LnETEoi8qHn3qc5_B2tewhOKw-TTPrU0xog@mail.gmail.com>
Subject: Re: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via driver_data
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

On Sun, Jul 25, 2021 at 10:55 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Sun, Jul 04, 2021 at 02:32:19PM +0530, Jagan Teki wrote:
> > Exynos DSI driver is actually a Samsung MIPI DSIM bridge
> > IP which is also used in i.MX8MM platforms.
> >
> > Right now the existing driver has some exynos drm specific
> > code bases like te_irq, crtc and component_ops.
> >
> > In order to switch this driver into a common bridge driver
> > We can see 2 options to handle the exynos specific code.
> >
> > A. Drop the component_ops, and rework other specifics.
> >    This may lead to more foundation work as it requires
> >    more changes in exynos drm drivers stack.
> >
> > B. Handle the exynos specifics via driver data, and make
> >    the common bridge work in different platforms and plan
> >    for option A in future.
> >
> > So, this patch is trying to add option B) changes to handle
> > exynos specifics via driver_data.
>
> We really should find someone that has the time, energy, knowledge and
> hardware that can include device_link support once anf for all for
> bridges.
> Then we would avoid hacks like this.
>
> I see no other options at the moment, but look forward for a better
> solution.

The real key problem here is hardware, unfortunately I'm unable to
find any proper exynos DSI hardware for myself to proceed atleast.

Thanks,
Jagan.
