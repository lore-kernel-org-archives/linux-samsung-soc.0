Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B77C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 07:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiDHHTs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 03:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiDHHTr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 03:19:47 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0429921DF1E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 00:17:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id dr20so15418284ejc.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0n61blmIAkKQaBF3fgsPecQx9lDeya+dROG3fR+36zM=;
        b=rDO9wCF+y70cv/4I1pJUnF98waE70HN2mn7xOtAJ9/6tJr21SWhOZql1eQ2iIIAceV
         SouBBS6HQQvDLfzFgnyLqOzIVFl74VSfOqOqLJcXsV/b5g3OJxI6OSGuxKFVvxboDHuU
         dfcG7kxNFAm5pcNpnO+IOiXjDVjG73fGtM9xmBqIFuuPVrhbHvI7AQm8L0ota6qOyL3x
         /3tWERQE7Ufrx//4MJWfnvyL49HaAS3AHb9RPVKBBLG8uBkomK6Ky0gFcm8h8w6I6CK4
         l+cO5AMMgSgJhqe8hB6QpRdhcHJ/zsDOfoSawHbFzY8fLYM2K/+TyRlRhoTe6sVTxkYB
         Gg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0n61blmIAkKQaBF3fgsPecQx9lDeya+dROG3fR+36zM=;
        b=UFTTU7qdqtCCzQutVVOq8t+tGxndPYOmzC2bKBSjS5nIsI0xTQ5etER8x9DHVEt/QP
         r3VO7M3ey6r4rm9mAW0h/ijwUCWrY2/18hl2gm0U2CgGZ0reUylhYAm/Fs7wnpP/0Y9B
         rhJF890gniEUfi5CRRYQHD4MDodwonVn5cjYKdNEMv+7wzxZkxA7cvoLVYacQdLX0S3r
         LRMRXnOQHpiUBVg9XK6t8FVBokY2XV4T1Z0SRiw6/YFsCyvegcfVJ6cKciVhBtSVoeCE
         S0hfCr+9WhLDjijUNxMZvE+xgBMNjL0cVmk3so6GfPm0r3OTqh2hiqDamwse46Dweqof
         NphQ==
X-Gm-Message-State: AOAM532Zep+NCwS6q8P/cyXrjtm37XPxLEvyRV2WXS8F6naVZRimk0A9
        BWsCUSyWobCJCC2TjJZymBnMHPIZ7DBQgMcA
X-Google-Smtp-Source: ABdhPJxnIy7zF7uE8xRHZ/boIh9E4X89WLB9SMQMnABLEB9K24hPdos6iUbx2cmBnQl1AWhRIsKFYA==
X-Received: by 2002:a17:906:434e:b0:6d0:ed9c:68bc with SMTP id z14-20020a170906434e00b006d0ed9c68bcmr16390976ejm.70.1649402262518;
        Fri, 08 Apr 2022 00:17:42 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bl24-20020a170906c25800b006e809b6bf89sm3720393ejb.221.2022.04.08.00.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 00:17:42 -0700 (PDT)
Message-ID: <9d6ba801-6ad1-80aa-a92a-bfc06c1cf1df@linaro.org>
Date:   Fri, 8 Apr 2022 09:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/4] clocksource/drivers/exynos_mct: Support frc-shared
 property
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
References: <20220407074432.424578-1-vincent.whitchurch@axis.com>
 <20220407074432.424578-3-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407074432.424578-3-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 09:44, Vincent Whitchurch wrote:
> When the FRC is shared with another main processor, the other processor
> is assumed to have started it and this processor should not write to the
> global registers.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v3:
>     - Split FRC sharing handling from local timer indices handling
>     - Remove addition of global variable.
> 
>  drivers/clocksource/exynos_mct.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Looks correct and I hope it works correct. :) I did not test it though.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
