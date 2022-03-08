Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A806C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 14:44:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbiCHOpu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 09:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbiCHOpt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 09:45:49 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09633B3F5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 06:44:52 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B91643F1C6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646750690;
        bh=XPWngrH4yB2m8hPYi3WQlp0y7ozLbZ9SOUzkcBuiDSo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=I38MiL+x2ERMr62JqwOe6ORV7lDV77K3uIDkboKB3Y4eePnEVgLiC1N+rviu0Ftaa
         JzbSybDnf6PHT50KXtX8JK+Ucr7l3qTC2DL2Ef1yGxTjcaY2QvQmXtXGgGA2BCrJC9
         M50toNxYfC58LZliWxQ3OgF9nxUSzaRl6uVTOMDP68KPus1mapXnxweSFRBuaohcxB
         BjgK28mAXSsZSmP+pSywCu+0nWO7Ari9UdgdBgzWFZO0jk8mgOCSRcHYlG71PJhc72
         2PRMOizy8qGXLSjz3/TwoaQXJ3yc6JO0QjodktIR8yuKIrXMcT+jeWt4V9r18ECho7
         u3ZiupGbP1cSQ==
Received: by mail-ed1-f69.google.com with SMTP id b9-20020aa7d489000000b0041669cd2cbfso1557363edr.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2022 06:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XPWngrH4yB2m8hPYi3WQlp0y7ozLbZ9SOUzkcBuiDSo=;
        b=ESxGzL/e/eYtESIW0oVrGIaUn0BvgJ4pBlWp+jhIttwaTMyQBHXj79jTnLCG791oja
         syuM4/5URu7hySUf133/UObX48Otvr33mHbsdIlQXw/w8NkZEen64Am2gbG/H+PyR9eA
         QF8oB7FR2AL0EnZ8iyIJwJzZ61qJWAFcQvRynow0pMYOAlH2WX0a434qpqg5vfUJvxW4
         Lnf6OuOGjjWYtKlMEWNMxFcy0eD8b2hqKWfvcgMfEYg0wWxsN/Pcz39tOMD49HDaN7Hg
         Gs5QaQxwCJ2d7FUQT9r0cqdtP/T2Te8R5oNGtPmh95IXBwqXsJG7dByl0N/kSWyWyG5y
         7WqA==
X-Gm-Message-State: AOAM532r2nhXmaBId9BgFeyfShPgZVySA6MOwN1+YH2BqIpYHAjpQfuV
        /r+GpKRUNmoVCwoHISbOhswwJMQlaoNoiUjE4r+WCvALhc3VNSj4r6e4dtRWoHQSwnEDhL1kvET
        c5MxaYT2oUp2UfdvIAngmnAtyNJ2DekrxYvp7xZvyw7z8uBst
X-Received: by 2002:a17:907:d93:b0:6da:bb7a:4da with SMTP id go19-20020a1709070d9300b006dabb7a04damr13412641ejc.183.1646750690447;
        Tue, 08 Mar 2022 06:44:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTaOdqLNPXSX1Gu97Fy6UulewAGsgiEfqKcZeLZUk+nIltFuvBtpMRoLBaIjZbNZtX/RFdnw==
X-Received: by 2002:a17:907:d93:b0:6da:bb7a:4da with SMTP id go19-20020a1709070d9300b006dabb7a04damr13412630ejc.183.1646750690213;
        Tue, 08 Mar 2022 06:44:50 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906144b00b006cf61dfb03esm6023364ejc.62.2022.03.08.06.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 06:44:49 -0800 (PST)
Message-ID: <26f42531-8f55-9fda-9465-bd78a2224f2c@canonical.com>
Date:   Tue, 8 Mar 2022 15:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/4] dt-bindings: timer: exynos4210-mct: Support using
 only local timer
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, robh+dt@kernel.org
References: <20220308142410.3193729-1-vincent.whitchurch@axis.com>
 <20220308142410.3193729-3-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220308142410.3193729-3-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/03/2022 15:24, Vincent Whitchurch wrote:
> The ARTPEC-8 SoC has a quad-core Cortex-A53 and a single-core Cortex-A5
> which share one MCT with one global and eight local timers.  The
> Cortex-A53 and Cortex-A5 do not have cache-coherency between them, and
> therefore run two separate kernels.
> 
> The Cortex-A53 boots first and starts the global FRC and also registers
> a clock events device using the global timer.  (This global timer clock
> events is usually replaced by arch timer clock events for each of the
> cores.)
> 
> When the A5 boots, we should not use the global timer interrupts or
> write to the global timer registers.  This is because even if there are
> four global comparators, the control bits for all four are in the same
> registers, and we would need to synchronize between the cpus.  Instead,
> the global timer FRC (already started by the A53) should be used as the
> clock source, and one of the local timers which are not used by the A53
> can be used for clock events on the A5.
> 
> To support this usecase, add a property to the binding to specify the
> first local timer index to be used. If this parameter is non-zero, the
> global timer interrupts will also not be used.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v2: New.
> 
>  .../bindings/timer/samsung,exynos4210-mct.yaml           | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
> index dce42f1f7574..46f466081836 100644
> --- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
> +++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
> @@ -47,6 +47,15 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  local-timer-index:

You need vendor prefix. Also this should describe the actual hardware,
not driver behavior, so rather:
"samsung,local-timers"
with a uint32-array type and list of timers to use.

You also need separate property to skip FRC, so something like:
"samsung,frc-shared"
of type boolean.

In the bindings please describe the hardware, not the result you want to
achieve from driver model point of view.

Also disallow this for all other compatibles:
allOf:
 - if:
     not:
       properties:
       ...
   then:
     properties:
       samsung,local-timers: false
       samsung,frc-shared: false

The property simply should not be used outside of Artpec8. It's not
valid in other configurations.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +    maximum: 15     # Last local timer index
> +    description: |
> +      If present, sets the first local timer index to use.  If this value is
> +      set to a non-default value, the global timer will not be used for
> +      interrupts.

Do not describe the driver, but the hardware. Instead explain which
local timers are allowed to be used.

> +
>    interrupts:
>      description: |
>        Interrupts should be put in specific order. This is, the local timer


Best regards,
Krzysztof
