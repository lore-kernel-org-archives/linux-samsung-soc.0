Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B216C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 316A66126A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhIUHbR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 03:31:17 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:36454 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbhIUHbQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 03:31:16 -0400
Received: by mail-wr1-f52.google.com with SMTP id g16so36341398wrb.3;
        Tue, 21 Sep 2021 00:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PwxU4ElXAEYTnpc02yX8wa7uynBe7bYZVZ/4RTAlYcw=;
        b=xhmYcH0z8X8WObbCoIxNnh/XDHJ7YdPuJ7UQWZmD9+WT8AjTUFL0DCwgfjj8mT0sAr
         pwdb7816RUgBlam2kUJCzcpV1lqVpUJXSR713+8CaVI70CB+HHXLC04e8bSVGotey1NP
         pw3PASyzSyYypefMc0ddu50HQVKl5hk9iicZBCR3sOUIe0xU9ZBBVXm3/pVA3MDxReQa
         ulkyx2GAyQgl92Kd9lFk5LOLgyypUUMcl5tg+5AlnSNkr7it5pWaWwn95VgHlp5chVfG
         ggf9tzfLJmOigxlvg9GoqfWv3VJZrAu0AGilNiAx/G4rExzasjPeoUdVI/1sji+AWYdg
         SGJw==
X-Gm-Message-State: AOAM532fOQfLTKU69ujQ6NY1JHgZ0bwdqpR62MygTjTChV4VNmPhweRF
        Ui/7tTBxhFLx82Y7o3xr4Pb+IiSc8+g=
X-Google-Smtp-Source: ABdhPJwz9XYBycQ0YgR09UlgwcWhnYfJ/0+mYSDJ2VfWjRl52IaG0QGibCPKkDWzRNi+YytFdXjlgg==
X-Received: by 2002:a1c:58:: with SMTP id 85mr2931892wma.87.1632209386943;
        Tue, 21 Sep 2021 00:29:46 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.googlemail.com with ESMTPSA id z17sm1781474wml.24.2021.09.21.00.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 00:29:46 -0700 (PDT)
Subject: Re: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default
 config logic
To:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
Date:   Tue, 21 Sep 2021 09:29:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920190350.3860821-2-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/09/2021 21:03, Will McVicker wrote:
> COMMON_CLK_SAMSUNG is selected by ARCH_EXYNOS which forces this config
> to be built-in when ARCH_EXYNOS is enabled. Switch the logic to use a
> "default y if ARCH_EXYNOS" to provide flexibilty for vendors to disable
> or modularize this driver.

The clock drivers are essential, you cannot disable them for a generic
kernel supporting ARCH_EXYNOS. Such kernel won't work properly on platforms.

> 
> I verified the .config is identical with and without this change.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 -
>  drivers/clk/samsung/Kconfig  | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 

NAK, please use get_maintainers.pl to Cc necessary folks.



Best regards,
Krzysztof
