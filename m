Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07537E92719
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 17:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjJERhw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 13:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjJERhX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 13:37:23 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45ECE1702
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 10:37:18 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c6052422acso12265ad.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696527437; x=1697132237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4e9Kg23SHZu+vjVtfxzHNoF3HFL3xTDkE0f1jaHYfI=;
        b=0pFLbdROommXT53KDHjRurRM2SDehRRvqr7HGcchXkyFXTdApFrKtwZcAcxLJFPgzK
         R+vcP8W/2ZGcTixOY417Qr7K+X5dLU33HleHt/o0g1ZhEORUE//9hZNL//OwMeNXTXQP
         qeWdmS4hCBNq34aV2FtjtQrt050JZETj01/SZb83GzrzeZU4NSt0RhbP6oqGMfQnCKey
         ZogYPX9hzMV3dRywzruCPBnWMdux2IT5Eymsh+M7joRGabGD1QouW7l0cR+C3fljaJXL
         qixpq23HX6pCb2RmNugLJ8BS8aowdmBtaHga+aJg1e0f+jSB77IjqPHbRwbDjBHhyPGp
         GHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527437; x=1697132237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4e9Kg23SHZu+vjVtfxzHNoF3HFL3xTDkE0f1jaHYfI=;
        b=DfMy4jgmghSJdbn34/NYlQq+UWGWS++CF6sNghsn4wxjrGOsCRA/BlekIflBwQ38CJ
         9vvqp32wHnl8g5Gb/mpsR2+vQOwOyRlbx6Td+y+hcd7YV4ZjjNn0f1KlGP/b+iJq0V0Z
         Ct1LWkxZi/jWc/AA8LxiYOL27w0G2Dke3SobK4iFaY0D2DYlFRraFLrr3TA+sT41HQTt
         RXJC/SEeWHD3ARhAILxwL/fQza/zYE5imZNW4gnWJo78GlMqL46oRBODhGQURhxKhtZ5
         nGFPUZ0n4PNmxtZ7z7CCN5ZZkrm4/Xz+FyOMaxc/1PJYm2hgHbVZwFYU33nQbZIqVBom
         E2ow==
X-Gm-Message-State: AOJu0Yw+aFzJ/VBoSUY+db5cxgqaunHJjHolQVWHy1yWhrLxLCHddMSR
        UpJ/O7taw602h8xRlAdhAt49dw==
X-Google-Smtp-Source: AGHT+IGQkqtkzOoEy8CUfeYOTGtNX1HN2CAYrTFP+QCLuLZnKQCDyDPhpX/WLtfxTO55ITdGr9wWng==
X-Received: by 2002:a17:903:18c:b0:1c7:5627:2053 with SMTP id z12-20020a170903018c00b001c756272053mr158309plg.18.1696527437142;
        Thu, 05 Oct 2023 10:37:17 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id bo4-20020a17090b090400b0026971450601sm1890158pjb.7.2023.10.05.10.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:37:16 -0700 (PDT)
Date:   Thu, 5 Oct 2023 10:37:13 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 05/21] dt-bindings: watchdog: Document Google gs101 &
 gs201 watchdog bindings
Message-ID: <ZR70SdvjY6JskvWD@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-6-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-6-peter.griffin@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/05/2023, Peter Griffin wrote:
> Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
> dt-schema documentation.
> 
> gs101 SoC has two CPU clusters and each cluster has its own dedicated
> watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> 
> These WDT instances are controlled using different bits in PMU
> registers.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index 8fb6656ba0c2..30f5949037fc 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -24,6 +24,8 @@ properties:
>        - samsung,exynos7-wdt                   # for Exynos7
>        - samsung,exynos850-wdt                 # for Exynos850
>        - samsung,exynosautov9-wdt              # for Exynosautov9
> +      - google,gs101-wdt                      # for Google gs101
> +      - google,gs201-wdt                      # for Google gs101

For "google,gs201-wdt the comment should be "for Google gs201".

Regards,
Will

>  
>    reg:
>      maxItems: 1
> @@ -42,13 +44,13 @@ properties:
>    samsung,cluster-index:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> -      Index of CPU cluster on which watchdog is running (in case of Exynos850)
> +      Index of CPU cluster on which watchdog is running (in case of Exynos850 or Google gsx01)
>  
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos7 and Exynos850).
> +      Exynos5420, Exynos7, Exynos850 and gsx01).
>  
>  required:
>    - compatible
> @@ -69,6 +71,8 @@ allOf:
>                - samsung,exynos7-wdt
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
> +              - google,gs101-wdt
> +              - google,gs201-wdt
>      then:
>        required:
>          - samsung,syscon-phandle
> @@ -79,6 +83,8 @@ allOf:
>              enum:
>                - samsung,exynos850-wdt
>                - samsung,exynosautov9-wdt
> +              - google,gs101-wdt
> +              - google,gs201-wdt
>      then:
>        properties:
>          clocks:
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 
