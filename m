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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B05C43381
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 18:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4A0823A04
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Jan 2021 18:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbhANSJ0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Jan 2021 13:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729813AbhANSJS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 13:09:18 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537FDC0613D6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 10:08:38 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id g4so2593946ybo.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jan 2021 10:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C3hrT05Ul8fFZR4pfF1BRuAXcWLu1jyPFeOD/jqNgsY=;
        b=W//c8CxUQhepAZnCagAxNOMraaY4URnyIPxbuv6tKgCDCT2bTkCUSUcZ6arpPk9Y2/
         iuBX6GysBL1MOTHSJvnrLyPqyi19qzqNgWUX8RVeEj1/h6HginlvTTbRqWiGJXBI8vPJ
         E4tkpVHaJ77zNCoEsCYttww3/Fyl5gwe0GxbwUUyGA/2CC+jy7/Y6hY1QZE+M0BPkI8e
         /OdLjGb3KTAMndjjw3qmDjysk4fW6oAacH4POl+FafpafDJW3IVoYsSNi7sYGq4DL9uU
         +y1rdQBHWy2ydtiPolGVGD9fPfzGDNfdHON8imhCR9m9NJKaGBR5d3+Tt7OIb9bxX4ZC
         Hn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C3hrT05Ul8fFZR4pfF1BRuAXcWLu1jyPFeOD/jqNgsY=;
        b=qLYAtnoFk9QQxeKB6bYhil067Y6O00UeZ4ga4r/Ly89qv6af79BJUyv6k0GSkBgN73
         0wNPdUk82UNOd77XyEkzambGWcKGXYpstp0R95x3tqw8hgLiM+92KVaNr7oBSga0ay8B
         USWlKJ6uaCeTD9+RfjzCOrV/9ald/NHUrmopxW3M/hsxvsEZPhL2lsfn9tGng3STWGw+
         ljWn1EqjCD4bKEEQyKmBeuQ/TwfjOzNz2sHLutm5cdnSXZSIrDYdx8vQnAH3XUNA6NR/
         M0wKzkF4EK3w7VPn5WXqiNg2Fl5Hyv+7v2CSN3tXu+xyF+U4ZhfsdmAXDy+zxsolTv7P
         zm7Q==
X-Gm-Message-State: AOAM533ukiAfmq10Hc4ZQfi4ynYeAwwGnKywTWuQzdFrR+2nQPvo7dHX
        Iie+OdsIlU2lLBhVCl0zrxdu6tJYIAu8I1Sqa0mIBA==
X-Google-Smtp-Source: ABdhPJwt90mev9yBW1IC9HaxfQq8riZdp6xXEz9z0DDRQd5d6UvCrgDF2E2HpViuNUdZm0IOtHNK2EOM9Zmm9oJuDK8=
X-Received: by 2002:a25:8b8b:: with SMTP id j11mr9140317ybl.310.1610647717290;
 Thu, 14 Jan 2021 10:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
 <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com> <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
 <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com>
 <fde65185-fd00-1f79-0f80-245eaa6c95cb@samsung.com> <CAGETcx_QY3h83q1fSr=h_vMQdH-TMhVYPozPuSr=q4uv2Lr48w@mail.gmail.com>
 <ed32b9c7-b6d6-bf86-5e43-fd0c4aa75dd6@samsung.com> <CAGETcx-aEitKpU0r-iYG-AaKMd4bZmNFWKfKeUNeq3m+TKjtjA@mail.gmail.com>
 <3db354fb-28e8-78c7-cf73-a9042228d50b@samsung.com>
