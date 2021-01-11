Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A56FC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 21:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EBDB22CAF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Jan 2021 21:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730835AbhAKVse (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Jan 2021 16:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730766AbhAKVsc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 16:48:32 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8B3C061794
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 13:47:52 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id b64so217450ybg.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jan 2021 13:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SS1JDoBxWO0P2GKLy8M+dKtC5ZVoKBwYfwO8muPlSTA=;
        b=OdbgjKmRzS1uGe2MBtr0tQZ6emWPzWL5mdaIMWszj+osI/cQBCUskuT5Btkcc14HKZ
         KyzuqXiokX08xxMvAMWR3yI+gMTFuS1AohJh8TOYckl5rj6ZndagiJ+bA1RWxIV5qrS7
         T1nyMjXfwidx9iv7l2fuW9Xc6kNXvn++UtHCv40ntcgo/atRqRVHgFEhuOTyqh9+yf7z
         1/f6mEgCD1tzM8+/ntsD1pwC+s3850WL2fpBzrxW4tRzmhLcNEkslPjNCyT9X0rpOUqg
         K8tABOjZSdTXpOL1MfZ2FBe2xFzT3qyK0UlmkfEvSjNMWRZuwPO9AHJISYp3ac0pTX6E
         F3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SS1JDoBxWO0P2GKLy8M+dKtC5ZVoKBwYfwO8muPlSTA=;
        b=jtQdD6VI29LRI7JfF3hoU3/jAI5LwSTxe1zkTXyB3s+GH3jLofJiQqGvRPDmfqkNRL
         08YJ06ZgM8gtA+f6X3e5b0Zs/5K9ZUHSy0wAS0BzYXmhGmKBFfa6F7R0BXZ7oNxEeBN0
         swb/Mz1uG8nRN7DPFNolCi/IgcvcAzCvqC8fZ8MtGfaQlEX3iu6O7rzvV+xaxn47Newp
         PRUYlx7ReO6Bhbq7Pj5C2i9wgigute6fSdXfnjzu57XjfMHM4lQQ0Hhn/vHeRkH5BGCF
         afLL2TDSEvvfHpa1M4gZOpCTh42goqENvC9VLtj0NTsnhW83INE5exgQSCbtfZ6tCAhb
         QIoA==
X-Gm-Message-State: AOAM531ywHIpSXKz4iwj6Q4EQYGn8PamsDRdYCd7dHGZgIVRGe8f5t6g
        EpU5HBo2zwD0zozHAgfQLeeFD08grivhRPM9QCJiLw==
X-Google-Smtp-Source: ABdhPJzrLlsKyI63T7yPVllxuMEj0Y2W1BWp7KAjNKIVG1UTQsO3+ZNNCMW0p9X9Pn4mZcb92u2M6tfNwXTN9pPd4rY=
X-Received: by 2002:a25:7491:: with SMTP id p139mr2461185ybc.346.1610401671552;
 Mon, 11 Jan 2021 13:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20201218031703.3053753-1-saravanak@google.com>
 <20201218031703.3053753-6-saravanak@google.com> <CGME20210111141814eucas1p1f388df07b789693a999042b27f0d8c2a@eucas1p1.samsung.com>
 <5484316b-0f27-6c36-9259-5c765bb6b96c@samsung.com> <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
In-Reply-To: <2556a69b-5da5-bf80-e051-df2d02fbc40f@samsung.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 11 Jan 2021 13:47:16 -0800
Message-ID: <CAGETcx8-1YzF2Br0sszJROLAWo3DSm27K071Md9wY5SOwUeLdw@mail.gmail.com>
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

On Mon, Jan 11, 2021 at 6:18 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 11.01.2021 12:12, Marek Szyprowski wrote:
> > On 18.12.2020 04:17, Saravana Kannan wrote:
> >> Cyclic dependencies in some firmware was one of the last remaining
> >> reasons fw_devlink=on couldn't be set by default. Now that cyclic
> >> dependencies don't block probing, set fw_devlink=on by default.
> >>
> >> Setting fw_devlink=on by default brings a bunch of benefits (currently,
> >> only for systems with device tree firmware):
> >> * Significantly cuts down deferred probes.
> >> * Device probe is effectively attempted in graph order.
> >> * Makes it much easier to load drivers as modules without having to
> >>    worry about functional dependencies between modules (depmod is still
> >>    needed for symbol dependencies).
> >>
> >> If this patch prevents some devices from probing, it's very likely due
> >> to the system having one or more device drivers that "probe"/set up a
> >> device (DT node with compatible property) without creating a struct
> >> device for it.  If we hit such cases, the device drivers need to be
> >> fixed so that they populate struct devices and probe them like normal
> >> device drivers so that the driver core is aware of the devices and their
> >> status. See [1] for an example of such a case.
> >>
> >> [1] -
> >> https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com/
> >> Signed-off-by: Saravana Kannan <saravanak@google.com>
> >
> > This patch landed recently in linux next-20210111 as commit
> > e590474768f1 ("driver core: Set fw_devlink=on by default"). Sadly it
> > breaks Exynos IOMMU operation, what causes lots of devices being
> > deferred and not probed at all. I've briefly checked and noticed that
> > exynos_sysmmu_probe() is never called after this patch. This is really
> > strange for me, as the SYSMMU controllers on Exynos platform are
> > regular platform devices registered by the OF code. The driver code is
> > here: drivers/iommu/exynos-iommu.c, example dts:
> > arch/arm/boot/dts/exynos3250.dtsi (compatible = "samsung,exynos-sysmmu").
>
> Okay, I found the source of this problem. It is caused by Exynos power
> domain driver, which is not platform driver yet. I will post a patch,
> which converts it to the platform driver.

Thanks Marek! Hopefully the debug logs I added were sufficient to
figure out the reason.

-Saravana
