Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64FDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Jul 2022 17:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbiGVRdB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Jul 2022 13:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235960AbiGVRdA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 13:33:00 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C139CE2D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2022 10:32:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m9so6205594ljp.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Jul 2022 10:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l48XYpfyFIQhz2kXp9OwdWKvu7j6Lw8BsI/XJ/Jv9Po=;
        b=Yk8lVGLY7UCYYTPZkrBXuwqCPqgSGUB4wvwBVUo+bNNOQiSFpx7HDPJYr6J4QGDG6+
         sKp0mkuIkGL45Y8mUjqaQzGVH7zR++z0HRsaE847EuN/Hy6PstJjb075COS8SmNCG9zy
         edunZhxF2J1mZdTOXIugyaegeKHTygAX0xkd02zu+Ht6VFQve4x0kKgMdQht5KvjHkzD
         Ol49eotMYOU/cDncMdWegvo0Y8f2ErI9Ya/sjDdnv/q4aVq87l2+/a5sTFbWv96HDy38
         33LqDqvG9bl5RCtZCqd3ftCnFuyGA4ExsS27vDrlGYtS4IAWwzUiqPOOtvtkltH/eob1
         skVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l48XYpfyFIQhz2kXp9OwdWKvu7j6Lw8BsI/XJ/Jv9Po=;
        b=Mk5Auuu8atwJu6dSyzweaErRCUR1R3Q59poF5GAdc3Q86/IhCTVZUnLMWt0+UP1III
         n7v9PMSLgxikEKe4mLApxxdCJ6stl3aPvUCgbYh8VHXf1EAttpjNAc0Gx5BuZbfSKQvq
         nyPFaxN7ljR4SuUC8o9fZU0CqG/rrwessm0MkUnMLjUMbgzlC550ktgCPAS7/puu6OZa
         OJKRmh0hhNAD6nDp9g/DOdp225OSUu6hZXRcU9mhXkPACXofYSff/CVV3GrfAZMNTEDr
         oLIfWwkPRXkFmqUaJGImt8myJPQIFyZ9HV2GB/W9W8+0ssLGjT4zXgRzxdRGDy50MVST
         Hpxw==
X-Gm-Message-State: AJIora+4R05ZMj8uSO1Pn5qj3w6y22Q7gKtnM3y9t+A+MvqTxoHn8Xmi
        6kkmnKMsR05oRrfKa+VYANvrybzJl2+nXQ3I
X-Google-Smtp-Source: AGRyM1tFjTdGZO6apyoZWyqR7lEhDKJTi9zVNsh1r+H7/YyqRX239MTwEIiGl2W+UPY+SmwYx7Oqfw==
X-Received: by 2002:a2e:8004:0:b0:25d:80c0:1e93 with SMTP id j4-20020a2e8004000000b0025d80c01e93mr380410ljg.210.1658511177697;
        Fri, 22 Jul 2022 10:32:57 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id n7-20020a05651203e700b00485e55192a3sm1159175lfq.72.2022.07.22.10.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 10:32:57 -0700 (PDT)
Message-ID: <454232b3-2f98-c3ca-4661-5e9eb51998b6@linaro.org>
Date:   Fri, 22 Jul 2022 19:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock items
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        'Rob Herring' <robh+dt@kernel.org>
Cc:     'Alim Akhtar' <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21@epcas2p1.samsung.com>
 <20220707062807.135960-1-chanho61.park@samsung.com>
 <4e8a36de-a631-f6c9-44d7-7d873f775db2@linaro.org>
 <001b01d89d69$37d80320$a7880960$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <001b01d89d69$37d80320$a7880960$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/07/2022 03:20, Chanho Park wrote:
>> Subject: Re: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock
>> items
>>
>> On 07/07/2022 08:28, Chanho Park wrote:
>>> Below error is detected from dtbs_check. exynos7-ufs-phy is required
>>> symbol clocks otherwise only PLL ref clock is required.
>>>
>>> clock-names: ['ref_clk'] is too short
>>>
>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Hi Krzysztof,
> 
> No one takes this patch. Could you please pick this patch in your tree?
> Thanks.

You did not send it to PHY maintainers... The bindings go via subsystem
maintainers.

If Vinod doesn't want it, I could take it, but he never had a chance to
say :)

Please resend.

Best regards,
Krzysztof
