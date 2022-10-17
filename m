Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57340C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Oct 2022 02:52:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbiJQCwR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Oct 2022 22:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiJQCwQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 22:52:16 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9173C474DD
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 19:52:15 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1326637be6eso11920141fac.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Oct 2022 19:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9rP/6LXrcKejMOXRx9c+Aj9B0Hobpt4k4fRjm5tGy7k=;
        b=bz/nzilPNshvt438l/SCKGV2hgLpWUuwHlEX8JQWf+DKFEgAfl7neZkS5vS3j2Lxur
         QtxbYEFarVe5DAsFxfh+9Kgp56fYgDhv6RvnWhdS+AqZrvqzQTr4Vp75DfTzmK1igCuK
         8tJktBI5gbK/4sN3xkwS9OjkvCgUWX5Jjl1hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rP/6LXrcKejMOXRx9c+Aj9B0Hobpt4k4fRjm5tGy7k=;
        b=Qo6aOqgZebB5YKSxYaa7yzibAnB7+Se+LQhJmk5E2mjut/EDEF7GnupfLAcij8+S6Y
         KXcoOG22NZZRN2kLNIG0KU0g2XQUUwKjWossXwixaAM9fjczjv20ZrUcqp3NnHf+fE2k
         aeX2hwzZ49gLD0hPd9A0lc2mSO47NH02ozgktclW11DRmW3ZLrcD5u/5ImSBw4gZGFi/
         4atqMXCUsV4HDQi2r9mTYAaWzw9uXbReivmnGpkiZtwPwSC9iUQJbjhtIPt8RyWSYVYn
         QXTti/MyZXhZshzrxWPE2a4ASIbyb16h2Q/DJoRngKpOGwmNJxNetC/wg3n0sVDEdeGz
         ho0g==
X-Gm-Message-State: ACrzQf3+Z6G0VNjtByrI8Up8BlbSLcapcRV39WH66DtXqHndOp7bPJeB
        +itGcmE0n4vVkxvqCLiNSkG36kNQMApcSxGOJvJMJA==
X-Google-Smtp-Source: AMsMyM4IcmRop8bVYXsoeWKKkEscTZblIgs0IVt8EpnmQ1lzsSKtdndQmyeLeg++cR8NHe5+/YIQ+X9Mu5rQyYyGKFM=
X-Received: by 2002:a05:6870:8999:b0:133:15f9:82fd with SMTP id
 f25-20020a056870899900b0013315f982fdmr4527991oaq.276.1665975134966; Sun, 16
 Oct 2022 19:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-3-jagan@amarulasolutions.com> <45f9065d-7257-1050-2664-5ad55d8c14ae@denx.de>
In-Reply-To: <45f9065d-7257-1050-2664-5ad55d8c14ae@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 17 Oct 2022 08:22:04 +0530
Message-ID: <CAMty3ZBtRZ-vDPQYX+m8uWmsD+vmbFOnCGVba8swQ8GWtWaKJQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] drm: bridge: samsung-dsim: Lookup OF-graph or
 Child node devices
To:     Marek Vasut <marex@denx.de>
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
        Neil Armstrong <narmstrong@linaro.org>,
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

On Sun, Oct 16, 2022 at 3:18 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/5/22 17:13, Jagan Teki wrote:
> > The child devices in MIPI DSI can be binding with OF-graph
> > and also via child nodes.
> >
> > The OF-graph interface represents the child devices via
> > remote and associated endpoint numbers like
> >
> > dsi {
> >     compatible = "fsl,imx8mm-mipi-dsim";
> >
> >     ports {
> >       port@0 {
> >            reg = <0>;
> >
> >            dsi_in_lcdif: endpoint@0 {
> >                 reg = <0>;
> >                 remote-endpoint = <&lcdif_out_dsi>;
> >            };
> >       };
> >
> >       port@1 {
> >            reg = <1>;
> >
> >            dsi_out_bridge: endpoint {
> >                 remote-endpoint = <&bridge_in_dsi>;
> >            };
> >       };
> > };
> >
> > The child node interface represents the child devices via
> > conventional child nodes on given DSI parent like
> >
> > dsi {
> >     compatible = "samsung,exynos5433-mipi-dsi";
> >
> >     ports {
> >          port@0 {
> >               reg = <0>;
> >
> >               dsi_to_mic: endpoint {
> >                    remote-endpoint = <&mic_to_dsi>;
> >               };
> >          };
> >     };
> >
> >     panel@0 {
> >          reg = <0>;
> >     };
> > };
> >
> > As Samsung DSIM bridge is common DSI IP across all Exynos DSI
> > and NXP i.MX8M host controllers, this patch adds support to
> > lookup the child devices whether its bindings on the associated
> > host represent OF-graph or child node interfaces.
>
> This looks like a good candidate for common/helper code which can be
> reused by other similar drivers.

Tried that but unfortunately, it cannot hold to handle things in a generic way.
80253168dbfd ("drm: of: Lookup if child node has panel or bridge")

Jagan.
