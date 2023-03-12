Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984DFC6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjCLRKi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 13:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbjCLRKh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 13:10:37 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D1B211D0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:10:34 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id j11so39797698edq.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678641033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g0gi8EqxrBeStL4EGcli/4vIjhUdEltrtG88sDHoc54=;
        b=E6cBY5bNYnJhDLFDErSnECfPOfwNLHU0Bm+u9p28IMfwolBh+tzIgk2w4291KErctX
         SOXEjQ4lHRmkn9y2aH8fKag919MrTvbW9roF6uS8AjxPd0O5EGl96nBWe1ayxio6qCj0
         6QnKt36hPl9/8KnadXNfqthAb7aI5dI4qELSq4f042bieOWS/v8b439uM385+4RzU3zG
         HK3qb5hi5X9M+EjmAvv0gYTEnerFxCifHwk2r9LlWx/+prWDReHVT7z6Rm3jmx3dpRjN
         QmDovIndhiVOTE7zzG0h5W2fzzYOdhHPAp0NLxuWe9JzLEv3vRi/MpppQ2Yx2qBM8Rrm
         TXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678641033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0gi8EqxrBeStL4EGcli/4vIjhUdEltrtG88sDHoc54=;
        b=JXu+LD1rCDHzGHV6OOgDMKtwnPhDw4RO+38AWlG/OhyEkEb4EJ3Fev8nl4rjzjB3l6
         wlP75mZV9BGSMtJqtxdw4Fyy2eWi/0PdN92jG24yO7FeQ7lpVBUrtsdsKptbPs5Kw7qK
         0LnrfeEUVuwntQ+dBkyyP5Ghb0+Dv5T+trOsTcfwrE/hbhZ5oCcTbuwOcGrDtiRAwVEd
         Bpa4a/ftPYhZtJ9aJsj/owzILW4VYtraj8xTAx9wpGFZICCubuQekE3V4svPPkIcuSl3
         sLJA93M8m9PIqGK/p6yuChjeMH6OX+ZslH6vlziU4yF//XyrHAqK4P7KlWC1b3K5+/Rl
         cr0A==
X-Gm-Message-State: AO0yUKVd6EYiNHx/8mspXYzyFfXiG5YF7KGHh3rAKCnwwDzFZdMmZP5h
        SdurAnsja3d2Suuw0ruBZZvGtQ==
X-Google-Smtp-Source: AK7set/EV3XqY7X1ShWyo0nUtXszB6ipwL14oOYPpU6mpu9Ccxn2zcLfApFHGQakFeBY4urxFrDszA==
X-Received: by 2002:aa7:d684:0:b0:4ae:f496:10ac with SMTP id d4-20020aa7d684000000b004aef49610acmr30389284edr.0.1678641033064;
        Sun, 12 Mar 2023 10:10:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id wt6-20020a170906ee8600b008f89953b761sm2392306ejb.3.2023.03.12.10.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 10:10:32 -0700 (PDT)
Message-ID: <fb775dde-b955-8e73-26f4-095fe1b08b54@linaro.org>
Date:   Sun, 12 Mar 2023 18:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/3] arm64: dts: exynos: fix wrong mmc compatible in
 exynos7885.dtsi
Content-Language: en-US
To:     Sergey Lisov <sleirsgoevy@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1678640497.9030156-2-sleirsgoevy@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678640497.9030156-2-sleirsgoevy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/03/2023 17:59, Sergey Lisov wrote:
> This DW-MMC variant is not actually compatible with
> "samsung,exynos7-dw-mshc-smu", and requires an additional quirk to handle
> very short data transfers. Update the compatible string to
> "samsung,exynos78xx-dw-mshc-smu" to reflect this fact.

Thanks.

> ---
>  arch/arm64/boot/dts/exynos/exynos7885.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
> index 23c2e0bb0..4b94ac9da 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
> @@ -294,7 +294,7 @@ pmu_system_controller: system-controller@11c80000 {
>  		};
>  
>  		mmc_0: mmc@13500000 {
> -			compatible = "samsung,exynos7-dw-mshc-smu";
> +			compatible = "samsung,exynos78xx-dw-mshc-smu";

Compatible is still wrong.

Best regards,
Krzysztof

