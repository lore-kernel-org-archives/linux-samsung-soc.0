Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A6EC678DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Mar 2023 09:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjCGJWk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Mar 2023 04:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjCGJWj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 04:22:39 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F752574C1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Mar 2023 01:22:19 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536be69eadfso234100697b3.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Mar 2023 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1678180938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nfi3/ee+0zzUkDd1GcSoY7Ws/UPnIZw0LTGTmaDNY9c=;
        b=hqQFyq408tXkxM6RC2t4Y5MdGe8VS4eXNMhpLam5ljHJgX991u/XdgMSZhWIWF6kzb
         PnUUC1LpJwI9yTWGKdY8O6XuwEK/T9ftM0bMJEcDTYlcXhU6fWreH9MXotUrWrkR7JJy
         MCRaUB82myrDLA4FC4GBRCsGjLA5oNnMqKm78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678180938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nfi3/ee+0zzUkDd1GcSoY7Ws/UPnIZw0LTGTmaDNY9c=;
        b=nClhwu7D6xgWg+qmt7cQOIOc7ap7+8E8cgCv33Ok/r2RgFZZfvI4sYSQ0vtTGnel3+
         EVtHIQaB8/ZwifufC/7a1nxp7Tz/0E/jRR4GNG+lXrLGIMiuCRUeAkRAnUsbPY6vADMI
         No846eqliZNzdiJ3afObpQ2S0JfykvE9rCoGa4CQ9R3rUHkUYHWFsrQqBvyKv0InWvpI
         UWHaWyUcCN8pWxNp6sTV9fjKUeHzz7xYK9S6sasA3YwFf5/B7SEFrDFoVd7E/JXk7vc0
         tjNj7NQGRPAcaCrEpmjoB+iMn1O82dqr/Q4JFMXqwPIlOeOaub4atG8brc/t+RBmP/tN
         NJVg==
X-Gm-Message-State: AO0yUKUL0FgzGz2FQzaoZMR49Rcf12bGqpJM/BZjDkaBzukppnz0jALr
        XV7M54egGCNI82gVWOUDj17TZcb18rocFD6ogIS1JQ==
X-Google-Smtp-Source: AK7set/AZav+eUn7LB571ItjErb9WqKq0kxTU/RWHkl+8BRPMAuOH6JTQYMfphBDYEJ3WryYc6B+CiuLhprt822azeQ=
X-Received: by 2002:a81:4317:0:b0:52e:dddf:82b9 with SMTP id
 q23-20020a814317000000b0052edddf82b9mr8909015ywa.10.1678180938312; Tue, 07
 Mar 2023 01:22:18 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230303145219eucas1p218c2e302e41464432627c8ac074302f8@eucas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com> <79c2e5cc-a488-09ae-dc68-18dbc47d963a@samsung.com>
 <CAMty3ZC1U3eDmtWa_sx0Sop_V1vU3fSM=r21U9qPf0UmCYTOkA@mail.gmail.com>
 <4b2624f6-b904-4daa-29ca-380cc7dbfc45@samsung.com> <CAMty3ZDiBERymX=jgM_dtDBbd_rvw9E4Q05ECy+dtpnZa2nkJw@mail.gmail.com>
 <44e40894-b0f6-2a00-2bea-4f99c3595e3a@samsung.com> <CAMty3ZDuTdhjqmyaRrT9NqDvq1O3=C0P6HfY1rvrn3imOsm6-A@mail.gmail.com>
In-Reply-To: <CAMty3ZDuTdhjqmyaRrT9NqDvq1O3=C0P6HfY1rvrn3imOsm6-A@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 7 Mar 2023 14:52:06 +0530
Message-ID: <CAMty3ZBxeySq3iSe=ZVrsHDKU76LiBO7cQrrc8EKbr9uUUXm2Q@mail.gmail.com>
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

