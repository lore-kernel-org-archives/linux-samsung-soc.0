Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC0DC77B61
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjDPKxV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Apr 2023 06:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjDPKxU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Apr 2023 06:53:20 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7C326A0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Apr 2023 03:53:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id xi5so56905692ejb.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Apr 2023 03:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681642397; x=1684234397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ouacL5jzwqdrqc6h6cItWvGdIc1UJBQ5F31zwjpSlE=;
        b=ySR9w98P8RnXzxDyjT5uqepX//GbkqEGw5tC571tl0ZdhTXPQQcvJP7AgNxP3neV9P
         TUrP0pJcjwpwNyjp6mpS6tPz2rTywKDvBijjxzSescmDF7HJHCwc8m2mStVWnb8TKbEE
         nu5SA27QGxsybnotK16UiRK5mGrc608EqMjJ6jxME5EtP3rb3yx8/WkZKy1AMRRkdvf7
         UtyMxDuCF32w7IRYMcYRULAceslZlfudSH6sxwzy88KJx/r2mjfWNoBFMfxwXIn4AVQs
         /OF4CSYzEyPpdE0bElp8yyr8ISlrXyZhbehmQ8O1MxpPKUtIdtUu19Mcm2kL8j92KFdh
         MkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681642397; x=1684234397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ouacL5jzwqdrqc6h6cItWvGdIc1UJBQ5F31zwjpSlE=;
        b=BsEompsjRh5d4d9iDbl3cmIIGOda4Ojsf/yeWeKYPVD5MQiYanf6RVD61sM6YnZ++O
         Wcy68L15ZZ+XM4cSd76Bxi4tq5bkGp1UUs45T56r6262BQF6pB1nP6TtFoG7OrFyORX0
         HmFPulL9zuo5S0TSdlTYCx4qM9GaV6suKAeX6dkSbPRJNpblLcsjQt9H3IDt7qdOo/O8
         boXR2gN2miMmY7ZflUj2nhjWv4fhpwxRybiNduSvgGVAf03TAtuFpD5cLGLkVa50LPl+
         ahD2CmKw49OvAtAD0LOYu4fL92U5HbhSLGyy4vdglkeonN0kx8V2eDJMZt2lDJ2L1xOi
         y4nQ==
X-Gm-Message-State: AAQBX9efgk1nnUo5K8wdh9njFbzquJPj3EeZsdCbBSvQQYU5CeuzK5kO
        fuyNL5vls+H6gwkVL04V7AwWBA==
X-Google-Smtp-Source: AKy350YiRHdtMmcT7j7PJPXYEMEyZ4e1Bw1LhCILnCce78Lp2xLtZeLuqXkwcSyY8+YlACLr4t7D3Q==
X-Received: by 2002:a17:906:f14f:b0:94a:171:83b1 with SMTP id gw15-20020a170906f14f00b0094a017183b1mr4650225ejb.2.1681642397392;
        Sun, 16 Apr 2023 03:53:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id qw24-20020a170906fcb800b009353066595csm4913522ejb.136.2023.04.16.03.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 03:53:17 -0700 (PDT)
Message-ID: <d0b2868f-cade-feb1-52cd-2aacd537c9c6@linaro.org>
Date:   Sun, 16 Apr 2023 12:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/12] Re-introduce Exynos4212 support and add Samsung
 Galaxy Tab 3 8.0 boards
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
 <3e513119-4d6a-18ec-aaec-1c6b2b7e35b4@gmail.com>
 <ba148e6c-1685-f6d4-458f-bbdf1dd674cf@linaro.org>
 <36287654-c6e6-f4bd-320c-866bef692d2f@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <36287654-c6e6-f4bd-320c-866bef692d2f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/04/2023 12:49, Artur Weber wrote:
> On 16/04/2023 12:34, Krzysztof Kozlowski wrote:
>> On 16/04/2023 12:26, Artur Weber wrote:
>>> On 16/04/2023 12:16, Artur Weber wrote:
>>>> This patches re-introduces the Exynos4212 platform and adds support
>>>> for the Samsung Galaxy Tab 3 8.0 series of tablets that uses it:
>>>>
>>>>    - Samsung Galaxy Tab 3 8.0 WiFi (SM-T310/lt01wifi)
>>>>    - Samsung Galaxy Tab 3 8.0 3G (SM-T311/lt013g)
>>>>    - Samsung Galaxy Tab 3 8.0 LTE (SM-T315/lt01lte)
>>>>
>>>> What works:
>>>>
>>>>    - Display and backlight
>>>>    - Touchscreen (without touchkeys)
>>>>    - GPIO buttons, hall sensor
>>>>    - WiFi and Bluetooth
>>>>    - USB, fuel gauge, charging (partial)
>>>>    - Accelerometer and magnetometer
>>>>    - WiFi model only: light sensor
>>>
>>> This patchset depends on "[PATCH 0/3] Add Samsung S6D7AA0 panel
>>> controller driver" for the display panel support for the Samsung Galaxy
>>> 3 8.0 boards.
>>
>> Why? DTS and ARM code cannot depend on driver changes. Please rework
>> your patchsets to remove any of such dependencies.
> 
> Ah, that makes sense. I'll re-send the patchset in a second with the 
> panel node removed.

I am sorry, I don't understand. Why would you remove anything from DTS?
Are bindings NAKed?

Best regards,
Krzysztof

