Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4CAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Feb 2022 17:34:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239018AbiBTReb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Feb 2022 12:34:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240918AbiBTRea (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Feb 2022 12:34:30 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72F2340E0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 09:34:06 -0800 (PST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB72B3F1AB
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645378445;
        bh=9CHXol+tjANjXTy42zLnuRvOaGNoUx+sjvXhmspXS3A=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=TO8Fdb1vZ2Mm1ker5UVWZj7+JtxEeO48JJkWrEKXjd4+y70R3HYYzHJW4Jz6tFikf
         7p1Z3ba8T/STpesCiaQFpaPPvvkFIje/OXV2qIQV4EolIctGtJkw1bVL9JvaiaYfsi
         yP2cCLm17xxlaNa3vFBWFc3fRMyaofgpSN79f2fQoyF01VnECflKrbVuQjT0MgzmPJ
         4o4x5LriYOJT+vKNM6/XMcqqPMnI9oIduLjRBkEAHt4m+Wne8zkDdSo84GkrWXLB3w
         8HcBOlTeUV91BRMNRMgP5cE35iZUL7u21EcHYO+lcxd6ISAFFdxIzwlVIyJ48Xtk61
         f+WqK1jsfQa4A==
Received: by mail-wr1-f69.google.com with SMTP id e11-20020adf9bcb000000b001e316b01456so6133763wrc.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 09:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9CHXol+tjANjXTy42zLnuRvOaGNoUx+sjvXhmspXS3A=;
        b=5ntSoBIKEi0SiUpYkwJ4/V2xyxMPxGe8cXP44z1ZEVh97OW3buBGoyH5YhVCfV782p
         dy4vC35s1R85VvwUlbnYNEiDcsr6zoZ3+T9bHe2q/rMDrRAd5Yx1ILmBqJS6fQRYqD5J
         sr48moIcVl9ILdUQWpM1zu2kHuXUo/aT04nX697tB1dU4hs4EpDXPQy4zy4D/agqdOu7
         MLQw/gWjC2mwdT3bJaOc4TyjAClfTqFLeWJhl9p0aaDiihSF3teAOGYqXkXfArOeBu1i
         EnWKtWkk5n8wtazNBgnC5rmgVcz+mbusSeyndZNBPgzE1hYR6w2lhlFt12bjz8nZexZ9
         tRUg==
X-Gm-Message-State: AOAM532OOiI0JpCipSh6k5j8R9BNOGtzO7vPqhbOUCyQ7K8qJ3MR9Yok
        O0ifAKcduh3ykJFd8JxOSYBDglVG/7uEJp0z1G+A26WPIV0QHa0KxJdMmamxcTrdB09bOzKXjJ/
        moBmx/oK0jZnkW0sbdaZS7auCmhCMBEMpH2Mu1prsBrkN6nS7
X-Received: by 2002:a5d:5045:0:b0:1e3:20ed:4386 with SMTP id h5-20020a5d5045000000b001e320ed4386mr12939922wrt.262.1645378445335;
        Sun, 20 Feb 2022 09:34:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCLpUdyHqsLniGEMnc7rSZMSzlQwPJvZTgF91EcyZMUBv627jHSn8UKLQ/Sy4Eg514OvY/hw==
X-Received: by 2002:a5d:5045:0:b0:1e3:20ed:4386 with SMTP id h5-20020a5d5045000000b001e320ed4386mr12939911wrt.262.1645378445183;
        Sun, 20 Feb 2022 09:34:05 -0800 (PST)
Received: from [192.168.0.118] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id bg1-20020a05600c3c8100b00345724fbc7csm5392074wmb.48.2022.02.20.09.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 09:34:04 -0800 (PST)
Message-ID: <f7fb5de6-369a-837f-35ad-52aa13df7e10@canonical.com>
Date:   Sun, 20 Feb 2022 18:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] clocksource/drivers/exynos_mct: bump up number of
 local timer
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, pankaj.dubey@samsung.com,
        m.szyprowski@samsung.com
References: <20220220133824.33837-1-alim.akhtar@samsung.com>
 <CGME20220220132643epcas5p39d48a27bb3fcde2ea3a01a260b46e1a0@epcas5p3.samsung.com>
 <20220220133824.33837-3-alim.akhtar@samsung.com>
 <fc8f6c95-e37f-0dc8-c50d-48cadffcaa98@canonical.com>
 <0a0801d8267b$467e8800$d37b9800$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <0a0801d8267b$467e8800$d37b9800$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/02/2022 17:59, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Sunday, February 20, 2022 9:03 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: linux-samsung-soc@vger.kernel.org; daniel.lezcano@linaro.org;
>> tglx@linutronix.de; pankaj.dubey@samsung.com;
>> m.szyprowski@samsung.com
>> Subject: Re: [PATCH v2 3/3] clocksource/drivers/exynos_mct: bump up
>> number of local timer
>>
>> On 20/02/2022 14:38, Alim Akhtar wrote:
>>> As per the dt binding, maximum number of local timer can be up to 16.
>>> Increase the array size of the _name_ variable which holds the number
>>> of local timer name per CPU to reflect the binding. While at it,
>>> change the magic number to a meaningful macro.
>>
>> This still does not make sense. Let's say you have 16 local timers, so why the
>> name of clock event device should be maximum 16? How are these related?
>>
> As you rightly commented on v1 and it is mainly for "mct_tick%d" with number of local timers and
> local timer is per cpu. With increase in cpu number, name[10] restrict the scalability.
> So either we can change to 11, or use some reference (as local timer number in this patch). 
> Let me know your thought on this.

There could be some reference, like dedicated define. However length is
not directly related to the number of local irqs, but only number of
digits in decimal representation. If MCT_NR_LOCAL_TIMERS is increased
from 12 to 20, or from 20 to 80, the length should stay the same.

I propose to keep it at 11 and add a comment that length of the name
must be adjusted if number of interrupts grow over two digits.

Best regards,
Krzysztof
