Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F8AC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 21:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 469E820936
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 21:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tChP/moP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKDVOw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 16:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgKDVOw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 16:14:52 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5462CC0613D3;
        Wed,  4 Nov 2020 13:14:52 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id y184so27122547lfa.12;
        Wed, 04 Nov 2020 13:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vIcP7q9UQt158YstCq+OZIif2g9QHgNcw0nmgclkL4w=;
        b=tChP/moPaZVaLTzz6HxN6ChzDNHozKx3OZQi71Norv8jnlMTrVoyY2p5d+5SFTMA3O
         FPLd3cw2ve+cjaQCpCCkfuq40T3KGXJ5OSC38HPyYCRyMufhSastjpFISP6q8O344Qa+
         5RMW7ZYt82kJ8/DLRlOZ4dChJhe0BPwEStpTStPO3MqzDKPkfKBL8JqOL1Czd8Xkwjey
         qpDzErVKxHQhDYlNw+hCaLKhNFrz2/gxYBXsmhKyMhkjGUVGup2qfBuAenBuev172R7G
         Jrcco71piHT0kB7DdyFfWJMmAFA3vhQLCLUHsMc6/zy2K9IPDhTf/dlMTCWapcy4F78a
         D1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vIcP7q9UQt158YstCq+OZIif2g9QHgNcw0nmgclkL4w=;
        b=OlFF+/zMxE0Z92xdRPsAUVJI9TazAdpMvZIghTYMuCDHznnm0l6DZDJK0sj+dEThkg
         VCYkgs7UVq8UiLPZa8YddGeyu6rbaB+hZFwxbA12p+81KCHNj6AuFkYAycUemDWET67i
         vlpLRTVjvca4SllXALWJYn765O7HITD/97tNXvwEWrmD4gVHLyqK/qT6WlBsVfqeedk2
         7ZsM8mi+fkFpnKm9PvCzAqOBLsEMRdiAz3QWHqohrOF1IQGejdUwUxck+Bqu5Nyg/FTB
         h+XQn1Kpj5I+Qk0n9FOulKcMqsF3y9oYd5aLyUOL7JRp6d8L6ILcjyhLjOAygDeOQulB
         lCLA==
X-Gm-Message-State: AOAM533UrBeq4sQGSXFoj7TfFRjmW7m/UaYQrG7M2RQHs5Z0UoCSkPVK
        yekEo5RodEFpcgmgz4YJ5wwrRB5hEhs=
X-Google-Smtp-Source: ABdhPJx/XTxo/21gPGdbGRdUiEcv1vpaApyF7SK6Jyz5hhnCH1q+t1nUZUbP17HTaazEwzgnWhDKuw==
X-Received: by 2002:a19:c78c:: with SMTP id x134mr1307041lff.319.1604524490565;
        Wed, 04 Nov 2020 13:14:50 -0800 (PST)
Received: from ?IPv6:2a02:a315:5445:5300:10:cd12:3307:e8d7? ([2a02:a315:5445:5300:10:cd12:3307:e8d7])
        by smtp.gmail.com with ESMTPSA id l9sm619423ljc.86.2020.11.04.13.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 13:14:49 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: exynos: Fix reboot/poweroff issues on Exynos7
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     kgene@kernel.org, alim.akhtar@samsung.com, robh+dt@kernel.org,
        a.kesavan@samsung.com, naveenkrishna.ch@gmail.com,
        thomas.ab@samsung.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201028210813.49874-1-pawel.mikolaj.chmiel@gmail.com>
 <20201029175043.GA88508@kozik-lap>
From:   =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Message-ID: <f00edc18-0dc7-f254-3edb-751e606ab857@gmail.com>
Date:   Wed, 4 Nov 2020 22:14:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201029175043.GA88508@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

On 29.10.2020 18:50, Krzysztof Kozlowski wrote:
> On Wed, Oct 28, 2020 at 10:08:13PM +0100, Paweł Chmiel wrote:
>> In vendor sources for Exynos 7420, psci is not used to reboot or
>> poweroff device. Instead we should use syscon reboot/poweroff.
>> Previously it was not possible to poweroff (no syscon poweroff node) or
>> reboot (because it was handled by psci and this way is not working for
>> Exynos).
> 
> Do you want to say that PSCI cannot be used to power off or reboot?
Yes
> 
>>
>> Fixes: fb026cb65247 ("arm64: dts: Add reboot node for exynos7")
>> Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")
>> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos7.dtsi | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> index 959918f4ca45..47d54c369d03 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
>> @@ -117,8 +117,10 @@ cpu_atlas3: cpu@3 {
>>  	};
>>  
>>  	psci {
>> -		compatible = "arm,psci-0.2";
>> +		compatible = "arm,psci";
> 
> Please explain how is it related to this issue? You onle mentioned
> a problem of lacking syscon-reboot node.
> 
>>  		method = "smc";
>> +		cpu_off = <0x84000002>;
>> +		cpu_on = <0xC4000003>;
> 
> The same question.
Thanks for feedback. I'll split this patch into two - one for inclusion
of exynos-syscon-restart.dtsi and second one fixing psci compatible (so
syscon-poweroff/restart will be working).
> 
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -552,6 +554,13 @@ pmu_system_controller: system-controller@105c0000 {
>>  			compatible = "samsung,exynos7-pmu", "syscon";
>>  			reg = <0x105c0000 0x5000>;
>>  
>> +			poweroff: syscon-poweroff {
>> +				compatible = "syscon-poweroff";
>> +				regmap = <&pmu_system_controller>;
>> +				offset = <0x330C>; /* PS_HOLD_CONTROL */
>> +				mask = <0x5200>; /* reset value */
>> +			};
>> +
> 
> Instead, please include arm/exynos-syscon-restart.dtsi.
Will do this.
> 
> Best regards,
> Krzysztof
> 
