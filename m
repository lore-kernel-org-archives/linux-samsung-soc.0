Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04E8C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jan 2022 08:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbiAUI03 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jan 2022 03:26:29 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60530
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1379572AbiAUI02 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 03:26:28 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 583533F1DD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642753587;
        bh=WFaN2NaRLA9rIp327g1xVjFRTrxCMZQ865lGwbwG9Rk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=pbMqgdf7cLUM9m1JBICEkPgEsBqXJXfWDa9NdzCqfhVipR0GhI6Bw6lpU2H/Zw+3B
         lMj+UXlE92CG1BDHrRSJVj8PKHJfJwt9ZqMBXT0wiuNIFLUeCoYn0VvAH/O7yuoOto
         G8PdIDbEQrrqopLCjdoWo1vTDmv6qURRh1z+6vSj2rB3fyBfdsLbrvlkBIl4vg4bgo
         M8QVboV6/jgg3fgHcLrtzoEavd+U4Z0C2i8FGs/RQ1Tmhmw0bXq8bMG0aTY0mFNJKk
         68ICVRXjqiOcFAwSM5jefoxmUXvUnEU2nWjN+WCYvcY3hE9aGWE1Ssu1GvoX/RUbV2
         W+3NH04lT/t7w==
Received: by mail-ed1-f72.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso7248595edb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 00:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WFaN2NaRLA9rIp327g1xVjFRTrxCMZQ865lGwbwG9Rk=;
        b=RdoUbwtZREcufTbP9CAO3wxofR5gGDsgGrF/tY5h/BPCC12tSjc/5s3SMqOUzUDlaK
         KlzH1+E5CT3WOW1MrtzJR6Wk5oYmkD9o2lubWw90tZyoomzpKCzz8r0s+KW8cWCL3oKL
         sKzSLfOeKGh9ZuJPFD9pC5RctLS+z0ulm4C7/X+DGyR1u8/cgF1RFkBSy9MXSHBzblBA
         OXl0g2KyLnNkbp41vbtuJtBxhBIp4mHEYl7oamBzwfzSlcDCiNzgCgzY/PmJUO6OhhIp
         rz91gnAhg9JLXBsCqylJofunjP1ym0cKJcB2c7CWiJ0MbrbwoSdxHcDohKYpnfpuHONf
         ELsw==
X-Gm-Message-State: AOAM531rC1cNElgpdhavvPkZ6JbN0K+/290FkcQC6Wa/Dr8OHR32uzOP
        NpmyZ6Ek1BTkZCcdLaZDMxRuPbDRKCV5MU4ohLgLoMoRsSYy2O2qBX1rUFLRhHWv/qnp8cPfdCW
        MhLveo1rw22RSbx60zgWMpzDOoQkwy0hhfcMhB1UEqkkC29SE
X-Received: by 2002:aa7:d949:: with SMTP id l9mr3339687eds.54.1642753576911;
        Fri, 21 Jan 2022 00:26:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM9vD86mwMtX+h2FjjQlccFgtkFev6o5qFbfunrbz4ISkFfscZEMnftrRS9hu6u4qvlPa49w==
X-Received: by 2002:aa7:d949:: with SMTP id l9mr3339671eds.54.1642753576763;
        Fri, 21 Jan 2022 00:26:16 -0800 (PST)
Received: from [192.168.0.50] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id cf13sm1821768ejb.141.2022.01.21.00.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 00:26:16 -0800 (PST)
Message-ID: <9a006308-cabb-7ee2-0556-860d425b251f@canonical.com>
Date:   Fri, 21 Jan 2022 09:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC 1/3] dt-bindings: iommu: Add bindings for samsung,sysmmu-v8
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
 <20220120201958.2649-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120201958.2649-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2022 21:19, Sam Protsenko wrote:
> Only example of usage and header for now.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/iommu/samsung,sysmmu-v8.txt      | 31 +++++++++++++

Please, don't copy paste bindings or entire drviers from vendor kernel.
It looks very bad. Instead, submit them in dtschema.

NAK.

>  include/dt-bindings/soc/samsung,sysmmu-v8.h   | 43 +++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu-v8.txt
>  create mode 100644 include/dt-bindings/soc/samsung,sysmmu-v8.h
> 
> diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu-v8.txt b/Documentation/devicetree/bindings/iommu/samsung,sysmmu-v8.txt
> new file mode 100644
> index 000000000000..d6004ea4a746
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iommu/samsung,sysmmu-v8.txt
> @@ -0,0 +1,31 @@
> +Example (Exynos850, IOMMU for DPU usage):
> +
> +	#include <dt-bindings/soc/samsung,sysmmu-v8.h>
> +
> +	/* IOMMU group info */
> +	iommu_group_dpu: iommu_group_dpu {
> +		compatible = "samsung,sysmmu-group";
> +	};
> +
> +	sysmmu_dpu: sysmmu@130c0000 {
> +		compatible = "samsung,sysmmu-v8";
> +		reg = <0x130c0000 0x9000>;
> +		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +		qos = <15>;
> +
> +		clocks = <&cmu_dpu CLK_GOUT_DPU_SMMU_CLK>;
> +		clock-names = "gate";
> +
> +		sysmmu,secure-irq;
> +		sysmmu,secure_base = <0x130d0000>;
> +		sysmmu,default_tlb = <TLB_CFG(BL1, PREFETCH_PREDICTION)>;
> +		sysmmu,tlb_property =
> +			<1 TLB_CFG(BL1, PREFETCH_PREDICTION) (DIR_READ | (1 << 16)) SYSMMU_ID_MASK(0x2, 0xF)>,
> +			<2 TLB_CFG(BL1, PREFETCH_PREDICTION) (DIR_READ | (1 << 16)) SYSMMU_ID_MASK(0x4, 0xF)>,
> +			<3 TLB_CFG(BL1, PREFETCH_PREDICTION) (DIR_READ | (1 << 16)) SYSMMU_ID_MASK(0x6, 0xF)>,
> +			<4 TLB_CFG(BL1, PREFETCH_PREDICTION) (DIR_READ | (1 << 16)) SYSMMU_ID_MASK(0x8, 0xF)>;
> +		port-name = "DPU";
> +		#iommu-cells = <0>;
> +		//power-domains = <&pd_dpu>;

We try not to store dead code in kernel.



Best regards,
Krzysztof
