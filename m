Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0E5C43217
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Nov 2022 09:16:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiKIJQs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Nov 2022 04:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiKIJQK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Nov 2022 04:16:10 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D14E23E99
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Nov 2022 01:14:43 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j16so24683436lfe.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Nov 2022 01:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rE5UJ2gWSpg6IpozSMRbtLn3mGKV5w8AwqD7IDy5jk=;
        b=U06Q1gCUo2hO0VTiMtEoJoaSneZWE4NtURqBoL4XiYfNhfZBbfl7abW9xNjKv5GPbK
         hCRmfTZe9WmG2yXqDRTlas8ZrrIDi+OzwEjNPm7bGmznXZ7Cwwavk9U1BzcaJcHnaD0D
         Hm83QaSpWpdHNXd4FoVk4toCLw2NmEOE5C9/I++ru2D+fV+KKd28hu+q+R5z1iy2zt+E
         QMjz1B7ywS8GyGIiiCsXtE2/h5+d39nVYAzdPtcvFP6Qt0VMcApOEMI4RTmg/NC0mSo3
         NrUfV4bpVr+8b2r25x1Q9e7IwLff7VFq7i1eKsPhsW1LjqRFzDEbd3BpHYUR4DbgVhn+
         mz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rE5UJ2gWSpg6IpozSMRbtLn3mGKV5w8AwqD7IDy5jk=;
        b=rrgyVA/mCYdwW990+aSRJCuNa9H90gPeOTMfkQ/RTOVqLA48iW/qvuT+7tD/Ed86V2
         Ro3YWFErLr9FsvtVZX9j4evSb+j/NvDIiR6zdc90v8roDgEiZn1Hmo9brRPv7lPs6L5W
         ctvo3iW8Yj4u1x7iFY67pAzPZDEgxkadvw+rVi40NHBrpaHwKDat9/XeFFCzqSex8F0p
         S11B19mGWDZmydnXwFO7GPYiLACq7wiGqJm5OuiDM40toNjoIFIujaogWry9+Egzob2J
         Tr+9mWpbSfLJmu1F4QjQejolg+7iTfuVaU12b8gEs1LOKkHrAM8yjTlSr8tfCyA6Gobn
         XEfw==
X-Gm-Message-State: ACrzQf3wMrUHfyMfOgPSMLgSuHuJdWgJg5ldwY+B4mY7SuCdOZuHg/t3
        dCFiYimzxHl7i9YQcGy735JOwA==
X-Google-Smtp-Source: AMsMyM7LgB3iu58DZRHLmWoJUX7TsMuJX1g8t6t7+zHqIzWcfEQTeAhOSuGqvRhzmMJAMw9LQxb0XA==
X-Received: by 2002:a05:6512:110d:b0:4a2:7df9:30bc with SMTP id l13-20020a056512110d00b004a27df930bcmr22209442lfg.138.1667985281476;
        Wed, 09 Nov 2022 01:14:41 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id p15-20020ac24ecf000000b0049adf925d00sm2146242lfr.1.2022.11.09.01.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:14:40 -0800 (PST)
Message-ID: <e6cf63f1-ec5f-e600-570d-70e933740f4b@linaro.org>
Date:   Wed, 9 Nov 2022 10:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] clk: samsung: Revert "clk: samsung: exynos-clkout: Use
 of_device_get_match_data()"
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vinod Koul <vkoul@kernel.org>, Nishanth Menon <nm@ti.com>,
        Mark Brown <broonie@kernel.org>
References: <CGME20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177@eucas1p2.samsung.com>
 <20221108213718.32076-1-m.szyprowski@samsung.com>
 <0da15378-ca0d-4f26-c21c-184de2a89350@linaro.org>
 <d4b49cb6-f7c1-e859-98a8-e78a132b421b@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d4b49cb6-f7c1-e859-98a8-e78a132b421b@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/11/2022 23:53, Marek Szyprowski wrote:
> On 08.11.2022 22:44, Krzysztof Kozlowski wrote:
>> On 08/11/2022 22:37, Marek Szyprowski wrote:
>>> of_device_get_match_data() function should not be used on the device
>>> other than the one matched to the given driver, because it always returns
>>> the match_data of the matched driver. In case of exynos-clkout driver,
>>> the code matched the OF IDs on the PARENT device, so replacing it with
>>> of_device_get_match_data() broke the driver.
>>>
>>> This reverts commit 777aaf3d1daf793461269b49c063aca1cee06a44.
>> This was untested, automated commit and there were several other like
>> that from Minghao. Other driver owners should check if they have the
>> same issue. I made a quick look and seems fine, but it all depends what
>> was the of_device_get_match_data() argument.
>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Please add Cc-stable tag. Do reverts need a Fixes tag? I guess as well...
> 
> Do we really need a CC-stable tag? v6.1-rc1 is the first release that 
> contains that bug, so this revert imho should be simply applied as a fix 
> for v6.1-rcX cycle.

No, then it's fine.

Stephen, can you take it directly to fixes for current RC?

Fixes: 777aaf3d1daf ("clk: samsung: exynos-clkout: Use of_device_get_match_data()")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

