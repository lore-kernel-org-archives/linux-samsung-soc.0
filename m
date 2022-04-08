Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CBDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 07:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiDHHSs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 03:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiDHHSr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 03:18:47 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE4D1E7443
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 00:16:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bq8so15456197ejb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 00:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ieIB5YqKCN+PKXGT2YPOFVPgHW/BR3G7k5u78AwWmig=;
        b=GcgJvyKPOGEwA1acdO+/0TE7/6G823io8jdY0AOuSRmGqbqrioIZUnDMq8g4JIoaER
         KwVlPY86OcLfbvqvHXq2jqy71sShCcBthzAmNCZOXq8PT7804u5TSAach/lu3Q9GxXT+
         Y16TKLuKtjy+WksAlSEbML5TJzj6WrRXV5YUAvaRJadV6K+F7t9iZra3KYbodEBQae2B
         nfT4RKsFeRDp6OIVkSGRFsku5AMdL9AuS0VmDqaZLsNxbXpVfwn9OtLH5NJsPaTsn6IF
         Z21YdpKH1H2+eKO0fFXhn2efRdGZGSitICMgvTHRYNYYqxj2/IzBvBvzMFaW+J2w4yP2
         56kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ieIB5YqKCN+PKXGT2YPOFVPgHW/BR3G7k5u78AwWmig=;
        b=r/XT7b8Mc6j6SDgCkkM/A0M7qq2+h9boM07cmqsl9HeRTAm/ddO5/0QsLj35ng7JTU
         rtSWfovA3phE7WS4Tx8Lek/kNKt2iIfRjxPL8vZOUtCtEaCFzDwh3UxWL+iUP6JbJFqy
         TZFGv/RJWRFbGp6uw150rF9nemzW0eNrKl431td9uk1wVQe2jJE6TfAW4OmJQtZsGZZa
         NRyltO3etYUPCotd/hqOvOi2UQYJh4iR8+3rSnxw6nG7mAIl1PQEfDueRumXvbefpqI9
         zYSmW40fb0wsulfUvvA2ROOYRyps+aYzRBdQs1fL+EigM4ZWBCZe1hB9aHSWsyxyLri3
         iw+w==
X-Gm-Message-State: AOAM5333LUxRb3TM88ST1WKJeuXlwH2qLA7eZUTmMHGFJFBGD8mrFC++
        vhvMdxmY+7KwelFnQKwYu5Lf0g==
X-Google-Smtp-Source: ABdhPJwzgDoQ0K2hEotiMSP4godR914nen/RCVo6vbJ+AvYQCq2Vhtw0UBtd9Jl/fMpd3FmrhXEVaQ==
X-Received: by 2002:a17:907:8a02:b0:6e7:18b9:5f43 with SMTP id sc2-20020a1709078a0200b006e718b95f43mr17251110ejc.148.1649402198311;
        Fri, 08 Apr 2022 00:16:38 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090654c300b006e4e1a3e9d5sm7963714ejp.144.2022.04.08.00.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 00:16:37 -0700 (PDT)
Message-ID: <f56df7f8-9ec5-efe4-df36-c3e2151b1cf0@linaro.org>
Date:   Fri, 8 Apr 2022 09:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/4] dt-bindings: timer: exynos4210-mct: Add ARTPEC-8
 MCT support
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
References: <20220407074432.424578-1-vincent.whitchurch@axis.com>
 <20220407074432.424578-2-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407074432.424578-2-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 09:44, Vincent Whitchurch wrote:
> The ARTPEC-8 has an MCT with 4 global and 8 local timer interrupts.
> 
> The SoC has a quad-core Cortex-A53 and a single-core Cortex-A5 which
> share one MCT with one global and eight local timers.  The Cortex-A53
> and Cortex-A5 do not have cache-coherency between them, and therefore
> run two separate kernels.
> 
> The Cortex-A53 boots first and starts the global free-running counter
> and also registers a clock events device using the global timer.  (This
> global timer clock events is usually replaced by arch timer clock events
> for each of the cores.)
> 
> When the A5 boots (via the A53), it should not use the global timer
> interrupts or write to the global timer registers.  This is because even
> if there are four global comparators, the control bits for all four are
> in the same registers, and we would need to synchronize between the
> cpus.  Instead, the global timer FRC (already started by the A53) should
> be used as the clock source, and one of the local timers which are not
> used by the A53 can be used for clock events on the A5.
> 
> To support this hardware, add a compatible for the MCT as well as two
> new properties to describe the hardware-mandated sharing of the FRC and
> dedicating local timers to specific processors.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 

This is rebased on my patch:
https://lore.kernel.org/lkml/20220407194127.19004-1-krzysztof.kozlowski@linaro.org/


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
