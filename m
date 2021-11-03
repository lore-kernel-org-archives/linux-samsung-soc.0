Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B93DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 09:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 156D960EBC
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Nov 2021 09:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbhKCJHQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Nov 2021 05:07:16 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59002
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231557AbhKCJHP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 05:07:15 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E2A323F1AF
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Nov 2021 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635930278;
        bh=h+0pQb7RviEjGKQ1P1od/UpE/ThgiFDmYotiXjSgxVQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=EWyV9ykWcpQ+xXNo90AiDRMWbxDn/k1D/Bj8+aHNfobih8uUvYoth/kN4IAlHtbFn
         xilh9svAtFqfiNM2xYADyhPGQnbmX37pkTOdgvcTJ9B8m3Bgu/NU7Nm2TEMGSHPbas
         zCFPIs3r/kv6kYlSfDxRFyrelW9/mAWfGlDkc2ZtO0CeB+pXm/VVlU/H0XrmES4yTc
         I9SyMJv2qY6IDu8gOL41mHjBZi6BGJOGLLMukVpDhqIP+Amzdo/51hHIJfyl0QARbp
         Pd88dY4BKMqA2xBumHcr7WucddFWfB8WZ0LrZZZoS/YFpBd/y28QR2MQJkWeGIVYMZ
         hsgM58J4gDm6A==
Received: by mail-lf1-f70.google.com with SMTP id t62-20020a19c341000000b004000224ab0cso383509lff.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Nov 2021 02:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h+0pQb7RviEjGKQ1P1od/UpE/ThgiFDmYotiXjSgxVQ=;
        b=oR3wStyKZ1rDDN/gD8Nu+FEocsoi5vKDk+GUMpygVsQ/1oRy5eTtMRpxsENgAy4y5O
         e3zIpryQQklMF4C0paOA3MTQtw7/mkFZYUAF1jrb3nf9BkSF0Y23PhnuvVYKxICq/TY1
         9unlN+V5QO5sdoJvOJUhNOcf+H6N34yTbWP1oLC7W8BZ2cjVGa+IwqyRUgDVwVg9ioPI
         B9a4MUTkDHQNgzzxAnKdex0BXcCguO6O8Xvrpj4d3/I2WkzROhWlB5HyQC6yGW+2nF2w
         PQveq7Y1FG6A5mta571KzmoekPQMtkqg+Fv4R3t90N23wH6dR5pNtG0QBQgcbwaHezSB
         QRGg==
X-Gm-Message-State: AOAM531YMQ6HeqhhLgTcm4gd02qqVd/1O6ejf7RRAaOi2FPD7K57wD7x
        DdcsGkXdnGgjxPw8YJZsGwspV8iqxtKIJdSaKPvOEUjLt/7w67kGB7TxhpYGSzlNGl7N9+a1kZm
        hRKfNOoXVjgCb9I5m5EO4x3jRTOKYhe2pYhrahWjdw206qLK+
X-Received: by 2002:ac2:4254:: with SMTP id m20mr34063653lfl.338.1635930278117;
        Wed, 03 Nov 2021 02:04:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG4cvYz4fxXGBgoDuE6eZNtzDD5eMOgR8wYZp1yNqOX+y64YPpeADmLTrnrWrvpBukqLTMsw==
X-Received: by 2002:ac2:4254:: with SMTP id m20mr34063623lfl.338.1635930277871;
        Wed, 03 Nov 2021 02:04:37 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w6sm145400ljw.89.2021.11.03.02.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 02:04:37 -0700 (PDT)
Message-ID: <f7871718-f244-8a9e-9302-c27bdb2d3cc1@canonical.com>
Date:   Wed, 3 Nov 2021 10:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Content-Language: en-US
To:     Youngmin Nam <youngmin.nam@samsung.com>
Cc:     will@kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org,
        tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
References: <20211102001122.27516-1-youngmin.nam@samsung.com>
 <CGME20211101234500epcas2p2d0e5bc54615b635f6694bc1be4c89fb5@epcas2p2.samsung.com>
 <20211102001122.27516-2-youngmin.nam@samsung.com>
 <20211102102802.GA16545@C02TD0UTHF1T.local> <20211103000945.GA48132@perf>
 <83f6574b-bbab-f0c3-7198-f773c3dcfc63@canonical.com>
 <20211103092444.GA7013@perf>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211103092444.GA7013@perf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/11/2021 10:24, Youngmin Nam wrote:
