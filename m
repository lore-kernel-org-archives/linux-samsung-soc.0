Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EC8C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 13:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233950AbiKKNaG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Nov 2022 08:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbiKKNaF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 08:30:05 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FE36068F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 05:30:02 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id e129so4406690pgc.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 05:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0HVMhLQv1RJfokbEb7w/OlQquqonqkODdkh8fwYdsI=;
        b=SlLCCRurDhyCwz3e2I8fL7r/uAP6b1gny457Y5bcm2IsKnTrrPEpxgU3ZxL0Q/RVXG
         jUkJtbv75/FGGaVJctxp871UliWISdbMdvJexhqM2rum4iSotN3qZs8FShHmMRhMqtTw
         PDgE3iEXrtXiTqsjdqO1jzP/tgSoD5jpI4mWnErIbmZDMU7E6iFqU+qR0w+umw6yp5hX
         Iu44nhVGTNgOX4F1l3USy5GwIcIUk16kChQ2FwDR1efIy9P/8dtoPaTYd2g7C+iCe44I
         UR/gyr0IRWtiB/PbAT5TALWziKhRQDS1mf1uE/TlT1J10boVlUKOU2MYqq4hdP3QmRh0
         8pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0HVMhLQv1RJfokbEb7w/OlQquqonqkODdkh8fwYdsI=;
        b=pme1lM0YEUBWu2TJteM4NPUQd7aDjHD7J/fa3RitIl2nQOrq0Y4ppZfUJXAoWi2Pdn
         xv0gS7IVeGFIrPKAH5u7ykb+nwfYBdkJQE0Y7RUX6NCWYGYO8tc3CpOtEQ5gzPIWBg1d
         kZXijbtY6nvAi71DrGrTcha+Rx0xWcLt60KP/0g5YFXJHyMpQ0D/njjllNVzfFALUaps
         mu5gmDuc7BSku1hONHjavnQFdt1ltRLH2YKID7v10KyDokK60auBFcBAYzFxiPYfYUEt
         /9LD70+GV2D7iV8C00t0nDHSah0oKGFFQfm2MK1Z3ffqdXHK40/9JnoauCFxLCpHEVrM
         VL4w==
X-Gm-Message-State: ANoB5pmx7MosN2dSc8RWyA9pS5hUbgh/gt2VB8y6h/ZK/yw9mMOD7FsX
        SOgcTB8JHOPR6WTgigdNQYbS0Jdo3lyUfWKC+Ztbjw==
X-Google-Smtp-Source: AA0mqf6kliWqZX+ZuqUU2N7G7HxK+QseYkbm23tlyZ3IsNelzP82ZvMpOMo72W0xrY5NSLX5AtlqfHeDCyhR2t3+h4U=
X-Received: by 2002:a63:493:0:b0:438:a751:f8fa with SMTP id
 141-20020a630493000000b00438a751f8famr1585765pge.601.1668173401716; Fri, 11
 Nov 2022 05:30:01 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221103195201eucas1p2a6ec2df41ebac3d9ccbb0b252c2cad34@eucas1p2.samsung.com>
 <20221103195154.21495-1-semen.protsenko@linaro.org> <a7d9cd18-a328-209c-c89f-afdcb7db3eb0@samsung.com>
 <b7ad6444-e7d2-1150-6134-3dae8129dcdb@samsung.com>
In-Reply-To: <b7ad6444-e7d2-1150-6134-3dae8129dcdb@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 11 Nov 2022 14:29:49 +0100
Message-ID: <CAPLW+4=Y6qZG2XjJR_BkX-ar4GWdETKO1tteJjfbxVc664e4Kg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] iommu/exynos: Convert to a module
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 10 Nov 2022 at 15:36, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

[snip]

> I've finally made Exynos IOMMU working as a module on Exynos5433 based
> TM2e board. It looks that this will be a bit longer journey that I've
> initially thought. I've posted a simple update of the fix for the driver
> initialization sequence, but the real problem is in the platform driver
> framework and OF helpers.
>
> Basically to get it working as a module I had to apply the following
> changes:
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 3dda62503102..f6921f5fcab6 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -257,7 +257,7 @@ static int deferred_devs_show(struct seq_file *s,
> void *data)
>   DEFINE_SHOW_ATTRIBUTE(deferred_devs);
>
>   #ifdef CONFIG_MODULES
> -int driver_deferred_probe_timeout = 10;
> +int driver_deferred_probe_timeout = 30;
>   #else
>   int driver_deferred_probe_timeout;
>   #endif
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 967f79b59016..e5df6672fee6 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1384,7 +1384,7 @@ static struct device_node *parse_interrupts(struct
> device_node *np,
>   static const struct supplier_bindings of_supplier_bindings[] = {
>          { .parse_prop = parse_clocks, },
>          { .parse_prop = parse_interconnects, },
> -       { .parse_prop = parse_iommus, .optional = true, },
> +       { .parse_prop = parse_iommus, },
>          { .parse_prop = parse_iommu_maps, .optional = true, },
>          { .parse_prop = parse_mboxes, },
>          { .parse_prop = parse_io_channels, },
>
> Without that a really nasty things happened.
>
> Initialization of the built-in drivers and loading modules takes time,
> so the default 10s deferred probe timeout is not enough to ensure that
> the built-in driver won't be probed before the Exynos IOMMU driver is
> loaded.
>

Yeah, the whole time-based sync looks nasty... I remember coming
across the slides by Andrzej Hajda called "Deferred Problem" [1], but
I guess the proposed solution was never applied. Just hope that
increasing the timeout is upstreamable solution.

[1] https://events19.linuxfoundation.org/wp-content/uploads/2017/12/Deferred-Problem-Issues-With-Complex-Dependencies-Between-Devices-in-Linux-Kernel-Andrzej-Hajda-Samsung.pdf

> The second change fixes the problem that driver core probes Exynos IOMMU
> controllers in parallel to probing the master devices, what results in
> calling exynos_iommu_of_xlate() and exynos_iommu_probe_device() even on
> the partially initialized IOMMU controllers or initializing the dma_ops
> under the already probed and working master device. This was easy to
> observe especially on the master devices with multiple IOMMU
> controllers. I wasn't able to solve this concurrency/race issues inside
> the Exynos IOMMU driver.
>
> Frankly speaking I don't know what is the rationale for making the
> 'iommus' property optional, but this simply doesn't work well with IOMMU
> driver being a module. CCed Saravana and Rob for this.
>

The patch which makes 'iommus' optional doesn't provide much of
insight on reasons in commit message either.

> Without fixing the above issues, I would add a warning that compiling
> the driver as a module leads to serious issues.
>

Nice catch! It doesn't reproduce on my platform, alas. Can I expect
you to submit those patches? If so, I'll probably just wait for those
to be applied, and then re-send my modularization series on top of it.
Does that sounds reasonable?

[snip]

>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
