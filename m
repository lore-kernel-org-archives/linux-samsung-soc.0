Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CD4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A15260F6D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344621AbhIGM3v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:29:51 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37518
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344587AbhIGM3r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 08:29:47 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 430B23F046
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Sep 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631017720;
        bh=1lz5zbXaAC/6Xt9DSvyMvWDrwTMabkYousM6j7peGJE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=X+paikGBkgHHKn07Xm0GYxpQ5sOKedPgIOXFMsfX6rE5xuMKDkx5U3TObNJhTG4uE
         FIdWaMdIe0pvBJpLGFln8TNQgbkoTctNb5/RMpYGFcx90v62+llQ1WkkY8tieP68SR
         HDUQmfRfGHra8V8Z+Mi34D+yVGuSC/gOGfM5R6DyyI4sg1rgpQmqnY0g/RkYI/TT7d
         jj7Xp8XRIWFgRLo2yHofEQGOcwxwPkfo/EcYZ/SYYirQqHmyMl2nnpr8tkwsN1fLR/
         6DlUixLpArreZdFwCD72vVwSNEkoV6qdegQDk6rUN6VswyQdUB0NEBtuuX54MMltAT
         EJjEljP90CuuA==
Received: by mail-wr1-f70.google.com with SMTP id t15-20020a5d42cf000000b001565f9c9ee8so2060589wrr.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2021 05:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1lz5zbXaAC/6Xt9DSvyMvWDrwTMabkYousM6j7peGJE=;
        b=RKamOOSW/Nhq8/eI7tXS65znXWzbVrCeg8dNSOTg5y7rskFG0APzym9BkyWi2zSgli
         XNtDD58/e/NeX1Zkua2lyE27Z+dLvNg0iswjukuOterUJWR6GOhDwMn6qYmhdl8r+QI6
         jwR5SFaIQJMEmj4TMD2owUS8bvS3hcqDrnKVGqTy+//KO9reR0ercSEPzwMzGGz0cw5z
         ZpMwuFnutv5fbR3yTgRVDw4o+wp+g6418qv+/6HfoIwX4loOjnXVXJTf4Ao5k9UD+od0
         Xw/PmlVtACr2yTlWyxsbzmcXb+8YtGcCWwVt0keBtvu9O/c2BvM/5E4u2xEmYZzGzsgb
         YBUg==
X-Gm-Message-State: AOAM533lCQDzz8RcOD9bAMAnjnnYBBXLtTeTzR74exWnH+NkXZUc7/jm
        fVtcYNt5+n5S77IqH9FH2Q1ymDw6ZE8vjCKn6itdRY+41XqiAAaJWcOdC0bklKIw/zJK4VACwkl
        BYvcZipb+NREO9q8u7quCHJie5iRN+L51FuQlnEfd07IW99TL
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr3736052wmq.83.1631017720023;
        Tue, 07 Sep 2021 05:28:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnia4fxnHdJbDEwVsFWre7qSHYc2QGFISEhWQFymiMZBSSOqZlc7sbdrkWnKGP+ygKpVwCvw==
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr3736037wmq.83.1631017719840;
        Tue, 07 Sep 2021 05:28:39 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.90])
        by smtp.gmail.com with ESMTPSA id f3sm2266751wmj.28.2021.09.07.05.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:28:39 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: s5pv210-audss: Make use of the helper
 function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210907085122.4305-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <cb81b1d4-d1de-c41d-3966-ac36f282de1d@canonical.com>
Date:   Tue, 7 Sep 2021 14:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907085122.4305-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/09/2021 10:51, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/clk/samsung/clk-s5pv210-audss.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
