Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E65C43381
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 21:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F6D123127
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 21:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438127AbhALVh0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Jan 2021 16:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437058AbhALUxP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 15:53:15 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10283C061794
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jan 2021 12:52:35 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id b64so27869ybg.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jan 2021 12:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4wcVuL2JHWUe2OSC6B91qspF/lz9pUiODDoT4Xqa+iM=;
        b=fed1BSmonr4i0CFVaM7ytMeRTJ0XmCOw0lrfX1w8MkrlzJ/jTr3wSOTfPJMC/BhzrG
         IPiCSToYZw6m67DQ89vmJAIuFJjQcL29aabYVT70HujxJ/GXS3I3EnOqTq0FLIJO2XyT
         jReE/+Co++NPwvk1Tx3nwfaahWsxyX0yE4wcINKNUMMTjI0DYplMXX6mQfy8qxMB02N2
         UfYxXQrmYBacTtXmDzJ3u28CYuDeqJA9rh7cTNw9WFVOmQn5HcJcs90M37kgo3aYAVUP
         tivk+yniUKXPqRzVoIO5YMtvCSKfaRLqHxyTVfXSKDUpWBwwt90a0WP+803Ic+nXXfca
         eRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4wcVuL2JHWUe2OSC6B91qspF/lz9pUiODDoT4Xqa+iM=;
        b=qKYJ8aRskPPxzEjscA0XGNbDy4nejXdHwPtn2UL2Nzfydb49Q/WeD0yI52qyQmckck
         ouyqWcDbNgQPdMMDMVQCGD7ucq6ktonqHBm2+qPKoRJhdj1ypKUq+zo2P3saYRQBSYkU
         l4KtSa2cgTLF3ioRRQlRZ5dRvxGGRY0lDUeEaiigWEyAxez+BPKecvkz7sNyeAXhpYte
         IC1pzwQ1B9oKQ5nl1nz6SHbiA13ofLntO5c33dN+cUyOD6LvB56X88JVHZjf7h9XbK0F
         Dq8bPk75qWg1zoBUbmzWFXmKPqn1fwVdWTnoOX+p3bKG/XVd89t2HZplclfjILRWgPtq
         MacQ==
X-Gm-Message-State: AOAM531v8RKjtfTgUgQewQ4k1MC0bAetaRIhrQ1RD/Ip2SKQrgfUdltp
        H2bGxz9q8EjXvy4gOlv5pFTAG+ayWJf7OwZ3iQsTbQ==
X-Google-Smtp-Source: ABdhPJwuTLLKnhlFDp3a9Qtnh3e6/seLDPR0sx8XyZk1MST52u3yoogdil8l1bS4/yhombgc6jNKobTh/Qr2ubS0YGs=
X-Received: by 2002:a25:b703:: with SMTP id t3mr2191805ybj.96.1610484753991;
 Tue, 12 Jan 2021 12:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
 <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com> <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
 <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com> <fde65185-fd00-1f79-0f80-245eaa6c95cb@samsung.com>
In-Reply-To: <fde65185-fd00-1f79-0f80-245eaa6c95cb@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 12 Jan 2021 12:51:58 -0800
Message-ID: <CAGETcx_QY3h83q1fSr=h_vMQdH-TMhVYPozPuSr=q4uv2Lr48w@mail.gmail.com>
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

On Mon, Jan 11, 2021 at 11:11 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 11.01.2021 22:47, Saravana Kannan wrote:
> > On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 11.01.2021 12:12, Marek Szyprowski wrote:
> >>> On 18.12.2020 04:17, Saravana Kannan wrote:
> >>>> Cyclic dependencies in some firmware was one of the last remaining
> >>>> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> >>>> dependencies don't block probing, set fw_devlink=on by default.
> >>>>
> >>>> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> >>>> only for systems with device tree firmware):
> >>>> * Significantly cuts down deferred probes.
> >>>> * Device probe is effectively attempted in graph order.
> >>>> * Makes it much easier to load drivers as modules without having to
> >>>>     worry about functional dependencies between modules (depmod is still
> >>>>     needed for symbol dependencies).
> >>>>
> >>>> If this patch prevents some devices from probing, it's very likely due
> >>>> to the system having one or more device drivers that "probe"/set up a
> >>>> device (DT node with compatible property) without creating a struct
> >>>> device for it.  If we hit such cases, the device drivers need to be
> >>>> fixed so that they populate struct devices and probe them like normal
> >>>> device drivers so that the driver core is aware of the devices and their
> >>>> status. See [1] for an example of such a case.
> >>>>
> >>>> [1] -
> >>>> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> >>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >>> This patch landed recently in linux next-20210111 as commit
> >>> e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it
> >>> breaks Exynos IOMMU operation, what causes lots of devices being
> >>> deferred and not probed at all. I've briefly checked and noticed that
> >>> exynos_sysmmu_probe() is never called after this patch. This is really
> >>> strange for me, as the SYSMMU controllers on Exynos platform are
> >>> regular platform devices registered by the OF code. The driver code is
> >>> here: drivers/iommu/exynos-iommu.c, example dts:
> >>> arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").
> >> Okay, I found the source of this problem. It is caused by Exynos power
> >> domain driver, which is not platform driver yet. I will post a patch,
> >> which converts it to the platform driver.
> > Thanks Marek! Hopefully the debug logs I added were sufficient to
> > figure out the reason.
>
> Frankly, it took me a while to figure out that device core waits for the
> power domain devices. Maybe it would be possible to add some more debug
> messages or hints? Like the reason of the deferred probe in
> /sys/kernel/debug/devices_deferred ?

There's already a /sys/devices/.../<device>/waiting_for_supplier file
that tells you if the device is waiting for a supplier device to be
added. That file goes away once the device probes. If the file has 1,
then it's waiting for the supplier device to be added (like your
case). If it's 0, then the device is just waiting on one of the
existing suppliers to probe. You can find the existing suppliers
through /sys/devices/.../<device>/supplier:*/supplier. Also, flip
these dev_dbg() to dev_info() if you need more details about deferred
probing.

https://lore.kernel.org/lkml/20201218031703.3053753-2-saravanak@google.com/

Hopefully this meets what you are looking for?

-Saravana
