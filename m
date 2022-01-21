Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA58CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jan 2022 08:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbiAUIlD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jan 2022 03:41:03 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58380
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234243AbiAUIkk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 03:40:40 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A575D3F19C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642754437;
        bh=xUftNJDaok3Pg41c/BkGehEh6TjX1iR0pvhLTmUxMyU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=cUINlMlfY+Vm19935ZYsZ5n0gLwtFILv6539o4B4USki+iCirxH4B9TB6Tasj6ISP
         y/evuf+nJjlewvTm6EhyVg2AEt4xMIQ5CvuTPU0eUl4bsqje1+hKD+k6hkPcULE4Q+
         o/nrxtRU0XTVe0viFJ6YzEEYqeuMlI38KanUhKoCeuestClE/xv0PZXJO6HbnYe0ZT
         jmgxcd3uxkeqFSScBpeO0xWKJqwmC8EfdzRuGY3xQFHHsoqJW1YEwDqPKO0ag3KuWK
         DUJIuBombn8M1hOhkE99IlfAClgzTL+m4GEkomEvwRpQNoVfbrg6OMdVQHFAG/6tKW
         0osCAbJmTaE/g==
Received: by mail-ed1-f69.google.com with SMTP id w23-20020a50d797000000b00406d33c039dso925734edi.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 00:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xUftNJDaok3Pg41c/BkGehEh6TjX1iR0pvhLTmUxMyU=;
        b=yWA/mGm/en8Txxsvco64tWgXikJTMqhJf0ouI1LaS1cUH8AdZMVarCaQ9XR1sce9L6
         fSFfb7dt+kctzawMFiQBGHAlH+N56wXCOpbeAhdCkhETEKo5q9yDCqThKedSdtS1F15Z
         /d1b9tA7lEJxY6jjnG5+KhbrYLH2VIFoVhozrCc/L/Z2X4XFF6vrTO5bfs4h2QNcBf/j
         MNMxlja0zwJ0o5r8isaWNgKBTGfiFgsQAz+cW23UcWsOEkemTt8/DL5lpuy46HxPY6Jl
         2gw3KC12YnGGGRixJ1wc/twkca8xuNW/phGAxLyEJ7RSqlsjghBpcXe+UkW5RNkNctAl
         9s8A==
X-Gm-Message-State: AOAM531KyKy/6Rl+OfPQxhvCqR8eoMZMWPeX+eZtMX4FACzAOf94Kg7k
        vjl5E7QrALDPl1pCYYRNm39BeVHeOVsvKMXAutZ7pkOYgx4ECKetDc/0kpJhFksJQKIsOTqL01l
        ykXcw8WaYe+x+gBwc3prAJStKNeTdCqOo5wCJyWAo1s0MQkJW
X-Received: by 2002:a05:6402:905:: with SMTP id g5mr3321709edz.30.1642754426514;
        Fri, 21 Jan 2022 00:40:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwUR+qQwnaFqphzLPwNcsoopVP4IbcqehJyUyMLY3yPSHFzVCOe0UwMbO/5cpPjAgxFJA9sQ==
X-Received: by 2002:a05:6402:905:: with SMTP id g5mr3321679edz.30.1642754426297;
        Fri, 21 Jan 2022 00:40:26 -0800 (PST)
Received: from [192.168.0.50] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e19sm787750ejl.225.2022.01.21.00.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 00:40:25 -0800 (PST)
Message-ID: <a111932a-6685-2a9d-abce-87af26b121a4@canonical.com>
Date:   Fri, 21 Jan 2022 09:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC 2/3] iommu/samsung: Introduce Exynos sysmmu-v8 driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Jinkyu Yang <jinkyu1.yang@samsung.com>,
        Alex <acnwigwe@google.com>, Carlos Llamas <cmllamas@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Erick Reyes <erickreyes@google.com>,
        "J . Avila" <elavila@google.com>, Jonglin Lee <jonglin@google.com>,
        Mark Salyzyn <salyzyn@google.com>,
        Thierry Strudel <tstrudel@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220120201958.2649-1-semen.protsenko@linaro.org>
 <20220120201958.2649-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120201958.2649-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2022 21:19, Sam Protsenko wrote:
