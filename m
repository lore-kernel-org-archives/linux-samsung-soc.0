Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6536ECAAD3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Sep 2022 09:08:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiIGJIN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Sep 2022 05:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbiIGJIJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2022 05:08:09 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B444282D1C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Sep 2022 02:08:07 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id az27so19310266wrb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Sep 2022 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=B275jAGAjsruLbAUf0SkNhxrL4LXUibL4NlLqbAbUp8=;
        b=liO6e2vmJgh++f275BD88zr4h+Az/nRmBOkBdfidE0HOnhZxihM/w8hFZRVvSU698n
         ugxIxrR1ibCziZS8EM3p0B7Y5znntT5e1nlxiFI6zk6WSl42ifGjifa9Ta1LukrNRAn0
         Jtf3hzN4I3DAJExwNUDVyo8h6aUXpqb4nJDcy5PVQ7k+T6H10XLDkMto9tah0DJTCdx8
         8b8xB1c5/G+wManUmaRc1TV0HXHs5TqoMlxfIWDPWgly6PjQ5lTf56GjXPWQmEgAJdS6
         CHOPX3Hk7p2gtkabKdbm3uW0Ei6xJ7wyHXBgaY+T4bFvDI1amWdM5RzRhd/yvsWl44Og
         lXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=B275jAGAjsruLbAUf0SkNhxrL4LXUibL4NlLqbAbUp8=;
        b=yCRHI+1dTmV4LyXBtPCQ6weKbVUy80kwJSnZNBQx6hyC4SUWW4jgpc3fu70quZ0sfu
         zgi7a2YT495N2Nq1+svHB4QsR10VNqhxSQvjXRDHXMR3N8p/VakvMEwYH/e4u+zwZ16S
         HlbN75TsgMFiQ0KIbOp9oHOjLmBvlcThBU54bWMIMRnIGDdxKZLtkMubNO1DjqfwLbex
         oqAcR9FWAhUCjcY8NpdJJz88cagcJsTkWtvSPPI6Eq8WoaHi8juZsSZoI6jnbOCuLQpE
         ZNgpp9XKCFXiWQGFelVnMeeNRd/bv+iHkZAHWqUVAV+U4BxVzK2u9o31dQYipftByv+m
         sWDA==
X-Gm-Message-State: ACgBeo1nH71D4XRFiAUr9YAgX48V58WSnHITff/100pdKukOPaNeU00I
        Z+t/aRayT33ymYUfzZUMERj40xEiFc3aSQ==
X-Google-Smtp-Source: AA6agR5dCwSp23P2wNAnIzmJE5NU9OkAIfvl0GHL1KkJH9wpgfUrmpbjTnQ6kDCgoGdmrRWL5Xz5Lw==
X-Received: by 2002:a5d:4405:0:b0:228:dab2:d900 with SMTP id z5-20020a5d4405000000b00228dab2d900mr1437207wrq.502.1662541685984;
        Wed, 07 Sep 2022 02:08:05 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e13-20020a5d65cd000000b00228d6bc8450sm8104712wrw.108.2022.09.07.02.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 02:08:05 -0700 (PDT)
Message-ID: <bdaf1340-d657-9f38-f14c-a35fe1f72bb0@linaro.org>
Date:   Wed, 7 Sep 2022 11:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/4] clocksource: Add MCT support for ARTPEC-8
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        krzysztof.kozlowski@linaro.org, tglx@linutronix.de
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
References: <20220609112738.359385-1-vincent.whitchurch@axis.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220609112738.359385-1-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/06/2022 13:27, Vincent Whitchurch wrote:
> This series add supports for the timer block on ARTPEC-8.  The block itself is
> fully compatible with the existing exynos4210-mct driver.  The ARTPEC-8 SoC
> uses this block from two separate processors running Linux (AMP) so it needs
> some extra code to allow this sharing.

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
