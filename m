Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CA1C636CC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Feb 2023 10:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjBPKyj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjBPKyX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 05:54:23 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB7F2D150
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:54:21 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id f21so4117228ejq.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QI8K5VaPcZDVX01pTM1BIt9n+MIastinOXR0Yd0M3Ns=;
        b=WXzPGozQEHAoWnI1lpMvXFw+Ugjikfz4UPisdi8HsJENaIY/CtxKjJSSaFTlLOzYwa
         /bXY0OL8LwVTwXU5QGl0qKlcdpalrjCHdu8Cxj6SzGHdVjS2rmdPTq0dBjh67+rAVlIc
         rJCQn/LShtJACkLjc8bC1Bv2N+foa3X1ZMNPL/ktu56OP+TBfiiVZ+m1rG9vi+/eeqUK
         Gcai1yavx6l9abE5W7+NJz9ynC4jeSEfyaOTS0fSli6wzGl203iJHyO5V2rQRlEaPKoA
         mdtM5ebNLfVmxT1X15Gdk2WEMmxPlh0fXkrqU6oS3HXZFUGHeNf9rYzIIVhEW87/beAN
         6UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QI8K5VaPcZDVX01pTM1BIt9n+MIastinOXR0Yd0M3Ns=;
        b=klRKKufeujEpU6YOBl1Ss4Yoz3Qk4BRhPBDSH59qYfg1EyP0jc76Fz0MvHSicCLmhp
         GOgKOUAH+DXsZ3hCT3LDKB37CIdDnRSsp0zzFcdp+XYSVwHamZ4FC3rg8KdbSqQvDbm4
         KS8g0yq1txE1/+cCcieTt215nqK7ieZ/aGWfA91qUvNaNz85d0otO+4iYu6OjeAFhndS
         Oc+xZJ0Osh1MjshWId5bmnTUEyBlSEu607BnkwyRcUan+3jm4/f4/jCJnxboucIu62Lw
         68ue8inBGuF9gNIfOYwIw8qesG5CPpxyP+gevjOXFHL+omvJbH3jRMahhGVUOqeA0/1V
         q6EA==
X-Gm-Message-State: AO0yUKV4oPVsNYn3KfL9+8i/T2ZMOywgLmjhO6JnhzAguxT5ei73rTks
        gRLSEIhX9BnU5jO/LJ6Sg59SiQ==
X-Google-Smtp-Source: AK7set+o2bzX5AwaFF5qCgbb5gZPGOApJ9Hy9hx2HWKBa/1QeqK05TbZr53k40utmIxOIunE7z7y2w==
X-Received: by 2002:a17:906:8502:b0:88b:23bb:e61f with SMTP id i2-20020a170906850200b0088b23bbe61fmr5734558ejx.25.1676544859978;
        Thu, 16 Feb 2023 02:54:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kq16-20020a170906abd000b00889a77458dbsm657273ejb.21.2023.02.16.02.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:54:19 -0800 (PST)
Message-ID: <b40cafa1-396f-e6cd-3240-bc879d5f2c8b@linaro.org>
Date:   Thu, 16 Feb 2023 11:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/16] dt-bindings: PCI: Rename Exynos PCIe binding to
 Samsung PCIe
Content-Language: en-US
To:     Shradha Todi <shradha.t@samsung.com>, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co,
        pankaj.dubey@samsung.com
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121404epcas5p3bfa6af0151b7f319d418f7c0dbed7c5a@epcas5p3.samsung.com>
 <20230214121333.1837-2-shradha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214121333.1837-2-shradha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/02/2023 13:13, Shradha Todi wrote:
> The current DT bindings is being used for Exynos5433 SoC only.
> In order to extend this binding for all SoCs manufactured by
> Samsung using DWC PCIe controller, renaming this file to a more
> generic name.

Thank you for your patch. There is something to discuss/improve.

> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  .../pci/{samsung,exynos-pcie.yaml => samsung,pcie.yaml}     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/pci/{samsung,exynos-pcie.yaml => samsung,pcie.yaml} (93%)
> 
> diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,pcie.yaml
> similarity index 93%
> rename from Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> rename to Documentation/devicetree/bindings/pci/samsung,pcie.yaml
> index f20ed7e709f7..6cd36d9ccba0 100644
> --- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/samsung,pcie.yaml

We keep the name rather tied to compatible, not generic. There are no
other compatibles here, so I don't think we should rename it.

Best regards,
Krzysztof

