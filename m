Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EA6C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 14:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbiGFOY6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 10:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbiGFOY5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 10:24:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB5920F75
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 07:24:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i18so26186186lfu.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0+hemKCm9KoLcdJVlDwowemoYH5rpN+Hagnel9ijRQ=;
        b=omXZrna0gxIYOazn7dGSQ7WvQGEYaiftOCQUxfDqPa5w+1/OLqJq8uvIyGgBHkh8zG
         9StaSLqmtiC++EBHnpfHQg4he4T37Hj1jxHflwWnMXc3gqIUe9gPq3WCAcdsp+s+2A3k
         VrH2kCLpJsCMT7K6KTLi//AB2RG+tSx0/Kt51DWW1YXgTGeB+LdeM7Yubl1VaevlPI6W
         wF7AKTUrmEaEU8dwOESUd3SQGKWBP/ipS3jCHfC0y8aIWEEQuBS4EgPw9kiZxRFXCwcS
         YtyGi6h+7/VfY39HZmzZ6fMF3Mf3AV3oUgt4z9v5BCBRR3hYosw9wyz7yWCEfjyAfLEG
         JuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0+hemKCm9KoLcdJVlDwowemoYH5rpN+Hagnel9ijRQ=;
        b=c4Pmkw8B9FdDcSY/Jtzkx+6IqDqn9BhohuEQjFh75whYPmh+UM9h/0x8wSPeIeNOIL
         SvQVI2wC5gmJ2Mm3wNgQLJ+2MMCvmGpSADsISrmfoZ5bea+J1p9etM6LaRHDQzrRI0+G
         2dcPVagWjw4KDvzm3j4IMK6391EBbjmuQ34pLR7nmc1aWQyyTzZW9b2saj3z87Pn1x+/
         rtBHLly/ldjBxFor0BqILmFJsvsoMhcqq0FpcbB8q1lflAi47x6f0YiJn+pOTvIOSeSg
         yuDWAS+b1EzE4AsV48Qthn5wl3/A9HI2XP3z+j9OpwIhJZufjz27KQTKSkPsSOZ4WQ9f
         NPYA==
X-Gm-Message-State: AJIora8HnBVIEA2Z4jco5k646M74+G1dZFWrNhNSLWnwhfWtyS838s2q
        ht6lYCl48wt4AITDZNRIDzzaQ8cOwC0P79DzbWZBsg==
X-Google-Smtp-Source: AGRyM1uDeNrP78kQbE4GCyT6VGpyQpPl0h+HaGsEaZJSOZN/gnHdPOD4IO3m6JYnJJttm/k1+C81vMOjQAuEaHVjx1g=
X-Received: by 2002:a05:6512:2205:b0:484:e296:62fa with SMTP id
 h5-20020a056512220500b00484e29662famr4062867lfu.142.1657117494567; Wed, 06
 Jul 2022 07:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
 <CAPLW+4kYbG7PRYo_L6N5xMa+F9DFBpyph4B+zb2R4kBbE3EKHg@mail.gmail.com> <67943ec4dcfe85d6d616a5507437d99f6c5638a2.camel@gmail.com>
In-Reply-To: <67943ec4dcfe85d6d616a5507437d99f6c5638a2.camel@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 6 Jul 2022 17:24:43 +0300
Message-ID: <CAPLW+4k9DBbX6PupEk-J_KFbLmwgbfuDrfuVgyapT=d4WMG7yQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] iommu/exynos: Add basic support for SysMMU v7
To:     Janghyuck Kim <janghyuck.kim@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        David Virag <virag.david003@gmail.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 3 Jul 2022 at 13:47, David Virag <virag.david003@gmail.com> wrote:
>
> On Sun, 2022-07-03 at 00:48 +0300, Sam Protsenko wrote:
> [...]
> > Hi Marek,
> >
> > As I understand, you have some board with SysMMU v7, which is not VM
> > capable (judging from the patches you shared earlier). Could you
> > please somehow verify if this series works fine for you? For example,
> > this testing driver [1] can be helpful.
> >
> > Thanks!
> >
> > [1]
> > https://github.com/joe-skb7/linux/commit/bbadd46fa525fe1fef2ccbdfff81f7d29caf0506
>
> Hi Sam,
>
> Not Marek here, but I wanted to try this on my jackpotlte (Exynos
> 7885). The driver reports it's DPU sysmmu as version 7.2, and manually
> reading the capabilities registers it looks like it has the 2nd
> capability register but not the VM capability.
>
> After applying your patches, adding your test driver (with SYSMMU_BASE
> corrected to 7885 value), and adding the sysmmu to dt, I tried to cat
> the test file that it creates in debugfs and I got an SError kernel
> panic.
>
> I tried tracing where the SError happens and it looks like it's this
> line:
>         /* Preload for emulation */
>         iowrite32(rw | vpn, obj->reg_base + MMU_EMU_PRELOAD);
>
> Trying to read the EMU registers using devmem results in a "Bus error".
>
> Could these emulation registers be missing from my SysMMU? Do you have
> any info on what version should have it? Or maybe some capability bit?
> I'll try testing it with DECON/DPP later and see if it works that way.
>

Hi Janghyuck,

Do you have by chance any info on SysMMU v7.2, which is present e.g.
on Exynos7885? David is trying to use emulation registers there with
no luck, so it would be nice if you can provide some details on
questions above.

Thanks!

> Best regards,
> David
