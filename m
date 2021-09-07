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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8171C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9757960F6D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344138AbhIGM3j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:29:39 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37496
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344555AbhIGM3f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 08:29:35 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4602040191
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Sep 2021 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631017707;
        bh=pBLtjph6RQEau8atPQFYfe8U7ef+hzqhMpxfWP4Bq6k=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Tfn1NcuVLCPge2r/rOBHzhLFGXXUuI+xApO4b8JBWTK623p4PndGmw6GBTWpDSE7B
         xTED7cB4Qd+tcTvsiPR5XDxfsATKIsz6gGLsKN9dKo3Ye2IhEGrxjj2VhMHBFD0N9g
         j0A7YeW1rjIRKWWLqIF//KJueX9xPKgINvzDZkxycWndo3UJlnq7D5zN8fU6ZpEbey
         o6DKqOG2fCTT2n+dzaojQ4bnqCGFZUmhBkpyZF0TmT7nJgsaQxHfCtpQXliAolIN8j
         oJGW9mVaN8KxSfwYvktvhtAL9sV5+Pw7oIh5wif9eXqHRBP16f9YWLW/xpxy7AtN5Y
         Fw8W3Mg+2EJQQ==
Received: by mail-wm1-f71.google.com with SMTP id c203-20020a1c9ad4000000b002f8cba155ccso931215wme.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2021 05:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pBLtjph6RQEau8atPQFYfe8U7ef+hzqhMpxfWP4Bq6k=;
        b=NbnL87iHpMdg6HZCi8kZluhPGpN6BREXVfqd2zg3o5BM89eeze26F9kuMt1uCby2SG
         YBnYDUu1HLrz9+iEJP7xIpIJuRR8YeN7opfUJq4iTShczfIgmKflIwjqnDwdvxLp888L
         i2Rvh09SngZv2RlRub+jXUtUhXL699MVNz98TNBUMy01EHDk5XA7YO9j4D1Z1addNqHD
         AvnQ05bTEhhNwnM8o9uCvuVoazxgrSqNDeORSe1YHw5wfy1cGYJB98INokW053YWaMBU
         bXGxFlO8Y38+L3SeIyiqLNZAWlFvd3KdMl3L+E2zh0TduLtGiHvHtzHZTZ45jXeagO2R
         UmRw==
X-Gm-Message-State: AOAM533s2epRNctxlRnxw7KmLgxTBJlUDA2+f7aFAPkBrrypnEgVbVVg
        oSGdi68jL5oH0UwW6HDSO14m5fa/hnjXlhnQZbmxNh8QE7bxuX63MgfSEdmtVclUnjcwlOKB/Hp
        vPqq3ff1unZzTlsux2wiflpOtH9V4Jh+olg/1IMM0bK+vkKMv
X-Received: by 2002:a05:6000:22d:: with SMTP id l13mr18433482wrz.410.1631017707043;
        Tue, 07 Sep 2021 05:28:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH8YGCnEpGP0h3+3v8fKMRKYSjBRI4kwHx1x58weU/Q149zGxzzjPZjvUPLf2ay8j3CaTMaQ==
X-Received: by 2002:a05:6000:22d:: with SMTP id l13mr18433468wrz.410.1631017706939;
        Tue, 07 Sep 2021 05:28:26 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.188])
        by smtp.gmail.com with ESMTPSA id l16sm8515158wrh.44.2021.09.07.05.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:28:26 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210907085115.4254-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ea98e7c6-641f-5db0-6bf8-76072cfe17aa@canonical.com>
Date:   Tue, 7 Sep 2021 14:28:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907085115.4254-1-caihuoqing@baidu.com>
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
>  drivers/clk/samsung/clk-exynos5433.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
