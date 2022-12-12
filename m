Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15781C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 09:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbiLLJfi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 04:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiLLJei (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 04:34:38 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A04B65F9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 01:34:14 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id d128so12887428ybf.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 01:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5raYu2oNzsA9lejV4fboamJeivIl4YOq/OEwskf/7qA=;
        b=mJJBPMtGj02QshpimYqAXPpFL2AXR7L5CjZAPh6lfoIop09BgQ6XUp+2qsTxz0vfV9
         dZLrphx69cxECOlcbVyhTeY8IpV5kxin2NPUZgZPcZ46fYAnZG5W9A7uy5j4PvnotM60
         NxWFlH1fH/HYveFQ/qXfT/AQ7Q8HhicnIxamc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5raYu2oNzsA9lejV4fboamJeivIl4YOq/OEwskf/7qA=;
        b=Mog4W2ZMfkJ5YEuUO6YdfdgTKxyTVZLL76jfMP/for/Pq3nUi7B3Ht4umT54MfGqL/
         TwVWu2NJWkY7gN4fqWW38Q74x+CbOFZGgiWTl8LVUQHXfAhytKWBc5UbX3DAUd5lThqI
         dUjEUqPO9aSfmsMV3JuyLtXGaVpk8w/BJMKMt/UFujKAiDmhMb3Y/a9UA2ztk/J5gnA/
         PM1P3kVSxKQn7bvwEoj9sq6vS44MFfp3T9wQ3hPrScvqQ6WJj23aRf0Qmti72NA422SW
         iUnfzGCcgVjLtjd/+5uQjczLUMe6mM0w9dHffMMHv+pkYXwt+hLqNq0IJmfOzL70EhsD
         E1Gw==
X-Gm-Message-State: ANoB5pl+QkHY2+PpD7mlkAY0vgRK+qnD4zbBe/wwMqBCOOqzyCdIr7ho
        993663ao0WbEIxdFxZ29y3YNeafWMIUHPaAs6EpJOg==
X-Google-Smtp-Source: AA0mqf6R5BRsKmiHMsRjHhQ76byqJcQ6e7wHQShHmmFWKymyR/3lhF9orOCFid3UDUPSL+zGq+lC9ExFZ9McSrccgdw=
X-Received: by 2002:a25:b94:0:b0:6fc:f894:91f7 with SMTP id
 142-20020a250b94000000b006fcf89491f7mr30138074ybl.475.1670837653201; Mon, 12
 Dec 2022 01:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-8-jagan@amarulasolutions.com> <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
 <CAMty3ZBOR_Bif9PUdiFgVzFLANhFn57pQTrn5=aFXgHEnA1=rA@mail.gmail.com> <deb78a20-11f7-8618-4064-76f0397a2657@denx.de>
In-Reply-To: <deb78a20-11f7-8618-4064-76f0397a2657@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 12 Dec 2022 15:04:01 +0530
Message-ID: <CAMty3ZDnjHAMqS+nV+KA+x5u7_ZGve9fLu7SHP2CYdARGi4-5g@mail.gmail.com>
Subject: Re: [PATCH v9 07/18] drm: bridge: samsung-dsim: Lookup OF-graph or
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

On Sun, Dec 11, 2022 at 11:36 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/11/22 06:42, Jagan Teki wrote:
> > On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/9/22 16:23, Jagan Teki wrote:
> >>> The child devices in MIPI DSI can be binding with OF-graph
> >>> and also via child nodes.
> >>>
> >>> The OF-graph interface represents the child devices via
> >>> remote and associated endpoint numbers like
> >>>
> >>> dsi {
> >>>      compatible = "fsl,imx8mm-mipi-dsim";
> >>>
> >>>      ports {
> >>>        port@0 {
> >>>             reg = <0>;
> >>>
> >>>             dsi_in_lcdif: endpoint@0 {
> >>>                  reg = <0>;
> >>>                  remote-endpoint = <&lcdif_out_dsi>;
> >>>             };
> >>>        };
> >>>
> >>>        port@1 {
> >>>             reg = <1>;
> >>>
> >>>             dsi_out_bridge: endpoint {
> >>>                  remote-endpoint = <&bridge_in_dsi>;
> >>>             };
> >>>        };
> >>> };
> >>>
> >>> The child node interface represents the child devices via
> >>> conventional child nodes on given DSI parent like
> >>>
> >>> dsi {
> >>>      compatible = "samsung,exynos5433-mipi-dsi";
> >>>
> >>>      ports {
> >>>           port@0 {
> >>>                reg = <0>;
> >>>
> >>>                dsi_to_mic: endpoint {
> >>>                     remote-endpoint = <&mic_to_dsi>;
> >>>                };
> >>>           };
> >>>      };
> >>>
> >>>      panel@0 {
> >>>           reg = <0>;
> >>>      };
> >>> };
> >>>
> >>> As Samsung DSIM bridge is common DSI IP across all Exynos DSI
> >>> and NXP i.MX8M host controllers, this patch adds support to
> >>> lookup the child devices whether its bindings on the associated
> >>> host represent OF-graph or child node interfaces.
> >>>
> >>> v9, v8, v7, v6, v5, v4, v3:
> >>> * none
> >>>
> >>> v2:
> >>> * new patch
> >>
> >> This looks like a good candidate for common/helper code which can be
> >> reused by other similar drivers.
> >
> > Yes, I have responded to the same comment of yours in v7 [1]. It is
> > hard to make this code work in a generic way.
>
> It seems the patch adds a for_each...() loop and a function call. Should
> be easy enough to turn that into a helper. What am I missing ?

What I'm saying here is, initially, I added for_each in the existing
drm_of_find_panel_or_bridge helper but it fails to handle all drm_of
use cases generically. You can find more information on this commit
80253168dbfd. I keep this in mind and will see whether it can support
the new dsi helper once this supported is merged. Hope I'm clear on
it.

Jagan.
