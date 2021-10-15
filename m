Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBADFC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 22:36:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC04F611EE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 22:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238906AbhJOWin (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235542AbhJOWin (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 18:38:43 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2A4C061570;
        Fri, 15 Oct 2021 15:36:36 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id w14so7259504pll.2;
        Fri, 15 Oct 2021 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YQxaOcZ/dqklpCTNGHeKXN2tK/O7rbUuAovDRSjUZyE=;
        b=IyqFnELja/7KEsOzN2pHh0BvyUCGD+e6zYj+VTFH7cQYm9TuL7GAXeGJ9w9cD282Uz
         53R3TIabBpCiPJQerjpCjcwd7o4aW9RCntoN+zDYFHU6nmFbALsVIyJ0MDgU98Jvr0+j
         XFDW/qW6A2C/gX01OiUKo/snAOC7vTqauOGNkUsnACMH6GelGhOA6sYb4nTdX9vcsE5g
         fTtb7PEkb4P7ND1hvS4OyMPA2hiZRnborE7P+rZ1Twl/giUf5ZFOt9yLR7YWvkeJElIk
         bEpYAB1ibZoOAbhEmYlE0wnAfRUg7/lzL9jZ1PPHB6QTq7FKJie7nZMcSLGWj4KEZlo4
         dJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YQxaOcZ/dqklpCTNGHeKXN2tK/O7rbUuAovDRSjUZyE=;
        b=6uMt2uTun6c9K/WZZpbXmg0SNPW5fHiKvPCybNC3Av90A7K1UV4CU0kqCq5RjlUALG
         moKw4u+EJbjyFHVpXl/+tM3NAjXDL5qFhOb+RQVWZy2Gyr3IhhsmmPJLvPinF+D0mUT7
         Y+wbwMbYqbnTxTEzUMOD6mK5O+Pt0tzbf0MGQycED8HPzVmmb+XpcskHX+4n5RfGX5Zv
         a+5opkdqY5+wJbQxT66IurkFMj1slSAQJ47WvJVkf4uV6Ne1A2YEteLfKJr1aEzImv1S
         6Fat+s1KhenocdcnALq+ifyVTuTRp+OOQYzV0aAhFvib8vxFb/8NLpYmHb/Mv1tDCcjJ
         /ToQ==
X-Gm-Message-State: AOAM533BbqN7OaWz8a9xkn9vyFzTb26Fo4PeHzFja6gxJlsV5egdUHPz
        8Y4b5UgFtonca3ZnbjI5138=
X-Google-Smtp-Source: ABdhPJy9eVEcn+64JdF9UWjF0GmxROZQH1Ez+dHOMD6+J/kMXpP/DlHxsQNZ36KfgNJd8IfbzMEp+A==
X-Received: by 2002:a17:903:1252:b0:13d:f3f6:2e1c with SMTP id u18-20020a170903125200b0013df3f62e1cmr13326229plh.73.1634337396021;
        Fri, 15 Oct 2021 15:36:36 -0700 (PDT)
Received: from [172.30.1.32] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id k14sm5859982pji.45.2021.10.15.15.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 15:36:35 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: remove __clk_lookup() usage
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <CGME20211015093935eucas1p2782d5f8263fd8843139f3e3e9c6caaa3@eucas1p2.samsung.com>
 <20211015093931.28086-1-m.szyprowski@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <9d6496f8-3c9b-24d2-4dfd-6b6d9a0de10f@gmail.com>
Date:   Sat, 16 Oct 2021 07:36:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015093931.28086-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21. 10. 15. 오후 6:39, Marek Szyprowski wrote:
> __clk_lookup() interface is obsolete, so remove it from the Samsung clock
> drivers. This has been achieved by getting rid of custom _get_rate()
> helper and replacing it with clk_hw_get_rate().
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This patch is based on top of the "[RFT PATCH v4 0/2] clk: samsung: add
> common support for CPU clocks" patchset:
> https://lore.kernel.org/linux-samsung-soc/20211014195347.3635601-1-willmcvicker@google.com/
> 
> Tested on the following Exynos SoC based boards: 4210, 4412, 5250 and
> 5422. S3C2410, S3C64XX and S5PV210 are only compile-tested.
> ---
>   drivers/clk/samsung/clk-exynos4.c      | 18 ++++++++++--------
>   drivers/clk/samsung/clk-exynos5250.c   | 10 +++++-----
>   drivers/clk/samsung/clk-exynos5420.c   |  2 +-
>   drivers/clk/samsung/clk-s3c2410.c      |  6 ++++--
>   drivers/clk/samsung/clk-s3c64xx.c      |  8 ++++++--
>   drivers/clk/samsung/clk-s5pv210.c      |  8 ++++++--
>   drivers/clk/samsung/clk.c              | 14 --------------
>   drivers/clk/samsung/clk.h              |  2 --
>   include/dt-bindings/clock/exynos4.h    |  4 +++-
>   include/dt-bindings/clock/exynos5250.h |  4 +++-
>   10 files changed, 38 insertions(+), 38 deletions(-)
> 

(snip)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
