Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F59FC43464
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 10:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6346D21D91
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 10:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600682877;
	bh=M6LHkAJAPE05nY/QGWQj/nCsSEFHZUH0Pr9phQ8CsDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=aPYa7lTmSs9Tm/h958KXkPSMUT42mzr3X1MPmTACJHicMwB2cwR5yey1UiQ0RxpGO
	 UHPvxLIHknLtZMsZhd/LrGJpF9/SDavgEb+JmoOd8UwcEAvGPg1y8lChh/ZRJ5XbnL
	 BuqzNNsFZwoum5qq//ZLHDsgR3WBCtRFO9TbQ5qE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgIUKHx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 06:07:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:43118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgIUKHx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 06:07:53 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ADDD21D95;
        Mon, 21 Sep 2020 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600682872;
        bh=M6LHkAJAPE05nY/QGWQj/nCsSEFHZUH0Pr9phQ8CsDM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a0hkdn54ND7Jt2MLUhEwTybGUgV+2MegWaY/Z3amxRopX8O0vmy488k+8TS0u6oJN
         APX4BePvpq6tJxutWDzhYq/7GKuNc5uYaBNk4AE6nihJDyvUM6ZiUSy4kvxNBUMU92
         lnMvIssouqPBll8gd6jc1a8BoeWkqzgpZgnL6vP8=
Received: by mail-ed1-f54.google.com with SMTP id e22so12184504edq.6;
        Mon, 21 Sep 2020 03:07:52 -0700 (PDT)
X-Gm-Message-State: AOAM530uldYHKiTo2XvaTjoxwO4SaqPEirVKMjOR1cSuBWNd8fxwKcDk
        vLChh1zK1X9rje+nhCBD59SVJTOwnLTNRGJAXDY=
X-Google-Smtp-Source: ABdhPJxW+jgg5O7Hl7ECZYJTkULCTd9X5eBczp3dE+Ml5zWHvVZmxF4xBxBRwBttvPP8zbe1e2luzrCZ/E8eCYgfPDU=
X-Received: by 2002:a50:e78f:: with SMTP id b15mr52070632edn.104.1600682870785;
 Mon, 21 Sep 2020 03:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200906142146.21266-1-krzk@kernel.org> <20200906142146.21266-2-krzk@kernel.org>
 <CGME20200911150351eucas1p1c678e3ae20e49209dbf19c000ea033f4@eucas1p1.samsung.com>
 <20200911145403.GC15290@kozik-lap> <d53d0b67-2368-1434-ab00-fb37b1e824a6@samsung.com>
In-Reply-To: <d53d0b67-2368-1434-ab00-fb37b1e824a6@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 21 Sep 2020 12:07:38 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfN25243hXfj6ujueV+iLwN5iDRfG41eGfS1YeiPuUJ-w@mail.gmail.com>
Message-ID: <CAJKOXPfN25243hXfj6ujueV+iLwN5iDRfG41eGfS1YeiPuUJ-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: exynos: Add assigned clock parent to CMU
 in Exynos4412 Odroid
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 21 Sep 2020 at 11:42, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Krzysztof,
>
> On 11.09.2020 16:54, Krzysztof Kozlowski wrote:
> > On Sun, Sep 06, 2020 at 04:21:45PM +0200, Krzysztof Kozlowski wrote:
> >> Commit 68605101460e ("ARM: dts: exynos: Add support for audio over HDMI
> >> for Odroid X/X2/U3") added assigned clocks under Clock Management Unit.
> >>
> >> However the dtschema expects "clocks" property if "assigned-clocks" are
> >> used.  Add reference to input clock, the parent used in
> >> "assigned-clock-parents" to silence the dtschema warnings:
> >>
> >>    arch/arm/boot/dts/exynos4412-odroidu3.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
> >>
> > Applied.
>
> This patch breaks operation of clocks on Odroid X2/U3:
>
> # dmesg | grep clk
> [    0.000000] exynos_clkout_init: failed to register clkout clock
> [    0.000000] Exynos4x12 clocks: sclk_apll = 1000000000, sclk_mpll =
> 800000000
>                  sclk_epll = 45158401, sclk_vpll = 350000000, arm_clk =
> 1000000000
> [    2.569484] usb3503 0-0008: unable to request refclk (-517)
> [    2.848718] s3c-sdhci 12530000.sdhci: clock source 2: mmc_busclk.2
> (50000000 Hz)
> [    3.373850] usb3503 0-0008: unable to request refclk (-517)
> [    3.542777] usb3503 0-0008: unable to request refclk (-517)
> [    3.544005] usb3503 0-0008: unable to request refclk (-517)
> [    3.559223] usb3503 0-0008: unable to request refclk (-517)
>
> Please revert or drop if possible.

Crap, thanks for noticing. I tested only Odroid X where the usb3503
came up. I'll try to fix it or revert.

Best regards,
Krzysztof
