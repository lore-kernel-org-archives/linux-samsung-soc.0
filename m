Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F9CC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 19:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2102523102
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Jan 2021 19:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbhAMTY1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Jan 2021 14:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbhAMTY1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 14:24:27 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40B6C061794
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jan 2021 11:23:46 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id f26so3533191qka.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Jan 2021 11:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZK7xbWMVIIVESqf5LVXtb0lV4vuYCkGC89dQ6hpCg4=;
        b=K3e+EkOEpZjjDAKoU/C/ghf009JjItzqZ6/q9O59fcDElWxaIPcYFlJ5cU71vRXeLK
         KiTTZQRjiYtFWBr3t10lPbr51Gwdw4m0SKjsgvLTWu2DZdKuuPLAeUvBjwg9FI7z3xxT
         ZZLHkS4n5AXCuyHM3fTQ6HWNbDKqQL4DtcUDn1fPvYW6wypiZGNaOKNeeZnMOeyo/6uS
         p0OlIL+dhsKA/OD0wqfpM7cFljMNgfBXDRnWShGXLXJtHrSUBRtsyO2nEtHDVhnHWK2n
         xf7E1MhIF3KHkGVrMyycSVFOAr+2UclE+5WIfciU7f9wTB5jCk2kc0Po/bM5siyq0ruF
         TCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZK7xbWMVIIVESqf5LVXtb0lV4vuYCkGC89dQ6hpCg4=;
        b=YUFxEM0Z9aPcHw/9SQuTo+pQK3Fit88QsuZUsPNwFj2tfsH6OEMHDWSwWyRBz0k4sX
         kbGQSosG+K/XPdH4tyTWVg1KZyctQGnLWd8qA3BvuhIO/wyM9qdkaP0Vd2PDO0DQ1hAC
         rSqvthaOqeTJBOaUvIkbSw5QTF5+4M/jW1UK412sJb+6xdmQ97jq4X2148Mb4WWHme1I
         /19mDnMp2g3/7vE3Vv4G52w9DmFFrEs+cCcO//cVASIcwPG42yTNTtMpOBrgmgcnjQbj
         UxD19EEiWS7vlT3uKybSgsPfd2iqj3+42jUDTcFcelTbbal9IrV09k/tvzbzFvgRzUH9
         D9HQ==
X-Gm-Message-State: AOAM530Icacfj7FPZ8dvDptXH+dVEhSJN5IBELPB/UBvL/2za4QgNpL1
        ekl9hSuotQuV6BozBfdGtZGZybCv4M7+LwA1N8NUwQ==
X-Google-Smtp-Source: ABdhPJzoRALpFi9nInRmlFotMPbNrAMKM5BnfE0JHEkeg52Fo9HGnH2GpIwiie2AiCG/hHQAsF2YBLHwjQ/SxI035L0=
X-Received: by 2002:a25:8b8b:: with SMTP id j11mr2751241ybl.310.1610565825798;
 Wed, 13 Jan 2021 11:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
 <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com> <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
 <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com>
 <fde65185-fd00-1f79-0f80-245eaa6c95cb@samsung.com> <CAGETcx_QY3h83q1fSr=h_vMQdH-TMhVYPozPuSr=q4uv2Lr48w@mail.gmail.com>
 <ed32b9c7-b6d6-bf86-5e43-fd0c4aa75dd6@samsung.com>
In-Reply-To: <ed32b9c7-b6d6-bf86-5e43-fd0c4aa75dd6@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 13 Jan 2021 11:23:09 -0800
Message-ID: <CAGETcx-aEitKpU0r-iYG-AaKMd4bZmNFWKfKeUNeq3m+TKjtjA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] driver core: Set fw_devlink=on by default
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kevin Hilman <khilman@baylibre.com>,
        John Stultz <john.stultz@linaro.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Marc Zyngier <maz@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jan 12, 2021 at 11:04 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Saravana,
