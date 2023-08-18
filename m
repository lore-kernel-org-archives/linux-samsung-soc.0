Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79829EE498F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Aug 2023 19:58:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbjHRT5c (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Aug 2023 15:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379428AbjHRT5G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 15:57:06 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A95E26AA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 12:57:04 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-26b7c16556eso960221a91.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692388624; x=1692993424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FVy8/I6+hZEhbfOu9dBJY0K2hcEvw4odHhWMeKKSlSQ=;
        b=Wa22YcrQ8hR7kutK9Cs/OH6zIDYKtTp61fXYhWf3xpUE1rqFQJonTLOePXKjLIqpSz
         j2x/7uPJk/GM8YxKmVNls9MGZGNQD3t9xkZRItjXW4vSRODwNYKArVV9kowRbFjUBD3T
         EeMVyocQhxPysCYBODX9xNHP15zKYz0J16vHc6N9tOd7MCRM+TTLKIFA9POjzFm4YkMa
         /rE9XxV5ER/TpdwhtCrq1BtafPFYepIcJeD6IXS/QzlufzIZ8EARXG8GoHoB6ufUV4My
         HRiHGcHReaBnQIPYT4DEZvQmHXqtFEJfXslFzNPFxplwDUsYVVIW/XW4jEDLtBuYeFjw
         8WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692388624; x=1692993424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVy8/I6+hZEhbfOu9dBJY0K2hcEvw4odHhWMeKKSlSQ=;
        b=ESwa7RaX/2eJq6yYUplITsb6QXzAzfRUv7Wqp/fKuCl6SfRe1sCB+wTADprId/tzkK
         J4yIERHPq+uOozKUbc+ywApqYUWwtKK6WZ78CISGc/tAU5zplNiVTFn3e5kSlq2hRSEx
         BXfhOzF/IM4hnlK/AXn2b8KmAVkGUwRWrLsG4bDEYLC08whXqDW25RAogPJJPONTpghL
         fJSAND+dcvCCKySONaPAYVyR2GKDYeU5GfvIWVfCklB9SXQ9pbltZCTlUbAKF8CGmvdw
         N10iO3lLb55dKlRg3S8aITdfgtm4m2uzAZ64Lb5NBKTyikxyQ6ZsyDcUGSHzTjiIwBpG
         NO5A==
X-Gm-Message-State: AOJu0YxNfN/LqCqBFT/G1zGWgyN3yRiqxNYGNzdeSGRqZRjJejlW04kZ
        6kjMS7BdntIBvdekD6NvjhPMbpdM9/4t8K3xJ+MPow==
X-Google-Smtp-Source: AGHT+IG1AUyT+kHxOcDxv2bvger1UKXAP+l8gqMIhxZAF556A4JVr7/WDWdrcG8dpTGWzJ7hKbnfj/3TE43gBySo1CQ=
X-Received: by 2002:a17:90b:4f4a:b0:268:300b:ee82 with SMTP id
 pj10-20020a17090b4f4a00b00268300bee82mr190016pjb.19.1692388623694; Fri, 18
 Aug 2023 12:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230818102911.18388-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230818102911.18388-1-krzysztof.kozlowski@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 18 Aug 2023 14:56:52 -0500
Message-ID: <CAPLW+4kiGoHvOjKxCNxb3adL+i1V2FMbun8Cq3bw0M1aeYfjAQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: fix order of
 clocks on Exynos5433
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 18 Aug 2023 at 05:29, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The Exynos5433 DTSI had always different order of DWC USB3 controller
> clocks than the binding.  The order in the binding was introduced in the
> commit 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to
> dtschema") converting to DT schema.  The Linux driver does not care
> about order and was always getting clocks by name.  Therefore assume the
> DTS is the preferred order and correct the binding.
>
> Fixes: 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema")
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> index 240f41b7133a..deeed2bca2cd 100644
> --- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> @@ -82,8 +82,8 @@ allOf:
>            items:
>              - const: aclk
>              - const: susp_clk
> -            - const: pipe_pclk
>              - const: phyclk
> +            - const: pipe_pclk
>
>    - if:
>        properties:
> --
> 2.34.1
>
