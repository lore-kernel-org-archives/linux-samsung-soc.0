Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BAFC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B07460F45
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344091AbhIGM3h (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:29:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37466
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344167AbhIGM3O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 08:29:14 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 011DE40191
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Sep 2021 12:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631017686;
        bh=i4ZGHX9mGJzs9Nqqb56NmrxFgegnuQrVd9flgc2QjQE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=CMoA7T5AT3W8FgDwmV59z5a/IP+M42qb0I/519Ep8p8kP2bXKUZ9zWj7kMOFd5zXU
         RsbIWVEnx1lF1HbUZWt2SoNhx8HhZ7jcqytiDsWTvnKYuxybQWhlswXZQ7ZTnFislE
         ndRU5mFqmH863GbGrTHJ6t2FeOV8ktBUFvbu49pmImGxNHBa28P3W4WGxk7kJp5LSJ
         f1IG5wg4F1j9/KPcwTZHeVWo55nPqDdTmtj9zzaYdqLE9lwsZxW2Mg5QyEtyo4ymd7
         jMqtzTbqgLKrYW58xZoqNR9D4T2g3qT6SXrSUe//v+/HL0E8hicUQKp2x5KUfNcgmw
         gWFE6SY519sQA==
Received: by mail-wr1-f71.google.com with SMTP id z15-20020adff74f000000b001577d70c98dso2048129wrp.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2021 05:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i4ZGHX9mGJzs9Nqqb56NmrxFgegnuQrVd9flgc2QjQE=;
        b=qDOdXJkOwy9gHASmWPdUCWJFd0HHmXq6LNG+s4+lIcMTCfYkK3nnkI4t+PGTHa3obV
         Y8ASTwK9ReZI1NZ3KEGMpydvAMR+cp4aoYtQ8s+VSM8uRwCqf2xR/gR3wTAUPzfYt5qL
         hA3f28i7CNCwr1nw4GMoFfy1OcvN9yYMXVoY4taDvdDUxXHE9+5Iv0HQ3LtPbIVDUEBH
         Qp4UZBrgG9tpIPnClDHQGubuv23G5j7lqv4Y1RJ/771NN9x69SzFp4MYMpP/o59km64i
         8jHfftrrFqin3RJP06PgU4PK0nKxYAOGoC3spfMuV3dqP/Nqzn1jpjImm5//gvmK/1BO
         gOCQ==
X-Gm-Message-State: AOAM533lv9yfcIH0xviy7sZ12P6iTClZgM3z6tMJU7k/rWnv0hZtJIFX
        ZFVc1/PIAjxStuy2Wt7P9jUAd8QRE/8CX5OW0ZtXOFJjzMjN770lXksH7YJbgU7uGaNy+T8HYpc
        QWNX0AAt64gm+TgNUdnRK7/TJ5Ft69pCtB2elM0AS2kIIGKRA
X-Received: by 2002:adf:9d45:: with SMTP id o5mr18367590wre.226.1631017685247;
        Tue, 07 Sep 2021 05:28:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxLSApf9aQAMF6rcSiRU6Die4JjL+/6CF8DzzLKlDlLHeOBw4SUW1cF3S2JUunqQGD5sLqZQ==
X-Received: by 2002:adf:9d45:: with SMTP id o5mr18367571wre.226.1631017685071;
        Tue, 07 Sep 2021 05:28:05 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id l7sm2333190wmj.9.2021.09.07.05.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:28:04 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: exynos4412-isp: Make use of the helper
 function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210907085107.4203-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2b378450-4ea5-e30f-750d-9e20bc1d113e@canonical.com>
Date:   Tue, 7 Sep 2021 14:28:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907085107.4203-1-caihuoqing@baidu.com>
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
>  drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
