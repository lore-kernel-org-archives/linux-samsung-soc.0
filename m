Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFA9C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 07:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F10D861056
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 07:06:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238597AbhHRHHX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:07:23 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53762
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238573AbhHRHHW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 03:07:22 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 23A4B412F4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 07:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629270407;
        bh=LPqSr7VKhV+o4G9luIWN38BQmsj4SRz8d1JgeXqOLWg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=iA5Ll1wJnqxC8P/olYm8SF7KjC0sq2tEEkb8Qqs38O9a+WnOOMBHvnT+P1ZQzaZrm
         sAL0DJxnwn21vt/pD3Qa7qOMO+YtkaLMifUlzXUPP59mUBeC/pV0kc2na8fgkM6j3q
         xxs9sNT/RG7ClvwmFzefCRR/ehKeck8ppwfmPUvEOiQ1j65athwqGUoaT568SYv4v1
         F4OMVyKYXmaXzqx0WyqE7Tis1Uftt9vordcvUzGOTDMcDgjzRjsJkiH2LtwfHPDVSR
         JEg7ItAzzDe54SUaonBTbc1Qv7wPYmJ8GY25LlVUvJPomWwAj3Fw1Qqu+6+ayhQAqp
         B5Wkhhc+e+FMA==
Received: by mail-ed1-f69.google.com with SMTP id b16-20020a0564022790b02903be6352006cso545890ede.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 00:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LPqSr7VKhV+o4G9luIWN38BQmsj4SRz8d1JgeXqOLWg=;
        b=gwRe2kKtKKTUFH/0JCZX5jO1rSzSFi0ouBdkZiZmH32RH/VQeSiBv9fCfmZeSqObfb
         5bArIOyhdb9+hpsFzWMn9Doby/6HsiixzfNyJx2eHFwCTGNt2iuFUwcssNml7c2sc4v/
         X89+TYM0XFjmU5ciXAV6440Fwpn2YeWUT8E71CSzMLrgCLeQsMHZP8nDY2IkGTU+LR5R
         U9fdTvKVt9flriVbVT3/JVNiJP8m5wk3caby281HNahUrUAEvQxjNaJUPe377LMkTgR7
         VP59HXjPq+dcUHU3NgngqytCDmBOQ2SqwT5ESpFk8FkcWkUs6+CzwLt+XGxVI8xH2XRc
         Sl/Q==
X-Gm-Message-State: AOAM533cYdhVFBWZ1PCUzWZbfbWFlAUcpYx4uDSglgV63uObw2WgXxv+
        UutDfGGYeTz2S8E1drI2wMfv/sq7hswOuhmlhrAxE9iPO0nbhh0J+XPcByk9bg7mE367r4GaI9p
        a7826zhdSQ56GuceboQ2MzkpFh1tMmFNCdSBmKtIig1/pt8s8
X-Received: by 2002:aa7:c6c3:: with SMTP id b3mr8412480eds.217.1629270406724;
        Wed, 18 Aug 2021 00:06:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIP8ALrIFQFr2qkCed/zA2EZjc0JpdVnSMuAfmtHQRX4kmakYEL2mTSFFn+d/rQWB/nqdT/w==
X-Received: by 2002:aa7:c6c3:: with SMTP id b3mr8412450eds.217.1629270406515;
        Wed, 18 Aug 2021 00:06:46 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id r27sm2059367edb.66.2021.08.18.00.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:06:46 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] dt-bindings: clock: samsung: convert Exynos AudSS
 to dtschema
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
 <YRwbYiS7VTd/NdS5@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <098578c6-ca2c-2c4b-d5c6-657abba35c4f@canonical.com>
