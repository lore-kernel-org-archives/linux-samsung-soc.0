Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B24EB64DD
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Aug 2023 19:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbjHNTmG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Aug 2023 15:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbjHNTl6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 15:41:58 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CCA10F9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 12:41:57 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe9c20f449so13175275e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692042116; x=1692646916;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hWVokt/CwUyrFGLpSEZU7jNylhLXHRK0ucHWHSV3+I=;
        b=TUKdKob8s0T4JkeeDvT2dwa/tAVm1CqbadyrTRnxa2IyDq45IUs0P9sEW9ak6SMtgo
         1iflsz9PnPw9auzulLS72OisiSeffETp0ki6FH2/Y7SK89qbuA11pWT7RwXZ6hpV1Yxj
         W/9xWndQTr4Wl0hbN2lO7LxVKa8DMfZq0J5jWre84hqkR63wpu7cjlKJ/4vYdlW+1RjN
         MV0HpPpVW1R8qyHkFMu8yg9f1sK3/pLyUGyqne54imype5AVfb70csLNauvHHvP5WPND
         er5RusW1g7jMG3e2B5X/Scx70aQRAYXpwRO8izMi4S91t9MulmSU9aFuBp0UwqPNJ+1i
         Toyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692042116; x=1692646916;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hWVokt/CwUyrFGLpSEZU7jNylhLXHRK0ucHWHSV3+I=;
        b=WPEuc8jXtIVkOCTIVXKJaI5I9jIKIe2Oki5OzUeK7y/Nwsg9HbPjzTNKg5wwFud73K
         wdCG05ytSVga3tO53Hl1c8wyNspjCSK6mA8jC6PUBf/YsqmG1idGZJaiM7cV+nCEJwT7
         O8TJ9wIH/8XJYGvObvFCwLfOUtwbtG/sOjBbHoR2YhUEZdo9v4Loel2rib8ZAs5mhWp2
         nnhaWRF+REtdn/4uHSrUdr10YN8GMal1XoHAbnifFXpI2oE/zvug7qJ/5C9+fiEdgMr0
         8wes2+fCK8m3J8jc3o5qsR3925oGDptgPCEGJLlfvDWzn8SE/vQ/jmNARe6cHqMBGYz9
         vmog==
X-Gm-Message-State: AOJu0YxfJKVe1Q8RROwzSZj2KDjJWa2yxHTLFIRhjO06mB+f0jE3QHN5
        pFb/ixlxr+kzR9xNrFDdx8O1/Q==
X-Google-Smtp-Source: AGHT+IG0u5gtxp32TUl77yAObK7hqWwBKPwbNr+WC1w31y4c6uk0yZmWJwLX5Q0Imes/bQTO1MKiEQ==
X-Received: by 2002:a7b:cbc7:0:b0:3f6:91c:4e86 with SMTP id n7-20020a7bcbc7000000b003f6091c4e86mr7729047wmi.3.1692042115963;
        Mon, 14 Aug 2023 12:41:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l4-20020a1ced04000000b003fe61c33df5sm18296228wmh.3.2023.08.14.12.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 12:41:55 -0700 (PDT)
Message-ID: <ae1107f7-d48e-d89f-4de9-f8d01abcc3e2@linaro.org>
Date:   Mon, 14 Aug 2023 21:41:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 4/4] arm64: dts: fsd: Add Ethernet support for PERIC
 Block of FSD SoC
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sriranjani P <sriranjani.p@samsung.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, alim.akhtar@samsung.com,
        linux-fsd@tesla.com, pankaj.dubey@samsung.com,
        swathi.ks@samsung.com, ravi.patel@samsung.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jayati Sahu <jayati.sahu@samsung.com>
References: <20230814112539.70453-1-sriranjani.p@samsung.com>
 <CGME20230814112625epcas5p1e1d488a590bfc10d4e2a06dcff166037@epcas5p1.samsung.com>
 <20230814112539.70453-5-sriranjani.p@samsung.com>
 <1ada88be-45db-1f38-5e08-daf4b544bb6b@linaro.org>
In-Reply-To: <1ada88be-45db-1f38-5e08-daf4b544bb6b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/08/2023 21:41, Krzysztof Kozlowski wrote:
> On 14/08/2023 13:25, Sriranjani P wrote:
>> The FSD SoC contains two instances of Synopsys DWC QoS Ethernet IP, one in
>> FSYS0 block and other in PERIC block.
>>
>> Adds device tree node for Ethernet in PERIC Block and enables the same for
>> FSD platform.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
>> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
>> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
>> ---
>>  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  9 ++++
>>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 56 ++++++++++++++++++++++
>>  arch/arm64/boot/dts/tesla/fsd.dtsi         | 29 +++++++++++
>>  3 files changed, 94 insertions(+)
> 
> Looks duplicated.

Ah, not, it's another block.

My question whether this was tested remains...

Best regards,
Krzysztof

