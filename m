Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73DAC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 10:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 802EE64FAC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 10:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236551AbhCPKML (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Mar 2021 06:12:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41393 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236524AbhCPKLp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 06:11:45 -0400
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lM6fw-0006Z5-Gg
        for linux-samsung-soc@vger.kernel.org; Tue, 16 Mar 2021 10:11:44 +0000
Received: by mail-ej1-f72.google.com with SMTP id v10so13333199ejh.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 03:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b0duzRCaAd6HCnqDszh8HzHViWmbH3s2/7Iw8Q+UR7g=;
        b=fiQRWZpHBvzXyxwYHDmm5WbDm/PNAhn+FA8PP0Pp2NCVMWdCLZJ5UiZSfkVzNSklf2
         O0vF+XQ1m7cbSu3VqS37YJGyLTp7VRjJuO2PGr8lbmjSx/dwbQr6L2kF+BfcYintDf5k
         vh+OLDj33DxhKMfkect63PMWdBIQr7s7DU4YZbEYXiqr4ebP7LKamtPglA+XfYWopiY/
         tf50IiOeVB9x7c8hQwRmrwH07TuC32KuOin6lx0cf6YlR0Ssq+X/1A1Dw+fEbUM4ioIK
         GhDr4A7RocU8690T49LFz56pD0k0BLZOEH93qF+cuagkEFbwXnhzX3zFzNJmEEv1938Q
         N5fQ==
X-Gm-Message-State: AOAM531MShztG7UQe4jviKZ2/EdbsWIWLsuz7dS94T7l8loBFwPkoSME
        Vyba59ugyoxHSMEM6MjGuvvGXBjhMXc5XshzRqUXyBk6SRbDPd9AnkYfKEgRPdCa//9aRzVImxO
        ju3Uc6VnzBDjeTWvbnZywf8kdgJIoj/neQN6JsWhqEjx50PVV
X-Received: by 2002:a17:906:9243:: with SMTP id c3mr29663334ejx.388.1615889504254;
        Tue, 16 Mar 2021 03:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2WvVnE529fDdG65yCEejk0MxK/8sqZnjAJjGw18sNXl1HOe3MN5ShhMd+pxFPJyRYKZpedg==
X-Received: by 2002:a17:906:9243:: with SMTP id c3mr29663314ejx.388.1615889504118;
        Tue, 16 Mar 2021 03:11:44 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id t27sm9126163ejc.62.2021.03.16.03.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 03:11:43 -0700 (PDT)
Subject: Re: [PATCH] tty: serial: samsung_tty: remove spinlock flags in
 interrupt handlers
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, marcan@marcan.st, arnd@kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210315181212.113217-1-krzysztof.kozlowski@canonical.com>
 <YFB0OcBg3Vj555eA@hovoldconsulting.com>
 <7f348e4c-3051-13cf-d461-eeda0ef53fdd@canonical.com>
 <YFCA5jFLV0Cu9YNe@hovoldconsulting.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <816834ba-8dc2-05cd-9c81-a11d65980cfd@canonical.com>
Date:   Tue, 16 Mar 2021 11:11:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFCA5jFLV0Cu9YNe@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/03/2021 10:56, Johan Hovold wrote:
> On Tue, Mar 16, 2021 at 10:47:53AM +0100, Krzysztof Kozlowski wrote:
>> On 16/03/2021 10:02, Johan Hovold wrote:
>>> On Mon, Mar 15, 2021 at 07:12:12PM +0100, Krzysztof Kozlowski wrote:
>>>> Since interrupt handler is called with disabled local interrupts, there
>>>> is no need to use the spinlock primitives disabling interrupts as well.
>>>
>>> This isn't generally true due to "threadirqs" and that can lead to
>>> deadlocks if the console code is called from hard irq context.
>>>
>>> Now, this is *not* the case for this particular driver since it doesn't
>>> even bother to take the port lock in console_write(). That should
>>> probably be fixed instead.
>>>
>>> See https://lore.kernel.org/r/X7kviiRwuxvPxC8O@localhost.
>>
>> Thanks for the link, quite interesting! For one type of device we have
>> two interrupts (RX and TX) so I guess it's a valid point/risk. However
>> let me try to understand it more.
>>
>> Assuming we had only one interrupt line, how this interrupt handler with
>> threadirqs could be called from hardirq context?
> 
> No, it's console_write() which can end up being called in hard irq
> context and if that path takes the port lock after the now threaded
> interrupt handler has been preempted you have a deadlock.

Thanks, I understand now. I see three patterns shared by serial drivers:

1. Do not take the lock in console_write() handler,
2. Take the lock like:
if (port->sysrq)
    locked = 0;
else if (oops_in_progress)
    locked = spin_trylock_irqsave(&port->lock, flags);
else
    spin_lock_irqsave(&port->lock, flags)

3. Take the lock like above but preceded with local_irq_save().

It seems the choice of pattern depends which driver was used as a base.

Best regards,
Krzysztof
