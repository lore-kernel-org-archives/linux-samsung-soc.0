Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B6FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 09:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233237AbiKKJy2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Nov 2022 04:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbiKKJy1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 04:54:27 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFC2BCB0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 01:54:26 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p8so7549606lfu.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 01:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QqWLXv5dxHw57HSy5QpLnj2IPSdZuYie5BJiHEMU2k=;
        b=zK3C9XJWP7EeM+RziAwk8E9icrkn/JtvCcvMp55u6Mkyk6f5Wd2Y1cFMPMwkffa4jl
         P5p9mHeYxytxSFKXFLE8PPDiOgyLaBQmF+5irigFtk/7wbS622TBMylXTEyi0x1ygHFP
         HSserg87in9MorqvaTm/JIsrYao7U1VRKLlJT5ZfjgdulXPSxh+aDaZP1OhF2jrHPO+U
         XB0mlvWjE9Ydk5kBzrHScZCQkrHIZJy3K0THRA/W17KuC4q+Sg8LWeKtoZdobs5tZMXr
         wRhfJgzf5p2tL3angiPqyPUhmEReFUnmLEdHiBU5KQSXZ82rRltluYVTW0Tzc68BI0uD
         Mdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QqWLXv5dxHw57HSy5QpLnj2IPSdZuYie5BJiHEMU2k=;
        b=QToBWjQ70e9EWrUQ/rhyMgmV874CcppG6dYWC1NJt61otPX7r/La8bbuK6c8QdwF6J
         OOnqgiPHLn+j8qmLSTQIlLpKMqta10HJCyE1Ou6oeoCd12qLqxBXESUfv8zZ2atlj1P1
         eAWAohwc9DciFarw25K3H4qdQcMyu63YTHsWbPnNCa1tUlgOytVSR4pkEIECazvcEDcp
         zpALvtTCu3yiWDTnQJmrBs/GL1zsms7Htb0HNLJmpulsqKjD1P1u5i6YLVowTDyKUryv
         /Py8xu8Wrum6W2qq5FMNSgm20UkojF6lvQ5r5KS1tsOre3HT2i0THHBleIsJdUehYra9
         wiUg==
X-Gm-Message-State: ANoB5pntL+zz9MjwIqn6SmZroIyv6OMM83+Ku3J/U6XaQl1vgh6wMf8G
        806AMRzQwAPJjL0w/4vON4eBgw==
X-Google-Smtp-Source: AA0mqf6GUoJxUuDsvBzv8ogmVsekZO5MBhkgXBEoYnEiU8HmAbFZhoKm5xeHsB7twKwvj9zgOz9qVg==
X-Received: by 2002:a19:4902:0:b0:4a2:4589:fa1e with SMTP id w2-20020a194902000000b004a24589fa1emr450090lfa.444.1668160464825;
        Fri, 11 Nov 2022 01:54:24 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b004a25bb4494fsm244321lfr.178.2022.11.11.01.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 01:54:24 -0800 (PST)
Message-ID: <94e1fffd-a28e-48aa-26b7-3d96c54bedc7@linaro.org>
Date:   Fri, 11 Nov 2022 10:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mfd: exynos-lpass: use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     ye.xingchen@zte.com.cn, lee@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        chi.minghao@zte.com.cn
References: <202211111640089246472@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <202211111640089246472@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/11/2022 09:40, ye.xingchen@zte.com.cn wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

1. I cannot find this report. This is an open source work and public
collaboration. The "Reported-by" usually means that the issue was
reported to us, in some way, usually in public. Can we see the report?
Otherwise adding non-public, non-verifiable reports is useless and
clutters our report-credit-system.

2. Where is the bug? Reported-by means there was a bug being fixed.
Please describe the visible effects of bug and its impact.

Otherwise please stop adding bogus reported-by messages. I have seen to
many bogus reported-by tags from ZTE last months.

> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/mfd/exynos-lpass.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Best regards,
Krzysztof

