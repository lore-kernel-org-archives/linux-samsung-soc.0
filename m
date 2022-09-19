Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DACECAAD3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Sep 2022 09:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiISJnV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiISJnU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 05:43:20 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE7D21277
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Sep 2022 02:43:18 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x29so934590ljq.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Sep 2022 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=PcJLJgBrnPMXsGzjXkPY7Pb1M0P65ee6QbjyYcCY3xQ=;
        b=atIaslZfr7a2dG6dY4McyfmKlTdPK8wfvhBhS5rWv/98HRPJw/1AwMp+fkCG/PjSLc
         RXcNQZBO/gZE2dT3wsIRIgZOQliqzguckcp1vAng7kUVGfQoGmn6/sh3vU38gDdvXt4J
         9VaKr7oTuPW3tawyEmRanRpqSvuEq6fCU5s1pYKgmjTQ4Fa7Xxx8Uv1e5Gn8O4UXalR9
         rqDgnqHfmGDz17merzTzYJ6s1Bb1i7bRJOK60QkuZPWF5A3bElzmcXSrdyvzYT4lmOzV
         +HRVVjLLkIS83wjwpm8L8LRjMqNs7WFzAGqaOREh4Vtv8eKvcsHgdTMzY2Ec1qBZ2bGz
         Xtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=PcJLJgBrnPMXsGzjXkPY7Pb1M0P65ee6QbjyYcCY3xQ=;
        b=MAueGvt+9Eg3PxVLoT8WSnCK/SAKMjApES0rZPCKYyw6Rrp1tTVseSJGIRk7JcCyDl
         KfpJ5X8TLmU+PqOK4V3jqdgLIDOEl2HCyNeC1Qb+LbOsyHZdmyLhjpmNejjx9VQllAEu
         9FlzhhNEF9PM079YrkY3mig5JVmtkGLyO8s+e2HeO6ZqZxNM/4Pb4KYVYMMXBlQztCEo
         NThKzkRINVuVX9Sw5XZcYiHJmrQivR5HCiAo/0GySdSVxbjRGBTZksHu2bo7oocPXQ6X
         o1i04Pd6UE79zfERNQ6j0SWXBsjJimxIPbZAX54GIRmKu/3smS++9reXc4qcyKwJUNxq
         q5LA==
X-Gm-Message-State: ACrzQf0KH0O4SywMi4CPBnTVbymUPJSxWih1Ay536npxpdkFNrSobojG
        w1FgnOiV0+0jtb2UbKdxdO1dKw==
X-Google-Smtp-Source: AMsMyM5+Rdc98PpTnnewnK3sHZtYQPHsqQbH/8xSabXXuoP63eF5UntgK3joCznaglllNZ7LiWVEWw==
X-Received: by 2002:a2e:988a:0:b0:26c:171f:1ecb with SMTP id b10-20020a2e988a000000b0026c171f1ecbmr4632926ljj.105.1663580597222;
        Mon, 19 Sep 2022 02:43:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g5-20020a19ee05000000b004886508ca5csm5117935lfb.68.2022.09.19.02.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:43:16 -0700 (PDT)
Message-ID: <2ace1136-25e0-ef6b-8960-29fbc7050e22@linaro.org>
Date:   Mon, 19 Sep 2022 11:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] spi: s3c64xx: Fix large transfers with DMA
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        broonie@kernel.org, andi@etezian.org
Cc:     kernel@axis.com, alim.akhtar@samsung.com,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220916113951.228398-1-vincent.whitchurch@axis.com>
 <20220916113951.228398-5-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916113951.228398-5-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/09/2022 13:39, Vincent Whitchurch wrote:
> The COUNT_VALUE in the PACKET_CNT register is 16-bit so the maximum
> value is 65535.  Asking the driver to transfer a larger size currently
> leads to the DMA transfer timing out.  Fix this by splitting the
> transfer as needed.
> 
> With this, the len>64 KiB tests in spi-loopback-test pass.
> 
> (Note that len==64 KiB tests work even without this patch for some reason.
>  The driver programs 0 to the COUNT_VALUE field in that case, but it's
>  unclear if it's by design, since the hardware documentation doesn't say
>  anything about the behaviour when COUNT_VALUE == 0, so play it safe and
>  split at 65535.)
> 
> Fixes: 230d42d422e7b69 ("spi: Add s3c64xx SPI Controller driver")
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
