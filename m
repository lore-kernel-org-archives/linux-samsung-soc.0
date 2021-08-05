Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786BEC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 07:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A9BE60720
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 07:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbhHEHhE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 03:37:04 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:44088
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238203AbhHEHhD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 03:37:03 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id F14103F0A2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 07:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628149008;
        bh=FkL9np5HE5mawBpGWfUQVMs1Jp3nZ1r2uXir2/3ncE4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=YpZ7RHzaXH8CS+hxU9zgucBGnVzaZGZLBfRYZX+P6q8eOlhckpasd841kxVrbeXzK
         s4kDYQ4x7xu8I+CtWxY76Vnaeah8D4FKksvyboWFOXNV5NZMLhOhdch/xHqKJKekLY
         pZ/AXITDx3VU3+Xayltk7DkYYSuveiuQAUTaNXtSJBU/OZ/OYJUTxVEGxjY171r8LL
         6fBoc1k/yprRfj7nvsUKqRe4GdDFEoDI9j+zjE1C80ZmvzvnfS9/f22mon0T0lvN4n
         hvJqgxdHIGBo7YZZ1FOG4iQIogRO5/9xY1d5MVZFqEOm/GllEf0nppI1wjJh5huG0N
         pMmopwBKgqUFA==
Received: by mail-ej1-f70.google.com with SMTP id p25-20020a170906b219b02905a698022dbaso1502521ejz.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Aug 2021 00:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FkL9np5HE5mawBpGWfUQVMs1Jp3nZ1r2uXir2/3ncE4=;
        b=Ov7044ta36Pay5ftElwFzQta4q8NKia//2gPC7ACHNkFZamHtPNvunX29qpYOsnJJ+
         NtrvPjaVVSv97YLvKRtAVuwBd4E9/9PqVo4L9eK6PYIapo3s2oSARSnRvaaEFZqslulg
         QrRXAPJzxvJ3+A18kxsghLcQ4DGvOUbm7PS8pMOuaz29Jv3O41YSnAsWvPyqXC81umKh
         /ZoeldVxfl/ShTp0jTNGknIetIvDPtfJ/L4SevfKW5XOOeqgK6VjHg1GcKSskq7TbjwY
         T+i0JBrimyx+D57HvjegQafO1P8Zqi4RcoURZGCllGd5/mkTCBVn4RigFrGOA+JsKSd4
         xdSQ==
X-Gm-Message-State: AOAM533G9eS2+1JI5KorDMvsfiAdixfgkuydMDMvxgiugyS3oohpZptz
        WYmA55FQW4lED6lGXPAZeXsb4F/ctdBEqPqv61vxkMPpTzd8UhmJHHelDYUXqgA9KAnbnpuu1Qy
        aa/4EfwSH+xVnrHbjI3i6oFWixd+hsbJ1wZoL2K2aQvALJEl3
X-Received: by 2002:aa7:c68e:: with SMTP id n14mr4845832edq.66.1628149008741;
        Thu, 05 Aug 2021 00:36:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNcrJVCuj4cNRpvfe7GyxnsvAMJjkp36MUOe1r9B6do8nVXIxKRiZrUJlh02P0wyiqgg+kpw==
X-Received: by 2002:aa7:c68e:: with SMTP id n14mr4845805edq.66.1628149008579;
        Thu, 05 Aug 2021 00:36:48 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id u4sm1403189eje.81.2021.08.05.00.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 00:36:48 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
 range on Exynos7
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Marc Zyngier <maz@kernel.org>
References: <20210805072110.4730-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b0d6ff2a-24af-96c1-62a1-8b920c63e05a@canonical.com>
Date:   Thu, 5 Aug 2021 09:36:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805072110.4730-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/08/2021 09:21, Krzysztof Kozlowski wrote:
> The GIC-400 CPU interfaces address range is defined as 0x2000-0x3FFF (by
> ARM).
> 

I underestimated the issue - this is actually bug as there is a GICC_DIR
register at offset 0x1000. Therefore:

Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")

> Reported-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index 8b06397ba6e7..c73a597ca66e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -137,7 +137,7 @@ gic: interrupt-controller@11001000 {
>  			#address-cells = <0>;
>  			interrupt-controller;
>  			reg =	<0x11001000 0x1000>,
> -				<0x11002000 0x1000>,
> +				<0x11002000 0x2000>,
>  				<0x11004000 0x2000>,
>  				<0x11006000 0x2000>;
>  		};
> 


Best regards,
Krzysztof
