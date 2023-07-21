Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD52EB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jul 2023 07:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjGUHer (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jul 2023 03:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjGUHep (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2023 03:34:45 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD18319B6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jul 2023 00:34:43 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso13514915e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jul 2023 00:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689924882; x=1690529682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2Eey66acd2jYSksTo6JIEFe6jkP5WZsbd4TIO3og64=;
        b=z301tzIOXGX6F6eYrBWz4edbxOvAxRPikB9z4YdNFWi/mFKVEGMk+DWX4ruVw5fd1k
         vlp1lIWQH1FMGTeIQpmtZEzOnUAfsdQODO09tsxbRqxy7Yd2Ng3MTzoHVvqXUPlD/7X3
         LA7Q5O1EyhbqF/ZW0QqUaiymqYkfSjXwHX5t2X5YAX5K1kYec54v89Nk7llmtYuV6Qlh
         wwoNYJF4Nt4Q3p1z059bJYGkJiMu7MnGRrY5gqedHUSjPUcH928kA3VmPhnwbcqsDIXv
         nhc9S4xibdGxFQeUuyMRsvKfTAXvv8gd04Nobyk1uQ31WUpjZKu0R2SdUq7SeaCs5qnm
         PLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689924882; x=1690529682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2Eey66acd2jYSksTo6JIEFe6jkP5WZsbd4TIO3og64=;
        b=grxiRo+Q5bJv1xX8IalMUKnKzEqbhGF2Kg26Eq5zWs4LSg1n9JLJaWuMee4Y1YqKJ+
         KoAGdIE9xyMip3F8AYzJn6LLu2mIziOGsgxX4Wt6zuzyCE3Y7xGgUSP33lVsdKbQW+TH
         yF6By+pyp3CgAjl1K7qAhCyhxrBrWm5qBypKU18fuEYOuufjZHFLAwuzhHr6JS6Al/d6
         UMRHCpZfwZdScjjcUYKPdil7QYSqlQKkLRgEeX4oParKmTgJCfwXgZP4+aIgeqseQTY0
         /pLJ3lkbo/R0q1FldFR04a8kD8TD6lB4VWa7QCQls2YT9R8hIBY0tY6ptZGeC6kZ8xEn
         206A==
X-Gm-Message-State: ABy/qLasr0qNlLgfbp6YeQPAaxHmB0aqVdrvm7PKK5O58cXWqEaQL+Qq
        iYgJv2wauZyrkxrrGtigzo1a3Q==
X-Google-Smtp-Source: APBJJlG+aEa1DNxanPsy99y0PcovGXg2DThCPtBsT59f4TOkChJND8YQpHArb7e+hWWwjwBbTA30Ew==
X-Received: by 2002:a05:600c:11cd:b0:3fc:e7d:ca57 with SMTP id b13-20020a05600c11cd00b003fc0e7dca57mr668391wmi.2.1689924882242;
        Fri, 21 Jul 2023 00:34:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a5-20020a05600c224500b003fbc9b9699dsm2834895wmm.45.2023.07.21.00.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 00:34:41 -0700 (PDT)
Message-ID: <3a912702-45be-2b79-a4e4-01381ac1120d@linaro.org>
Date:   Fri, 21 Jul 2023 09:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/2] dt-bindings: pwm: samsung: add exynosautov9
 compatible
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230718062200.79306-1-jaewon02.kim@samsung.com>
 <CGME20230718062724epcas2p4c5e986c62fba72f722a37973e721a452@epcas2p4.samsung.com>
 <20230718062200.79306-2-jaewon02.kim@samsung.com> <ZLlZZyR19tQUfsx-@orome>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZLlZZyR19tQUfsx-@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/07/2023 17:57, Thierry Reding wrote:
> On Tue, Jul 18, 2023 at 03:21:59PM +0900, Jaewon Kim wrote:
>> Add samsung,exynosautov9-pwm compatible string to binding document.
>>
>> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/pwm/pwm-samsung.yaml    | 17 +++++++++++------
>>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> Kryzsztof,
> 
> do you want to pick this up along with the DT change? If so:
> 
> Acked-by: Thierry Reding <thierry.reding@gmail.com>
> 
> Let me know if you prefer for this to go through the PWM tree.

I already applied it and sent a confirmation of that.

Best regards,
Krzysztof

