Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC7FC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 06:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9731560FC4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 06:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhHJGyS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 02:54:18 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:33020
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235351AbhHJGyS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 02:54:18 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 3DCC540C7B
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628578435;
        bh=naRS7CwaU7aZcp3xZ2tFKyzYWCR0lqnUKpwy/5eVcB8=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Gb8vkKoLI9+7rNqE++FDESd7P12O5G/9avHN/y119Iva/DXANidzkVrOW4H3wpgxE
         Dd+02tqDnAtZfGln2KMieDWU5mTYqHCEB0xI8UO2BXH/E2nqeAlLB0gRYEU91ei6/9
         qVuUTawYedvESMFOo+Tq7SzWsSsX2wJg4rquzdIJ06zGkDivWW5ozsCPmcATqryHo5
         PY1dfkVPwP+XrGjJnjJ2R3XzL9DdCnss0vBKLvca0KE+viLdYrR72+7AnaQfOQvJUx
         IMGf0tRCmIwzfXBBxCq8OO/odi5e7hGGHbxt1v4uwvquonQZFU5kRizievCDPVASC/
         rZkEABdeiTFMQ==
Received: by mail-ed1-f71.google.com with SMTP id l18-20020a0564021252b02903be7bdd65ccso315781edw.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 23:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=naRS7CwaU7aZcp3xZ2tFKyzYWCR0lqnUKpwy/5eVcB8=;
        b=fm/VspTLqYOxC7LEBzqMap7tgoEmbPC2gK1BhZvlSzXUEYfEPKsxqOo0mTnUs4melH
         vTaKGEbeJQBugdrv0vzACcXXHI4qSYm1UnLR1iMM2wvQqd74QHFmikJD9/r+LLroQCSM
         xlyvZlZIF0S6T9WwydZ/rFuapjFby2o+DAg6oYPFfYMOG9Q7jdDdOzvB/RFwmfepo5um
         948g23aJS/tz6EbM7Vgi480zmhH6BUzygF2jO4RWuMi7bIt2BjKO7P9kRC2subyu2Tlc
         KNEGsujpuax5AIBsYfhXV0GTrZ3UjSrk17mOileOA6SsVyA6tXdPevbddfFH8D92AcTl
         nGSg==
X-Gm-Message-State: AOAM53004dstHR9NyIHhYBAjozRqCWrnvZgb1EFLPhL2jaKa6J33vXn3
        fxKilq4cVryRlIzcfDV8Ns7Q0v2K3zbX/wrlnpBzfpRR6Us49S5UA1/uawdiwlxmhTQgch7O5v8
        OACdCGfafneDa2Hz/2dnF0IY0IEJxTYXw+AJywsE9z4cxLQLr
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr3061921edc.67.1628578434626;
        Mon, 09 Aug 2021 23:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt5lJkSnz2CsK2GprdZMkQVhxvGiMbsBmVqAjsI2uQfnOW7rXeLh7k2sxFeX91CAgklSqXHg==
X-Received: by 2002:a05:6402:34c4:: with SMTP id w4mr3061912edc.67.1628578434454;
        Mon, 09 Aug 2021 23:53:54 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id t15sm6483770ejf.119.2021.08.09.23.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 23:53:54 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] usb: gadget: udc: s3c2410: add IRQ check
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <bd69b22c-b484-5a1f-c798-78d4b78405f2@omp.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9db78434-6eb0-0094-3ed6-9b355eb923dc@canonical.com>
Date:   Tue, 10 Aug 2021 08:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bd69b22c-b484-5a1f-c798-78d4b78405f2@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/08/2021 22:35, Sergey Shtylyov wrote:
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling request_irq() with the invalid IRQ #s.
> 
> Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
>  drivers/usb/gadget/udc/s3c2410_udc.c |    4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
