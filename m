Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C555C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 06:44:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58F8A60F55
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 06:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234851AbhHKGoq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 02:44:46 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:60986
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234791AbhHKGop (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 02:44:45 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6490D3F102
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 06:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628664255;
        bh=yI4F0TrXeF6j0uWlAGd8JOKtXjZO1rjsb+fsK6ntWNc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=QCrL0IH+NlioFBUPojDPQNjzXAW1OEc8lRhhkTAfkV/v6OYo1c9fxEuQ3p3z3kaI3
         ksU+1ZWG/y09CdLfH0FCh7AfI5ePFtiePiDbYwxGpCt8Bnx1q5xj7PMY7dFZixoX0R
         cksG9BIKsMRAr0N/xqg+zff7nh73AIUp/FqHTEgssqc6clKwR+lZS1W0NBY/jRETyx
         JPx0mOl5ECPsKNNWzvtc5tuS4JAQ4r1rLuTtQ0oANkcKYhK5UyYR/efsVprlcg/bkg
         rirD9G+mNTS87LBxa3J+uzs1seecMUc2mwGDNis+MO5Ihd1HM3SmmbCdoMj8dqfIj8
         lGZRSAhMZJIgg==
Received: by mail-ej1-f72.google.com with SMTP id zp23-20020a17090684f7b02905a13980d522so287645ejb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 23:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yI4F0TrXeF6j0uWlAGd8JOKtXjZO1rjsb+fsK6ntWNc=;
        b=KypeJ3CU537y4xBJKRC4FC60np+S4qpuIUerZNhLPGYrikuKvgq0Kewl7p9D9VpCVR
         fCyCV+0vcQ2SUX8RQ1X17pjJrfKGQ5T6WAHi8VzfoBBYYBzCS/Qh92oR7tkPDmPGToV8
         4r21n0m88Slh55OH0kmMbTyKc9zCjKYcFLvWWGCgcDgAz+bvXrWVPzhjwbF6pZ7DLSKd
         kdGmWMeAobRv6R3FeA83IKWjYbXILwmrFWkHVOycGqrW8xeD9u1jN/amvTcBQwmZucXg
         x8OBcBOOcLhunPghMsZSz2ZgExqmVNBD0GlRg+NCILAA/7kCUG3oa1KXDTeN8mTbxzgr
         JYvw==
X-Gm-Message-State: AOAM533c8t9hZFyRvmPf5JPe4a0jehQ06E0MAo8ePKCp2LtzwLBmPQ1+
        soMIpGec8uqgdAxLtNk1Kgo7CpSUgRcAFSTc8RPzkwaT3EJqwNSeyfOIJAIjiI4cqdXQRBubrTP
        VdszF27FNJaVQQLlO1Xhpp/9GlwTxW405R0v2e22a6qCpLHRh
X-Received: by 2002:a05:6402:60b:: with SMTP id n11mr9969677edv.235.1628664255169;
        Tue, 10 Aug 2021 23:44:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB+O4Ym2uIaIHDDXqDCrOGwxlCDfkjrMNGsotn04/wADe/4dd+/4WTGUUDqN74xbHo46mvig==
X-Received: by 2002:a05:6402:60b:: with SMTP id n11mr9969663edv.235.1628664255049;
        Tue, 10 Aug 2021 23:44:15 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id f16sm2712974edw.79.2021.08.10.23.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 23:44:14 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: samsung: convert Exynos5250 to
 dtschema
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
 <20210810093145.26153-2-krzysztof.kozlowski@canonical.com>
 <CAPLW+4njX-R2e66qcCz=OT_bYKTRLHTH4nFv==EEovJyjN8qAg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <48a205be-6a37-5acc-e2ee-fa18643711a9@canonical.com>
Date:   Wed, 11 Aug 2021 08:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4njX-R2e66qcCz=OT_bYKTRLHTH4nFv==EEovJyjN8qAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/08/2021 19:51, Sam Protsenko wrote:
> On Tue, 10 Aug 2021 at 12:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Convert Samsung Exynos5250 clock controller bindings to DT schema format
>> using json-schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/clock/exynos5250-clock.txt       | 41 ----------------
>>  .../bindings/clock/samsung,exynos-clock.yaml  | 48 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  3 files changed, 49 insertions(+), 41 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>> deleted file mode 100644
>> index aff266a12eeb..000000000000
>> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -* Samsung Exynos5250 Clock Controller
>> -
>> -The Exynos5250 clock controller generates and supplies clock to various
>> -controllers within the Exynos5250 SoC.
>> -
>> -Required Properties:
>> -
>> -- compatible: should be one of the following.
>> -  - "samsung,exynos5250-clock" - controller compatible with Exynos5250 SoC.
>> -
>> -- reg: physical base address of the controller and length of memory mapped
>> -  region.
>> -
>> -- #clock-cells: should be 1.
>> -
>> -Each clock is assigned an identifier and client nodes can use this identifier
>> -to specify the clock which they consume.
>> -
>> -All available clocks are defined as preprocessor macros in
>> -dt-bindings/clock/exynos5250.h header and can be used in device
>> -tree sources.
>> -
>> -Example 1: An example of a clock controller node is listed below.
>> -
>> -       clock: clock-controller@10010000 {
>> -               compatible = "samsung,exynos5250-clock";
>> -               reg = <0x10010000 0x30000>;
>> -               #clock-cells = <1>;
>> -       };
>> -
>> -Example 2: UART controller node that consumes the clock generated by the clock
>> -          controller. Refer to the standard clock bindings for information
>> -          about 'clocks' and 'clock-names' property.
>> -
>> -       serial@13820000 {
>> -               compatible = "samsung,exynos4210-uart";
>> -               reg = <0x13820000 0x100>;
>> -               interrupts = <0 54 0>;
>> -               clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>> -               clock-names = "uart", "clk_uart_baud0";
>> -       };
>> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> new file mode 100644
>> index 000000000000..cd6567bd8cc7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/samsung,exynos-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung Exynos SoC clock controller
>> +
>> +maintainers:
>> +  - Chanwoo Choi <cw00.choi@samsung.com>
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
>> +  - Tomasz Figa <tomasz.figa@gmail.com>
>> +
>> +description: |
>> +  All available clocks are defined as preprocessor macros in
>> +  dt-bindings/clock/ headers.
>> +
>> +properties:
>> +  compatible:
>> +    const: samsung,exynos5250-clock
>> +
>> +  assigned-clocks: true
>> +  assigned-clock-parents: true
>> +  assigned-clock-rates: true
>> +  clocks: true
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - "#clock-cells"
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/exynos5250.h>
>> +    clock: clock-controller@10010000 {
>> +        compatible = "samsung,exynos5250-clock";
>> +        reg = <0x10010000 0x30000>;
>> +        #clock-cells = <1>;
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 36aee8517ab0..2dbacacac3f5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -16491,6 +16491,7 @@ L:      linux-samsung-soc@vger.kernel.org
>>  S:     Supported
>>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
>>  F:     Documentation/devicetree/bindings/clock/exynos*.txt
> 
> Are there any exynos*.txt bindings actually left after this series? If
> no, maybe it's worth to remove this line while at it.

Yes, there are. These are the bindings which expect specific  external
fixed clock and I don't know yet how to model it in dtschema.


Best regards,
Krzysztof
