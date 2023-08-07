Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DFCC001DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Aug 2023 13:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbjHGNJs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbjHGNJr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Aug 2023 09:09:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DD8170A
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Aug 2023 06:09:44 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so612813266b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Aug 2023 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691413783; x=1692018583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUBX0M73wFHT9eoECwDsnUeuQ/GOufxE2TDJPi/hBi4=;
        b=CwY2YCXlMDtzQMebTwv7Ckjxds6YTVDHwGNS5YtrmZA4PmSJ/ycHgSkYcVgoWDliT4
         UVBTr3vEfsIYoOlvXhyz0ir/u+DA6IiXumxTV5Cl+OTarcmOWyunKGwZlIUxlO0x3F41
         hzVz2vEg4/uLUgoZHp8FTWjhUhw7dfJfNYivPid+KP5TWrr9O5eyq0cvuENoKjBiG7aJ
         1Cq+v+c6HF8VkPWnYVlGpZAHnGA0POZKB2pezEhj7wP+kfnsOV4uZlxFxoRBCe91iYZD
         ZmwCtYXU+lBdFXpbn/JDa9rome/yfaB270MCMFxRSlGKlttEn/5V0nj3V+3+3mAZ048i
         1YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691413783; x=1692018583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUBX0M73wFHT9eoECwDsnUeuQ/GOufxE2TDJPi/hBi4=;
        b=MnmJFrX9qAFMvpVmZYHMUd8cTJGHy5zQ+d/M3DVXt0/NppUBGjzTjaCAMBDMr7e58k
         5ppYTZEQn8FB8XjYqaOG0G7w8vJjP0I3kkuyNi0c+d4h/ELXlQUSbpAlEoYuK2T2OohQ
         RwwvC3jEGBd3t90RwRERlFikCbLm5YT+X2tLgjJNkG952SRLJYwGpdKudodNxRjf95A4
         hhMdQFtK4CPaOifa6p2KlXOayonQHleC/7SGYm8bpkKg6BFgPNpQNF4JFqAashqTb36M
         Lsp2Y3sCT9bth7GpnCi+fb1F6uC+vjZHJDOoltyXWGvBcdqdz524a99yxEXVe4PtJ83E
         bF3A==
X-Gm-Message-State: AOJu0Yyx/ygNFSZCm1qHCPUkD8SzuU6cBWHMl0w1I6Fs79u7LcA6vbB+
        ZWj0W99EHV2PrFbQUhXgikEWFg==
X-Google-Smtp-Source: AGHT+IE2cGa7ZQhye3Rv8ehiG2rTumLO8Og+QEsxDBnUJkU/mU8QmIulq6RaJ48j6i1orRq+apPqgw==
X-Received: by 2002:a17:907:7757:b0:99b:499d:4635 with SMTP id kx23-20020a170907775700b0099b499d4635mr7903641ejc.75.1691413783095;
        Mon, 07 Aug 2023 06:09:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090611d100b0099bd0b5a2bcsm5231021eja.101.2023.08.07.06.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 06:09:42 -0700 (PDT)
Message-ID: <9c878317-18d6-c483-d182-4c25200ee305@linaro.org>
Date:   Mon, 7 Aug 2023 15:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] media: exynos4-is: fimc-is: replace duplicate pmu
 node with phandle
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230722115441.139628-1-krzysztof.kozlowski@linaro.org>
 <20230722115441.139628-3-krzysztof.kozlowski@linaro.org>
 <0b361e6c-d141-4758-edc2-c75b6f0efbe3@xs4all.nl>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0b361e6c-d141-4758-edc2-c75b6f0efbe3@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/08/2023 15:06, Hans Verkuil wrote:
> Hi Krzysztof,
> 
> On 22/07/2023 13:54, Krzysztof Kozlowski wrote:
>> Devicetree for the FIMC IS camera included duplicated PMU node as its
>> child like:
>>
>>   soc@0 {
>>     system-controller@10020000 { ... }; // Real PMU
>>
>>     camera@11800000 {
>>       fimc-is@12000000 {
>>         // FIMC IS camera node
>>         pmu@10020000 {
>>           reg = <0x10020000 0x3000>; // Fake PMU node
>>         };
>>       };
>>     };
>>   };
>>
>> This is not a correct representation of the hardware.  Mapping the PMU
>> (Power Management Unit) IO memory should be via syscon-like phandle
>> (samsung,pmu-syscon, already used for other drivers), not by duplicating
>> "pmu" Devicetree node inside the FIMC IS.  Backward compatibility is
>> preserved.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../platform/samsung/exynos4-is/fimc-is.c     | 33 ++++++++++++++-----
>>  1 file changed, 24 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
>> index 530a148fe4d3..c4c191771093 100644
>> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
>> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
>> @@ -767,12 +767,32 @@ static void fimc_is_debugfs_create(struct fimc_is *is)
>>  static int fimc_is_runtime_resume(struct device *dev);
>>  static int fimc_is_runtime_suspend(struct device *dev);
>>  
>> +static void __iomem *fimc_is_get_pmu_regs(struct device *dev)
>> +{
>> +	struct device_node *node;
>> +	void __iomem *regs;
>> +
>> +	node = of_parse_phandle(dev->of_node, "samsung,pmu-syscon", 0);
>> +	if (!node) {
>> +		dev_warn(dev, "Finding PMU node via deprecated method, update your DTB\n");
>> +		node = of_get_child_by_name(dev->of_node, "pmu");
>> +		if (!node)
>> +			return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	regs = of_iomap(node, 0);
>> +	of_node_put(node);
>> +	if (!regs)
>> +		return ERR_PTR(-ENOMEM);
> 
> sparse gives me these warnings for these ERR_PTR returns:
> 
> drivers/media/platform/samsung/exynos4-is/fimc-is.c:780:39: warning: incorrect type in return expression (different address spaces)
> drivers/media/platform/samsung/exynos4-is/fimc-is.c:780:39:    expected void [noderef] __iomem *
> drivers/media/platform/samsung/exynos4-is/fimc-is.c:780:39:    got void *

Thanks, indeed. I will use IOMEM_ERR_PTR()

Best regards,
Krzysztof

