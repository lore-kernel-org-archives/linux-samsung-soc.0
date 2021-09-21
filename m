Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F117CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:20:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7696610CA
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 07:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhIUHVc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 03:21:32 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60794
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230031AbhIUHVc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 03:21:32 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7629A3F338
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 07:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632208802;
        bh=AEgBA3R77w9KryrrVCKS+IcMBHSWWQYQcCPJfI9REUY=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=q5I2OKK/BHIgeadXIt4B504ihWDnqoms3PgcGZQGSft7i44IlbxsDlXvkhVjJFIW3
         mzYuofJjMvriDGreAPnbacsXV4600h+II6SoC0/cUriDo8/BwzS1MsBO4ZYx1WoBRY
         Hhiz/tJZjvxtjhGvANGJlRhJ/ZPg4lKfqDYZ6sYHyc267AUtnWybwqolIxF49/bRVf
         lYGazccFPhBDNT5/WgSwoDgG70BJdUuJOV58O8soOlGA4x2ifxfz2Vbb4dVsBor53I
         PeZHGG2I7TKlyOocxsFvmTY7QOZVuO5RA0wJ7vMhnXmk2OGAhpLM5q87yNT9wrvMBU
         JYcuEZT4dxsQQ==
Received: by mail-wr1-f69.google.com with SMTP id h5-20020a5d6885000000b0015e21e37523so8035545wru.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 00:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AEgBA3R77w9KryrrVCKS+IcMBHSWWQYQcCPJfI9REUY=;
        b=x0pty7oqSQ0mUf8i0iV+ApbhzBrKh9l/CmqDJkzEMBlwJtemYhbFhH3Ii89eBgzcXH
         fChA2HSjOQKib1S2Gxi+3cRy9QbgCK7qzohP1j5S8OmCSCfIaPgds+8S6sDZjH9Q3pjY
         h41Xo6sZCHiyaLF0iabnndqHj0uZH12uNZ+LhHrdQzA6a3We9bFU5ptVjE8AyVD1ERQf
         gRcjLHVp2MCa+w3PP+fhBwJnGiJnYdnujYt6hrHYVySY4nu83TJ6wMFRiWVyavElmw+m
         K7cVJl+rocVIBRloi4TN6Nay9R6CWLhIPSxPkT7uv25ChX3vzgE4MDYjE5rzqKl04DGI
         xWMg==
X-Gm-Message-State: AOAM531DeaY9o1QvxhmjNk9oQqKxnMQuuPggaeDeT+S/y0F/V+agpXlC
        FYzIJwwBClh8LC+MrPYqcg3yFILXnp49OKqHmwqwO4Y8MrMMkmP/twXAl8O9sNAbcEPa3nz4aB4
        iZxy8Lv6n7gRcEfjzeG4eLTKGa84O4l71Bt8id/XCiJkyt8zk
X-Received: by 2002:a7b:c750:: with SMTP id w16mr2977695wmk.128.1632208802084;
        Tue, 21 Sep 2021 00:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO5jz1FEI8gyX7GyxtVi5eDjZZJeMMrwVlptuHEN5O7i5u5mvto6Hcns9xoz5xze1ScI9CPA==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr2977671wmk.128.1632208801861;
        Tue, 21 Sep 2021 00:20:01 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id u5sm3543492wrg.57.2021.09.21.00.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 00:20:01 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20210920190350.3860821-1-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com>
Date:   Tue, 21 Sep 2021 09:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/09/2021 21:03, Will McVicker wrote:
> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> a handful of drivers without allowing the vendor to override any of the
> default configs. This takes away from the flexibilty of compiling a generic
> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> modularize these drivers out of the core kernel in order to share a generic
> kernel image across multiple devices that require device-specific kernel
> modules.

You do not address the issue in these patches. The problem you describe
is that drivers are not modules and you are not changing them into modules.

> 
> To address this without impacting the existing behavior, this series
> switches the default config logic for the offending configs to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select them. I have
> verified that these patches do not impact the default aarch64 .config.

Yep, this is what you did but it does not match the described problem.
You are not solving it but doing something else.

> 
> Will McVicker (4):
>   clk: samsung: change COMMON_CLK_SAMSUNG default config logic
>   soc: samsung: change SOC_SAMSUNG default config logic
>   pinctrl: samsung: change PINCTRL_EXYNOS default config logic
>   rtc: change HAVE_S3C_RTC default config logic
> 


I received only two patches from this set. Please resend following
get_maintainers.pl script.


Best regards,
Krzysztof
