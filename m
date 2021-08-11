Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31289C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 06:46:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 165A160F55
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 06:46:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234930AbhHKGrM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 02:47:12 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:33232
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234781AbhHKGrM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 02:47:12 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 20BC54062C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 06:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628664408;
        bh=Kxcfgig03MExxX+JwfluOsjWYQpaWWiiVo+lWFIhADQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=P/LI2XjiaGae2I65j+DTithB5mybgXSQefo/W8jpIckD99M+TqMME6FMn9cr8kydA
         egY/sEvMO7Vj8OOgBthFJW0yXcpfI5AiOColUV67mipBwAF2bsJxh2MF2mq7RgAuTB
         zI6bSMITE/i1Xp8k4PqxAJj0jX8YlnURpHGHWGCU0fldnc6Jvcjw2r23V6Kf048jJX
         0JeMQ952BeUMbwC/EO7R8xrK1Lg9YfB2Nb4YhgeL3mUyN3BTudufPuS7IfCieuA1H5
         uivAsA0Mj+b53gZal7GtvdPCTBYbNL8NkdoirZrWaiVA/CaE6/LvcklYtbayfnlbMh
         IAKR1wKwKyxlA==
Received: by mail-ed1-f72.google.com with SMTP id b16-20020a0564022790b02903be6352006cso718736ede.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 23:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kxcfgig03MExxX+JwfluOsjWYQpaWWiiVo+lWFIhADQ=;
        b=q41xSPgPldJkSy2/2mgTYjZ8Aw5CxZMWOL7x7tj0JfjwC1x5RwRm4HregZmaDemUDT
         HhTTlvYBQAwF7lMJdzhJ0zpKAgUpJeugsfIm9iNWSaC1vRXkJJY3WLB6jlIEpCWa1qLB
         919IdV+aVcwJJ7QAdx045tlPcBXUWxf6jCyGWrzKzzPjkFP6a1EJ/RSWX81C6aPpZG3D
         3JDCDURdDse35KMFJkj7rxPAyBtOckS0srFvXU9JZfVmCncpelmQQXuvRLxYHuxBma64
         Ji+6bMAL9mk/IM6u+Y9eNV2mV0+3IgYmmLpasojx7XeEhvHG33QmAXQrtTfKF4FqLgRJ
         WHjQ==
X-Gm-Message-State: AOAM533Ge7ASmKU8M2FLhHczxrxi/GHirAc26U1qu1AmKZASdPXdQT62
        lzBJs+zcLar9bcB9DCFe1ufVacz81GsRuuJqtVvJXBWsPir/9DX+ATn3d05Y0Ach0YNff9t4DD/
        WETNtkdx+rKF+2bAjrr7Grld0iX3JVu4Pe9FIveZiZc4G38J6
X-Received: by 2002:a17:906:3486:: with SMTP id g6mr2191983ejb.71.1628664407876;
        Tue, 10 Aug 2021 23:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBEhnDDIKzRzSlos2OcWTaUXRBhbPyQFY/bOczJwuJqcDVlM+mwha6XxbcUtpn16t24qXmdw==
X-Received: by 2002:a17:906:3486:: with SMTP id g6mr2191954ejb.71.1628664407588;
        Tue, 10 Aug 2021 23:46:47 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id n15sm10695991edw.70.2021.08.10.23.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 23:46:47 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] dt-bindings: clock: samsung: convert Exynos AudSS
 to dtschema
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
 <CAPLW+4=tOpaNGs6vxwyVy7xaeX+w_jhtY2P2U8sZGvm6mdqh1Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2f8ff138-4d34-619c-e137-099dc9251e25@canonical.com>
Date:   Wed, 11 Aug 2021 08:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=tOpaNGs6vxwyVy7xaeX+w_jhtY2P2U8sZGvm6mdqh1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/08/2021 19:46, Sam Protsenko wrote:
> On Tue, 10 Aug 2021 at 12:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
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
>> -          clock names is listed below.
>> -
>> -clock_audss: audss-clock-controller@3810000 {
>> -       compatible = "samsung,exynos5250-audss-clock";
>> -       reg = <0x03810000 0x0C>;
>> -       #clock-cells = <1>;
>> -};
>> -
>> -Example 2: An example of a clock controller node with the input clocks
>> -           specified.
>> -
>> -clock_audss: audss-clock-controller@3810000 {
>> -       compatible = "samsung,exynos5250-audss-clock";
>> -       reg = <0x03810000 0x0C>;
>> -       #clock-cells = <1>;
>> -       clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>,
>> -               <&ext_i2s_clk>;
>> -       clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
>> -};
>> -
>> -Example 3: I2S controller node that consumes the clock generated by the clock
>> -           controller. Refer to the standard clock bindings for information
>> -           about 'clocks' and 'clock-names' property.
>> -
>> -i2s0: i2s@3830000 {
>> -       compatible = "samsung,i2s-v5";
>> -       reg = <0x03830000 0x100>;
>> -       dmas = <&pdma0 10
>> -               &pdma0 9
>> -               &pdma0 8>;
>> -       dma-names = "tx", "rx", "tx-sec";
>> -       clocks = <&clock_audss EXYNOS_I2S_BUS>,
>> -               <&clock_audss EXYNOS_I2S_BUS>,
>> -               <&clock_audss EXYNOS_SCLK_I2S>,
>> -               <&clock_audss EXYNOS_MOUT_AUDSS>,
>> -               <&clock_audss EXYNOS_MOUT_I2S>;
>> -       clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
>> -                     "mout_audss", "mout_i2s";
>> -};
> 
> Seems like some examples and "Provided clocks" table were dropped in
> in yaml binding. Also there is no description for example present in
> yaml file. Is that some redundant info and was dropped intentionally?
> I'm just worrying about losing some useful info during the conversion.

I don't see any point of having a clock consumer example in a clock
provider binding.


Best regards,
Krzysztof
