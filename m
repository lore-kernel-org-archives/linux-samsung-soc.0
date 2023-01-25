Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C7FC27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 19:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235303AbjAYTZC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 14:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbjAYTZA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 14:25:00 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983F172BB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 11:24:58 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id t16so19692211ybk.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 11:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kjCOH+Bah/rBQEkuY52H26Uj32tdQ7thposSFvWsa0U=;
        b=TN7YHmXzQ3wjzP9Ck1OVEcK4t58+AbefJbHKE0l3WJcjJP4Om58Gjokv1C8CaXnAcW
         nYKB9qZ2B52WKif5+y7HAWSSYJPxo5I01oMIw1YkZMIGi6arOuz55v2gCE2gy7DHkhws
         fA3Or4HKz9/pqH4DDEhzRNR+DFWPjP63+6YRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjCOH+Bah/rBQEkuY52H26Uj32tdQ7thposSFvWsa0U=;
        b=zyl19EkVMP44ICffAe7dur3rqr97VNnnE361lePC0Po2Owf/gVvMZh60TTf0Cnmxb3
         H10Y6BTMZndeASy+Ign0cqIA/jedyCXzRlkp7WxK+E1d1J1kncZUHQb87E1OuRtq5irA
         CoGeQns8/sNMRAP8gQwmbJM9kARwo+HottUNdMu0mU1L7STHCucDipQSttYAYCYLgGnq
         5LQO6cbeYOhAAb3JXt2XdAD1iQg4guBL8+wbQoZJGVP/HkefOlIiqNFlTTy1iS0TwK8s
         K8BnRFzsNQL09L16TWpjQ7qFEfzBUoP0RfcGwswZQMpnIr7rp7tu9n668vB40Yzq6iRb
         fDOA==
X-Gm-Message-State: AO0yUKWVNA9FtiSYk/yQNAsK8QF40cAbrqLHgKdmsevvfuof8BLHTIsj
        T2B1u8p32zgPcQajtCaX2jXLtKJBrlN2wTfZaXCnCA==
X-Google-Smtp-Source: AK7set/Ubjl/kR4XwJKyXJklCNuk6uw5bs8ayrSC/puhHItAJpvdjyRHNS7xDQs6m2Sadjo8lcfO3DKG2/svHfyov2E=
X-Received: by 2002:a25:3749:0:b0:80b:6fc1:8b32 with SMTP id
 e70-20020a253749000000b0080b6fc18b32mr665824yba.126.1674674697800; Wed, 25
 Jan 2023 11:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de> <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
 <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de> <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
 <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de> <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
 <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de> <CAMty3ZDTcnN_NgjL8hEBnABpFcaE=hCegZnzaC9tz-7wFxYSmw@mail.gmail.com>
 <94f847b0-769d-e28b-11c0-b817b30c704f@denx.de>
In-Reply-To: <94f847b0-769d-e28b-11c0-b817b30c704f@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 26 Jan 2023 00:54:46 +0530
Message-ID: <CAMty3ZBTRO55N87u+YS+MtOn-D=-YRbe1Gnm8uuQM04ULuT_Vw@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
To:     Marek Vasut <marex@denx.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
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

On Wed, Jan 25, 2023 at 11:33 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 18:35, Jagan Teki wrote:
>
> [...]
>
> >>> exynos_dsi_register_te_irq is done after the bridge attach is done in
> >>> Exynos, here bridge attach is triggered in the component ops bind
> >>> call, since samsung-dsim is a pure bridge w/o any component ops.
> >>> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
> >>> https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112
> >>>
> >>> Any suggestion on how to handle this?
> >>
> >> Why isn't the generic code calling drm_bridge_attach() in
> >> samsung_dsim_host_attach(), like the exynos one ?
> >
> > Exynos drm drivers follow component ops and generic dsim is a pure drm
> > bridge whose downstream bridge will attach in bridge ops attach and
> > the component-based drivers require an initial bridge attach (whose
> > previous is NULL) call in the component bind hook for establishing the
> > bridge chain.
>
> Well in that case, call the exynos optional host_attach and register the
> TE IRQ handler at the end, that should work just fine too, right ? If
> so, then you can also move the IRQ handler registration into the generic
> part of the driver.

Something like this?

samsung_dsim_host_attach()
{
        drm_bridge_add(&dsi->bridge);

        if (pdata->host_ops && pdata->host_ops->attach)
                pdata->host_ops->attach(dsi, device);

        exynos_dsi_register_te_irq

        dsi->lanes = device->lanes;
        dsi->format = device->format;
        dsi->mode_flags = device->mode_flags;
}

Jagan.
