Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D729AC7EE2D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 15:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjCCPMI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 10:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjCCPMH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 10:12:07 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B832367E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 07:12:06 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id v101so2249983ybi.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+YNWt3/2mwhQtToJ+WhtS+kWhy5QJtkAQP5ui8Wpx0=;
        b=E7qyvwtQl97lZ/Sq/Xto3u4q+xBQgdgGeuODz5MPGhUkyuH4o4Qt0gmB84bdIh3zw/
         0Jk5yjUzGhUVNlsCA77YwtHod3OWwPnfxFCWCK1/t+L9cOJmt2P1Lw9o5pxFgvaMrRNY
         JvVyNKPgWpA0A7bpZNVRQ46O3AlJyvBXvj50M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+YNWt3/2mwhQtToJ+WhtS+kWhy5QJtkAQP5ui8Wpx0=;
        b=WI97vynTLjOeWZBmB0t+bjsDY5ZJN/1JlUVZSwiYGcsDk/hC9XIJhWm0qukxcQa5wP
         J237EqDChzJxjaYY7dIgrQVitt62A4nN3R3InHJllZDZVSgHFznFnyKOzzW+Cz5XeZJR
         vXV1qLGC4z0BubAgVfKGcPKcKJaaq2f/sds0R2JXHCCcB/VlllHQi8H7mBjnWxGJ+ohe
         6jw0N5Hnl8ts6X1lMfGvpOel/J6+C5l7QcbC/a9UDRik6jhn8u/OispRT5WAGnp5Dy4V
         o+dEVGBVa4XkrNg3PqVKx60zEA/T7YuEwNw2dkGXv5h1d8Dsg1lzj9eVvcftLYAyuKQZ
         wuWw==
X-Gm-Message-State: AO0yUKXiW8FNtlRyznh8oRUJWdqJh8dSW2I0L9UpUq0c7XN2YvplvxBz
        weum/6jFgpEC66D4JEMHQzk0EtmdED9JjGa7TaFsHA==
X-Google-Smtp-Source: AK7set/uu7+i7lmLzXdvVBwrBo2YxMppu1kabgxL75/dmMInh7Y50+ilXQzz4J7CEdbV4A3U6bNnY3M0naC/gJ2u3mE=
X-Received: by 2002:a05:6902:4c3:b0:a6a:3356:6561 with SMTP id
 v3-20020a05690204c300b00a6a33566561mr1035058ybs.1.1677856325423; Fri, 03 Mar
 2023 07:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
 <20230303145138.29233-13-jagan@amarulasolutions.com> <20230303150807.4hhpjinuac6uyj3p@houat>
In-Reply-To: <20230303150807.4hhpjinuac6uyj3p@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 3 Mar 2023 20:41:54 +0530
Message-ID: <CAMty3ZDCVQyR-Az4Nd+iNUww5ddvtEPRR2Dt0M-=0Nt+who4ow@mail.gmail.com>
Subject: Re: [PATCH v15 12/16] drm: bridge: Generalize Exynos-DSI driver into
 a Samsung DSIM bridge
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Mar 3, 2023 at 8:38=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:
>
> On Fri, Mar 03, 2023 at 08:21:34PM +0530, Jagan Teki wrote:
> > +static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
> > +                                 struct mipi_dsi_device *device)
> > +{
> > +     struct samsung_dsim *dsi =3D host_to_dsi(host);
> > +     const struct samsung_dsim_plat_data *pdata =3D dsi->plat_data;
> > +
> > +     if (dsi->out_bridge->funcs->detach)
> > +             dsi->out_bridge->funcs->detach(dsi->out_bridge);
>
> You should never call into the bridge ops directly. If there's an issue
> in the helpers somewhere else, fix that instead.

Agreed, it was added by mistake and it was removed in Exynos. I will fix it=
.

Jagan.