In-Reply-To: <3db354fb-28e8-78c7-cf73-a9042228d50b@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 14 Jan 2021 10:08:01 -0800
Message-ID: <CAGETcx-w5+uMB9vWzVgGdcYqTBFfXDzwFWuoL4x0M8S3DZY32g@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 13, 2021 at 11:36 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Saravana,
>
> On 13.01.2021 20:23, Saravana Kannan wrote:
> > On Tue, Jan 12, 2021 at 11:04 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 12.01.2021 21:51, Saravana Kannan wrote:
> >>> On Mon, Jan 11, 2021 at 11:11 PM Marek Szyprowski
> >>> <m.szyprowski@samsung.com> wrote:
> >>>> On 11.01.2021 22:47, Saravana Kannan wrote:
> >>>>> On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>> On 11.01.2021 12:12, Marek Szyprowski wrote:
> >>>>>>> On 18.12.2020 04:17, Saravana Kannan wrote:
> >>>>>>>> Cyclic dependencies in some firmware was one of the last remaini=
ng
> >>>>>>>> reasons fw_devlink=3Don couldn't be set by default. Now that cyc=
lic
> >>>>>>>> dependencies don't block probing, set fw_devlink=3Don by default=
.
> >>>>>>>>
> >>>>>>>> Setting fw_devlink=3Don by default brings a bunch of benefits (c=
urrently,
> >>>>>>>> only for systems with device tree firmware):
> >>>>>>>> * Significantly cuts down deferred probes.
> >>>>>>>> * Device probe is effectively attempted in graph order.
> >>>>>>>> * Makes it much easier to load drivers as modules without having=
 to
> >>>>>>>>       worry about functional dependencies between modules (depmo=
d is still
> >>>>>>>>       needed for symbol dependencies).
> >>>>>>>>
> >>>>>>>> If this patch prevents some devices from probing, it's very like=
ly due
> >>>>>>>> to the system having one or more device drivers that "probe"/set=
 up a
> >>>>>>>> device (DT node with compatible property) without creating a str=
uct
> >>>>>>>> device for it.  If we hit such cases, the device drivers need to=
 be
