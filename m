Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786DFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 13:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AB7A6115C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 13:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240006AbhJONtL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 09:49:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:49602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236384AbhJONtL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 09:49:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E703600D4;
        Fri, 15 Oct 2021 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634305624;
        bh=/Mbkfa1+NWegcrBQ2TkZ79kV27LgRGCLcWrVVKv5bso=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nFTGJ9ZoXcJf1EMxema9sKSnQ885ZjmovVsTDv7tZ14EqNpCbEkJMEgAJCSjLTdLJ
         4XipYSuidch6U2ZFN2nyfVLs0UYmWMyAuzmgJuHypwT3VHaPpdLMZNCCxZZBjwj/3S
         7Mv1mUFkyC7kQYmeb/HWfLNz2davT3oYGPFEDKxqq6HmyRDPa33Tvz7VKkv9zD6YrS
         1b4XD29rPBJSXNO3/9nvgzVjYbiYB0BsY6xwp6w8AGGVssqc8DbkygbpG4z3mAlmnV
         9dqzrCjox0hdfjn0Le1hQorrHmFWi1jcXl8/1AGiYHAhEwdAlcOkgJyj0Yw64T5A2U
         TdMoBSeRJ5DcA==
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Document Exynos850 CMU
 bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
 <20211008154352.19519-5-semen.protsenko@linaro.org>
 <7049b3a9-dc8f-2ae9-01e6-eb3b6f461400@kernel.org>
 <CGME20211011101326eucas1p17e6deeaa2449bf3f0d6306fb930cce17@eucas1p1.samsung.com>
 <CAPLW+4kJK=kaiCLDXX1EGLhbKJo5pcHQY9QCj0SVyGQP1n7q0g@mail.gmail.com>
 <ef781890-76ca-3392-9a17-3856fa1834cf@samsung.com>
 <CAPLW+4mXMLadAi6U3GiXqRHAGnLH79rZeK6w=EcbOccjqH4N9w@mail.gmail.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <bfe13b9f-fcb5-18a5-c14f-6efa0f61909f@kernel.org>
Date:   Fri, 15 Oct 2021 15:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mXMLadAi6U3GiXqRHAGnLH79rZeK6w=EcbOccjqH4N9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12.10.2021 10:13, Sam Protsenko wrote:
> On Mon, 11 Oct 2021 at 13:42, Sylwester Nawrocki<s.nawrocki@samsung.com>  wrote:
>> On 11.10.2021 12:13, Sam Protsenko wrote:
>>> On Sat, 9 Oct 2021 at 23:41, Sylwester Nawrocki<snawrocki@kernel.org>  wrote:
>>>> On 08.10.2021 17:43, Sam Protsenko wrote:
>>>>> Provide dt-schema documentation for Exynos850 SoC clock controller.
>>>>>
>>>>> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
>>>>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
>>>>> Acked-by: Chanwoo Choi<cw00.choi@samsung.com>
>> [...]
>>>>> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
>>>>> @@ -0,0 +1,185 @@
>> [...]
>>>>> +
>>>>> +title: Samsung Exynos850 SoC clock controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Sam Protsenko<semen.protsenko@linaro.org>
>>>>> +  - Chanwoo Choi<cw00.choi@samsung.com>
>>>>> +  - Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
>>>>> +  - Sylwester Nawrocki<s.nawrocki@samsung.com>
>>>>> +  - Tomasz Figa<tomasz.figa@gmail.com>
>>>>> +
>>>>> +description: |
>>>>> +  Exynos850 clock controller is comprised of several CMU units, generating
>>>>> +  clocks for different domains. Those CMU units are modeled as separate device
>>>>> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
>>>>> +  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
>>>>> +  clocks must be defined as fixed-rate clocks in dts.
>>>>> +
>>>>> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
>>>>> +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
>>>>> +
>>>>> +  Each clock is assigned an identifier and client nodes can use this identifier
>>>>> +  to specify the clock which they consume. All clocks that available for usage

>>>> s/All clocks that available/All clocks available ?
>>>> No need to resend, I can amend it when applying.
>>>>
>>> Yeah, not a native speaker, I tend to do such mistakes sometimes:)
>>> Please fix when applying.
>>>
>>> Btw, I can see that you already applied 3 out of 5 patches from this
>>> patch series here: [1]. Can you please also apply the rest, or is
>>> there any outstanding comments that I missed?
>> The patches look good to me, I just wanted to allow some for Rob to have
>> a look and provide an Ack.
>>
> Can you please review this one?

The binding is rather straightforward so I applied the patch now, thank you.



