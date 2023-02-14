Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8649FC6379F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Feb 2023 10:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjBNKA0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Feb 2023 05:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbjBNJ7g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 04:59:36 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7646C233D0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 01:59:00 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id o18so15037817wrj.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 01:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YigLVN232d2vsfHIJ26LQHhC5RhgoKV67mcKgoE/0Tg=;
        b=Lgr+NZlmPJrB0+lMM0N6BMTZMMdFS1M0LlvQbZTmoCCJ+XDWFlO11xG2TfAbxMRfsr
         xhoexczwRzeLZTFYbH4E1x7lxCxZZaU1vksAyPZzNH8Mn1OK2bMdGKp1dfXWPd85LXCw
         mNMlyCsliv0YykzbR8m7THYVA3oPJRPVo4HUp540kYZCz0ZUo/HOSh8KXaFqm78k1wBV
         R8BCl0M2UWauDKPbDUSfk4R8fLZ0IrquTqfWTgbBG1mTK9aAi/wxKDtADwZfFq3o3Ajw
         aj3TH0Fbm9Eoc0kTgAmUToQ64QgVCGoHBmhwSau1tfYM6WYTGrFJ4vgb3lkMQNOS5Qv6
         XhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YigLVN232d2vsfHIJ26LQHhC5RhgoKV67mcKgoE/0Tg=;
        b=kikIGFn9hczL7v5kEwqO5xHcdvhYlCijtwuTGk5MIlRnhQuRBUcuGKJi3+86DPwuE4
         NdDsDDCcit8sNr+1Up/HN8fihSfAjnyBOxjkgGXvatB1VRLBXa6alfE9LNScknSOLvx9
         o1oEF34tdSGlzV093CJdSBQ5G6UIqV042nu+T1dEWZPYqQ+0WF7yGcpyIXXPj2omL+OM
         RMBUkricZcK1dLBA5tYNJeThm5k98Y/aNOWdcrQW7K+XukbojkleA5tKgN9lXYAsSLps
         jUqFXXdTCekET+TfvVuQbOjPj173LODzzrTgUAK7VuqoW6jvu3uqFh1ic6QLjPuz8z8Z
         tJQQ==
X-Gm-Message-State: AO0yUKUhLMa6p/4hth1GsqjepONanIkThFs76gbRroMc1prcw3cpATD4
        2DHQ4IMgbpNbQRd3YLSFNrGo3w==
X-Google-Smtp-Source: AK7set/siP0mTRrExraFbFYMqjIdU9FDVpbw8X8TUHwWT+RaseP1odGp2QbV1Q7w7d7Vfc4ReqTENg==
X-Received: by 2002:a5d:5704:0:b0:2bf:b68a:e122 with SMTP id a4-20020a5d5704000000b002bfb68ae122mr1542895wrv.33.1676368739088;
        Tue, 14 Feb 2023 01:58:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r3-20020a5d6943000000b002c551ae8cc1sm7505795wrw.67.2023.02.14.01.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:58:58 -0800 (PST)
Message-ID: <765c9ce0-65e3-8681-7343-c57ba70da9df@linaro.org>
Date:   Tue, 14 Feb 2023 10:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] media: dt-bindings: samsung,exynos4212-is: convert to
 dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20230212190222.44977-1-krzysztof.kozlowski@linaro.org>
 <20230212190222.44977-3-krzysztof.kozlowski@linaro.org>
 <167630051330.6283.15554895477756313707.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167630051330.6283.15554895477756313707.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/02/2023 16:09, Rob Herring wrote:
> 
> On Sun, 12 Feb 2023 20:02:21 +0100, Krzysztof Kozlowski wrote:
>> Convert the Samsung Exynos4212/4412 SoC Imaging Subsystem (FIMC-IS)
>> bindings to DT schema.  Changes during conversion - adjust to existing
>> DTS and Linux driver: add iommus and power-domains.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/media/exynos4-fimc-is.txt        |  50 ----
>>  .../media/samsung,exynos4212-fimc-is.yaml     | 221 ++++++++++++++++++
>>  MAINTAINERS                                   |   1 +
>>  3 files changed, 222 insertions(+), 50 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
>>  create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: /example-0/fimc-is@12000000/i2c-isp@12140000/image-sensor@10: failed to match any schema with compatible: ['samsung,s5k6a3']
> 

Eh, I missed the fact that this depends on my other (earlier) patch for
samsung,s5k6a3. I will resend all of them in one patchset.

Best regards,
Krzysztof

