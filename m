Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17577C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:22:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8B3660E74
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 15:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbhJZPZW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:25:22 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41560
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234738AbhJZPZV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 11:25:21 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E23123FFF8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635261776;
        bh=8gTXC6kDWVMYoToYb5B6hbJrl2FdmKK5EeKfMKFu7aQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=SlxVavj/j5qJQvHBYe806kj610+zmFISg5FFFihKBPClFvrEEI6mtvoGyAMBkGXpm
         aa9svj4d0G07wgJ85iH15OnzwxkHKu16jn7nbLJNkGp05fc+mTLRhUJUa2TcQ2sdAz
         3xAhJygy5Kj+yDzXjwhqSuMrKS/uLQuqMxcLVwEPquPXGTq9Xo5IW/Nxl7318uwbB+
         dzzPV0k89CfjRcwJbfnV1StNq1dDuDPwYo/kvUawZI5qpoeDYOwXpqrT203UyJIjJe
         cdQ8bUmGfF+Va4vSPiLfKJ9wLgqjDt9c62UkXqmspCRcePJKAJb8q9eP4dIJQLfpcc
         /ucke+H8kavaw==
Received: by mail-lf1-f69.google.com with SMTP id u17-20020a05651206d100b003fd714d9a38so1262166lff.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 08:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8gTXC6kDWVMYoToYb5B6hbJrl2FdmKK5EeKfMKFu7aQ=;
        b=EW61Z81gZmVzZlNuGRCOyIrZLr3Dfg6Dhlx1LH5sczmzCKFsXTOIvCFhaN10AXyZqZ
         26ML0Ttsj5RV1zkssNNl0XF3fQJO8jcpw4sNl/XuViG1wnL+ErOhVxTDa3ZLENZ5/CYG
         zQROL6qSFHlYX1q/9V7Lj4qK2VzAifBHOg06IlEPJM+bh4DcElQZddcOKxsyx+gpmULr
         LIBVRZOZHWJZi6AY3g3IdeKdpDA2rXNPTFCr6IdvVc6z5hzwqXEdbOk9EgrjiIJ6xNsY
         fz0nJMS2UH1DtTBdeWcQSnunMEOV34uONVIgQwizE7B5c1lNpcaLLBzHbLR0v67MBd+j
         GuUQ==
X-Gm-Message-State: AOAM531OG5sMpvOt+srTgeEJzOWTe4d6t8Mq+rWg6xyQzZk7+AC/0oty
        s2p4HYaOFTGe+NNECYjTLh7r5a51pBH3CseeE8BoP3uDT3Z5iX23zxaR/7527htwrWX8KLIBedp
        NHq3Km/XbkMpnApqTqTooD6q7Qny5K5TZxQi0xTUVnd5VHom1
X-Received: by 2002:a05:6512:a8b:: with SMTP id m11mr23566142lfu.376.1635261776079;
        Tue, 26 Oct 2021 08:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlCNdMFwEXIZr86mohjVM6JadTYb6AKySe6zIb7iwY/lu2oUlq8/Du47vqUYSfMuBR8kLszg==
X-Received: by 2002:a05:6512:a8b:: with SMTP id m11mr23566133lfu.376.1635261775914;
        Tue, 26 Oct 2021 08:22:55 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f14sm2267759ljc.108.2021.10.26.08.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 08:22:55 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: s3c: irq-s3c24xx: Fix return value check for
 s3c24xx_init_intc()
To:     Arnd Bergmann <arnd@arndb.de>, Jackie Liu <liu.yun@linux.dev>
Cc:     "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Jackie Liu <liuyun01@kylinos.cn>
References: <20210901123557.1043953-1-liu.yun@linux.dev>
 <CAK8P3a2AxmdhGKhGxfQetfzE0nKaaTRBmX=0OEPoaxkkZwABNg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <957585d9-2f0f-7181-bba3-69c690c92f6f@canonical.com>
Date:   Tue, 26 Oct 2021 17:22:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2AxmdhGKhGxfQetfzE0nKaaTRBmX=0OEPoaxkkZwABNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/10/2021 17:10, Arnd Bergmann wrote:
> On Wed, Sep 1, 2021 at 2:35 PM Jackie Liu <liu.yun@linux.dev> wrote:
> 
>> +               /* For platform based machines, neither ERR nor NULL can happen here.
>> +                * The s3c24xx_handle_irq() will be set as IRQ handler iff this succeeds:
>> +                *
>> +                *    s3c_intc[0] = s3c24xx_init_intc()
>> +                *
>> +                * If this fails, the next calls to s3c24xx_init_intc() won't be executed.
>> +                *
>> +                * For DT machine, s3c_init_intc_of() could set the IRQ handler without
>> +                * setting s3c_intc[0] only if it was called with num_ctrl=0. There is no
>> +                * such code path, so again the s3c_intc[0] will have a valid pointer if
>> +                * set_handle_irq() is called.
>> +                *
>> +                * Therefore in s3c24xx_handle_irq(), the s3c_intc[0] is always something.
>> +                */
>> +               if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
>> +                       continue;
>>
>> -               if (s3c_intc[2])
>> +               if (!IS_ERR_OR_NULL(s3c_intc[2]))
>>                         if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
>>                                 continue;
> 
> I just saw this in the pull request. I'm taking the pull request since
> it's a bugfix and
> the resulting code is technically correct, but I'd point out that this
> is particularly
> ugly. Any use of IS_ERR_OR_NULL() essentially means we have a misdefined
> interface, and it's clear that this is one of them.

Yes, that's the case.

> 
> Nothing actually uses the return code of s3c24xx_init_intc(), so returning
> NULL on error there and changing all the checks to that would be a much
> more straightforward solution.
> 
> Any chance you could send a follow-up to do that?

I can work on this but you know this is a legacy platform and none of us
can test it?


Best regards,
Krzysztof
