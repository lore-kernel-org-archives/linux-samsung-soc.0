Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED19C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Dec 2021 17:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbhLLRuL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Dec 2021 12:50:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48000
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229990AbhLLRuJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Dec 2021 12:50:09 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DD33C4003A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Dec 2021 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639331407;
        bh=WCCvwpT22jrWbgMHRE3RsRLnwwEuukRNrzKAgDnW7I4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Z6PYwsJjDE0HyuJJb27t+MZbrAnbADY4Gjl3/vTRi2tn9htuxZCDyOUfmibrGPAyr
         H82EXeWQn0BUBaDYdt/sBhStMB4qNz5l6/yGyWi/qqfIII7WxM0OUmbo77OXhi/Hwe
         lFis7Tmlel1wiEFw64ld5ZiMqFOsdMRemVhc+ch/PKDZoOxHOAVx1Qa4ny/kC4MiXJ
         +WJA3RmDCTHzHSa0V2uvKTOiNDoFUwPNiJFLc9+Lye4heU5GQp92/nLxXkPWUIUYDJ
         xgojAn4iaktH0Z14tXsloWhVaxxR1msls+6HZB1vyVWRBaM3rQ0jjp5c2PeobLLiNz
         oshwUAmPIzAfQ==
Received: by mail-lf1-f69.google.com with SMTP id q13-20020a19f20d000000b0041fcb65b6c7so4208972lfh.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Dec 2021 09:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WCCvwpT22jrWbgMHRE3RsRLnwwEuukRNrzKAgDnW7I4=;
        b=VoLyvWAFw/VX53AcRUTl5/RlTQ0GFpUrPi0pT2MuaxU/HXprwoKQd7g8x9yDdsOfps
         E8HHW0VCJWK3S8h1PSwaPYpWZBq7yY97tjwGvqjjjBdh6k0+KDZnUHTDoXcQx/q1Zmkh
         1A+bML6M+pgFtAd/s6/p+rc0+8FiQcPIMeWMuNtr8g8L+dBwTJVCxGl4EfDUSrSXhQiB
         mr9nnim86rNl60rW6yIyMTCfNXl99B3jGmyMrpcKI0J2otpddMyVSH6MLupGQgJzpmef
         PSuxHkj86/rVlk7ulY5FcmthL7t81th2n1XiRjgDEB7fU5A3siIEmJECG4dssZKUReXg
         caQA==
X-Gm-Message-State: AOAM533ymmZ6jT3R26A/53uLf+Xo8qd1QdSbg02Bw7mqg3iwnI2gwi+/
        47ezCmxbqnDMdycGLIW15E09i9b38jO/95Zedun8uJkiY80c2JHRkNkWCMA1WCh1+Ii7wUP6bpB
        HneDYjCAWUKzUjyKKiaD5Y7bHK1dGhtKRnC8Vz7eI4nQrmySf
X-Received: by 2002:a05:6512:2820:: with SMTP id cf32mr24881729lfb.510.1639331407210;
        Sun, 12 Dec 2021 09:50:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUu1cZVv3akhdYGI1KReu7wig7sZszq46hRcYvBeAwNUtzmKOFPO3wTQxMzJmtsBvtBD/ddg==
X-Received: by 2002:a05:6512:2820:: with SMTP id cf32mr24881715lfb.510.1639331407044;
        Sun, 12 Dec 2021 09:50:07 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u7sm1135220lja.58.2021.12.12.09.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 09:50:06 -0800 (PST)
Message-ID: <b618ff5b-ee41-2c29-5074-24fd4d0f0933@canonical.com>
Date:   Sun, 12 Dec 2021 18:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] watchdog: s3c2410: Fix getting the optional clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211212170247.30646-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211212170247.30646-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/12/2021 18:02, Sam Protsenko wrote:
> "watchdog_src" clock is optional and may not be present for some SoCs
> supported by this driver. Nevertheless, in case the clock is provided
> but some error happens during its getting, that error should be handled
> properly. Use devm_clk_get_optional() API for that. Also report possible
> errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> clock provider is not ready by the time WDT probe function is executed).
> 
> Fixes: a4f3dc8d5fbc ("watchdog: s3c2410: Support separate source clock")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
