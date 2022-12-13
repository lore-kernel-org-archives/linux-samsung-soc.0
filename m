Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3549AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Dec 2022 13:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbiLMNbc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Dec 2022 08:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbiLMNbb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 08:31:31 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A291C2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 05:31:30 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-381662c78a9so191289657b3.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxHqQaQZ5w2vv77RAQDRtZk1hHRxs4xh8uv5mFHlHKk=;
        b=T1BLMYiZLAsBmIdUnQNHie+D8kICgNfUgtv/P0inTXR7TxzJr1vAyTFCE2xPfWtwOJ
         FrYKNnvU8N+dLp6Scf/6xU2+z9AUh0ppzKOfuYD05R1m16z0Kel+9WZL/ShWCn7Qsafq
         4tB6WHTNVBfFZ4POmGPn9Trdu4gtzYTMiEVr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxHqQaQZ5w2vv77RAQDRtZk1hHRxs4xh8uv5mFHlHKk=;
        b=RO2ZmBv/pizG6edXua96YFu2RwiTBoW0ITA24nTJxNTALRVIp/5ai7/Z+MhTrrMZE6
         6ZbzQ1Nv6mTEqLwT/8lfq+dwfxmoVCR8syc/pOH2C7h28oB3nvNV2PPTLyRPT/cpP8hD
         lAcickEK2LyDdiT/lx8MTuDjK14d9PQEbrAkjzhRZdgcbiq1HlS8wjuy//8qcihUVFCe
         l52kqpadNRri8vqxP/UT9ClRBM9HLqvjT/+gsP0XcldvM4nc9eYKUJMItoORe8X7Ft2H
         0Cu/GK6UlM2ksKeXPyBqwdN75Iy8/KU2a5fsxXjB5t76RywZatQWwWva1prRrhYIuCkY
         vwzA==
X-Gm-Message-State: ANoB5pkynssEj1usVcMxngLAtKHQuB0Jd5OwOJMH+48WMcHX+YlR2Fzr
        WUoVsY7+XWUHqFN777ueHJerjWJj/o65D99B53INrg==
X-Google-Smtp-Source: AA0mqf6f7vunebOO8FhwJEuAHaYwQnNN8qZJWeONm2RwxXRLUJekqkeh3ysVt10MrzDoKGkFqEkvQTiX2TEB9N7sHT0=
X-Received: by 2002:a81:9a13:0:b0:398:ab7a:aba9 with SMTP id
 r19-20020a819a13000000b00398ab7aaba9mr21081470ywg.106.1670938289746; Tue, 13
 Dec 2022 05:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com> <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com> <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com> <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <c3f0c5c2-aae8-dc39-be02-dc4dfd0e7073@samsung.com>
In-Reply-To: <c3f0c5c2-aae8-dc39-be02-dc4dfd0e7073@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 13 Dec 2022 19:01:18 +0530
Message-ID: <CAMty3ZBjW=tdd9_zTAAwVmh0vD4oAwSnngJNkFz7F2ns9XtJNA@mail.gmail.com>
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
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
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Dec 13, 2022 at 5:50 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 13.12.2022 11:40, Jagan Teki wrote:
> > On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 12.12.2022 16:33, Jagan Teki wrote:
> >>
> >> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>
> >> On 12.12.2022 09:43, Marek Szyprowski wrote:
> >>
> >> On 12.12.2022 09:32, Jagan Teki wrote:
> >>
> >> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On 09.12.2022 16:23, Jagan Teki wrote:
> >>
> >> The existing drm panels and bridges in Exynos required host
> >> initialization during the first DSI command transfer even though
> >> the initialization was done before.
> >>
> >> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
> >> flag and triggers from host transfer.
> >>
> >> Do this exclusively for Exynos.
> >>
> >> Initial logic is derived from Marek Szyprowski changes.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >> Changes from v9:
> >> - derived from v8
> >> - added comments
> >>
> >>     drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
> >>     include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>     2 files changed, 17 insertions(+), 3 deletions(-)
> >>
> >> The following chunk is missing compared to v8:
> >>
> >> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> index 6e9ad955ebd3..6a9403cb92ae 100644
> >> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
> >> *dsi, unsigned int flag)
> >>                    return 0;
> >>
> >>            samsung_dsim_reset(dsi);
> >> -       samsung_dsim_enable_irq(dsi);
> >> +
> >> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >> +               samsung_dsim_enable_irq(dsi);
> >>
> >> Is this really required? does it make sure that the IRQ does not
> >> enable twice?
> >>
> >> That's what that check does. Without the 'if (!(dsi->state &
> >> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
> >> from pre_enable, then from the first transfer), what leads to a
> >> warning from irq core.
> >>
> >> I've just noticed that we also would need to clear the
> >> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
> >>
> >> However I've found that a bit simpler patch would keep the current cod=
e
> >> flow for Exynos instead of this reinitialization hack. This can be
> >> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
> >> init in pre_enable" patch:
> >>
> >> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> index 0b2e52585485..acc95c61ae45 100644
> >> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >> @@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(stru=
ct
> >> drm_bridge *bridge,
> >>
> >>           dsi->state |=3D DSIM_STATE_ENABLED;
> >>
> >> -       ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> >> -       if (ret)
> >> -               return;
> >> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> >> +               ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED)=
;
> >> +               if (ret)
> >> +                       return;
> >> +       }
> >>
> >> Sorry, I don't understand this. Does it mean Exynos doesn't need to
> >> init host in pre_enable? If I remember correctly even though the host
> >> is initialized it has to reinitialize during the first transfer - This
> >> is what the Exynos requirement is. Please correct or explain here.
> >>
> >> This is a matter of enabling power regulator(s) in the right order and=
 doing the host initialization in the right moment. It was never a matter o=
f re-initialization. See the current code for the reference (it uses the sa=
me approach as my above change). I've already explained that here:
> >>
> >> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsu=
ng.com/
> >>
> >> If you would like to see the exact proper moment of the dsi host initi=
alization on the Exynos see the code here:
> >>
> >> https://protect2.fireeye.com/v1/url?k=3D5dc33900-0258001f-5dc2b24f-000=
babdfecba-f7c1a2a1905c83ca&q=3D1&e=3Df086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=
=3Dhttps%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511=
-dsi-rework and patches adding mipi_dsi_host_init() to panel/bridge drivers=
.
> > As I said before, the downstream bridge needs an explicit call to host
> > init via mipi_dsi_host_init - this is indeed not a usual use-case
> > scenario. Let's handle this with a REINIT fix and see if we can update
> > this later to handle both scenarios.
> >
> > Would you please test this repo, I have included all.
> >
> > https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> This doesn't work on TM2e board. Give me some time to find why...

May be some mode_flags changes in the panel driver.

Jagan.
