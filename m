Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D72CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Nov 2022 18:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbiKGSPZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Nov 2022 13:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiKGSPB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 13:15:01 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FC41087
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2022 10:14:02 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id z24so17570757ljn.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 10:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pvuKD18nXs5C0f6du6Wvit7+4UGLgSc//n9KNZJnd2U=;
        b=ZeE2g8FJuwjaUrwBzqjDJ7ffHwLQMyHb4BNDQ9bSphP0A3VS5xIvw496dMkbbYQbu3
         /a+qEq5ToWhdsqapUhlEFgjaQLzySs41v9OJjptqER2dCQ+lpVdWPsqa+CPbZ6RJUeXN
         MkTMjE8MUQyH3wRJTv7QBq8+H/OuKyQV9iKjJizM+9ohu/0Pl+juTsGat8dBUNhAPtnp
         FI55nc6g8mwfAX4d9Dj6doGt+sx/V6RI+d7UdA/ruSehYZlkeLcYsbqRzLbGN6cvaYAO
         0J1wyQv4slSP9p8RGcRwD8PJdrYn4sGjX8y9E2GFH4RTxjBqKeu4VmIF/0GQnZF+L1it
         wyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvuKD18nXs5C0f6du6Wvit7+4UGLgSc//n9KNZJnd2U=;
        b=5uuJpf6ME3okb1T6Xmxi6f/POkg+Y6pF5aweupsezh+Pe2z/KCw4Pse0GLDoSwMA7B
         3I27/g03VKh1IcoKlQQql6CwNfPhKZD1cMo4qrhuNIWQj9pZ/8k7kGoa/H50jb+eAgbc
         Tf56DOWNG8SOeCdA9NPz0D3yAIIgVn/JehbQvheAQxE5HUUt0FfcF4tVX+ydlXblEBJK
         AIH4Fa1b9aO5WJU0wmwBScNPVEHA68OBgJRJDG6FiBhqUTehEPFFhPjVrybkq2tApKDe
         0hwFgzDee/UbY/GULzUDnq63hGyiR3d3LxxXpyb0fqiYDzl+8LpOhBdBvVieNkavhHMn
         mg+w==
X-Gm-Message-State: ACrzQf2lqBiiIX2OYTbM7UauqX9ulx+1Wfn78PlYjWbgUVIQ4oQOXlKO
        G2JdKUzlEvfZE/HPcuCkl8/l8A==
X-Google-Smtp-Source: AMsMyM4cUoHwZTyngzcx+bF4UO192jEYqwXF5DtB+xrdiGnSYEVJ1CIPPQHLl5OH6HQOikomQ8sJ5A==
X-Received: by 2002:a2e:98d2:0:b0:26c:66c1:87f9 with SMTP id s18-20020a2e98d2000000b0026c66c187f9mr5900566ljj.47.1667844840764;
        Mon, 07 Nov 2022 10:14:00 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id t12-20020a056512208c00b00492aefd73a5sm1360716lfr.132.2022.11.07.10.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 10:14:00 -0800 (PST)
Message-ID: <9e0d2b3e-d3a6-0249-8cb3-29e0344708d4@linaro.org>
Date:   Mon, 7 Nov 2022 19:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: (subset) [PATCH 06/20] arm64: dts: Update cache properties for
 exynos
Content-Language: en-US
To:     Pierre Gondois <pierre.gondois@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob.Herring@arm.com, linux-samsung-soc@vger.kernel.org
References: <20221031091945.531874-1-pierre.gondois@arm.com>
 <166742051292.139492.12539582422109367063.b4-ty@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166742051292.139492.12539582422109367063.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/11/2022 21:21, Krzysztof Kozlowski wrote:
> On Mon, 31 Oct 2022 10:19:45 +0100, Pierre Gondois wrote:
>> The DeviceTree Specification v0.3 specifies that the cache node
>> 'compatible' and 'cache-level' properties are 'required'. Cf.
>> s3.8 Multi-level and Shared Cache Nodes
>>
>> The recently added init_of_cache_level() function checks
>> these properties. Add them if missing.
>>
>> [...]
> 
> Applied, thanks!
> 
> [06/20] arm64: dts: Update cache properties for exynos
>         https://git.kernel.org/krzk/linux/c/58710ae94589a2b2baaab6b6986064b691124b0d

Now dropped. I understand this is the intention/request of v2.

When resending be sure to use proper subject prefixes.

Best regards,
Krzysztof

