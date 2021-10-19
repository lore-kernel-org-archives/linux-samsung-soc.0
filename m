Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031C4C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:19:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBDBF60F93
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhJSQWF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 12:22:05 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59378
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232764AbhJSQWD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:22:03 -0400
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 942283FFF4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634660389;
        bh=ohoFL61CfWYsVL+uDHu343iCHjwcCPT3tDnjH6gN0gA=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=JXucaMltzouZi2xE7/mYkEv4mkU9+SFXosvveHiLyLU/pTytwRZtpSUK6xtgpU2Ce
         GSOzRVZNdTsGGCSm5PZXFL0lXIQ0sD7DJ1KyTDPaabfYd77PSjO1p+LC5RAWM0KmYp
         owYsUpsycSwboAdUOkARJwoaCqipD3H+6uKzdJugJWiyKhOzQ0JrVijBDKM8NMJG1L
         ojsQwfNsxZd7f28nZ5GcmAZKi/P2NxP5Bzv9utUTFSPhzO6UF5HAs73yZm72htA92N
         cnojIyP5z7bEggCK0BWBY6emG7feVOk0P2MfC9vLaXy/Wr7s7jioPR94DeyVkoBiHk
         T2GE1LxuH4Dog==
Received: by mail-lj1-f197.google.com with SMTP id k13-20020a05651c10ad00b00210d682c600so1079690ljn.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ohoFL61CfWYsVL+uDHu343iCHjwcCPT3tDnjH6gN0gA=;
        b=YOEXq3+AI4InDKo+YYC2ayFyLDq7xBIsqvObW3kC/fmqSgtZE1J5CC5piiWVXV2r4w
         KkUQDgFXJPBZt+HXhYiiicX1wkbDtGJCwbyr43dJMJ4/eaCHUWceEgEgJ9LkJ/2hOwd1
         rAT+ACX6ngTvDcJ5lMacRjlChRnm0Tw2Z/mjuFHEDpSxJbB8HG8ti2lymzsP29MZM3zv
         oWg1ybPktNaxaNssJiuxhUdBphP/w1b97sTZez38Gtpxe8D6U3H93FldGZ5tmxYRART7
         m2KkbjA3zPUx2UtIPyunyXAMDIyUDyEnZn/0YEMBkKuETWQ1sEmO3L/k0Td2Fn5d1aHJ
         c1GA==
X-Gm-Message-State: AOAM531I5ejtbyLuG+18+1FPoWhP77oT/tjm5WcWbGGuZTf7CRidSS31
        etVhTpBiHrvW2nKKsngRGLbtzRQgW4c9BebbSArWfAX/uxT14DtOo8Kk4WUfNR3hU3998rKltdZ
        njM9ggdj0rTY8gqBrTszgKOeaampo/WIG0Rm7V0eA8jfENQ1p
X-Received: by 2002:a2e:b054:: with SMTP id d20mr7612092ljl.507.1634660387899;
        Tue, 19 Oct 2021 09:19:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpdTo0CO8ZXx41HeRQ/5OTfWwGEz0XRfPfvr8zseDWzDoAGuzIqXZAJSwoCE9oKeZQunZgYg==
X-Received: by 2002:a2e:b054:: with SMTP id d20mr7611940ljl.507.1634660386225;
        Tue, 19 Oct 2021 09:19:46 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x22sm1696238lfd.198.2021.10.19.09.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:19:45 -0700 (PDT)
Subject: Re: [PATCH 4/4] rtc: s3c: Fix RTC read on first boot
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-5-semen.protsenko@linaro.org>
 <YW7o4iVhJNmv/ea6@piout.net>
 <CAPLW+4nWvMWfz32WmcDZ=X78jVREMUAOD1Z7SefxH--p8F+NXA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <754ac854-f1ca-2e93-f8fa-92dd332a44b9@canonical.com>
Date:   Tue, 19 Oct 2021 18:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4nWvMWfz32WmcDZ=X78jVREMUAOD1Z7SefxH--p8F+NXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 18:04, Sam Protsenko wrote:
> On Tue, 19 Oct 2021 at 18:48, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>>
>> On 19/10/2021 16:17:24+0300, Sam Protsenko wrote:
>>> On first RTC boot it has the month register value set to 0.
>>> Unconditional subtracting of 1 subsequently in s3c_rtc_gettime() leads
>>> to the next error message in kernel log:
>>>
>>>     hctosys: unable to read the hardware clock
>>>
>>> That happens in s3c_rtc_probe() when trying to register the RTC, which
>>> in turn tries to read and validate the time. Initialize RTC date/time
>>> registers to valid values in probe function on the first boot to prevent
>>> such errors.
>>>
>>
>> No, never ever do that, the time is bogus and it has to stay this way,
>> else userspace can't know whether the time on the RTC is the actual wall
>> time or just some random value that you have set from the driver.
>>
> 
> Thought about that, but that error message looked distracting and not
> very helpful in understanding what's actually going on. Anyway, can
> you please drop this patch from series (and maybe [PATCH 3/4] too) and
> apply the rest?
> 

Please give it some time for review. Pinging after few hours is too fast.

Best regards,
Krzysztof
