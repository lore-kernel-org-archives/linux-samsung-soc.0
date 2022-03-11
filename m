Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231BBC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Mar 2022 10:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiCKKn4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Mar 2022 05:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiCKKnz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 05:43:55 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B186A028
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Mar 2022 02:42:52 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 828CF3F321
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Mar 2022 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646995371;
        bh=x4TvzHF8QuKQ3/zOGOuqHkYTzalnGKY2B97/GSUfpsM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=wKY4ijq178WgQSNw1eeE0nkeDM3zj7C5WU4Z4yRwb0qCIaD1FVcGcjC18vwATPhw+
         VN+tNKKNjslf6OZ1LqfEXQ25w85F4M2T9RprutHcmXZ+44gzJpgxcRPTREHgpNTkL3
         EHOpAGr0mNAQwQEqClu5Y73hztZZLq/sl2UdrDAKjHfyydiA6/sf+ZznUkbWCaOADh
         3Bdamcmx5yujKhoUaY3YpghflcahiFeFDofFlMHNC4sNtktKwKbkyIrphn/Yrra5LB
         yhUo/hbvwd4ZGUn/YUG8o4bkEeiiG6Z3YzqaMQ4OR5c1e4dRfUub+016lLi/6dH+/A
         O88Z6tkjMSpbg==
Received: by mail-ed1-f71.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso4665773edh.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Mar 2022 02:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x4TvzHF8QuKQ3/zOGOuqHkYTzalnGKY2B97/GSUfpsM=;
        b=iOR94h7qu1TNtaZMTfbIbzNbn21odQ8HlLaSQEw/pMnzyptPGpZ4C60Bz3Tz9tog+g
         wHISD24SH9QTIrfgWGKTH+pi6SMrVgxd8AiJEpWZqQxAJZhaTfT9ROaK/xEulmoiJrYB
         adNklr47gys5BeL1QCxDEwLaYD2WstsE/feGZVOf6I9um8bRi1zRqhPwDrUNClndr69I
         vNG6q46p+CVh/dvke+5mteerUaF6VoGgcXYeqs4VzPJVimfFRAWmTMfclvUqfQBaFf0l
         NoHYNiAutwUBbSiACTv6EQ9O2N8L/ffswHyS2J3IsXFbL1xl1T4a7/NRG7SWiKAMX+vm
         4xdQ==
X-Gm-Message-State: AOAM531ccGG6GZA0nsmRk+z587BRGqZO0h6JNBfQe0UZ9QC9GdTDNpv6
        LGWFfq8iiotSBKwPJWeMMiBFt2u8SjTbRfBVQMmKJTjuEllYXo11dsYrkBpCcgltmpAxmmI3cSk
        VmaiK9gBTmSmeLI71g09X3W2fEtpNIjzSUZ76SYARuM+hREHr
X-Received: by 2002:a05:6402:4301:b0:415:b73f:1b48 with SMTP id m1-20020a056402430100b00415b73f1b48mr8164296edc.39.1646995370722;
        Fri, 11 Mar 2022 02:42:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5gHHbbJP79tXVqgVSmziJdzb2BPwQmpwOBIR/Tn9dJGGxL7wDFb7JWGH8AKhMGqStoPQB7g==
X-Received: by 2002:a05:6402:4301:b0:415:b73f:1b48 with SMTP id m1-20020a056402430100b00415b73f1b48mr8164284edc.39.1646995370567;
        Fri, 11 Mar 2022 02:42:50 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id b10-20020a056402278a00b00415b20902a6sm3272872ede.27.2022.03.11.02.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 02:42:49 -0800 (PST)
Message-ID: <ad94136d-f651-7e6e-b3ec-94553c4c6d3b@canonical.com>
Date:   Fri, 11 Mar 2022 11:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] tty: serial: samsung: Add ARTPEC-8 support
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        alim.akhtar@samsung.com
References: <20220311094515.3223023-1-vincent.whitchurch@axis.com>
 <20220311094515.3223023-3-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311094515.3223023-3-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/03/2022 10:45, Vincent Whitchurch wrote:
> Add support for the UART block on the ARTPEC-8 SoC.  This is closely
> related to the variants used on the Exynos chips.  The register layout
> is identical to Exynos850 et al but the fifo size is different (64 bytes
> in each direction for all instances).
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v2:
>     - Added Krzysztof's Reviewed-by.
>     - Expanded commit message
>     - Fixed fifo size
>     - Rebased on top of Krzysztof's "minor fixes/cleanups" series.  This needed a
>       couple of fixes for build errors.
>     
>     (I'm always unsure if Reviewed-by should be carried over or not if the fixes
>     are minor.  I apologize in advance if carring it over was the wrong thing to do
>     in this case.)

For minor fixes, usually we carry Rb tag over. It's fine.

LGTM

Best regards,
Krzysztof
