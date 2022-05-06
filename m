Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1756C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 08:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390142AbiEFIci (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 04:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390139AbiEFIch (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 04:32:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3C257980
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 01:28:55 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l18so13052059ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=k8gw4JD+CVD/evHIacbhoTM1UmIlcjVCNQ+9z7oYUtI=;
        b=dDZs4xRsI+XJt34onMwmAZtEAGas5P7kna23XXUg06Y/gztAxn8a54iuBWXYNHBmCX
         bc9omCyYTSnmd4wyPVEQaM3fJ9qeBaAWNqvOqOrhHgltpmko5+rjky0VeGWALW6WwdqR
         X8j95OnDoOceNHT0SEmSr/ABL3waSGRPacAK4vCWkbGL4jqK94qZCzk20EvvtfS9e2ek
         bClBIbWgydbg+7AxUw2bTZhxtAsJwRDiWDDECmrJ1Npw9K8xbMKzewaoC76r4daDMsSa
         QM5Xf6k4repo+cmcKUjz0K2GGYKSydY1YVPjwyMhtNJK56a6oPnmwgeSIZbwL0ODJwEI
         f4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=k8gw4JD+CVD/evHIacbhoTM1UmIlcjVCNQ+9z7oYUtI=;
        b=pIuHp0Gf7f9yN6sj8GlypES05nygJe3GJ4rQwuaUI4VpWEoKHQFy58+Ykw626rruSd
         Rs9lyb4syPpErseIFq0Oma5EOU1yE4Wjs/0alNlluXvMWnjWJXT94PKAnj8AOn+IiYtT
         32Prmj5djlZMK6nigRAg6ZSfGzNX0u3XnMwFGrPKgF5fKE6oI4EQJWlaRxD1C+I80jiN
         t1DeJW7gRCAGledbu4HXXhns1pDS7Mz1qwKeXJY2Ona4Ik1srafGs3AaRNJTlPW5UZoB
         ozqUjAtldB7qC3tuZJzypi/6SCkno+ftNNNITRgYMbZ6q9W/AIqDt77XQ3kxmTMI5IDc
         pcNg==
X-Gm-Message-State: AOAM533FSheWgD0K2AkhRwQrVy6zQqMqYOLHdctwZChnx9BY/LFjXZWy
        +LcdyK3yTXhmff5sfvCiEs2zuQ==
X-Google-Smtp-Source: ABdhPJz8nMRZdChtZYB1x22twKxHKUjq6qOsvsEKiRI3qcGnDs0ehoq2wpfQpANDDl8kg3ZNcHVoEw==
X-Received: by 2002:a17:906:54c3:b0:6ef:d07b:c8ec with SMTP id c3-20020a17090654c300b006efd07bc8ecmr1859082ejp.687.1651825733978;
        Fri, 06 May 2022 01:28:53 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r2-20020aa7d582000000b0042617ba6396sm1997301edq.32.2022.05.06.01.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 01:28:53 -0700 (PDT)
Message-ID: <d6ead111-e2f8-c098-42ff-cda30a1d72bc@linaro.org>
Date:   Fri, 6 May 2022 10:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] dt-bindings: timer: cdns,ttc: drop unneeded minItems
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20220424150333.75172-1-krzysztof.kozlowski@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424150333.75172-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/04/2022 17:03, Krzysztof Kozlowski wrote:
> There is no need to add minItems when it is equal to maxItems.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/timer/cdns,ttc.yaml | 1 -
>  1 file changed, 1 deletion(-)
Hi Daniel, Thomas,

The patchset was acked by Rob, so he expects you will pick it up. Could
you let me know if there is anything stopping or you expect the other
way (via DT-tree)?

Best regards,
Krzysztof
