Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6CAC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 11:15:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A157361369
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Apr 2021 11:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351770AbhDGLPX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:15:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37699 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhDGLPX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 07:15:23 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lU69R-00081S-0h
        for linux-samsung-soc@vger.kernel.org; Wed, 07 Apr 2021 11:15:13 +0000
Received: by mail-wr1-f69.google.com with SMTP id z17so4876941wru.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Apr 2021 04:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HouJQzuf2a1RcT0yofIoKLAiQ7qd5aclheZGD67RW3Q=;
        b=WvwOfxNXFLnuTqUrmvGhCB4jlqIZkjGYX8+pVZklFsSxCa+HkuFKYWfo+63ZTpnRVO
         ma89JA3Y3kR2aUPdiNfLmYzPjR5wnJIGETF7f86MSjMnYNadnQJDKRZsvT4EKiHOTrbu
         rhz9aM9YxGlvM1w9O0hylUICgwTGFJjvfZ3D7rfxZjfvn1JYjCSFQYFRQJkGlpt7apfZ
         wD0LxasXY9kQdmZ+iWEfsSx1qb4vqKIVzq55aqzVQFrTcHYnUg+iZ9afedeQzKFmgP3m
         FiVHxA6xsz9WFEt2uhK0gqCIjI/KgKyh9WuR8Cr9Xo+RR3eUe8NcWBPoGdEa5jo2zI1s
         IH5A==
X-Gm-Message-State: AOAM531ZXAHejp/m+W4ZXSkIZI7BTYy+wCfP3ZXLkhtpBwDOKHDvRO3p
        UrcAE4jwDp03zIKvMd7bKjMAYvmSqWhyYdTVI58vaDO9ZuLffN4CgBk51Q8XbPUlerfgMruxjrf
        4Q8dA9uI9QR11kQkpwI3J+mUhmafJEo2OwTwK/3rbxPpD7Ayh
X-Received: by 2002:a05:600c:289:: with SMTP id 9mr2579319wmk.135.1617794112792;
        Wed, 07 Apr 2021 04:15:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO6lh76dqAK/8ySaxATJaX1KSJP2CwlW9U/9Lc9KH0/ThKDYRhCZamwGMwGpbLu9yd7DIm7w==
X-Received: by 2002:a05:600c:289:: with SMTP id 9mr2579295wmk.135.1617794112628;
        Wed, 07 Apr 2021 04:15:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id i127sm8297328wma.6.2021.04.07.04.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:15:12 -0700 (PDT)
Subject: Re: [PATCH -next] power: supply: s3c_adc_battery: fix possible
 use-after-free in s3c_adc_bat_remove()
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     sre@kernel.org
References: <20210407091903.3268399-1-yangyingliang@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <59bbbad2-a82b-e08d-5225-267fee168ed1@canonical.com>
Date:   Wed, 7 Apr 2021 13:15:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407091903.3268399-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2021 11:19, Yang Yingliang wrote:
> This driver's remove path calls cancel_delayed_work(). However, that
> function does not wait until the work function finishes. This means
> that the callback function may still be running after the driver's
> remove function has finished, which would result in a use-after-free.
> 
> Fix by calling cancel_delayed_work_sync(), which ensures that
> the work is properly cancelled, no longer running, and unable
> to re-schedule itself.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/power/supply/s3c_adc_battery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