Date:   Wed, 18 Aug 2021 09:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRwbYiS7VTd/NdS5@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/08/2021 22:26, Rob Herring wrote:
> On Tue, Aug 10, 2021 at 11:31:43AM +0200, Krzysztof Kozlowski wrote:
>> Convert Samsung Exynos Audio SubSystem clock controller bindings to DT
>> schema format using json-schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
>>  .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
>>  2 files changed, 79 insertions(+), 103 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
>> deleted file mode 100644
>> index 6030afb10b5c..000000000000
>> --- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
>> +++ /dev/null
>> @@ -1,103 +0,0 @@
>> -* Samsung Audio Subsystem Clock Controller
>> -
>> -The Samsung Audio Subsystem clock controller generates and supplies clocks
>> -to Audio Subsystem block available in the S5PV210 and Exynos SoCs. The clock
>> -binding described here is applicable to all SoCs in Exynos family.
>> -
>> -Required Properties:
>> -
>> -- compatible: should be one of the following:
>> -  - "samsung,exynos4210-audss-clock" - controller compatible with all Exynos4 SoCs.
>> -  - "samsung,exynos5250-audss-clock" - controller compatible with Exynos5250
>> -    SoCs.
>> -  - "samsung,exynos5410-audss-clock" - controller compatible with Exynos5410
>> -    SoCs.
>> -  - "samsung,exynos5420-audss-clock" - controller compatible with Exynos5420
>> -    SoCs.
>> -- reg: physical base address and length of the controller's register set.
>> -
>> -- #clock-cells: should be 1.
>> -
>> -- clocks:
>> -  - pll_ref: Fixed rate PLL reference clock, parent of mout_audss. "fin_pll"
>> -    is used if not specified.
>> -  - pll_in: Input PLL to the AudioSS block, parent of mout_audss. "fout_epll"
>> -    is used if not specified.
>> -  - cdclk: External i2s clock, parent of mout_i2s. "cdclk0" is used if not
>> -    specified.
>> -  - sclk_audio: Audio bus clock, parent of mout_i2s. "sclk_audio0" is used if
>> -    not specified.
>> -  - sclk_pcm_in: PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if not
>> -    specified.
>> -
>> -- clock-names: Aliases for the above clocks. They should be "pll_ref",
>> -  "pll_in", "cdclk", "sclk_audio", and "sclk_pcm_in" respectively.
>> -
>> -Optional Properties:
>> -
>> -  - power-domains: a phandle to respective power domain node as described by
>> -    generic PM domain bindings (see power/power_domain.txt for more
>> -    information).
>> -
>> -The following is the list of clocks generated by the controller. Each clock is
>> -assigned an identifier and client nodes use this identifier to specify the
>> -clock which they consume. Some of the clocks are available only on a particular
>> -Exynos4 SoC and this is specified where applicable.
>> -
>> -Provided clocks:
>> -
>> -Clock           ID      SoC (if specific)
>> ------------------------------------------------
>> -
>> -mout_audss      0
>> -mout_i2s        1
>> -dout_srp        2
>> -dout_aud_bus    3
>> -dout_i2s        4
>> -srp_clk         5
>> -i2s_bus         6
>> -sclk_i2s        7
>> -pcm_bus         8
>> -sclk_pcm        9
>> -adma            10      Exynos5420
>> -
>> -Example 1: An example of a clock controller node using the default input
>> -	   clock names is listed below.
>> -
>> -clock_audss: audss-clock-controller@3810000 {
>> -	compatible = "samsung,exynos5250-audss-clock";
>> -	reg = <0x03810000 0x0C>;
>> -	#clock-cells = <1>;
>> -};
>> -
>> -Example 2: An example of a clock controller node with the input clocks
>> -           specified.
>> -
>> -clock_audss: audss-clock-controller@3810000 {
>> -	compatible = "samsung,exynos5250-audss-clock";
>> -	reg = <0x03810000 0x0C>;
>> -	#clock-cells = <1>;
>> -	clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>,
>> -		<&ext_i2s_clk>;
>> -	clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
>> -};
>> -
>> -Example 3: I2S controller node that consumes the clock generated by the clock
>> -           controller. Refer to the standard clock bindings for information
>> -           about 'clocks' and 'clock-names' property.
>> -
>> -i2s0: i2s@3830000 {
>> -	compatible = "samsung,i2s-v5";
>> -	reg = <0x03830000 0x100>;
>> -	dmas = <&pdma0 10
>> -		&pdma0 9
>> -		&pdma0 8>;
>> -	dma-names = "tx", "rx", "tx-sec";
>> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
>> -		<&clock_audss EXYNOS_I2S_BUS>,
>> -		<&clock_audss EXYNOS_SCLK_I2S>,
>> -		<&clock_audss EXYNOS_MOUT_AUDSS>,
>> -		<&clock_audss EXYNOS_MOUT_I2S>;
>> -	clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
>> -		      "mout_audss", "mout_i2s";
>> -};
>> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
>> new file mode 100644
>> index 000000000000..d60b29fa22e7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/samsung,exynos-audss-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung Exynos SoC Audio SubSystem clock controller
>> +
>> +maintainers:
>> +  - Chanwoo Choi <cw00.choi@samsung.com>
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
>> +  - Tomasz Figa <tomasz.figa@gmail.com>
>> +
>> +description: |
>> +  All available clocks are defined as preprocessor macros in
>> +  include/dt-bindings/clock/exynos-audss-clk.h header.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - samsung,exynos4210-audss-clock
>> +      - samsung,exynos5250-audss-clock
>> +      - samsung,exynos5410-audss-clock
>> +      - samsung,exynos5420-audss-clock
>> +
>> +  clocks:
>> +    minItems: 2
>> +    items:
>> +      - description:
>> +          Fixed rate PLL reference clock, parent of mout_audss. "fin_pll" is
>> +          used if not specified.
>> +      - description:
>> +          Input PLL to the AudioSS block, parent of mout_audss. "fout_epll" is
>> +          used if not specified.
>> +      - description:
>> +          Audio bus clock, parent of mout_i2s. "sclk_audio0" is used if not
>> +          specified.
>> +      - description:
>> +          PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if not specified.
>> +      - description:
>> +          External i2s clock, parent of mout_i2s. "cdclk0" is used if not
>> +          specified.
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    items:
>> +      - const: pll_ref
>> +      - const: pll_in
>> +      - const: sclk_audio
>> +      - const: sclk_pcm_in
>> +      - const: cdclk
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  power-domains: true
> 
> How many?
> 

I'll fix it, thanks for review.

Best regards,
Krzysztof
