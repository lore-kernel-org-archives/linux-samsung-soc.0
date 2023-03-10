Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C132C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 14:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbjCJOnt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 09:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbjCJOnb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 09:43:31 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2953E5BCBA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 06:43:23 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id u9so21423890edd.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 06:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678459402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYMEdjeleSWWpXin+nV8OWvud5LsPZ8G/6AgyZ+yAwQ=;
        b=dyVAJ7eu/3a4Va5UtYhwVcbyFbDZz+mUrkWue+/ZeULTxrL+HQcyDqTd5cix+XtfxF
         SzBBDrIXZoFe/dqF/muPu05TUeNINPBMDlb1C7U/oQO2fB4cvy39qIkiYaiwMKiVxtlX
         KFzS5UmjoQ0zAnBXuHyv083PXHcK3mno2vK9ZXLB1ekJuB90bnrXP1XYfbCRD3cB3aEG
         eYSZqopzPKNIol8R4lp2C6fVDVjQloFSowH+Y+vum1zXMTECctTspaEABEl/fxcXYf/u
         4OhR61yzeBveMA6G30JseUSfNyQubIrtmsUdHfG0XbC90zhJf9z+fWZ3tcSGrHzrfdYU
         wxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYMEdjeleSWWpXin+nV8OWvud5LsPZ8G/6AgyZ+yAwQ=;
        b=fAREvden1R1tLKQFVidyZMdyfxYFy6EA2NQasp+2c82AFxRk9YEmjLq5xJZbBNuFGs
         GZx+2JwIVbgOoNj3KTjq23mJXOwsCeuMny9rfpMXXzTAcxP0s3me/evlQHIaPSoiK29F
         PetCTboXoqZ5bogjKZasl+M7PZAFvYZoAeRqWKS/0dcTPdvewz7zaWn7BUyAO8l2kf3j
         I5C6aXba/zY50CxGU9xQARYzeVEjSYcxDPLIFCn+Mo+pTQgYa4HsHUL9bAOfB23aX/eZ
         qy0/G7zmp9q1roozrtJTzj1VYyOkFHQzMMWpSJphrdsQi5r98kYaXDBk8WvY27nuax7V
         aJ9Q==
X-Gm-Message-State: AO0yUKUrzWTmOejLk+eXKugHC3a5kW/jUhmfOD/jwt8tIuvtXhy4JsvH
        9AOsU/q7T8snRBtIOmohMRIsgA==
X-Google-Smtp-Source: AK7set845QJSc/SjAXM6QM3dwBDS1eo1cerd3I4zY5AKmphjSWiUT+Tw3zhF0l6YLSy+ywhLwM2bfQ==
X-Received: by 2002:aa7:d952:0:b0:4c6:f2cd:9d72 with SMTP id l18-20020aa7d952000000b004c6f2cd9d72mr24748846eds.5.1678459402436;
        Fri, 10 Mar 2023 06:43:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:45c4:46be:ec71:4a51? ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906319700b008c06de45e75sm1034415ejy.107.2023.03.10.06.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 06:43:22 -0800 (PST)
Message-ID: <8caa7218-41c2-04b4-e7b3-ee0fb43079a3@linaro.org>
Date:   Fri, 10 Mar 2023 15:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/7] dt-bindings: clock: exynos850: Add power-domains
 property
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
 <20230308233822.31180-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308233822.31180-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/03/2023 00:38, Sam Protsenko wrote:
> Document power-domains property in Exynos850 clock controller.

This we see from the diff. You need to say why, e.g. "several clock
controllers are part of their power domain and require domain to be on
for operation."

> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../devicetree/bindings/clock/samsung,exynos850-clock.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> index 8aa87b8c1b33..cc1e9173b272 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> @@ -54,6 +54,9 @@ properties:
>    "#clock-cells":
>      const: 1
>  
> +  power-domains:
> +    maxItems: 1
> +
>    reg:
>      maxItems: 1
>  

Best regards,
Krzysztof