On Tue, Mar 7, 2023 at 1:25=E2=80=AFPM Jagan Teki <jagan@amarulasolutions.c=
om> wrote:
>
> Hi Marek,
>
> On Tue, Mar 7, 2023 at 4:11=E2=80=AFAM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > Dear Jagan,
> >
> > On 06.03.2023 18:24, Jagan Teki wrote:
> > > On Mon, Mar 6, 2023 at 4:32=E2=80=AFPM Marek Szyprowski
> > > <m.szyprowski@samsung.com> wrote:
> > >> On 04.03.2023 19:59, Jagan Teki wrote:
> > >>> On Sat, Mar 4, 2023 at 3:56=E2=80=AFAM Marek Szyprowski
> > >>> <m.szyprowski@samsung.com> wrote:
> > >>>> On 03.03.2023 15:51, Jagan Teki wrote:
> > >>>>> This series supports common bridge support for Samsung MIPI DSIM
> > >>>>> which is used in Exynos and i.MX8MM SoC's.
> > >>>>>
> > >>>>> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Pl=
us.
> > >>>>>
> > >>>>> Inki Dae: please note that this series added on top of exynos-drm=
-next
> > >>>>> since few exynos dsi changes are not been part of drm-misc-next.
> > >>>>> Request you to pick these via exynos-drm-next, or let me know if =
you
> > >>>>> have any comments?
> > >>>> I gave it a try on Exynos TM2e and unfortunately it nukes again:
> > >>>>
> > >>>> exynos-drm exynos-drm: bound 13970000.hdmi (ops hdmi_component_ops=
)
> > >>>> Unable to handle kernel paging request at virtual address 003d454d=
414e5675
> > >>>> ...
> > >>>> [003d454d414e5675] address between user and kernel address ranges
> > >>>> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > >>>> Modules linked in:
> > >>>> CPU: 4 PID: 9 Comm: kworker/u16:0 Not tainted 6.2.0-next-20230303+=
 #13341