> On Wed, Nov 03, 2021 at 09:18:07AM +0100, Krzysztof Kozlowski wrote:
>> On 03/11/2021 01:09, Youngmin Nam wrote:
>>> On Tue, Nov 02, 2021 at 10:28:10AM +0000, Mark Rutland wrote:
>>>> On Tue, Nov 02, 2021 at 09:11:21AM +0900, Youngmin Nam wrote:
>>>>> Exynos MCT version 2 is composed of 1 FRC and 12 comparators.
>>>>> There are no global timer and local timer anymore.
>>>>> The 1 of 64bit FRC serves as "up-counter"(not "comparators").
>>>>> The 12 comaprators(not "counter") can be used as per-cpu event timer
>>>>> so that it can support upto 12 cores.
>>>>> And a RTC source can be used as backup clock source.
>>>>
>>>> [...]
>>>>
>>>>> +static int exynos_mct_starting_cpu(unsigned int cpu)
>>>>> +{
>>>>> +	struct mct_clock_event_device *mevt = per_cpu_ptr(&percpu_mct_tick, cpu);
>>>>> +	struct clock_event_device *evt = &mevt->evt;
>>>>> +
>>>>> +	snprintf(mevt->name, sizeof(mevt->name), "mct_comp%d", cpu);
>>>>> +
>>>>> +	evt->name = mevt->name;
>>>>> +	evt->cpumask = cpumask_of(cpu);
>>>>> +	evt->set_next_event = exynos_comp_set_next_event;
>>>>> +	evt->set_state_periodic = mct_set_state_periodic;
>>>>> +	evt->set_state_shutdown = mct_set_state_shutdown;
>>>>> +	evt->set_state_oneshot = mct_set_state_shutdown;
>>>>> +	evt->set_state_oneshot_stopped = mct_set_state_shutdown;
>>>>> +	evt->tick_resume = mct_set_state_shutdown;
>>>>> +	evt->features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
>>>>> +	evt->rating = 500;	/* use value higher than ARM arch timer */
>>>>
>>>> Previously Will asked you to try CLOCK_EVT_FEAT_PERCPU here, and to set
>>>> the C3STOP flag on the arch timer via the DT when necessary, rather than
>>>> trying to override the arch timer like this:
>>>>
>>>>   https://protect2.fireeye.com/v1/url?k=72526080-2dc9598b-7253ebcf-002590f5b904-ca603717c6462908&q=1&e=be56aa83-dbac-4639-913d-d388620fe3fc&u=https%3A%2F%2Flore.kernel.org%2Fr%2F20211027073458.GA22231%40willie-the-truck
>>>>
>>>> There are a bunch of things that depend on the architected timer working
>>>> as a clocksource (e.g. vdso, kvm), and it *should* work as a lock
>>>> clockevent_device if configured correctly, and it's much more consistent
>>>> with *everyone else* to use the arhcitected timer by default.
>>>>
>>>> Please try as Will suggested above, so that this works from day one.
>>>>
>>>> Thanks,
>>>> Mark.
>>>>
>>>
>>> Hi Mark.
>>> It looks like you missed my previous mail.
>>> https://protect2.fireeye.com/v1/url?k=ab15817a-cbf71c27-ab140a35-000babd9f1ba-123b7f313b1b1ccc&q=1&e=34c8716e-6d2e-4d8e-82fe-04777ebc5eb3&u=https%3A%2F%2Flore.kernel.org%2Fall%2F20211029035422.GA30523%40perf%2F%23t
>>>
>>> Yes, I believe Will's suggestion definitely will work.
>>> But that is for performance not functionality.
>>> As a driver for new H/W IP I would like to confirm functionality first.
>>>
>>> We need more time to test this feature with our exynos core power down feature.
>>> And we need to do a various regression test whether there is another corner case or not.
>>> So, how about we apply Will's suggetion later after the current patchset is merged first?
>>> After doing our regression test with our exynos core power down feature, we can confirm this.
>>>
>>
>> Not really, because once it is merged there is no incentive to fix it or
>> simply changing it can be forgotten. Also similarly to commit
>> 6282edb72bed ("clocksource/drivers/exynos_mct: Increase priority over
>> ARM arch timer"), there should be a valid and serious reason to
>> prioritize Exynos MCT.
>>
> 
> No, it's not. I also want to decrease MCTv2 timer rating so that we want to use arm arch timer as a default.
> But this feature has to be confirmed with core power down feature enabled.
> Without core power down feature, we can't comfirm this.
> Ater that we need to check whether there is regression or not related power, stability, and so on.
> I'm not saying I will not apply Will's suggestion but I just want to apply later after some hard test.
> 

You repeat the same argument, the same words. Nothing new. Repeating the
same won't change it, use the lower priority. This is a patch for new
kernel, so there is a plenty of time to test it and it won't affect your
production environment.

Best regards,
Krzysztof
