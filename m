Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E18DC43216
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:35:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74B9D6115B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245461AbhIAMgI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 08:36:08 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56004
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245439AbhIAMch (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 08:32:37 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DFD3D3F046
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Sep 2021 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630499498;
        bh=/DOVcTuoJyHfRzErnFKUErpJUgTFlL6mubtltn5I8so=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=gus6QyFTY2S0ewMbi3bvwcL+sogBPHH6/6hPhHaHhEOEdlB8yJe41/viXmFoZWkG+
         qNibSf4oKNah9x+ddDpCb8js3KAKQzz0jyQ8JjA2eZHiOk6YTJ16ICWz7pUAk5PvcF
         8iyFRijTUNiMErBtaEB4YMVz35gzBflKkMXen55TeqG81vBLW6jlQae7BeCoCXGS+l
         rM95P7Our2ebo5bopL4sQ42FnqqYcJvNf6Q7QPzsx8HNQIxNwqpR5kT6PiOnN8UBbm
         5vDSV8tPNAiJInyN25EPJ+3mdS0HukFz9viNaXvZyRIim8OpM0LhGzNNtR/r9LSX0H
         M5NQcWPNHAMnA==
Received: by mail-wm1-f71.google.com with SMTP id f128-20020a1c3886000000b002e887c95e07so971332wma.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2021 05:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/DOVcTuoJyHfRzErnFKUErpJUgTFlL6mubtltn5I8so=;
        b=dyrdeFPa4k0s7Yqy2fP/LgDq1YjJUI7R/rkdhEkEA1w2GMs1JLO+XbCuZXBxSZgu9i
         fzPPub6EmsMl6dB9PrmINaodCmuMaZCSYS2KvfJWoHPHKKwyVVadDzqWDzNXkAlwHVSQ
         KUO7SYobhgtiR0esylIDrq5I8u9N0/ungF+g19/Nl9eW8ELBc/o1PHDmzb/tsgxDBBdH
         P/Z4b4BNetzqXworsvltPQhfap3yo20T3sD40fJHPKYNRwwSdS2m+NCQHIr270Yp0L77
         MDdBDrsxQqe6BrEBoKR4lLG6KY8fB1uHyD6PkXsDhLIWSpI0V+oZKdsCVjLodGepnQmA
         WUYg==
X-Gm-Message-State: AOAM533HiisGla7FbxB7AtSdkBMkSKAwM1fREPzX99VOzu1qB9EAFkim
        /5wypKR+sRV7fmsCVpvQKHX773a5ELOTepxCHCtGJHy3iu/86dgVdxYiosCDnE6NTQ9eJQWL9EU
        Zh6ClrGecJvAXwvOXRM67IZDXSAHPckKRMFnGR6fkatN7dxqN
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr9309799wmk.107.1630499498577;
        Wed, 01 Sep 2021 05:31:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZw8A3fB+INF1mUgcp/mBWzV8ecNjSLwG6xmOEhGkVR+pysqZx2nbUh6XaQ8Y7SG1vBuGcYg==
X-Received: by 2002:a05:600c:299:: with SMTP id 25mr9309776wmk.107.1630499498341;
        Wed, 01 Sep 2021 05:31:38 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.227])
        by smtp.gmail.com with ESMTPSA id b15sm23352509wru.1.2021.09.01.05.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 05:31:37 -0700 (PDT)
Subject: Re: [PATCH] ARM: s3c: irq-s3c24xx: Fix return value check for
 s3c24xx_init_intc()
To:     Jackie Liu <liuyun01@kylinos.cn>, Jackie Liu <liu.yun@linux.dev>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210831095728.2447598-1-liu.yun@linux.dev>
 <4137a6dc-cd90-5813-07aa-c8b4dbf510ce@canonical.com>
 <d0b556af-68b4-6972-7213-0067d65594c8@kylinos.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <48dd9faf-52df-56d0-7875-9b5ad7c7e0cd@canonical.com>
Date:   Wed, 1 Sep 2021 14:31:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d0b556af-68b4-6972-7213-0067d65594c8@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/09/2021 14:28, Jackie Liu wrote:
> 
> Hi Krzysztof, Thanks for you message.
> 
> 在 2021/9/1 下午8:09, Krzysztof Kozlowski 写道:
>> On 31/08/2021 11:57, Jackie Liu wrote:
>>> From: Jackie Liu <liuyun01@kylinos.cn>
>>>
>>> The s3c24xx_init_intc() returns an error pointer upon failure, not NULL.
>>> let's add an error pointer check in s3c24xx_handle_irq.
>>>
>>> Fixes: 1f629b7a3ced ("ARM: S3C24XX: transform irq handling into a declarative form")
>>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>>
>> Please use scripts/get_maintainers.pl to get list of mailing lists to
>> CC. You skipped two - arm and LKML.
>>
>>> ---
>>>   arch/arm/mach-s3c/irq-s3c24xx.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
>>> index 0c631c14a817..d58bf0f9bf9a 100644
>>> --- a/arch/arm/mach-s3c/irq-s3c24xx.c
>>> +++ b/arch/arm/mach-s3c/irq-s3c24xx.c
>>> @@ -362,11 +362,11 @@ static inline int s3c24xx_handle_intc(struct s3c_irq_intc *intc,
>>>   static asmlinkage void __exception_irq_entry s3c24xx_handle_irq(struct pt_regs *regs)
>>>   {
>>>   	do {
>>> -		if (likely(s3c_intc[0]))
>>> +		if (likely(!IS_ERR_OR_NULL(s3c_intc[0])))
>>>   			if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
>>
>> Thanks for the patch but it does not look entirely correct.
>>
>> For platform based machines, neither ERR nor NULL can happen here.
>> The s3c24xx_handle_irq() will be set as IRQ handler iff this succeeds:
>>      s3c_intc[0] = s3c24xx_init_intc()
>>
>> If this fails, the next calls to s3c24xx_init_intc() won't be executed.
>>
>> For DT machine, s3c_init_intc_of() could set the IRQ handler without
>> setting s3c_intc[0] only if it was called with num_ctrl=0. There is no
>> such code path, so again the s3c_intc[0] will have a valid pointer if
>> set_handle_irq() is called.
>>
>> Therefore in s3c24xx_handle_irq(), the s3c_intc[0] is always something.
>>
>> The code can be simplified by removing if(), if we really wanted and
>> were sure about it.
> 
> In fact, I didn't study his underlying logic in depth, but found that
> this place was not particularly perfect based on the return value of the
> function, because I happened to encounter a similar problem elsewhere.
> 
>>
>>
>>>   				continue;
>>>   
>>> -		if (s3c_intc[2])
>>> +		if (!IS_ERR_OR_NULL(s3c_intc[2]))
>>
>> For the non-DT case, this seems ugly but proper solution. The
>> s3c_intc[2] could be NULL (not set at all) or set as ERR (if
>> s3c24xx_init_intc() fails).
>>
>>>   			if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
>>>   				continue;
>>>   
>>>
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Would you mind review v2?

Sure, please send it.


Best regards,
Krzysztof
