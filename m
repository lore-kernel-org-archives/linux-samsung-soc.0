Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6B4C48BE5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Jun 2021 08:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E258661164
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Jun 2021 08:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhFUIyK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Jun 2021 04:54:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39668 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhFUIyK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 04:54:10 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lvFet-0005rz-II
        for linux-samsung-soc@vger.kernel.org; Mon, 21 Jun 2021 08:51:55 +0000
Received: by mail-ej1-f70.google.com with SMTP id f1-20020a1709064941b02903f6b5ef17bfso6047669ejt.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jun 2021 01:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ggXee6A796CsVt4xk+5DiytAJr6HRec0kihk7+kdguU=;
        b=IVjfEkvX1GrhMKOmK9/e2RfZugF8IIcDes6/knzowzPvye/cFZhB9E5NXob1k59huS
         HUGiip4zFQkyBligrxx56nbFK0B4B3FuhUkj8TFKjt8geTYZYYSZN54iEu2Cz/pHAumC
         AdIAx3IbxlvoVjHL+AaR7ad6DWxqs4cL269/v17r7XuWHv6rzlpDZBN8fUGIrFYqA6bR
         sCXTbjVWL5TeqGjiDbkX/k7eT4bMeq2Vfa4hpQJ3Q6l4kyYEFTyz3nR2MraaXY8pzx+Y
         8B+tqDQO5L9jUAe+8FUJ0odLO527W3Bu0w8+3qqpSc/rPw26NcvtSuXxr28ANsnleiQH
         Jvgg==
X-Gm-Message-State: AOAM531a5bP1T7bNc61lLPlRzmBPh8i7vPUYcWNJcs09GADU49UK/Omv
        KZEKmcCMjdOVSJTSyCOEv6xgpDjlyApANkUny0qZgXIm3lzzdvYefR8RfoH53RY/TNPGt3CJCWL
        Hc9OTgPNnk0LtmN74xI4zwjoXZcupRIA8QKsisIWmz9hJdLYe
X-Received: by 2002:a17:906:b190:: with SMTP id w16mr23951026ejy.332.1624265514880;
        Mon, 21 Jun 2021 01:51:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw/9DH/lZzejm4BaxNnmKxMr/3WyMC6hKB5u1jhTfs5PGPy2HClTCywxxBQkefzrdj/XXQDw==
X-Received: by 2002:a17:906:b190:: with SMTP id w16mr23951016ejy.332.1624265514735;
        Mon, 21 Jun 2021 01:51:54 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id og37sm2584474ejc.100.2021.06.21.01.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 01:51:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: exynos5433: Add cpu cache information
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     linux-samsung-soc@vger.kernel.org
References: <20210617113739.66911-1-alim.akhtar@samsung.com>
 <CGME20210617113314epcas5p4652e98d24d7f56a7c8461175bbb25456@epcas5p4.samsung.com>
 <20210617113739.66911-2-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0120db2f-e25e-a4ae-669b-a404dbfae05b@canonical.com>
Date:   Mon, 21 Jun 2021 10:51:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617113739.66911-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/06/2021 13:37, Alim Akhtar wrote:
> This patch adds cpu caches information to its dt
> nodes so that the same is available to userspace
> via sysfs.
> This SoC has 48/32 KB I/D cache for each A57 cores
> with 2MB L2 cache.
> And 32/32 KB I/D cache for each A53 cores with
> 256KB L2 cache.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index 18a912eee360..8183a59e9046 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -62,6 +62,13 @@
>  			clock-names = "apolloclk";
>  			operating-points-v2 = <&cluster_a53_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&apollo_l2>;
>  		};
>  
>  		cpu1: cpu@101 {
> @@ -72,6 +79,13 @@
>  			clock-frequency = <1300000000>;
>  			operating-points-v2 = <&cluster_a53_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&apollo_l2>;
>  		};
>  
>  		cpu2: cpu@102 {
> @@ -82,6 +96,13 @@
>  			clock-frequency = <1300000000>;
>  			operating-points-v2 = <&cluster_a53_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&apollo_l2>;
>  		};
>  
>  		cpu3: cpu@103 {
> @@ -92,6 +113,13 @@
>  			clock-frequency = <1300000000>;
>  			operating-points-v2 = <&cluster_a53_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0x8000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&apollo_l2>;
>  		};
>  
>  		cpu4: cpu@0 {
> @@ -104,6 +132,13 @@
>  			clock-names = "atlasclk";
>  			operating-points-v2 = <&cluster_a57_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0xc000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&atlas_l2>;
>  		};
>  
>  		cpu5: cpu@1 {
> @@ -114,6 +149,13 @@
>  			clock-frequency = <1900000000>;
>  			operating-points-v2 = <&cluster_a57_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0xc000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&atlas_l2>;
>  		};
>  
>  		cpu6: cpu@2 {
> @@ -124,6 +166,13 @@
>  			clock-frequency = <1900000000>;
>  			operating-points-v2 = <&cluster_a57_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0xc000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&atlas_l2>;
>  		};
>  
>  		cpu7: cpu@3 {
> @@ -134,6 +183,27 @@
>  			clock-frequency = <1900000000>;
>  			operating-points-v2 = <&cluster_a57_opp_table>;
>  			#cooling-cells = <2>;
> +			i-cache-size = <0xc000>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <0x8000>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&atlas_l2>;
> +		};
> +
> +		atlas_l2: l2-cache0 {

Few other nodes (PMU, OPP tables) use a57/a53 names instead of
codenames, so I would prefer to stay with them (so cluster_a57_l2).

For Exynos7 it's fine as it uses Atlas already in labels.

> +			compatible = "cache";
> +			cache-size = <0x200000>;
> +			cache-line-size = <64>;
> +			cache-sets = <2048>;
> +		};
> +
> +		apollo_l2: l2-cache1 {
> +			compatible = "cache";
> +			cache-size = <0x40000>;
> +			cache-line-size = <64>;
> +			cache-sets = <256>;
>  		};
>  	};
>  
> 


Best regards,
Krzysztof
