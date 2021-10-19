Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF54C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:10:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C808A61154
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhJSQMh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 12:12:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44906
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229789AbhJSQMg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:12:36 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D7C8C4001A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634659817;
        bh=vbtQkKJv01vIX5oUykdTEq0VFYquYD5Mv4xWeOReiYU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=uzege5HR8cEGy4Hw/lY00ucQFbhFQwKhab1ZmK0exm8RhfkQfo2khF2mk8HBSFCXX
         vub9Hw6i2FYYbvgZEUu+Hg1k3hJDgWTq3x4BYVRv+kXxJT4uoppjoh91iEf+A5MKQ7
         tbdcWI2C43fNMpvy/s6cpQdeNDE2yH4BY2vhssTly51t9IB0rITXraXHZbinCjQFua
         pHdxcxqW3ZbD1qCZ3ES4Uuw2y8ANpfdyKavRiHhTDPMpmvPTRkeN43RqyR36Vz4eob
         q7qr4bWlHe9PiBhbXyOSHXIeLkSCxXxblHfYsV5lE5JjlKl5dvzn8FI4fkMjOkmxeD
         R/lcnz3Qqasww==
Received: by mail-lf1-f69.google.com with SMTP id bi16-20020a0565120e9000b003fd56ef5a94so1625390lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vbtQkKJv01vIX5oUykdTEq0VFYquYD5Mv4xWeOReiYU=;
        b=Grhx/H9qNz0pqGyWEnI7n8H7iUK1X2AhUmGVaV9wmgvvsaNl4Dc7Jo5waYOJ91K/+h
         8d/EEyvTAo7FgweHp878cmgjJWQzuNgZ4jCr6OX02CND2aojpLxjUdqfUR5Q5niIeiLN
         bFi/lRX7QfpbBElXH5qZuNsPNTnkOARl6uzMGf4/W6IIxltZn7D6lJ2JR3Mt92dk36/p
         mTp6E+Cb12YyCwHeYY4pQk4VTS1NlXShBRSbba1qgWhd60Fx34sRY0OlFb673bV79foJ
         U0/PQVowzr3rDhJ3ClCgnJ4nnSWFIJu8951/aG2Qzn59KLL5QoP0g4GwdoDJIkt8QRmV
         s6Ag==
X-Gm-Message-State: AOAM532pyiSPWor9tU8Z094vfH01NU6yN5NtlxcXciygC/vUCvmKSpIB
        xQInN7ncfXXxUhMYewqErDqPh1jwBa5wwLm9vW1Z9VUXm67W1lbimVSHsY5x/pwjnLK6RS8UMCI
        8bVMutqEJxbDryc7xSXDioIOVj9+4NbCQdm7jBRnS8fMEQLMp
X-Received: by 2002:a2e:3c17:: with SMTP id j23mr7717429lja.161.1634659817313;
        Tue, 19 Oct 2021 09:10:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuvSDYjL+zmtZPegiXBuE33fgNyA22xger9D425lRjzwroeHAMmeFFBSfH1dCAVIsuIHEvXQ==
X-Received: by 2002:a2e:3c17:: with SMTP id j23mr7717413lja.161.1634659817111;
        Tue, 19 Oct 2021 09:10:17 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x4sm2130401ljm.45.2021.10.19.09.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:10:16 -0700 (PDT)
Subject: Re: [PATCH 4/4] rtc: s3c: Fix RTC read on first boot
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-5-semen.protsenko@linaro.org>
 <YW7o4iVhJNmv/ea6@piout.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9206176d-2a79-a70d-9b2e-546385b42f3b@canonical.com>
Date:   Tue, 19 Oct 2021 18:10:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW7o4iVhJNmv/ea6@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 17:48, Alexandre Belloni wrote:
> On 19/10/2021 16:17:24+0300, Sam Protsenko wrote:
>> On first RTC boot it has the month register value set to 0.
>> Unconditional subtracting of 1 subsequently in s3c_rtc_gettime() leads
>> to the next error message in kernel log:
>>
>>     hctosys: unable to read the hardware clock
>>
>> That happens in s3c_rtc_probe() when trying to register the RTC, which
>> in turn tries to read and validate the time. Initialize RTC date/time
>> registers to valid values in probe function on the first boot to prevent
>> such errors.
>>
> 
> No, never ever do that, the time is bogus and it has to stay this way,
> else userspace can't know whether the time on the RTC is the actual wall
> time or just some random value that you have set from the driver.
> 

Indeed. This looks basically like a revert of your commit 5c78cceeb2d8
("rtc: s3c: stop setting bogus time"). For the Samsung PMIC RTC, we
dropped time initialization in commit fe787a5b2297 ("rtc: s5m: remove
undocumented time init on first boot").

Best regards,
Krzysztof
