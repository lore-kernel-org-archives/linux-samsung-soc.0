Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3B3C77B7D
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 May 2023 17:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbjEMRhk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 13 May 2023 13:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjEMRhj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 May 2023 13:37:39 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A963612C
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 10:37:37 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-965c3f9af2aso1698930166b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 10:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683999456; x=1686591456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phEaoLqXnuHVjhKK/074Q+ATg9GGDFAIHK3RaliX/xs=;
        b=evSV/R5ffLjVwauCYY48D1u+m+e/VX17IimUCeC218UBpgANY/+ME4eqapH7Yj1bTq
         xOvbH10IfQYFcEFSpJA/qOGU+H1S+s9SJXp1ym6ZMvaC8bGppNn/tOLlS+eQXhtabKOq
         ZZiowXQeo7lgL3OsiH2dkUtArpkqSZLBAUQL4F2ivc78Q0SMMtkY1aXWZyWqvNoJoKQ8
         gX2TKhWmxEJTJ6omiYxBAL6Mtde07NztQGyu/SQD5kN20pM11pHSffzWQm3/D5zFs7hy
         DdxupsruO6PEYFIfy5VFVeMCgr0uXrYQ0woqBhW2ZrQH02iJ/hhztq/tQSCMWdik/m0b
         aPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683999456; x=1686591456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phEaoLqXnuHVjhKK/074Q+ATg9GGDFAIHK3RaliX/xs=;
        b=boC/b7Eg37wc3XFxrymnD8S1FRxMst9oAYw94cgPjFTn919Eq+03q98PBqndATq0x1
         mLF7jnA8G//ulhhU6Kc3roEjgklcz3W1NCku4u37IpwdvkiTrcnUJ7jp41HTBMlT8ZJ+
         khvPzXrdR9mTIiDKEsP8OsBwELpnqPdxS4Hk3QCmQImOhQlxBkjmeDMAqpncPvAUSP9P
         03obRjTGeQbJYeTZaoJNA7rYGorfM8OTFIOG5MpPn83UoVfwkRT3TQ9nF3n+rwv5IJpD
         p7pLxaxa8kD5WjjG6LT3z6keLgZbU52xrTzW8XBttkeSCMERB62IIoyX3Gkk2mXr+Pxf
         OmOw==
X-Gm-Message-State: AC+VfDyDGyKUSEoznK578cfBwBtFbwNXKz0kP/rlVDnkhcR7jBrMdJOK
        XiGWbhUcJ0M49ubZlumJ//riSg==
X-Google-Smtp-Source: ACHHUZ7Ff9s2f9f/z+N90bS59Y0tGzNori+ir7oCbpWhVrC2abp4fhHbcXH203MWt1UyD/1QZkhKsw==
X-Received: by 2002:a17:906:58c8:b0:966:168d:8c5 with SMTP id e8-20020a17090658c800b00966168d08c5mr24174817ejs.57.1683999456087;
        Sat, 13 May 2023 10:37:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bc2d:23f8:43c2:2aed? ([2a02:810d:15c0:828:bc2d:23f8:43c2:2aed])
        by smtp.gmail.com with ESMTPSA id jr18-20020a170906515200b00965f5d778e3sm7043541ejc.120.2023.05.13.10.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 10:37:35 -0700 (PDT)
Message-ID: <a65abc07-eace-eaa6-e821-2eed438e068b@linaro.org>
Date:   Sat, 13 May 2023 19:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: MAINTAINERS: drop Krzysztof Kozlowski from Samsung
 audio
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
        'Liam Girdwood' <lgirdwood@gmail.com>,
        'Mark Brown' <broonie@kernel.org>,
        'Jaroslav Kysela' <perex@perex.cz>,
        'Takashi Iwai' <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>,
        p.rajanbabu@samsung.com,
        =?UTF-8?B?J+2MkOy5tOymiCc=?= <pankaj.dubey@samsung.com>
References: <CGME20230513090242epcas5p34625f5b6f0a180263e6607a38e0c996f@epcas5p3.samsung.com>
 <20230513090228.4340-1-krzysztof.kozlowski@linaro.org>
 <000001d985a8$9fd3fb50$df7bf1f0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000001d985a8$9fd3fb50$df7bf1f0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/05/2023 16:38, Alim Akhtar wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Saturday, May 13, 2023 2:32 PM
>> To: linux-samsung-soc@vger.kernel.org; Sylwester Nawrocki
>> <s.nawrocki@samsung.com>; Liam Girdwood <lgirdwood@gmail.com>;
>> Mark Brown <broonie@kernel.org>; Jaroslav Kysela <perex@perex.cz>;
>> Takashi Iwai <tiwai@suse.com>; alsa-devel@alsa-project.org; linux-
>> kernel@vger.kernel.org
>> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Arnd Bergmann
>> <arnd@arndb.de>; Olof Johansson <olof@lixom.net>; Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org>
>> Subject: [PATCH] ASoC: MAINTAINERS: drop Krzysztof Kozlowski from
>> Samsung audio
>>
>> Remove Krzysztof Kozlowski from maintainer of Samsung SoC Audio drivers
>> and change the status to maintenance (no one is reality being paid for
>> looking at this).
>>
> Thank you! For your over the year’s contribution and support in
> maintaining and enhancing Samsung SoC Audio driver. Your input always helps
> and I hope that will continue in future as well.

Thanks! Although I did not contribute that much to the Samsung Audio
driver, but rather tried to keep it reviewed and in some shape.

> While at it, I know Padmanabhna (CCed) was recently doing and is working on
> I2S driver and Audio codec driver upstreaming to add support for some of
> the recent platforms. I will check with him if he has interest to take up
> this.

That would be great!

Best regards,
Krzysztof

