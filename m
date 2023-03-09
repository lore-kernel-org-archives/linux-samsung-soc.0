Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8196C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Mar 2023 09:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbjCIJP1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Mar 2023 04:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjCIJPV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 04:15:21 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24FD6B950
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Mar 2023 01:15:17 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id s11so4229423edy.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Mar 2023 01:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678353316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5q8KQOzCQWOJTqdyqK3y1vIAkUs5tdLsy8yXKdX+F0=;
        b=eC7LBTnawutc5RwLnhfn1YG+rYbLKnbNiN6fETTvSSKIKTS/O5JKglmmvBAgljM08A
         VyGMlZ1xNFFZJBjOxZ+G0gCB317iz7438XRa6b5UmZ9+8q8DMb9bJTGL/UJbi7/HUhM/
         eBRCR3YjBJwmtUoqt/xNlgTFd3JiaKB/3z1Icqlzio0HpxNlEabmVXYTiuPci+saCbpG
         ri5ZXW+fh8WSJpt/TZsUwg59NnAf64hG+CPZ381dy1cBVTeyaTLaSKont+6nkNspJhUm
         RLal67hr1/wYty1IZ5mNocVAR/zoyKocQqvBX8WXdfl8MSmEWxkO2s+VO/3dEXme81hC
         JCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5q8KQOzCQWOJTqdyqK3y1vIAkUs5tdLsy8yXKdX+F0=;
        b=nRzbhDYVnmR7nAp/w7oucY6j4cXJwfVEPfc2JvcKcrY1IA6nXCkkVFdFH5neM2sQNO
         snmSYPSIbL0o4UPaV2SIWpxc0kV41yjQwJx8kxiROyjYwAxrh5ASMUrgmeEVcjQhl4V8
         22PJmtMBDFjDgficz/cll6zpTUgwzEZ15HXS0F40wTF4lgW9cM6AwZ3MvVpPklcCVGeG
         4JILL2DlxAW9jnTIiCVQouaW1dHN7ImONxIaMP3ncWg1LgSjtDSkN4agsNZV4KyUPqZj
         XCkLr7Zhl7XCN1U95YjFze5wlhRJz2t2UsE3BpvMePqygHc9U2bzuoD7GyQyjiGYW2jA
         i9aQ==
X-Gm-Message-State: AO0yUKW+x3Wu2kBDpCP0KujTDNThoAdZ0HILTmqkxG6aKpAtCZRvfI2v
        ZI5QbOC8B0KIi0OVIpzkO4fqDA==
X-Google-Smtp-Source: AK7set8xwtxCT7nFJQpgOv90l8MyYk/13E3cgWr+yoj7OFzq7eSsX4qzkbHVVhC0/n/vMJqEyTKK7A==
X-Received: by 2002:a17:906:304a:b0:8b1:4051:6d2c with SMTP id d10-20020a170906304a00b008b140516d2cmr19889796ejd.19.1678353316452;
        Thu, 09 Mar 2023 01:15:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id uo17-20020a170907cc1100b008b17ed98d05sm8531971ejc.120.2023.03.09.01.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:15:15 -0800 (PST)
Message-ID: <1b8bce82-a59d-f655-1277-3cc1110b818f@linaro.org>
Date:   Thu, 9 Mar 2023 10:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/6] dt-bindings: power: pd-samsung: Add Exynos850 support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308230931.27261-1-semen.protsenko@linaro.org>
 <20230308230931.27261-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308230931.27261-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/03/2023 00:09, Sam Protsenko wrote:
> Document the compatible string for Exynos850 power domains controller.
> Also add power domain indices which can be used in "samsung,pd-index"

There is no such property...

> property to specify a particular power domain in the device tree.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../devicetree/bindings/power/pd-samsung.yaml   |  1 +
>  MAINTAINERS                                     |  1 +
>  .../dt-bindings/power/samsung,exynos850-power.h | 17 +++++++++++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/power/samsung,exynos850-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> index 9c2c51133457..a353a705292c 100644
> --- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
> +++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - samsung,exynos4210-pd
>        - samsung,exynos5433-pd
> +      - samsung,exynos850-pd
>  
>    reg:
>      maxItems: 1
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d5bc223f305..53e11e48639c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2720,6 +2720,7 @@ F:	drivers/pwm/pwm-samsung.c
>  F:	drivers/soc/samsung/
>  F:	drivers/tty/serial/samsung*
>  F:	include/clocksource/samsung_pwm.h
> +F:	include/dt-bindings/power/samsung,*
>  F:	include/linux/platform_data/*s3c*
>  F:	include/linux/serial_s3c.h
>  F:	include/linux/soc/samsung/
> diff --git a/include/dt-bindings/power/samsung,exynos850-power.h b/include/dt-bindings/power/samsung,exynos850-power.h
> new file mode 100644
> index 000000000000..a8d877b5515a
> --- /dev/null
> +++ b/include/dt-bindings/power/samsung,exynos850-power.h

Filename matching compatible, so samsung,exynos850-pd.h... but I
actually wonder why do we need it. How power domains are organized in
Exynos850?

Best regards,
Krzysztof

