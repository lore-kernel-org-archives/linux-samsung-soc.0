Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267C3C43334
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  2 Jul 2022 21:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiGBVs4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 2 Jul 2022 17:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiGBVsz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 2 Jul 2022 17:48:55 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44888A1A6
        for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Jul 2022 14:48:54 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o23so6581141ljg.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 02 Jul 2022 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xwhpF2WN1J6S5lDXRAv+Kjl/+1IwILg/3g/jg+Rhz9c=;
        b=oCpQEhUQFqNhRyRxjTjg2S5HdHN/+rGO/9TGX6J3EXmBo7rnTdLvPgvWrtCYw2J9UL
         wPu+VXgoiZTIjlLx8ApyAAFpKJYDCFzUjD+6WIbD9w2kENrTihBt45XO8XYjeSnU93NS
         krbAIogLcjd8c8Hl+HuDng2dDRSr96aWR3ZV8g8//QDnIuXXK552X9Zyvv13uHm9LwGT
         Qg2/7MLD3xII8a4IFaufxcAVcoUOcYwp49Xo4IqzHP2n5rUaXUo3LyC/py01oAEAukQp
         tovSlF37pVHf7oPsn77gzJU3rv/MI1477WsxbQ52/qO1KKeng3K1lsh93mSnr2STndqD
         2RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xwhpF2WN1J6S5lDXRAv+Kjl/+1IwILg/3g/jg+Rhz9c=;
        b=FQaJyG00KvA+dYIdbynY2BcAGA29ugl5JfO0I8zW9kvMaGhV+VCTtqqBDOhgQpqH2i
         Mrl1lj3sbjrI1V4QGQ0N26GCyEIpEOyfZ1I/VLm3Zevwx0vWxI1y++d/ItBouwisrE2T
         Z/UYtUulGB1FSnzN4T3sfDu4+l0m3FEzzbwJtbjJpzHjEfW8p0awy0PhmXXRtgA61hhi
         yLFFrkiOiR+IOJiRRA59G6UnoEpGhJEOAHu3Ur4lyaJTLkmNJWyehl8aD7YwOobK5A3T
         V+WxpVI4SIM4ei5uynrljngtsH5m0th11wvOvAqeajL7liN0930fLoZZGuVDuumMUDoy
         t+kg==
X-Gm-Message-State: AJIora//KbKjbArxKWsaCT3FYdD3SmVNXpsHTOI7wQ4nUNOlFgaftUo5
        xQwjQaO/zi2hOeaal/qIfRYPyE+4Mok46BixEItQ/A==
X-Google-Smtp-Source: AGRyM1vFoFHz8ksTCP0i6tWzC5kgSiz3ScxWxfJFYqE/7vLPww6uI//LFWqdzMMDeGA2eY9gG4si//g3WtmRof3kUm0=
X-Received: by 2002:a2e:8ec9:0:b0:25a:754d:db39 with SMTP id
 e9-20020a2e8ec9000000b0025a754ddb39mr12010480ljl.4.1656798532393; Sat, 02 Jul
 2022 14:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220702213724.3949-1-semen.protsenko@linaro.org>
In-Reply-To: <20220702213724.3949-1-semen.protsenko@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 3 Jul 2022 00:48:41 +0300
Message-ID: <CAPLW+4kYbG7PRYo_L6N5xMa+F9DFBpyph4B+zb2R4kBbE3EKHg@mail.gmail.com>
Subject: Re: [PATCH 0/4] iommu/exynos: Add basic support for SysMMU v7
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
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

On Sun, 3 Jul 2022 at 00:37, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>
> Existing exynos-iommu driver only supports SysMMU versions up to v5. But
> it's pretty much ready for basic usage with SysMMU v7, only small
> changes have to be done. As SysMMU version is tested dynamically (by
> reading the corresponding register), there is no need to introduce new
> compatible string.
>
> One major change is that SysMMU v7 can have different register layouts:
>   - with Virtual Machine support
>   - without Virtual Machine support
>
> That can be checked by reading the capability registers. In case the
> SysMMU IP-core is VM-capable, the VM registers have to be used, and some
> additional initialization is needed. That is the case on E850-96 board,
> which non-secure SysMMU (v7.4) implements VM-capable register set.
>
> The patch series was tested on E850-96 board. Because at the moment
> there are no SysMMU users for that board, the testing was done using so
> called "Emulated Translation" registers available on SysMMU v7. That
> allows one to initiate the translation from CPU, by writing to those
> registers, and then reading the corresponding TLB registers to find out
> the translation result. The testing driver can be found in [1] tree.
>
> [1] https://github.com/joe-skb7/linux/tree/e850-96-mainline-iommu
>
> Sam Protsenko (4):
>   iommu/exynos: Set correct dma mask for SysMMU v5+
>   iommu/exynos: Check if SysMMU v7 has VM registers
>   iommu/exynos: Use lookup based approach to access v7 registers
>   iommu/exynos: Add minimal support for SysMMU v7 with VM registers
>
>  drivers/iommu/exynos-iommu.c | 112 ++++++++++++++++++++++++++++++++---
>  1 file changed, 104 insertions(+), 8 deletions(-)
>
> --
> 2.30.2
>

Hi Marek,

As I understand, you have some board with SysMMU v7, which is not VM
capable (judging from the patches you shared earlier). Could you
please somehow verify if this series works fine for you? For example,
this testing driver [1] can be helpful.

Thanks!

[1] https://github.com/joe-skb7/linux/commit/bbadd46fa525fe1fef2ccbdfff81f7d29caf0506
