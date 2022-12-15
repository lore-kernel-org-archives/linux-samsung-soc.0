Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834C7C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Dec 2022 11:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiLOLj3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Dec 2022 06:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiLOLj3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 06:39:29 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6704DE4D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 03:39:28 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-12c8312131fso20577178fac.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Dec 2022 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yJRvwMAk47d1d+Rj/Ks/R3isqSE7sPbBB85HHuRrV0o=;
        b=qDcjtGRf2kzm8mpJXHsgYZk0y2r0mZwZ8AyGpm6r1BT+NVCt8h6vWmnzp8CU/QzFGd
         awgbeAyjgP1WhIzirBa8LuiFqSFBwmeyVUBadNFJ1VkBkvYox202LdJYy/HAuvwsv59P
         0VZB+Wzayh4YRXumgI/jbYzThd3ykix5KcgaqUmv4Cv3B3jn9MTrH0hERp4o1GtCXcn/
         SUiTBHaKUTIB4rtQ5gQyspWfRZV/2NRpM1OY90yY7g6AkMIFmAxKEcmZeWyiDe5qTJZS
         Xd6PXRla5P8CPFoeus0G8dS9yhbTj4wWo5XVi7ZfCaCttQgJfMQ2B7q4fM3e4iSYAuuA
         rkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJRvwMAk47d1d+Rj/Ks/R3isqSE7sPbBB85HHuRrV0o=;
        b=AIhwY1lYsjt++/Ri2nAe8zwdrbH13Pj4Z3Wg56jzh+DBhDd/d0ffI72Z6+GvXH4ODA
         n467+eMVQVMAnemz+QAJmh+g8MtR5az4v+Z2uTJn++13qG1OcX7saQ9IdThY1z/Mqx9n
         Txcc0uoW6v3YX324KKGvx/rreGJlOGt0O743QDjwFGDvprvsyR70V0+BAsrBr2THYgmS
         hgvm5jXRdfJWD1fcyzTxM+jMiAMg/oQKbz+cy5GoAXiyBT/lR956YGDilnFZaSgXSwfq
         1pwR+pQ7bpiUS5xcA5XPM2Te749mfiv2fJ4l56H1gejpLAeYhEMFG1pcg0HmGZBamFAO
         uy/g==
X-Gm-Message-State: AFqh2kpf6TuXR7tZVw/mUoPVe1KbSyrMnXEu3q3GSJ0O8ZWRXlrF6aAw
        YrwMzBiUwa9gT+GgzwEr3kvKBODrPKTqEA9KboPMSI/td/DFoA==
X-Google-Smtp-Source: AA0mqf5+8oomt5/aC+bnm7+gK9sejDVAUdUGVYkHyFYont6AiCTu8+BUdmqeeX60AQG5vFFqmkT3M34m60jCbPk8v/4=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr597733oab.14.1671104367774; Thu, 15
 Dec 2022 03:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-17-jagan@amarulasolutions.com> <7a58566d-9069-bc65-9a87-e79404d05e0d@kontron.de>
In-Reply-To: <7a58566d-9069-bc65-9a87-e79404d05e0d@kontron.de>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 15 Dec 2022 12:39:17 +0100
Message-ID: <CAG3jFyvoWUfa9qHme6-EDMCrXH54QmU2EeCvi8mkX0PoWA_bPg@mail.gmail.com>
Subject: Re: [PATCH v10 16/18] drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 15 Dec 2022 at 10:22, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 14.12.22 13:59, Jagan Teki wrote:
> > Samsung MIPI DSIM master can also be found in i.MX8M Mini/Nano SoC.
> >
> > Add compatible and associated driver_data for it.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Acked-by: Robert Foss <robert.foss@linaro.org>
