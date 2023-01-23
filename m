Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FB7C38142
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:44:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjAWMoB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjAWMoA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:44:00 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A4A126C5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:43:59 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id a9so14586935ybb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm1c4o5Qws8Ruu+DZEzGakbPQg7gR3fqPXnzIHM18Ic=;
        b=gd1X0bgNFwzVjEV9KLuK5vYNVLNIocazpdbZ8klm6a8wgWdRQ8T7AzuOGkwaRdk/uO
         mq7wT6qhBfYLzFqtV92OhtRE4kKo5LumBL6ZLbuZKZCxnMAk5MagkYbqgBRIISM11g9O
         2NEufEOLjwW3ufX0V/qtCkLCkg6LSW8AL3n7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xm1c4o5Qws8Ruu+DZEzGakbPQg7gR3fqPXnzIHM18Ic=;
        b=j7JHFa+jHVBuZVv6oo/uw0lGllsJ/VefAG70rK75dZ1xAyXLq8UKoTZqu+x9WvVbvh
         95NC17nxqsmiycMWZ/Dy+MhpZIIY+vadaCHvEiwqJo/DmiDWDSK5IOnhEA/cSfzM+8jr
         l4OSHc51H+HQNetIdbAQ64iDFX8Er8erRhpLMenEf+cEJmYJ5AnHLmEOzxZ5ZWYbV6Pl
         maNprwUkR/yBrMzj1JrCTpIO4JO0MiX5DpSjoZWnGcZrzIeQfJ3dOVXWEV4lw0+fYlYe
         Ypyfo62pYBeBbNfnw0aDY5v0CBiivsXa2d4j1reIIlVss0GpzWYGzjCnRodEfQm1Rq1u
         SPKw==
X-Gm-Message-State: AFqh2korpe4s0owc6gZYAuX4xp9mkdOeecVgS7MMsWHVcTqqpxGEpXaa
        nVolgXvuiJkwMUclZWsqJyJYgejT2RcumsgJ+bYQgA==
X-Google-Smtp-Source: AMrXdXuh1Rh81U9xnljENDm/W7joPbbVUTyssB+1n88rC1Tk94ZPV/ASJaEyEgQLq6rEWGfqxTTMXsE1SwMyV991K/E=
X-Received: by 2002:a25:bd54:0:b0:7d3:851c:e744 with SMTP id
 p20-20020a25bd54000000b007d3851ce744mr2967367ybm.84.1674477839174; Mon, 23
 Jan 2023 04:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
 <20230123122319.261341-18-jagan@amarulasolutions.com> <7d3d2ff3-961f-55e8-e36a-68a7304bd205@kontron.de>
In-Reply-To: <7d3d2ff3-961f-55e8-e36a-68a7304bd205@kontron.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 23 Jan 2023 18:13:47 +0530
Message-ID: <CAMty3ZDiM1UF98Ls-Ose5iyf8T0iToA=BbCQ3k4LtW4B_J9ZTw@mail.gmail.com>
Subject: Re: [PATCH v11 17/18] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8M Plus support
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jan 23, 2023 at 6:08 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 23.01.23 13:23, Jagan Teki wrote:
> > Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.
> >
> > Add dt-bingings for it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v11:
> > - collect ACK from Rob
>
> Tag is missing

Ohh, I think I will resend the series again. with RESEND prefix of the
same version.

Jagan.