> >>>>>>>> fixed so that they populate struct devices and probe them like n=
ormal
> >>>>>>>> device drivers so that the driver core is aware of the devices a=
nd their
> >>>>>>>> status. See [1] for an example of such a case.
> >>>>>>>>
> >>>>>>>> [1] -
> >>>>>>>> https://protect2.fireeye.com/v1/url?k=3D68f5d8ba-376ee1f5-68f453=
f5-0cc47a30d446-324e64700545ab93&q=3D1&e=3Dfb455b9e-c8c7-40d0-8e3c-d9d3713d=
519b&u=3Dhttps%3A%2F%2Flore.kernel.org%2Flkml%2FCAGETcx9PiX%3D%3DmLxB9PO8My=
yk6u2vhPVwTMsA5NkD-ywH5xhusw%40mail.gmail.com%2F
> >>>>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>>>>>> This patch landed recently in linux next-20210111 as commit
> >>>>>>> e590474768f1 ("driver core: Set fw_devlink=3Don by default"). Sad=
ly it
> >>>>>>> breaks Exynos IOMMU operation, what causes lots of devices being
> >>>>>>> deferred and not probed at all. I've briefly checked and noticed =
that
> >>>>>>> exynos_sysmmu_probe() is never called after this patch. This is r=
eally
> >>>>>>> strange for me, as the SYSMMU controllers on Exynos platform are
> >>>>>>> regular platform devices registered by the OF code. The driver co=
de is
> >>>>>>> here: drivers/iommu/exynos-iommu.c, example dts:
> >>>>>>> arch/arm/boot/dts/exynos3250.dtsi (compatible =3D "samsung,exynos=
-sysmmu").
> >>>>>> Okay, I found the source of this problem. It is caused by Exynos p=
ower
> >>>>>> domain driver, which is not platform driver yet. I will post a pat=
ch,
> >>>>>> which converts it to the platform driver.
> >>>>> Thanks Marek! Hopefully the debug logs I added were sufficient to
> >>>>> figure out the reason.
> >>>> Frankly, it took me a while to figure out that device core waits for=
 the
> >>>> power domain devices. Maybe it would be possible to add some more de=
bug
> >>>> messages or hints? Like the reason of the deferred probe in
> >>>> /sys/kernel/debug/devices_deferred ?
> >>> There's already a /sys/devices/.../<device>/waiting_for_supplier file
> >>> that tells you if the device is waiting for a supplier device to be
> >>> added. That file goes away once the device probes. If the file has 1,
> >>> then it's waiting for the supplier device to be added (like your
> >>> case). If it's 0, then the device is just waiting on one of the
> >>> existing suppliers to probe. You can find the existing suppliers
> >>> through /sys/devices/.../<device>/supplier:*/supplier. Also, flip
> >>> these dev_dbg() to dev_info() if you need more details about deferred
> >>> probing.
> >> Frankly speaking I doubt that anyone will find those. Even experienced
> >> developer might need some time to figure it out.
> >>
> >> I expect that such information will be at least in the mentioned
> >> /sys/kernel/debug/devices_deferred file. We already have infrastructur=
e
> >> for putting the deferred probe reason there, see dev_err_probe()
> >> function. Even such a simple change makes the debugging this issue muc=
h
> >> easier:
> >>
> >> diff --git a/drivers/base/core.c b/drivers/base/core.c
> >> index cd8e518fadd6..ceb5aed5a84c 100644
> >> --- a/drivers/base/core.c
> >> +++ b/drivers/base/core.c
> >> @@ -937,12 +937,13 @@ int device_links_check_suppliers(struct device *=
dev)
> >>           mutex_lock(&fwnode_link_lock);
> >>           if (dev->fwnode && !list_empty(&dev->fwnode->suppliers) &&
> >>               !fw_devlink_is_permissive()) {
> >> -               dev_dbg(dev, "probe deferral - wait for supplier %pfwP=
\n",
> >> +               ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> >> +                       "probe deferral - wait for supplier %pfwP\n",
> >> list_first_entry(&dev->fwnode->suppliers,
> >>                           struct fwnode_link,
> >>                           c_hook)->supplier);
> >>                   mutex_unlock(&fwnode_link_lock);
> >> -               return -EPROBE_DEFER;
> >> +               return ret;
> >>           }
> >>           mutex_unlock(&fwnode_link_lock);
> >>
> >> @@ -955,9 +956,9 @@ int device_links_check_suppliers(struct device *de=
v)
> >>                   if (link->status !=3D DL_STATE_AVAILABLE &&
> >>                       !(link->flags & DL_FLAG_SYNC_STATE_ONLY)) {
> >>                           device_links_missing_supplier(dev);
> >> -                       dev_dbg(dev, "probe deferral - supplier %s not
> >> ready\n",
> >> +                       ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> >> +                               "probe deferral - supplier %s not read=
y\n",
> >>                                   dev_name(link->supplier));
> >> -                       ret =3D -EPROBE_DEFER;
> >>                           break;
> >>                   }
> >>                   WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> >>
> >>
> >> After such change:
> >>
> >> # cat /sys/kernet/debug/devices_deferred
> > Sweet! I wasn't aware of this file at all.
> >
> > However, on a side note, one of my TODO items is to not add devices to
> > the deferred probe list if they'll never probe yet (due to suppliers
> > not having probed). On a board I tested on, it cut down really_probe()
> > calls by 75%! So the probe attempt itself effectively happens in graph
> > order (which I think is pretty cool). So that's going to conflict with
> > this file. I'll have to see what to do about that.
> >
> > Thanks for this pointer. Let me sit on this for 2 weeks and see how I
> > can incorporate your suggestion while allowing for the above. And then
> > I'll send out a patch. Does that work?
>
> Fine for me.
>
> Even if you want to change the core not to probe devices that miss their
> suppliers (what's good imho), the 'devices_deferred' file might still
> contain all of them. For user it is just a list of devices that are not
> yet available in the system with the optional reasons for that.

Right, I understood that :) My point was that I'm assuming the debugfs
file loops through the deferred devices list. But with my
optimization, it won't find all the devices. So, we might need YET
another list. :-(

-Saravana
