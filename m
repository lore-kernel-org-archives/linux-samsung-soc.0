Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91928C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Apr 2022 15:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbiDIPDx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Apr 2022 11:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiDIPDw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Apr 2022 11:03:52 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609DE1CABD2
        for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Apr 2022 08:01:45 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bh17so22585576ejb.8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Apr 2022 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GAVKFfoN1smkTBfHuiv+rPrgn6yKY4TRawWyMs8Tm3s=;
        b=LUChvBF5Bl+EwTgMb0sE/WwqbwWfGQYeB0/52i6GIF0nM5+4JAQxzzY0eStwBdDBid
         Ju0i/Y8eArrgAkO6XOJ/m10hc4zZYBg6ou1fKYtcubUGahBhNULDQ8hqPj+W1LWsz8Il
         epGqAi/rTC2U1bfUnojiIY0n9dcuFpPiG0MD47sZQ90VnXRU7x4sVCTtxaV9zKPssSpt
         Y+10jxEM+ZPtYhSu7JNrFBqiJ8SGl/WtuPrVdGHT5fXi3DtWmWx7htfkOoxl/kx95c4Y
         PQ6US59AnI1dLE1hmT2eI1e8UbDYdqRFk9p4X7KyMz/jMhoPcro9REJ8yudJaSljTsy1
         rTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GAVKFfoN1smkTBfHuiv+rPrgn6yKY4TRawWyMs8Tm3s=;
        b=H0IF2lL3Oa54pZ+v1RwiuN32+uZ/G/eCWgKGEStITUTEr2Wlt3sL0GxEChxOUYQHJE
         DZvQVGD5p1xs76JiahWi1TuIG0pSLNXhjSeHz/uy7TMGtMM/JtOndoQ1bftJGYlE44Eu
         meS9vOw+LvkRS8aecFhT7yxBXHYQ0PNuuTnlHOW5+3bWNJMVQNYJB3UCnUXlmznrjvIx
         qDgTgHiTD1+vewfiaz0GVd5E6IsqqVgBTjgRvw3ph5hKtS9rkNMV/c2DcedMm3kZFqPG
         7RvxFMuhbS9GdcC5u2Mzaemb2QLwBQOgE9wQgP5ckd80y7B8GlWBHvFPv+YKOB/w5gCx
         0f/Q==
X-Gm-Message-State: AOAM531qAEB7tu2rJIf48p7L/oHrK/1PxJQmup7AUcztkXHEeEOhlqxB
        uTfsddDbjjjyPHFhNbgx3ZMJOw==
X-Google-Smtp-Source: ABdhPJyLIhJWnK5HW8vBG47SFii8DTWXtKOq5yxrrxlBiVtVwcCxSbXmzsZ6j/Zfk2sklkRPbTBGFA==
X-Received: by 2002:a17:907:e8d:b0:6e0:19e7:9549 with SMTP id ho13-20020a1709070e8d00b006e019e79549mr23299158ejc.44.1649516503982;
        Sat, 09 Apr 2022 08:01:43 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id et21-20020a170907295500b006e7f1abe2ccsm6623482ejc.75.2022.04.09.08.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 08:01:43 -0700 (PDT)
Message-ID: <364b4ce1-5160-0f48-9d4c-ab8f7f6cc1b6@linaro.org>
Date:   Sat, 9 Apr 2022 17:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] pwm: pwm-samsung: trigger manual update on 100% duty
Content-Language: en-US
To:     =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-samsung-soc@vger.kernel.org
References: <20220409134005.GA12218@adroid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220409134005.GA12218@adroid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/04/2022 15:40, Martin Jücker wrote:
> Hello,
> 
> I have some trouble with a pwm backlight in the p4note and I'm not sure
> what the cause is. The problem is with setting the backlight brightness
> to its maximum value, which will actually turn off the display. All the
> other values seem to be working just fine.

A bit similar issues was fixed by Mårten (5d82e661398e ("pwm:
pwm-samsung: Trigger manual update when disabling PWM")
). I assume you test on a tree having that commit.

> 
> Looking at the documentation for the pwm driver in the exynos4412
> manual, I found that for pwm, the higher the tcmp value, the lower the
> pwm value is. Enabling debug logging, this seems to be exactly what's
> happening for values below 100% duty, but when the duty reaches 100%,
> the tcmp is zero and then gets decreased which causes it to wrap around.
> Looking at the rest of the code, this seems to be expected behaviour and
> I would assume that it should cause the pwm to never switch the value
> from high to low which would also fit.

I miss here some details.

The tcmp=-1 is written to registers for the next duty cycle. When
current duty cycle finishes, this new tcmp=-1 should be loaded into the PWM.

It seems that this loading does not happen in your case. Correct?

I tried this on Odroid HC1 and works correctly:
duty_ns=2000000, period_ns=2000000
tin_ns=240
tcmp=4294967295
tcnt=8332

What values do you have? How can I reproduce your case?

Best regards,
Krzysztof
