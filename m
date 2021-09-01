Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10E2C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:09:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D31F360F92
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243892AbhIAMKB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 08:10:01 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50926
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243873AbhIAMKB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 08:10:01 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E5C653F322
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Sep 2021 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630498143;
        bh=TiN2YJlrFi2fh7IjgKq//uvd2EQYFIgpP1SXwm5jQaI=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Q+gHQBfAL009lHeqHEiRhLjF91E9P++plt6AcbKUylA7dB+SAgMKOVzAcLrokBNgR
         WWdndNk/iReQCRd6Za9HUFoGTu8mOlIMREaQ/3daBCkQ+C8cG/YZ+7OSHJrXzCa2U4
         Z4LosM051VwmyWllEU4VReUjGC5aM7mmNzK8jRG4/UQHPue9aurmsX316MiLV9wtgG
         DxwV67p6BNITlK+EGbf6eFyt0KgHzcmmixzIo8zXPqpd6FRX8/q7Kp4nN1GeMMNL08
         yisBTlLAHM5WefRtCKCb0lxj0OoISKQCeDtVEhvtBWmQC2wyIGCKNBp0l2F1kAxkUq
         r8PSRtLJCJF8w==
Received: by mail-wm1-f71.google.com with SMTP id w25-20020a1cf6190000b0290252505ddd56so920953wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2021 05:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TiN2YJlrFi2fh7IjgKq//uvd2EQYFIgpP1SXwm5jQaI=;
        b=nlvFc+aOup2zTO04cJF9oE4xurLvrdtLAmhqHHU6vu58H8z4zYVuhQGqmlcXwae08E
         aDpefUOr7tI9VKJFQMAQFcDV9zOEfjMSgzFiScNtl2tzSlmqUgxgsjMwyCpEtKv5iYka
         zcDM+/IgG2mH6zf8iiixNiMJxLi6pxQDWDn980BzfH/IHYhzk0ycpek6jOLJW/DlCZ7o
         hCxfYcp9KHX7VUJZppR76SScySiLE8J0dCM71kT/ND1P4VzGyYy4eORFXKVQf0K5pxBO
         OvhccV+j/R7T3j3Itswb8UmF3DBtHbwa3DoVwreuctuW3665lw4JmF+oGAFkRk9CFW5h
         7NAQ==
X-Gm-Message-State: AOAM533ZRcCpUuJnzdQANdXYm4z+GiMqxdKrFvQKGxtNtaAco8Bb41Bj
        Jcvy+UntLqvF6aRcSYnpTQBIokPdqDqXHrNh+RghCRDFRVnom+f4P5gBczKfL1rDNwIxl4VMJzu
        GLDVwbXnm4gAL0a1ReNLXQ/JFFXwh1Rxy9ReyEpGgeA2j4X1B
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr9170362wmb.53.1630498143611;
        Wed, 01 Sep 2021 05:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwi1MwYKgqy6vx+8xFKb3kasux6cJfQz8FOhnpIuRQdJ1lDspe9q2kOWHQgXR6QFvisFcy8A==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr9170344wmb.53.1630498143439;
        Wed, 01 Sep 2021 05:09:03 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.150])
        by smtp.gmail.com with ESMTPSA id k16sm1752754wrh.24.2021.09.01.05.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 05:09:02 -0700 (PDT)
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     linux-samsung-soc@vger.kernel.org, liuyun01@kylinos.cn
References: <20210831095728.2447598-1-liu.yun@linux.dev>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] ARM: s3c: irq-s3c24xx: Fix return value check for
 s3c24xx_init_intc()
Message-ID: <4137a6dc-cd90-5813-07aa-c8b4dbf510ce@canonical.com>
Date:   Wed, 1 Sep 2021 14:09:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831095728.2447598-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/08/2021 11:57, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> The s3c24xx_init_intc() returns an error pointer upon failure, not NULL.
> let's add an error pointer check in s3c24xx_handle_irq.
> 
> Fixes: 1f629b7a3ced ("ARM: S3C24XX: transform irq handling into a declarative form")
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

Please use scripts/get_maintainers.pl to get list of mailing lists to
CC. You skipped two - arm and LKML.

> ---
>  arch/arm/mach-s3c/irq-s3c24xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
> index 0c631c14a817..d58bf0f9bf9a 100644
> --- a/arch/arm/mach-s3c/irq-s3c24xx.c
> +++ b/arch/arm/mach-s3c/irq-s3c24xx.c
> @@ -362,11 +362,11 @@ static inline int s3c24xx_handle_intc(struct s3c_irq_intc *intc,
>  static asmlinkage void __exception_irq_entry s3c24xx_handle_irq(struct pt_regs *regs)
>  {
>  	do {
> -		if (likely(s3c_intc[0]))
> +		if (likely(!IS_ERR_OR_NULL(s3c_intc[0])))
>  			if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))

Thanks for the patch but it does not look entirely correct.

For platform based machines, neither ERR nor NULL can happen here.
The s3c24xx_handle_irq() will be set as IRQ handler iff this succeeds:
    s3c_intc[0] = s3c24xx_init_intc()

If this fails, the next calls to s3c24xx_init_intc() won't be executed.

For DT machine, s3c_init_intc_of() could set the IRQ handler without
setting s3c_intc[0] only if it was called with num_ctrl=0. There is no
such code path, so again the s3c_intc[0] will have a valid pointer if
set_handle_irq() is called.

Therefore in s3c24xx_handle_irq(), the s3c_intc[0] is always something.

The code can be simplified by removing if(), if we really wanted and
were sure about it.


>  				continue;
>  
> -		if (s3c_intc[2])
> +		if (!IS_ERR_OR_NULL(s3c_intc[2]))

For the non-DT case, this seems ugly but proper solution. The
s3c_intc[2] could be NULL (not set at all) or set as ERR (if
s3c24xx_init_intc() fails).

>  			if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
>  				continue;
>  
> 


Best regards,
Krzysztof
