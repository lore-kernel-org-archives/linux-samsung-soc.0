Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F238EC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 06:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9A676102A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Aug 2021 06:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238687AbhHRGuC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Aug 2021 02:50:02 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:52942
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238597AbhHRGuB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 02:50:01 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id C8E24412E5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Aug 2021 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629269365;
        bh=koyaZ5FIZxDdS33SITxLj7wHGHh/MSdOiD6GS5fpHeg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=LxH8xivxknKbu4PGoNssjfpIhFmTTJS13p40vXmGzRWBM8fZhw6sjJJ3oQsC3RUOq
         xQ5m3MjNoHlNhJAdVnea8HHideSZIFVb4Mgwjjc1uOoHuQeIAKLor5aqiZ5u7surzl
         MSG0eQR9xo6hBnlKXLo3x07cAGB4DZqTLinqtwjLLqa0Xv+HGtmDnRG0SIa8Ln7UA+
         6ITkLPfu+K6zc9F2O8ajLai2sVydqLk4SNqnYeK++s8/ARpuioYq/zVPC1M7SdYVcf
         bfI91/PpBabdySBu6YuShmiUOyM0BpLCcLZEUHdwY8S99Iss0SEkLp8br90B2/XTlH
         Zq7vAM6m8K7ag==
Received: by mail-ed1-f72.google.com with SMTP id n4-20020aa7c6840000b02903be94ce771fso533839edq.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 23:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=koyaZ5FIZxDdS33SITxLj7wHGHh/MSdOiD6GS5fpHeg=;
        b=P+sOpbT5m3/R0ybj65P3czktTJJ0Luq1H9eV8qAvw089I26YBTnRPGjmzChuJ4LxpX
         Yp9HLVzwEb1tAQSfV+Ba+wKnPF61C9IX1aRFVXj9F/m+lF/elfr14tkhkahRJ10JKnPQ
         CcqbouqezZCzwFT31QKhOphRD2pdzzjy3l1gSbDCd1ASbphO47UI1rxrTH/q47xpULTH
         N4DtRyAiMHhO+7IN7GFFOXc9z7evh9B+nQPalUXDt6c2ODyptWkmXYG8VLX88GFZpR8t
         oyykFo0KTvs5zGfV49LA7IoY7dSUkrZkQ0XT84+swOApNAM+KpCLRNE9ifCsMjC0h6d9
         poZw==
X-Gm-Message-State: AOAM532zz8ld9zsfu6esa/ovkgJbYA0CoUaa6CeG8PU3B2tY0dZBbaw8
        p7+buBi5VPc3loYbQFCmBMqySuDnjEChD3DHva1JV876cY2avwZMMigxbqRbtmg4nACCfCZmguD
        F5R4GQXOFEhMWA9uSvQToORm/W7qoI3oHmjWh/r8m4Vt4PZQx
X-Received: by 2002:a17:906:1f8e:: with SMTP id t14mr8154726ejr.313.1629269365322;
        Tue, 17 Aug 2021 23:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWhQFCV598TtTdTr1EoTmYGq5dI5oFgzC45QcBRmM+oIeH6pPwo+Is9DtzMEBVJyV2Y08tYw==
X-Received: by 2002:a17:906:1f8e:: with SMTP id t14mr8154708ejr.313.1629269365121;
        Tue, 17 Aug 2021 23:49:25 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id f20sm1580873ejz.30.2021.08.17.23.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 23:49:24 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: samsung: convert Exynos5250 to
 dtschema
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
 <20210810093145.26153-2-krzysztof.kozlowski@canonical.com>
 <YRwZG1uerWt+NAQH@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c7311cd1-7e62-91d9-bbbd-cfc3c027da35@canonical.com>
Date:   Wed, 18 Aug 2021 08:49:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRwZG1uerWt+NAQH@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/08/2021 22:16, Rob Herring wrote:
> On Tue, Aug 10, 2021 at 11:31:38AM +0200, Krzysztof Kozlowski wrote:
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
>> -	clock: clock-controller@10010000 {
>> -		compatible = "samsung,exynos5250-clock";
>> -		reg = <0x10010000 0x30000>;
>> -		#clock-cells = <1>;
>> -	};
>> -
>> -Example 2: UART controller node that consumes the clock generated by the clock
>> -	   controller. Refer to the standard clock bindings for information
>> -	   about 'clocks' and 'clock-names' property.
>> -
>> -	serial@13820000 {
>> -		compatible = "samsung,exynos4210-uart";
>> -		reg = <0x13820000 0x100>;
>> -		interrupts = <0 54 0>;
>> -		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
>> -		clock-names = "uart", "clk_uart_baud0";
>> -	};
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
> 
> These can be dropped. They are always allowed if 'clocks' is present.
> 
>> +  clocks: true
> 
> This needs to define how many.
> 

Right, thanks.


Best regards,
Krzysztof