>
> On 12.01.2021 21:51, Saravana Kannan wrote:
> > On Mon, Jan 11, 2021 at 11:11 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 11.01.2021 22:47, Saravana Kannan wrote:
> >>> On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 11.01.2021 12:12, Marek Szyprowski wrote:
> >>>>> On 18.12.2020 04:17, Saravana Kannan wrote:
> >>>>>> Cyclic dependencies in some firmware was one of the last remaining
> >>>>>> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> >>>>>> dependencies don't block probing, set fw_devlink=on by default.
> >>>>>>
> >>>>>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> >>>>>> only for systems with device tree firmware):
> >>>>>> * Significantly cuts down deferred probes.
> >>>>>> * Device probe is effectively attempted in graph order.
> >>>>>> * Makes it much easier to load drivers as modules without having to
> >>>>>>      worry about functional dependencies between modules (depmod is still
> >>>>>>      needed for symbol dependencies).
> >>>>>>
> >>>>>> If this patch prevents some devices from probing, it's very likely due
> >>>>>> to the system having one or more device drivers that "probe"/set up a
> >>>>>> device (DT node with compatible property) without creating a struct
> >>>>>> device for it.  If we hit such cases, the device drivers need to be
> >>>>>> fixed so that they populate struct devices and probe them like normal
> >>>>>> device drivers so that the driver core is aware of the devices and their
> >>>>>> status. See [1] for an example of such a case.
> >>>>>>
> >>>>>> [1] -
> >>>>>> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> >>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>>>> This patch landed recently in linux next-20210111 as commit
> >>>>> e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it
> >>>>> breaks Exynos IOMMU operation, what causes lots of devices being
> >>>>> deferred and not probed at all. I've briefly checked and noticed that
> >>>>> exynos_sysmmu_probe() is never called after this patch. This is really
> >>>>> strange for me, as the SYSMMU controllers on Exynos platform are
> >>>>> regular platform devices registered by the OF code. The driver code is
> >>>>> here: drivers/iommu/exynos-iommu.c, example dts:
> >>>>> arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").
> >>>> Okay, I found the source of this problem. It is caused by Exynos power
> >>>> domain driver, which is not platform driver yet. I will post a patch,
> >>>> which converts it to the platform driver.
> >>> Thanks Marek! Hopefully the debug logs I added were sufficient to
> >>> figure out the reason.
> >> Frankly, it took me a while to figure out that device core waits for the
> >> power domain devices. Maybe it would be possible to add some more debug
> >> messages or hints? Like the reason of the deferred probe in
> >> /sys/kernel/debug/devices_deferred ?
> > There's already a /sys/devices/.../<device>/waiting_for_supplier file
> > that tells you if the device is waiting for a supplier device to be
> > added. That file goes away once the device probes. If the file has 1,
> > then it's waiting for the supplier device to be added (like your
> > case). If it's 0, then the device is just waiting on one of the
> > existing suppliers to probe. You can find the existing suppliers
> > through /sys/devices/.../<device>/supplier:*/supplier. Also, flip
> > these dev_dbg() to dev_info() if you need more details about deferred
> > probing.
>
> Frankly speaking I doubt that anyone will find those. Even experienced
> developer might need some time to figure it out.
>
> I expect that such information will be at least in the mentioned
> /sys/kernel/debug/devices_deferred file. We already have infrastructure
> for putting the deferred probe reason there, see dev_err_probe()
> function. Even such a simple change makes the debugging this issue much
> easier:
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index cd8e518fadd6..ceb5aed5a84c 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -937,12 +937,13 @@ int device_links_check_suppliers(struct device *dev)
>          mutex_lock(&fwnode_link_lock);
>          if (dev->fwnode && !list_empty(&dev->fwnode->suppliers) &&
>              !fw_devlink_is_permissive()) {
> -               dev_dbg(dev, "probe deferral - wait for supplier %pfwP\n",
> +               ret = dev_err_probe(dev, -EPROBE_DEFER,
> +                       "probe deferral - wait for supplier %pfwP\n",
> list_first_entry(&dev->fwnode->suppliers,
>                          struct fwnode_link,
>                          c_hook)->supplier);
>                  mutex_unlock(&fwnode_link_lock);
> -               return -EPROBE_DEFER;
> +               return ret;
>          }
>          mutex_unlock(&fwnode_link_lock);
>
> @@ -955,9 +956,9 @@ int device_links_check_suppliers(struct device *dev)
>                  if (link->status != DL_STATE_AVAILABLE &&
>                      !(link->flags & DL_FLAG_SYNC_STATE_ONLY)) {
>                          device_links_missing_supplier(dev);
> -                       dev_dbg(dev, "probe deferral - supplier %s not
> ready\n",
> +                       ret = dev_err_probe(dev, -EPROBE_DEFER,
> +                               "probe deferral - supplier %s not ready\n",
>                                  dev_name(link->supplier));
> -                       ret = -EPROBE_DEFER;
>                          break;
>                  }
>                  WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
>
>
> After such change:
>
> # cat /sys/kernet/debug/devices_deferred

Sweet! I wasn't aware of this file at all.

However, on a side note, one of my TODO items is to not add devices to
the deferred probe list if they'll never probe yet (due to suppliers
not having probed). On a board I tested on, it cut down really_probe()
calls by 75%! So the probe attempt itself effectively happens in graph
order (which I think is pretty cool). So that's going to conflict with
this file. I'll have to see what to do about that.

Thanks for this pointer. Let me sit on this for 2 weeks and see how I
can incorporate your suggestion while allowing for the above. And then
I'll send out a patch. Does that work?

-Saravana

> sound
> 13620000.sysmmu platform: probe deferral - supplier
> 10023c40.power-domain not ready
> 13630000.sysmmu platform: probe deferral - supplier
> 10023c40.power-domain not ready
> 12e20000.sysmmu platform: probe deferral - supplier
> 10023c20.power-domain not ready
> 11a20000.sysmmu platform: probe deferral - supplier
> 10023c00.power-domain not ready
> 11a30000.sysmmu platform: probe deferral - supplier
> 10023c00.power-domain not ready
> 11a40000.sysmmu platform: probe deferral - supplier
> 10023c00.power-domain not ready
> 11a50000.sysmmu platform: probe deferral - supplier
> 10023c00.power-domain not ready
> 11a60000.sysmmu platform: probe deferral - supplier
> 10023c00.power-domain not ready
> 11e20000.sysmmu platform: probe deferral - supplier
> 10023c80.power-domain not ready
> 12d00000.hdmi   platform: probe deferral - supplier
> 10023c20.power-domain not ready
> 10048000.clock-controller       platform: probe deferral - supplier
> 10023ca0.power-domain not ready
> 12260000.sysmmu platform: probe deferral - supplier
> 10048000.clock-controller not ready
> 12270000.sysmmu platform: probe deferral - supplier
> 10048000.clock-controller not ready
> 122a0000.sysmmu platform: probe deferral - supplier
> 10048000.clock-controller not ready
> 122b0000.sysmmu platform: probe deferral - supplier
> 10048000.clock-controller not ready
> 123b0000.sysmmu platform: probe deferral - supplier
> 10048000.clock-controller not ready
> 123c0000.sysmmu platform: probe deferral - supplier
> 10048000.clock-controller not ready
> 12c10000.mixer  platform: probe deferral - supplier
> 10023c20.power-domain not ready
> 13000000.gpu    platform: probe deferral - supplier
> 10023c60.power-domain not ready
>
> Probably the message can be adjusted a bit, this would significantly
> help me finding that is the source of the problem.
>
> Best regards
>
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
