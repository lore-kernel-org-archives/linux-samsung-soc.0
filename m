Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C9FC46467
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Jan 2023 07:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjAPH4s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Jan 2023 02:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjAPH4n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 02:56:43 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FCC10AA6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jan 2023 23:56:40 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id vm8so66050708ejc.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jan 2023 23:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gvyOgN0Gv+9aZeDPI0iyOYcZNIneKqTYb4ORRQXR7c=;
        b=rBDrFUNgFpBENLm5kSuqnkbHktKp1W/JSHPkJG8x1mcgNb9zbfQzwykiwP7hn6Exnu
         wPIROLfu9bB/KOY0BfINggz/qVnWSWBbDK1tipAuCd0IVRXWWjNbiJ6mzK7FsbttFfWW
         6gidJvWAhVO5F6lPoJeLHIc/OlyWpVQKsJ/unTr91x0vRlZLBpuxcDkq7szT6QPAd8TA
         wJ7pJ3cIvubXBFEnR3Q937zXPv6gqggvpzWFMhgqmQNfVAONMxl9Dr3LrEnu6UIRAmDo
         jo1U06Xl6dNjma+Pm/zEtEt88KAt9XE5psNyq4U7PwJEo2Yi/anChwz5mUrVjwnF3+/y
         zNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gvyOgN0Gv+9aZeDPI0iyOYcZNIneKqTYb4ORRQXR7c=;
        b=wmKCt4D0OW7LWqvfB6cYKB40/lD3VIQFysFTEEnM0hzgx1aSbkC+nEoeWoWjPLamRy
         37hw11+3FZYd7hRbZL4OK5DJCXRb6P39dKWBjNqEGAL1kneZkjtfIaLbnbRwDbssZn0K
         WoWoq9w4DVpPk0Tf4+cI6nXQs7gC25okCEmRJjIpXYsp14a8FsZqGaMh0x1na42/yfrV
         fJKiGhkr+9CQNaPH+9d3b4gj0+lI2zbirZYGjOc1unUnjQ9BiL5dQ7pt92DHwAqecHES
         jL9CSVc40dOHgIO45OoGKwmrfhheK9iAvXjj5tMwKn3kYbbpNoKnxiNlSW9cjAEZiZ6r
         /XUg==
X-Gm-Message-State: AFqh2kpMjDmvG7S0pvWLEWZxfCdWgd3rN0/tt/2Z73dRe7r1pzeF1KtE
        cDPIGxs7JIFek6+0l/oqwG8SiA==
X-Google-Smtp-Source: AMrXdXvdJcISS/2tkszHVKaJI3ZYI/cMss5wB+0+Mq6EMO0VIT+isGpGqBB2ELI7cd9SLA9/KESnIQ==
X-Received: by 2002:a17:906:3154:b0:84d:28d9:ce6 with SMTP id e20-20020a170906315400b0084d28d90ce6mr29373303eje.35.1673855798726;
        Sun, 15 Jan 2023 23:56:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kw4-20020a170907770400b0084d397e0938sm10138707ejc.195.2023.01.15.23.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 23:56:38 -0800 (PST)
Message-ID: <70fd41e4-6d1a-cc73-cc30-1392e125919e@linaro.org>
Date:   Mon, 16 Jan 2023 08:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
Content-Language: en-US
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121830epcas5p4cc336a48f4597ba84ab1352774242f75@epcas5p4.samsung.com>
 <20230113121749.4657-5-p.rajanbabu@samsung.com>
 <a4982e06-a6a4-a8c9-3b24-24f798c61f73@linaro.org>
 <03a301d92962$3c1a2320$b44e6960$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <03a301d92962$3c1a2320$b44e6960$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/01/2023 05:23, Padmanabhan Rajanbabu wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: 15 January 2023 08:37 PM
>> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
>> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
>> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
>> alim.akhtar@samsung.com; rcsekar@samsung.com;
>> aswani.reddy@samsung.com
>> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
>> Subject: Re: [PATCH v3 4/5] arm64: dts: fsd: Add codec node for Tesla FSD
>>
>> On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
>>> Add device tree node support for codec on Tesla FSD platform.
>>>
>>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> index cf5f2ce4d2a7..2f211a1ad50d 100644
>>> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> @@ -10,6 +10,7 @@
>>>
>>>  /dts-v1/;
>>>  #include "fsd.dtsi"
>>> +#include <dt-bindings/gpio/gpio.h>
>>>
>>>  / {
>>>  	model = "Tesla Full Self-Driving (FSD) Evaluation board"; @@ -34,6
>>> +35,17 @@
>>>  	clock-frequency = <24000000>;
>>>  };
>>>
>>> +&hsi2c_5 {
>>> +	status = "okay";
>>> +
>>> +	tlv320aic3x: codec@18 {
>>> +		compatible = "ti,tlv320aic3104";
>>> +		reg = <0x18>;
>>> +		#sound-dai-cells = <0>;
>>> +		reset-gpios = <&gpg1 6 GPIO_ACTIVE_LOW>;
>>> +	};
>>> +};
>>> +
>>
>> Why there is i2s here? What was the base of this patch?
> 
> Sorry, I could not get what you were asking for. Would be really
> helpful if you can elaborate on this query.

Eh, I missed a "not" in the sentence - why there is no i2s here? You
added the i2s in previous patch and by ordering this should be just
after this node, right? i2s should be before serial, so it should be
visible in the diff. Are your nodes properly ordered?


Best regards,
Krzysztof

