Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8F0C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Mar 2023 19:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjCDTAA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 4 Mar 2023 14:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDTAA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Mar 2023 14:00:00 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AC511E85
        for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Mar 2023 10:59:59 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536c02eea4dso106484477b3.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Mar 2023 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iciU42MsjzRLLBgcoDIhCRCJz7raKvgN999jry5uumc=;
        b=EPE/cdNdWIkA3bAMqx9YTT2+yiGIuO0CeTCoDI4u9igT/0173Ts5aMMamePXvCumgY
         dOcpAtU3b4jDZpdXJuPm/SagrTmiurHV9N24b57FOqXVWeT4fll9yOhYs3/GqyNgs6Ni
         uAujZW05rmELnWmVTmzIyCduuCWMIXA+lyYGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iciU42MsjzRLLBgcoDIhCRCJz7raKvgN999jry5uumc=;
        b=7xGnj7LdOjlket3CnxkZvo7qf2TNc3zp2exoLObCmRJ+bXEUKjxrxr1LkAV9ElW+/X
         kSdV/xxBJfAlsq+5vwVZ8SiTK9yGZPwZ4OBIfb5zolk/wzVl9TA6Aq3i/1kSzU2Ax9In
         seB3FBh8vDaoBOAtzUC63m83+lKEaHsyR4omYLfPjAeAe03JcqNfUA2WTCEecHFP6g15
         +zr+ssmMeD54HbCZX6oJoGdj33KupBDeBCizym/w28VDBo5cP4VQMZHSAnhfckt0c+mn
         fIf7G2SVOL75ZRkU7zT0IS0b2JEN9ox4ttGM+40wm1+tlUEE+zB1mu5pu8BWThtc2xEt
         ZlsQ==
X-Gm-Message-State: AO0yUKWKa4FNCcshvgYS96AatJhj0iHMrSELpAwoYJ78eqGbfJEflYfP
        7UyUT05oLF8KBN9m9j/r9FsVOr+Q3ax09Jp0F+FPiw==
X-Google-Smtp-Source: AK7set+p1y290rRoo9CZP+K1Band+15T00kDGqTFxdbQ+doUjGOn8ofNfRdmcfqGuna0jxaPwRMFFCA00KQxf3j2j2I=
X-Received: by 2002:a81:ad44:0:b0:52a:92e9:27c1 with SMTP id
 l4-20020a81ad44000000b0052a92e927c1mr3560103ywk.10.1677956398135; Sat, 04 Mar
 2023 10:59:58 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230303145219eucas1p218c2e302e41464432627c8ac074302f8@eucas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com> <79c2e5cc-a488-09ae-dc68-18dbc47d963a@samsung.com>
In-Reply-To: <79c2e5cc-a488-09ae-dc68-18dbc47d963a@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sun, 5 Mar 2023 00:29:46 +0530
Message-ID: <CAMty3ZC1U3eDmtWa_sx0Sop_V1vU3fSM=r21U9qPf0UmCYTOkA@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <mripard@kernel.org>,
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

Hi Marek,

On Sat, Mar 4, 2023 at 3:56=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 03.03.2023 15:51, Jagan Teki wrote:
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >
> > Inki Dae: please note that this series added on top of exynos-drm-next
> > since few exynos dsi changes are not been part of drm-misc-next.
> > Request you to pick these via exynos-drm-next, or let me know if you
> > have any comments?
>
> I gave it a try on Exynos TM2e and unfortunately it nukes again:
>
> exynos-drm exynos-drm: bound 13970000.hdmi (ops hdmi_component_ops)
> Unable to handle kernel paging request at virtual address 003d454d414e567=
5
> ...
> [003d454d414e5675] address between user and kernel address ranges
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 4 PID: 9 Comm: kworker/u16:0 Not tainted 6.2.0-next-20230303+ #13341
> Hardware name: Samsung TM2E board (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : drm_connector_list_iter_next+0x58/0x100
> lr : drm_connector_list_iter_next+0x2c/0x100
> sp : ffff80000bbab910
> ...
> Call trace:
>   drm_connector_list_iter_next+0x58/0x100
>   drm_mode_config_reset+0xfc/0x144
>   exynos_drm_bind+0x160/0x1b8
>   try_to_bring_up_aggregate_device+0x168/0x1d4
>   __component_add+0xa8/0x170
>   component_add+0x14/0x20
>   hdmi_probe+0x3fc/0x6d4
>   platform_probe+0x68/0xd8
>   really_probe+0x148/0x2b4
>   __driver_probe_device+0x78/0xe0
>   driver_probe_device+0xd8/0x160
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x84/0xe0
>   __device_attach+0xa8/0x1b0
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0xb0/0xb4
>   deferred_probe_work_func+0x8c/0xc8
>   process_one_work+0x288/0x6c8
>   worker_thread+0x24c/0x450
>   kthread+0x118/0x11c
>   ret_from_fork+0x10/0x20

This looks not related to dsi to me since there is no exynos_drm_dsi
call in the trace. look hdmi related. Moreover, I think the exynos dsi
worked well on v10 and I couldn't find any potential differences in
terms of call flow change.
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10

Please let me know, thanks!

Jagan.
