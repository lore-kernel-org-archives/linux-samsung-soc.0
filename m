Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027D3C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 16:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEDD1610CF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 16:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhDHQWK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Apr 2021 12:22:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35955 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbhDHQWI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 12:22:08 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lUXPn-00055N-Li
        for linux-samsung-soc@vger.kernel.org; Thu, 08 Apr 2021 16:21:55 +0000
Received: by mail-wr1-f70.google.com with SMTP id 75so1205686wrl.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Apr 2021 09:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n9mniXimsxRbXR5uC0L5WVy4JZkTyuKDjQ5Fp74xwm0=;
        b=gNsjog3zt/zUBscworyqQYf7YZaP71d8O7HtQtHx5GbE5mlRBS48xUyLjTgyJZb8Aa
         IwdqZnKooW3y3O3Y5hBIQN4aRFwauNjlmH8jyMUjH1gmIuPVJVp7ABLSX4hwMGwd1HaH
         TUxNpkaMygIIUAPUyT9C9HpGlNEO1AAQ7c9z03SgrCx+7gASKRvZ+fzA/QCfrdkXgZ1x
         v7mFxXucyuR8Ubcxw9+UuLs0153vt/2XhKLyDXzHB13SWMiOUrzODZF306pv7T/+8InV
         gRX6inT7BT8ELN9t2VlnngdsFekMNocRkrTn9HJhbBZJMO6AgsP0f5YnVCV2ss1IqJHm
         jFNw==
X-Gm-Message-State: AOAM5338OvnJY81IsePKrYrm1K00LqC2qYq8ZjNrgMv5RPoSv4GrOgdi
        LYoZK/jDQSC18HZSzHW8u5PIIEQ3qTsD/BfsnG4XYUoKzXWTGeWyBX2fXy3CrcWH8YHXZ21bM2s
        QyxY3AtlO+enYVz1tJ3lD6iwKWSIjwZmJikv9woG1Nbj80ses
X-Received: by 2002:adf:a703:: with SMTP id c3mr12682390wrd.72.1617898915302;
        Thu, 08 Apr 2021 09:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx85JGaBfMcW8iSqNB+8yrW6b15Le1JKi24IwDgmyt4YYURPyZi/eFCaTQYOx8+u6H0Y9nHAQ==
X-Received: by 2002:adf:a703:: with SMTP id c3mr12682357wrd.72.1617898915096;
        Thu, 08 Apr 2021 09:21:55 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id r5sm10950737wrx.87.2021.04.08.09.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 09:21:54 -0700 (PDT)
Subject: Re: [PATCH -next] clk: samsung: Remove redundant dev_err calls
To:     Chen Hui <clare.chenhui@huawei.com>, s.nawrocki@samsung.com,
        tomasz.figa@gmail.com, cw00.choi@samsung.com,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210408134856.207305-1-clare.chenhui@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <38c703df-2bfc-6492-ab2f-344ffc2647a1@canonical.com>
Date:   Thu, 8 Apr 2021 18:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408134856.207305-1-clare.chenhui@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/04/2021 15:48, Chen Hui wrote:
> There is error message within devm_ioremap_resource
> already, so remove the dev_err calls to avoid redundant
> error messages.
> 
> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
> ---
>  drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
>  drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
