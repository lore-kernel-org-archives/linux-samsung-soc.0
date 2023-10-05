Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA47E92719
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 16:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240488AbjJEQTJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242161AbjJEQQ5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:16:57 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207D9178EC
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 09:04:19 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-533c4d20b33so2689561a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 09:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521858; x=1697126658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfU8LZJfGanhRhGiSst4h+v18HcAUwEyfYmlvT10K+g=;
        b=wPT0SlBfaZNcH2ARAB2U7+U8svgxPouGXuQgGR3MSe6F0qW3Rxh50IGOl3l29yZBPq
         semFRmvx2TRnzJQdfk4M9AIP0CuNNgxc8ABqtcat1Ad7KSDKfmc46YkuLzyNBWKVM2c8
         6z+HKYdNrxubOsyHP8/wQH/quHoymnx41gUSC96AXfalxPsA29z6O0ZOfDo72tmtxw3A
         NItJzOHOT63Z9W4VYYrq6o49LES3oKkWEvglnA9WXM5nkMRlmcQLYlaeRFOabO2BLsb0
         mj+ryIRDC7fDtoxF3h1tCKyrP7a+0ouJIlsMJyBSCbZynYiJfmAgF1itGRw0jSbv7Wn9
         Z+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521858; x=1697126658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfU8LZJfGanhRhGiSst4h+v18HcAUwEyfYmlvT10K+g=;
        b=M35QpWW2s7Iv1DiCB8Mz2ZTG7o5CHlacWc8wvmx8gCkI1pq3spn0URN54Zt0RNw7js
         f/FutaVanPax5Gr9mc55vvgY0sZk5Hdr4DzFOjROisK+1XXQ43Quaf/YM9u7WIiLVFmI
         bA0ZQqoUQgaFC/yOrajQ4JVc8a3cU02zjhCIV30MNzRaFozV3+ghpk3D00B+P07lD0Qh
         RGaULqkBHywzeJod6mOCJmfKFzYHAm8vLcZCApWA0/KXUHSJscpCqEjctbwNVn8mXlDx
         f4ZDPuF2sxw5HfpTn2CWIuQSrSfO5uGP81DABPJNFVlaKHxw53vBCch1/OSIhg12bhrK
         uFQw==
X-Gm-Message-State: AOJu0YwvJDqPOrZybJrv15kjssm2OlP5h+75/mrT1Cxo+edX4tjP9LbC
        5iyMUs1PtutRszf8IYjS9d7yvQ==
X-Google-Smtp-Source: AGHT+IE2IUIhqPL8MeLG9G+5wr3NaYBG0Yp9GEL8ttgXRTZOmgq7PTyMy7Go7zBaISn2XPbgCZEm0w==
X-Received: by 2002:a05:6402:4314:b0:525:4d74:be8c with SMTP id m20-20020a056402431400b005254d74be8cmr1720833edc.14.1696521858249;
        Thu, 05 Oct 2023 09:04:18 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id n19-20020a056402515300b0053495596f42sm1278344edd.30.2023.10.05.09.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 09:04:17 -0700 (PDT)
Message-ID: <419f823c-2476-4aec-b25d-7e6a2994555a@linaro.org>
Date:   Thu, 5 Oct 2023 18:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] dt-bindings: interrupt-controller: Add gs101
 interrupt controller
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-2-peter.griffin@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231005155618.700312-2-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/10/2023 17:55, Peter Griffin wrote:
> Add the gs101 SoC interrupt header that provides human readable
> constants for all the IRQs in the SoC.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../dt-bindings/interrupt-controller/gs101.h  | 758 ++++++++++++++++++
>  1 file changed, 758 insertions(+)
>  create mode 100644 include/dt-bindings/interrupt-controller/gs101.h
> 
> diff --git a/include/dt-bindings/interrupt-controller/gs101.h b/include/dt-bindings/interrupt-controller/gs101.h
> new file mode 100644
> index 000000000000..51c8eb54eca2
> --- /dev/null
> +++ b/include/dt-bindings/interrupt-controller/gs101.h
> @@ -0,0 +1,758 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * This header provides constants for gs101 interrupt controller.
> + *
> + * Copyright 2019-2023 Google LLC
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_GS101_H
> +#define _DT_BINDINGS_INTERRUPT_CONTROLLER_GS101_H
> +
> +#define ITNO	IRQ_TYPE_NONE
> +#define ITER	IRQ_TYPE_EDGE_RISING
> +#define ITEF	IRQ_TYPE_EDGE_FALLING
> +#define ITEB	IRQ_TYPE_EDGE_BOTH
> +#define ITLH	IRQ_TYPE_LEVEL_HIGH
> +#define ITLL	IRQ_TYPE_LEVEL_LOW

No, these are not bindings.

> +
> +#define IRQ_ALIVE_EINT0		0
> +#define IRQ_ALIVE_EINT1		1

We do not keep interrupt numbers as bindings. Please drop entire file.

Best regards,
Krzysztof

