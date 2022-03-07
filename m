Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DF9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbiCGIr7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233266AbiCGIr5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:47:57 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9886352D
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:47:03 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FC333F5F7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646642821;
        bh=cTVS5wZOGaAoIcz1M4Y4sLTFfhLOC06ze/gaw6hqXNw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=SS+2a6ideT8YDbS371Foym8KXdJxQC/R/mxCiUblsH07rj2xiJIhg3O1KFwChQb+p
         jsVgTssmW8zFH68V3ZKC468/xfdOqKDZgcTYh2zP6VtMIsrZm6ZjZGapTC4DxZmbm7
         Xu5oEuU0s+os9w4hpu0h3heEs0R6+152SqmH17vqMnSgmDozsC/2YuRjZC8/9IGDx1
         hsPU/pr7NyOHYMAI+3q9es3IWu8eI+lKsfzqVvDvRJhAv/Hs9nwpdNTrgNPsJ9p6wS
         tqkxqr1POFZimngoT1MQ/bliQWuSVtb7QdQQjAKp2XhvbspJXjMjQfAhjKNs0lO/RJ
         C/pOrpJk5rvmQ==
Received: by mail-ed1-f71.google.com with SMTP id b24-20020a50e798000000b0041631767675so2313378edn.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cTVS5wZOGaAoIcz1M4Y4sLTFfhLOC06ze/gaw6hqXNw=;
        b=frJHXyCQEMBm3VRQ1kJIBQBCaMBORgX2uFfqNEBtD4YHAUpqlIWASIyIamKZa+fKBB
         LPca2+WLiYNIViIqPES/D7tm5NIoEz6mshwnwf0xqK6CVz21HZfrsRPcfuaHp7Jmonz0
         2cPUSUJkvQljVAamhA6ugdGzkd1i5/8D3BAd6lNL6I3NfGhMQfug+HitFCT0OCWeq6eF
         +AdmD0pedo2IK1+Cz2NDc6FnRAVeoCRMN+8t/hcvhn7aKQHoPzjnkTpc3b8y1pN6h86/
         O4GiTAd/eNpPK/INBo3OtU8b92IbX7DVOuw1xlFoYXCrUPBO/ZGj7fr1WfzonJZYIoSH
         rXMA==
X-Gm-Message-State: AOAM533R1JE/blYtTahblVLYZ1A9FHMKbyvry2W6EtN1wJrR0I6HML7o
        h0tWeZhWWWpWt3mwW1SLste8aHwY56XJnu0+hqP9Cdg0kGhG9rEJeYxR4qcaT+/cfoNeiA/8Ki9
        UfzKDEQzjEM4RZqF9AZLZQmf1PGMzl4gg3MsMYztv+zX0dF6d
X-Received: by 2002:a05:6402:2754:b0:416:55c4:c883 with SMTP id z20-20020a056402275400b0041655c4c883mr1452288edd.285.1646642820898;
        Mon, 07 Mar 2022 00:47:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlcygC1225VRsCfRH7PGhqlqVVmwDsWlgFrgal65RixQmIDsY1lehMdFc//YJEm1fs3ijWuQ==
X-Received: by 2002:a05:6402:2754:b0:416:55c4:c883 with SMTP id z20-20020a056402275400b0041655c4c883mr1452278edd.285.1646642820720;
        Mon, 07 Mar 2022 00:47:00 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id h20-20020a1709060f5400b006d6d54b9203sm4474446ejj.38.2022.03.07.00.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:46:59 -0800 (PST)
Message-ID: <e021ee5d-1d4d-61ea-8eb4-51ca87820b2f@canonical.com>
Date:   Mon, 7 Mar 2022 09:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Enable building on ARTPEC
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     kernel@axis.com, alim.akhtar@samsung.com,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220307083744.1592533-1-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307083744.1592533-1-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 09:37, Vincent Whitchurch wrote:
> This timer block is used on ARTPEC-8.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  drivers/clocksource/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index ae95d06a4a8f..2ea981ef23af 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -419,7 +419,7 @@ config ATMEL_TCB_CLKSRC
>  config CLKSRC_EXYNOS_MCT
>  	bool "Exynos multi core timer driver" if COMPILE_TEST
>  	depends on ARM || ARM64
> -	depends on ARCH_EXYNOS || COMPILE_TEST
> +	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST

This looks ok, but please also provide compatible in the bindings (if
driver stays the same) on top of my patches specifying number of interrupts:
https://github.com/krzk/linux/commits/n/dt-bindings-exynos-mct-v2

Best regards,
Krzysztof
