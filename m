Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E77C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 21 May 2022 14:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbiEUOoJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 21 May 2022 10:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355094AbiEUOoI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 May 2022 10:44:08 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC066A009
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2022 07:44:06 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id g16so12466872lja.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2022 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/cbTtBq59WXX2nYbXhKg+bCe+ywZbzVEJW+eIz8/F80=;
        b=QAZgPLmzBIyLU+16M8XZQRVYtmRhWu+CjNFiDeV3+mFGN5fPMSwVjoeWS+0qsl4PrE
         VcoTqUd9WD99J7jM7nCYgRLwj7Wj4HggL91Gq4JNoBlLbls/qzU73Ipf6R2nkRDX9IU3
         /3e8wI3YSCnDLHdr9ySCPAjGzth+ET+iNOhDFGTKZLXlsD/p+dfjQu4LGVN6/Y2qSnRR
         +9uSUIB5ELflGPbOqQpuAIm2fBLIMrDQkOYkK54QPSVw1mB5phMawMB2RaLaG3vVGpEr
         iHJ4sYZLt9yql1tMqszxGRRVCECe1/p7ebBDnKiLAH4pW+ne7J+He0S9t1mdl5FuUWs3
         uVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/cbTtBq59WXX2nYbXhKg+bCe+ywZbzVEJW+eIz8/F80=;
        b=wK7hokWfHKLlhJ/k79IiFiWIuvn6MDQbwKAVRSjS501gaMyFDUplTxkeHbibtJfKHS
         /QyheQN0LCqRddgJeoASo1u+ZxCmsdIbG+ibyy9V6d5bcGNkfiUiEzxjsmFnNJ1jujbx
         3mK5qt9w5PpmXV3CNyQQwq5XkpzytMARWkJidvj0AkYF1l2QUR/lPRmbNt+pEHhWCm1w
         wNtEguOEHtw3PSeCXmYvkbZZS5WDYDuH4l0fM84/1ox3Vi6txOKsKjEkmozbprspFE3n
         NWkAorxLXdz7Pryvv+sVP8mZXRrgdteBEPow7yvlM6WpFBdmCv34sFiWqqSa6ilbs7Cl
         RpPA==
X-Gm-Message-State: AOAM530lWBPWEVhsqxqopYDLcqFw76rvX/3a8hysCZDfdNHdnVupnSoq
        FdlOcJcTQBkIbbgs8PcpQYzwOw==
X-Google-Smtp-Source: ABdhPJzEd+pCyalQMTT1oPB9QGqDCUMDyYeZg56h0jH74pn/hH6+cCG2iNDJsYa8hkjoxqddALRSVg==
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id y2-20020a05651c154200b002495d863164mr8498632ljp.500.1653144245237;
        Sat, 21 May 2022 07:44:05 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h15-20020a2ea48f000000b00253bd1d1a84sm733337lji.16.2022.05.21.07.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 07:44:04 -0700 (PDT)
Message-ID: <0a924446-7ced-79cf-2183-10df81c0e450@linaro.org>
Date:   Sat, 21 May 2022 16:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: add samsung,boot-mode
 definitions
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20220520115250.57785-1-chanho61.park@samsung.com>
 <CGME20220520115216epcas2p20de68c07071435ae33b50c7b664a20eb@epcas2p2.samsung.com>
 <20220520115250.57785-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520115250.57785-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/05/2022 13:52, Chanho Park wrote:
> Adds samsung,boot-mode.h header file which contains boot mode
> definitions for bootloader. As for now, there are only boot mode
> definitions for Exynos Auto v9 SoC.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Thank you for your patch. There is something to discuss/improve.

> ---
>  include/dt-bindings/soc/samsung,boot-mode.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h
> 
> diff --git a/include/dt-bindings/soc/samsung,boot-mode.h b/include/dt-bindings/soc/samsung,boot-mode.h
> new file mode 100644
> index 000000000000..f1d03d96f45c
> --- /dev/null
> +++ b/include/dt-bindings/soc/samsung,boot-mode.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license:
GPL-2.0-only OR BSD-2-Clause

> +
> +#ifndef __SAMSUNG_BOOT_MODE_H

__DT_BINDINGS_SAMSUNG_BOOT_MODE_H

> +#define __SAMSUNG_BOOT_MODE_H
> +
> +/* Boot mode definitions for Exynos Auto v9 SoC */
> +
> +#define EXYNOSAUTOV9_BOOT_FASTBOOT	(0xfa)
> +#define EXYNOSAUTOV9_BOOT_BOOTLOADER	(0xfc)
> +#define EXYNOSAUTOV9_BOOT_RECOVERY	(0xff)

No need for ().

> +
> +#endif


Best regards,
Krzysztof
