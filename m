Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B921ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 15:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiJXPVQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiJXPUz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 11:20:55 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C299C0997
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:04:15 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id x66so7955551vsb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Vr0nqHCGrm+b68s/C4QPay7OOdjkPPEqnfDL2I3xZ0=;
        b=A1zile5aaiGOv1/6LYGIIS7rWZdNf/REZ+C9UBtfg9OfpCOGjXnhycbBfjdSe0JOyu
         v5qzJjdxIPLQzNoFIOLcH8aiLZMksx3Tj6Nur9hpg9fEaWvP7WH1gT5ar8GPUQpgA5lJ
         DioVkGo5QA/KPc7eezM0ezSfhiofM6Pb9FiueqjTZj7jQ/qNViyLM0EuJoUXoo8FQbGG
         N7zpmFdBC9U18lnuezv9+We3fEpYv6ZvxzaOMEglGMbyGuOucIIcEoZ1vQEwbdbY0HRA
         4C9EJiEr8dTf62+r9YQ3C5gn+n6uMmjDlqJSHPRWR60LM6ro/3Du7SUX9hoCoCevjEWv
         qhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Vr0nqHCGrm+b68s/C4QPay7OOdjkPPEqnfDL2I3xZ0=;
        b=t8AcuEcrb14WOnF92+x5a5igYkCD/luDK9psc0SykJi5/OkdVRhNtsAMmriva6Oq8+
         2eazDKnCdpBdKnxgQhRrk7sVyqorAprWG46ZfQlhuBHzkAb0TnOYiHY2/mw+DZsBagGz
         +brd/LmIijvJl4h2LOXbaKZGTpL6s7+vEuwbPoZaXSM3l8nQDFN52cv4iApQ4y2A41qe
         TPHIXvl40ZISld7l96d/tFUQ67BA+4drrlCyoJjhJHmc/hvlXglpw8Enmc8rhEnv2YSq
         ANCid7lH8zU1scWGZOwEBLI3UId0GNuRb6lwRnRIg3+t65QwWkwX4YgFlZ1YuMTUxu07
         5NLg==
X-Gm-Message-State: ACrzQf1n+geBnVnMHlcXPcNzYDs7l9oIameGoPH1Rs6MbI0TegMk5aO7
        4JyGx5ORTBWP2mbPWg/CnnAb2rcz3utucw==
X-Google-Smtp-Source: AMsMyM5X+kIBxudaeRFmJTdkoXGBmNzB+x8RZi8q9kq8BLojbo3cknAZE5oULo3K676hCYZUJgRcwQ==
X-Received: by 2002:a0c:9151:0:b0:4b1:8375:46d3 with SMTP id q75-20020a0c9151000000b004b1837546d3mr28530283qvq.122.1666618142903;
        Mon, 24 Oct 2022 06:29:02 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id cn15-20020a05622a248f00b0034305a91aaesm12586522qtb.83.2022.10.24.06.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:29:02 -0700 (PDT)
Message-ID: <a7693e48-f16f-9577-8685-417f21706d1b@linaro.org>
Date:   Mon, 24 Oct 2022 09:29:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] pinctrl: samsung: remove variable pin
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024131527.2156810-1-colin.i.king@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024131527.2156810-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/10/2022 09:15, Colin Ian King wrote:
> Variable pin is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks for the patch. The file is being in process of dropping (patchset
is being reviewed), so I think we can skip all the fixes.

Best regards,
Krzysztof

