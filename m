Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCA1C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 08:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FADF60234
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 08:49:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237774AbhHJIth (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 04:49:37 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:39696
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237554AbhHJItg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 04:49:36 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 2FE413F361
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628585353;
        bh=CAgpG6WrguxqP2IRH8Bsd0WkckHriXozJ08neyhr3cI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=JWFi+ZDbq6bwz22bOA5b8cCyluHW+ZCYfAO7G58QBs8Td2VTaJBP9toRBhgY5lCt5
         o/vxQrYu1Q4MPKoA4xOVpyGrX57l+JbsMX0Yl/tOedtoLBwr/kzCu1G6twLohsFVtw
         XOHICZRCvtBOZ6KW3ouHSBVMoxkbE0NupFlmxZQijff2wUvwEiimmvUTZw80BWcBCq
         ZzuUXnR7ZkFO4c0AbCwbDjzta+aDkYKoYZBVTOVPdaQFrO6pw6wV/ObL7JW3mqnopu
         lF0C6mzv8spP0uq15DUooi8WWsb+9fG7zzE91hbwwJGWuQcVFf6+HMh2/RdknMUtZh
         RL5kMFIQgveaw==
Received: by mail-ed1-f72.google.com with SMTP id ec47-20020a0564020d6fb02903be5e0a8cd2so4100264edb.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 01:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CAgpG6WrguxqP2IRH8Bsd0WkckHriXozJ08neyhr3cI=;
        b=XrYhyhYO/D7PrYcjBumPDVS7iMAlT0vT53us3LBjnUEAjkNeSqYYodjmQQhEffqRjN
         yhlj62B/LnXWX58TyIc9mDtQIzcre/3z/j4ZM91roxxbGXYPaHggJIVVjR9FbyN0KMBT
         MFQcLaKUVHb0yelB6UULlEtwW/uqLxh7JnLUbX1yeREOQcKIP3LlY5DrSkl4hUV9brQq
         WOaDu1nidCV9EvFP0QThtoAtGvRrOw19843YbwyJMvyB7IXcy6UN1M6jG/do1rCp+qVm
         TyWI/FLzTjvVFEesttz78Y6DdwFzU7YvbDZhb0fRZI7eJ4UuBP9wi1k2HRQb2fQYeHG4
         mgBQ==
X-Gm-Message-State: AOAM5323X4E8LG/M1lcsRTWediMC02hDdXL4VnZnfm9XTtcgbEXv4lO2
        RUncV2rcemH/iJyyzPYTTprRZqetMkB6oc5rjd8YAcnz+bGdlBL/ISZr81X7SF50qO2NKSF+pUv
        6epVElB5ytLhQ43X6qE2MAzKXZY+qYP+QXDoGYzU8QCqw1/ce
X-Received: by 2002:aa7:d815:: with SMTP id v21mr3613314edq.262.1628585352914;
        Tue, 10 Aug 2021 01:49:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz77fy9fLXSFWJs9Es0lAOffB7mrFKyLwbEVB/OFWy0HcQWY8xncNUb2Z+7ZIpeUXJe0xIKOA==
X-Received: by 2002:aa7:d815:: with SMTP id v21mr3613305edq.262.1628585352799;
        Tue, 10 Aug 2021 01:49:12 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id ee11sm6556872edb.26.2021.08.10.01.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 01:49:12 -0700 (PDT)
Subject: Re: [PATCH] thermal: exynos: Fix an error code in exynos_tmu_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Abhilash Kesavan <a.kesavan@samsung.com>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Lukasz Majewski <l.majewski@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210810084413.GA23810@kili>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <dfa9cdf6-5dc6-586f-9db3-300d4232acf0@canonical.com>
Date:   Tue, 10 Aug 2021 10:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810084413.GA23810@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/08/2021 10:44, Dan Carpenter wrote:
> This error path return success but it should propagate the negative
> error code from devm_clk_get().
> 
> Fixes: 6c247393cfdd ("thermal: exynos: Add TMU support for Exynos7 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Thanks, good catch!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
