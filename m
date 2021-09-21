Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F8BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 10:04:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9592861156
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 10:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhIUKFa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 06:05:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:44228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229833AbhIUKFa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 06:05:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02B6760E9B;
        Tue, 21 Sep 2021 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632218642;
        bh=wOy6b7vGPISeEG0LPcHEKi+NseEtuJC3LnPNLORtWIg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=phojlOPBV6Ek+gVlVy5miq8fI8N3nHGunLNdGeTNCAHLSM2b8Hzz+NdkxfOb4Yvd5
         93TVYTFIJ5Z2cNJNL53sX0JcoSDwZeWbw6MnuimbPJxfvOugFUyMXO+uCABSAr44IY
         +ZOcIJWRo7QChZbHgHLvNQPa9JQFEASwYG5CCi7TxzbJXZqLqhufTVnzXMTgSdd5qY
         wbBtZuBEjRFbQUA4cgMcsIG9G42jSnvTuZBZQejccESEFn9c1r8wUOQZ7lAJ94qnZR
         dbV+dNaOu+9lp845xJQELrIQC+s2Ie9kOg16LNW2jhSCtjyfwDznaT19O0S1hE7Km1
         qkpRk7l7+F53g==
Subject: Re: [PATCH v2 0/3] soc: samsung: exynos-chipid: be a module!
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <4aee1b0d-91a1-75ac-d2b7-6dab3d7a301f@kernel.org>
Date:   Tue, 21 Sep 2021 12:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19.09.2021 11:31, Krzysztof Kozlowski wrote:
> Krzysztof Kozlowski (3):
>    soc: samsung: exynos-chipid: avoid soc_device_to_device()
>    soc: samsung: exynos-chipid: convert to a module
>    soc: samsung: exynos-chipid: do not enforce built-in
> 
>   arch/arm/mach-exynos/Kconfig         |  1 -
>   drivers/soc/samsung/Kconfig          |  4 +++-
>   drivers/soc/samsung/Makefile         |  3 ++-
>   drivers/soc/samsung/exynos-chipid.c  | 14 +++++++++++---
>   drivers/soc/samsung/exynos5422-asv.c |  1 +


For the series:
Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
Tested-by: Sylwester Nawrocki <snawrocki@kernel.org>

I just verified Odroid-XU4 is still booting without the driver
and with the driver as a module. Thanks.