> Introduce new driver for modern Exynos ARMv8 SoCs, e.g. Exynos850. Also
> it's used for Google's GS101 SoC.
> 
> This is squashed commit, contains next patches of different authors. See
> `iommu-exynos850-dev' branch for details: [1].
> 
> Original authors (Samsung):
> 
>  - Cho KyongHo <pullip.cho@samsung.com>
>  - Hyesoo Yu <hyesoo.yu@samsung.com>
>  - Janghyuck Kim <janghyuck.kim@samsung.com>
>  - Jinkyu Yang <jinkyu1.yang@samsung.com>
> 
> Some improvements were made by Google engineers:
> 
>  - Alex <acnwigwe@google.com>
>  - Carlos Llamas <cmllamas@google.com>
>  - Daniel Mentz <danielmentz@google.com>
>  - Erick Reyes <erickreyes@google.com>
>  - J. Avila <elavila@google.com>
>  - Jonglin Lee <jonglin@google.com>
>  - Mark Salyzyn <salyzyn@google.com>
>  - Thierry Strudel <tstrudel@google.com>
>  - Will McVicker <willmcvicker@google.com>
> 
> [1] https://github.com/joe-skb7/linux/tree/iommu-exynos850-dev
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/iommu/Kconfig               |   13 +
>  drivers/iommu/Makefile              |    3 +
>  drivers/iommu/samsung-iommu-fault.c |  617 +++++++++++
>  drivers/iommu/samsung-iommu-group.c |   50 +
>  drivers/iommu/samsung-iommu.c       | 1521 +++++++++++++++++++++++++++
>  drivers/iommu/samsung-iommu.h       |  216 ++++
>  6 files changed, 2420 insertions(+)
>  create mode 100644 drivers/iommu/samsung-iommu-fault.c
>  create mode 100644 drivers/iommu/samsung-iommu-group.c
>  create mode 100644 drivers/iommu/samsung-iommu.c
>  create mode 100644 drivers/iommu/samsung-iommu.h
> 

Existing driver supports several different Exynos SysMMU IP block
versions. Several. Please explain why it cannot support one more version?

Similarity of vendor driver with mainline is not an argument.


> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 3eb68fa1b8cc..78e7039f18aa 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -452,6 +452,19 @@ config QCOM_IOMMU
>  	help
>  	  Support for IOMMU on certain Qualcomm SoCs.
>  
> +config SAMSUNG_IOMMU
> +	tristate "Samsung IOMMU Support"
> +	select ARM_DMA_USE_IOMMU
> +	select IOMMU_DMA
> +	select SAMSUNG_IOMMU_GROUP
> +	help
> +	  Support for IOMMU on Samsung Exynos SoCs.
> +
> +config SAMSUNG_IOMMU_GROUP
> +	tristate "Samsung IOMMU Group Support"
> +	help
> +	  Support for IOMMU group on Samsung Exynos SoCs.
> +
>  config HYPERV_IOMMU
>  	bool "Hyper-V x2APIC IRQ Handling"
>  	depends on HYPERV && X86
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index bc7f730edbb0..a8bdf449f1d4 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -27,6 +27,9 @@ obj-$(CONFIG_FSL_PAMU) += fsl_pamu.o fsl_pamu_domain.o
>  obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
>  obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
>  obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
> +obj-$(CONFIG_SAMSUNG_IOMMU) += samsung_iommu.o
> +samsung_iommu-objs += samsung-iommu.o samsung-iommu-fault.o
> +obj-$(CONFIG_SAMSUNG_IOMMU_GROUP) += samsung-iommu-group.o
>  obj-$(CONFIG_IOMMU_SVA_LIB) += iommu-sva-lib.o io-pgfault.o
>  obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
>  obj-$(CONFIG_APPLE_DART) += apple-dart.o
> diff --git a/drivers/iommu/samsung-iommu-fault.c b/drivers/iommu/samsung-iommu-fault.c
> new file mode 100644
> index 000000000000..c6b4259976c4
> --- /dev/null
> +++ b/drivers/iommu/samsung-iommu-fault.c
> @@ -0,0 +1,617 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020 Samsung Electronics Co., Ltd.
> + */
> +
> +#define pr_fmt(fmt) "sysmmu: " fmt
> +
> +#include <linux/smc.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "samsung-iommu.h"
> +
> +#define MMU_TLB_INFO(n)			(0x2000 + ((n) * 0x20))
> +#define MMU_CAPA1_NUM_TLB_SET(reg)	(((reg) >> 16) & 0xFF)
> +#define MMU_CAPA1_NUM_TLB_WAY(reg)	((reg) & 0xFF)
> +#define MMU_CAPA1_SET_TLB_READ_ENTRY(tid, set, way, line)		\
> +					((set) | ((way) << 8) |		\
> +					 ((line) << 16) | ((tid) << 20))
> +
> +#define MMU_TLB_ENTRY_VALID(reg)	((reg) >> 28)
> +#define MMU_SBB_ENTRY_VALID(reg)	((reg) >> 28)
> +#define MMU_VADDR_FROM_TLB(reg, idx)	((((reg) & 0xFFFFC) | ((idx) & 0x3)) << 12)
> +#define MMU_VID_FROM_TLB(reg)		(((reg) >> 20) & 0x7U)
> +#define MMU_PADDR_FROM_TLB(reg)		((phys_addr_t)((reg) & 0xFFFFFF) << 12)
> +#define MMU_VADDR_FROM_SBB(reg)		(((reg) & 0xFFFFF) << 12)
> +#define MMU_VID_FROM_SBB(reg)		(((reg) >> 20) & 0x7U)
> +#define MMU_PADDR_FROM_SBB(reg)		((phys_addr_t)((reg) & 0x3FFFFFF) << 10)
> +
> +#define REG_MMU_INT_STATUS		0x060
> +#define REG_MMU_INT_CLEAR		0x064
> +#define REG_MMU_FAULT_RW_MASK		GENMASK(20, 20)
> +#define IS_READ_FAULT(x)		(((x) & REG_MMU_FAULT_RW_MASK) == 0)
> +
> +#define SYSMMU_FAULT_PTW_ACCESS   0
> +#define SYSMMU_FAULT_PAGE_FAULT   1
> +#define SYSMMU_FAULT_ACCESS       2
> +#define SYSMMU_FAULT_RESERVED     3
> +#define SYSMMU_FAULT_UNKNOWN      4
> +
> +#define SYSMMU_SEC_FAULT_MASK		(BIT(SYSMMU_FAULT_PTW_ACCESS) | \
> +					 BIT(SYSMMU_FAULT_PAGE_FAULT) | \
> +					 BIT(SYSMMU_FAULT_ACCESS))
> +
> +#define SYSMMU_FAULTS_NUM         (SYSMMU_FAULT_UNKNOWN + 1)
> +
> +#if IS_ENABLED(CONFIG_EXYNOS_CONTENT_PATH_PROTECTION)

You just copy-pasted vendor stuff, without actually going through it.

It is very disappointing because instead of putting your own effort, you
expect community to do your job.

What the hell is CONFIG_EXYNOS_CONTENT_PATH_PROTECTION?

I'll stop reviewing. Please work on extending existing driver. If you
submitted something nice and clean, ready for upstream, instead of
vendor junk, you could get away with separate driver. But you did not.
It looks really bad.

Best regards,
Krzysztof