> > >>>> Hardware name: Samsung TM2E board (DT)
> > >>>> Workqueue: events_unbound deferred_probe_work_func
> > >>>> pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > >>>> pc : drm_connector_list_iter_next+0x58/0x100
> > >>>> lr : drm_connector_list_iter_next+0x2c/0x100
> > >>>> sp : ffff80000bbab910
> > >>>> ...
> > >>>> Call trace:
> > >>>>     drm_connector_list_iter_next+0x58/0x100
> > >>>>     drm_mode_config_reset+0xfc/0x144
> > >>>>     exynos_drm_bind+0x160/0x1b8
> > >>>>     try_to_bring_up_aggregate_device+0x168/0x1d4
> > >>>>     __component_add+0xa8/0x170
> > >>>>     component_add+0x14/0x20
> > >>>>     hdmi_probe+0x3fc/0x6d4
> > >>>>     platform_probe+0x68/0xd8
> > >>>>     really_probe+0x148/0x2b4
> > >>>>     __driver_probe_device+0x78/0xe0
> > >>>>     driver_probe_device+0xd8/0x160
> > >>>>     __device_attach_driver+0xb8/0x138
> > >>>>     bus_for_each_drv+0x84/0xe0
> > >>>>     __device_attach+0xa8/0x1b0
> > >>>>     device_initial_probe+0x14/0x20
> > >>>>     bus_probe_device+0xb0/0xb4
> > >>>>     deferred_probe_work_func+0x8c/0xc8
> > >>>>     process_one_work+0x288/0x6c8
> > >>>>     worker_thread+0x24c/0x450
> > >>>>     kthread+0x118/0x11c
> > >>>>     ret_from_fork+0x10/0x20
> > >>> This looks not related to dsi to me since there is no exynos_drm_ds=
i
> > >>> call in the trace. look hdmi related. Moreover, I think the exynos =
dsi
> > >>> worked well on v10 and I couldn't find any potential differences in
> > >>> terms of call flow change.
> > >>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
> > >> Well, the issue is definitely related to this patchset. On Friday, d=
ue
> > >> to other kernel messages, I missed the most important part of the lo=
g:
> > >>
> > >> [drm] Exynos DRM: using 13800000.decon device for DMA mapping operat=
ions
> > >> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops=
)
> > >> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops=
)
> > >> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e=
3hf2
> > >> device
> > >> exynos-dsi 13900000.dsi: request interrupt failed with -22
> > >> panel-samsung-s6e3ha2: probe of 13900000.dsi.0 failed with error -22
> > >> exynos-drm exynos-drm: bound 13900000.dsi (ops exynos_dsi_component_=
ops)
> > >> exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_=
ops)
> > >>
> > >> It looks that the are at least 2 issues. The first one related to TE
> > >> interrupt registration, the second is broken error path, which shoul=
d
> > >> free allocated resources and stop DRM from binding/initialization.
> > >>
> > >> This patch fixes the issue (TE gpio/interrupt is optional!):
> > >>
> > >> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > >> b/drivers/gpu/drm/bridge/samsung-dsim.c
> > >> index b4a5348b763c..ed83495fe105 100644
> > >> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > >> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > >> @@ -1518,7 +1518,9 @@ static int samsung_dsim_register_te_irq(struct
> > >> samsung_dsim *dsi, struct device
> > >>           int ret;
> > >>
> > >>           dsi->te_gpio =3D devm_gpiod_get_optional(dev, "te", GPIOD_=
IN);
> > >> -       if (IS_ERR(dsi->te_gpio))
> > >> +       if (!dsi->te_gpio)
> > >> +               return 0;
> > >> +       else if (IS_ERR(dsi->te_gpio))
> > > I think I missed this change from v10 where Marek V commented to move
> > > this in dsim instead of in Exynos. anyway, I will correct this.
> > >
> > >>                   return dev_err_probe(dev, PTR_ERR(dsi->te_gpio),
> > >> "failed to get te GPIO\n");
> > >>
> > >>           te_gpio_irq =3D gpiod_to_irq(dsi->te_gpio);
> > >>
> > >>
> > >> The error path in samsung_dsim_host_attach() after
> > >> samsung_dsim_register_te_irq() failure is wrong. It lacks cleaning u=
p
> > >> the allocated resources (removing the bridge, detaing the dsi device=
).
> > > This is because of the same discussion of moving TE GPIO in dsim inst=
ead exynos.
> >
> > Well, I'm not very happy about adding more and more features/changes to
> > this single patch. I think that once we got the first version that was
> > working on both Exynos and IMX, all other changes should be done
> > incrementally to avoid this kind of issues...
>
> This is what I thought too, v10 was that ready to merge patchset.
> Since it was delayed it is obvious to have more comments from other
> developers in the community. This is what happened with the TE GPIO
> change.
>
> >
> >
> > > How about register TE GPIO before calling host attach like this,
> > >
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -1598,9 +1598,6 @@ static int samsung_dsim_host_attach(struct
> > > mipi_dsi_host *host,
> > >
> > >          drm_bridge_add(&dsi->bridge);
> > >
> > > -       if (pdata->host_ops && pdata->host_ops->attach)
> > > -               pdata->host_ops->attach(dsi, device);
> > > -
> > >          /*
> > >           * This is a temporary solution and should be made by more g=
eneric way.
> > >           *
> > > @@ -1613,6 +1610,9 @@ static int samsung_dsim_host_attach(struct
> > > mipi_dsi_host *host,
> > >                          return ret;
> > >          }
> > >
> > > +       if (pdata->host_ops && pdata->host_ops->attach)
> > > +               pdata->host_ops->attach(dsi, device);
> > > +
> > >          dsi->lanes =3D device->lanes;
> > >          dsi->format =3D device->format;
> > >          dsi->mode_flags =3D device->mode_flags;
> > >
> > > Would you please check this?
> >
> > Yes. This fixes the error path.
>
> Okay. I'm sending v16 with the above two changes.

Would you please test this v16 for confirmation before sending it to
the mailing list?
https://github.com/openedev/kernel/commits/imx8mm-dsi-v16

Thanks,
Jagan.
