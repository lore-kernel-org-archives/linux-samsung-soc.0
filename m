Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AE3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DB26610A0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhIUHZ1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 03:25:27 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60992
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230165AbhIUHZZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 03:25:25 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4E4A83F30E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632209037;
        bh=FaHcDpk+u1VpWt5lbH8rjwnBsNSsw93jdeErzZSXmg0=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=BZl8mZnyi5Yq4N8T7f43iRmSjP3STi84eNkGzG7qsmYItgCP18CQLa5jBH4TOEIkJ
         m+eqOWBq3/SXJN7yvPQoEVbzjB3mHahlGtm7JOOBinCGbkx1/PdeL28ndiZiSoNt5Q
         6L9pa2LED8FpIiYQNgwZgd8K0ojyZ5NG4zeB6XUcZSa0oeLIumyi03Rc5AiJ1rVF/X
         mp3U9q25yU1GWDU3bCqejh06Cse8mx+vpff9pe5Ap6f8uLZI22NHTZFkWj+Ru8isBQ
         cO+++DBUKeKJva7gLa2+Pv4iqPhAQgCp9y8OZRVmSLaBJYnQnyNt/cJCgm1Ego+ahn
         xxnAlY6gowtVw==
Received: by mail-wr1-f69.google.com with SMTP id x7-20020a5d6507000000b0015dada209b1so8022598wru.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 00:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FaHcDpk+u1VpWt5lbH8rjwnBsNSsw93jdeErzZSXmg0=;
        b=t+f990IRyb/rQi61jE7Ry1N0yQonnGHJ4UoRNYkKbBwJSalczgQh5inPjI6/SVbwoc
         1vEpYMPURY8TFSMPnmwySielQji9z3VF/OSrPCXuriuNL5E4StetGdJZobpr9I15lpUC
         Z7besqkMJ8vdKC5eThW4M+6JqTHXRhKqoqNp75edGLODsLenqoCyMqbVSVwiXrKqXV0L
         X/VTU6fAhIfIh/AW1n1KqptEcK+c7YXeNmh5lSZOKwX6sZrs97L9b/7eKbmSo4U8kczj
         qq3JLon9vsyT+op3uyNGMebKnYj5yUjj/cVhS1O7DeVR6AtIR9iqjvXyI3ayo8D6Tm+B
         P5hQ==
X-Gm-Message-State: AOAM530rF/rJh7xChEHu3FcEY2xbvKjO5o0OVQtyx8IA+SLpMUaR/1mF
        rX0Wo2Gp67ARyuG94CzsDl8QiXAGYYBwqLBfoqIvz/0Oa/nPPhfBTJtnfUzat8hU+FYb0lbD9ul
        UpcmKB+n9U8vspwsR5gxUA7lPiPPuGod/HvxLGzAOXaGFafzS
X-Received: by 2002:a5d:6503:: with SMTP id x3mr33696775wru.76.1632209036701;
        Tue, 21 Sep 2021 00:23:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIt6Xvm6FM45NoflFQPUnxuEX7g4Z3WCiYjoS2cooa5lMLDgpEqp+kpteu59gYfReRS0VpXQ==
X-Received: by 2002:a5d:6503:: with SMTP id x3mr33696759wru.76.1632209036525;
        Tue, 21 Sep 2021 00:23:56 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id x5sm2367351wmk.32.2021.09.21.00.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 00:23:56 -0700 (PDT)
Subject: Re: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config
 logic
To:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
Date:   Tue, 21 Sep 2021 09:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920190350.3860821-3-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/09/2021 21:03, Will McVicker wrote:
> Switch the default logic to enable SOC_SAMSUNG and it's sub-configs to
> be enabled by default via "default y if ARCH_EXYNOS" versus being
> selected by the ARCH_EXYNOS config directly. This allows vendors to
> disable these configs if they wish and provides additional flexibility
> to modularize them in the presence of a generic kernel.

This is not true. Vendors cannot disable these options as they are not
visible. Although I understand that Arnd prefers this way and I do not
object it, but your explanation is incorrect.
> 
> There are no .config differences with this change. The configs
> SOC_SAMSUNG, EXYNOS_CHIPID, EXYNOS_PM_DOMAINS, and EXYNOS_PMU still
> remain enabled by default.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms | 4 ----
>  drivers/soc/samsung/Kconfig  | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 3a66ed43088d..6a006490c9b9 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -91,14 +91,10 @@ config ARCH_BRCMSTB
>  
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
> -	select EXYNOS_CHIPID

This will conflict with:
https://lore.kernel.org/linux-samsung-soc/CAGOxZ50i6URzUQ7o7V4m7MR=2TqSeD6qx5fQaQDs+5nEq4fa2A@mail.gmail.com/T/#t

Build on top of it, please.


Best regards,
Krzysztof
