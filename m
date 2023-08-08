Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9145C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 19:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbjHHTIp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbjHHTIU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 15:08:20 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5605FD4BE6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:30:29 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52328e96869so5050641a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512209; x=1692117009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rh7yiDqz5JOnOPNrSWe6RNtd/mULecCxFtp8KEyVNnw=;
        b=q4yh2Y24CvrRUER4eJGyu7LDARUuC68JIRJi5UaPs/oyaUW4/XUJx6eMkvFZEpI0F2
         NDnfBEw93jc0kGAxRHTO7PRaZ9GrEgli8OLPU24aZ0GRC5cKJNM9gxnrIyoTDuTHWMjb
         unkUM6gnoO+wN6oclgyTKnrSMYS5s2FhQ+S1CiicV1bnYzKaVY04DmIIW2Ti0sihwInm
         icp36Cf3y8cNIw8900aQg4TnS1TSHG3xW3GstYlqG+vsT2MGX/OvCIsEXE927vbj/wWj
         S8HmVks8AZgoY7jEIuPmFayljiZ/1kqzYub8fckhH3moXE+cK6LUVhkRh9U+ngvpAH5K
         ytOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512209; x=1692117009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rh7yiDqz5JOnOPNrSWe6RNtd/mULecCxFtp8KEyVNnw=;
        b=CM923S+AiSwbqoYOqXcxx+va9OBt7DnPfMd7XIs7HAYG65Z+yGqeeVNNLk4KP5xDvW
         NsiJWtiOGAd7i7BPTwkWCEwESCErAIg2RbpbwocHir0se+eVlZ72bFpOZT8fdUbIGXKF
         Qk8RiPHx7tUYdpyLwPwqWGlhbQDIgCxbc3kvuESIq6CEh5y8yf723a2+SR9ByZ2WDkRd
         bIvZ10mSZOgelmiqdIQtw2h6FjsSJLTVcqExdEYGVXPaL/CCfKXzSzoPD/qJo2WyEg8c
         4efYnuxpX3UwsEV+OtQPMp6wCRrHoFAM0nzlpBiVcE7I9YvCm5bwnrDWAJOp1sLT97Rb
         Emfg==
X-Gm-Message-State: AOJu0YwXXTuJTFjQB2Q0l5j0AgJ1nb8SOt48QNtpp/0datxneo23Tos7
        4B6H4DaHTL1LqWm8VLr6P8IapOVgXfjYIlxRd+g=
X-Google-Smtp-Source: AGHT+IEbOCg9xyA18ITMblbIWlyzPFYOlii2hEzw3GovA2rrE4kb5tpZlfY7zxAoe7VitoQW3rEUTg==
X-Received: by 2002:a2e:914b:0:b0:2b9:4476:ab28 with SMTP id q11-20020a2e914b000000b002b94476ab28mr9271044ljg.38.1691501487657;
        Tue, 08 Aug 2023 06:31:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id l26-20020a1c791a000000b003fe4548188bsm13716497wme.48.2023.08.08.06.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 06:31:27 -0700 (PDT)
Message-ID: <d198429e-d8ca-aeea-e59b-a241dacde658@linaro.org>
Date:   Tue, 8 Aug 2023 15:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/3] media: exynos4-is: fimc-is: replace duplicate pmu
 node with phandle
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230807131256.254243-1-krzysztof.kozlowski@linaro.org>
 <20230807131256.254243-3-krzysztof.kozlowski@linaro.org>
 <20230807231320.svssge6uymw3jiho@intel.intel>
 <84fbcc37-d226-b637-caa1-b24ebaf03d58@linaro.org>
 <20230808114201.ztr22migzzyfsfwq@intel.intel>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808114201.ztr22migzzyfsfwq@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/08/2023 13:42, Andi Shyti wrote:
>>>> +static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
>>>> +{
>>>> +	struct device_node *node;
>>>> +	void __iomem *regs;
>>>> +
>>>> +	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
>>>> +	if (!node) {
>>>> +		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>>>> +		node = of_get_child_by_name(dev->of_node, "pmu");
>>>> +		if (!node)
>>>> +			return IOMEM_ERR_PTR(-ENODEV);
>>>
>>> in my opinion this should be:
>>>
>>> 		...
>>> 		if (!node)
>>> 			return IOMEM_ERR_PTR(-ENODEV);
>>>
>>> 		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>>>
>>> Because if you don't have both "samsung,pmu-syscon and "pmu" then
>>> the warning should not be printed and you need to return -ENODEV.
>>
>> Why not? Warning is correct - the driver is trying to find, thus
>> continuous tense "Finding", PMU node via old method.
> 
> Alright, I'll go along with what you're suggesting, but I have to
> say, I find it misleading.
> 
> From what I understand, you're requesting an update to the dtb
> because it's using deprecated methods. However, the reality might 
> be that the node is not present in any method at all.
> 
> Your statement would be accurate if you failed to find the
> previous method but then did end up finding it.
> 
> Relying on the present continuous tense for clarity is a bold
> move, don't you think? :)

I just don't think it matters and is not worth resending.

Best regards,
Krzysztof

