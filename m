Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9049DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 08:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E82B611EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 08:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhIUIhW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 04:37:22 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35010
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230488AbhIUIhV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 04:37:21 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 47E6A3F4BE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632213353;
        bh=lQRT6EGGve1EBnMNNxr8uMFKa9VogaceuvltbqBrtr8=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=V5Ar01ZNphCZj8Na1gOBq7Qvw566jlPqmlah2+FMP6sGwGjQQBIBAddnPWWDOui/V
         jYoUBr+jqXfxAVibGMdUt3HHRK7nFKnTEEMtuywYzYIBmzUVqXa83I+QIr82LgGQEH
         XlSHAhSjfnXahYcxD90phiJzgzXCwvKZR/6YGtyG2fuYNN3HKiWGsAr2WThTCh19Z3
         TGQc3agt+Nstl9FcYiNoqlbRXDWZ0iFX2MzQiblboKfIb/NrjrQernd2eej3URKiLU
         S/6u0gakPtlyYpj5ZbPNKCEYEnB0ncYo3Fayst6tM676U8lyRv+zsimf8czavu1WHL
         6CjnrpVPIFmtA==
Received: by mail-wr1-f72.google.com with SMTP id v1-20020adfc401000000b0015e11f71e65so8214095wrf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 01:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lQRT6EGGve1EBnMNNxr8uMFKa9VogaceuvltbqBrtr8=;
        b=e7Fz9SB9qI9ZmbqYWFkaCsoUgAMi396b+vS8z8a9Ci+0ed9frv5OkD66X2qcUJhq8a
         WnIPu/w0iTjkQDJ3L329vCf/38QkfmBD7WuKb58Mi3OaReKQGykOICMctVJ4rFY53Yjy
         vX9/aojtAMRN4GBAsHjoPfoEZwEbR3zhyE/ZVMn1Oy2z5AZzhL/H5mFQyTGtujKq5dkK
         mbYFE4hAHtrFPNdpNC1rbi096IhsgHwyzxj3LE/63+en/SBe1d+P2FVLbqnFarik+O/3
         /N3jUgnrcVAviZtC6xZh6ExgVIioA9iHTT6VS+zpRzjOGyWz/UHVV68s70BtraUAeBy+
         cdLw==
X-Gm-Message-State: AOAM5302izBhdR30qxXp4oMdJBEN+BteacAwvRnX26DZpGnABGI456iv
        e3lB604OBFSNwS0w18UGUoFFszSvwbYqJd1k5T/hp8qGhuPYNhADL2jB4qOAqL1ECGnGjE4l6Nk
        uxgksb89iIaIPhNTf2cuzkZLc9+uVUdyTvJZYZe5i8pbtYzf1
X-Received: by 2002:a7b:c142:: with SMTP id z2mr3357171wmi.10.1632213352916;
        Tue, 21 Sep 2021 01:35:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDvUrXflYulapeJv6L1lTo5OVRdOzoWqHitDx/QOp0/pTxHCrxTBBq7VpLs3ZVu4Jpt3sotw==
X-Received: by 2002:a7b:c142:: with SMTP id z2mr3357151wmi.10.1632213352769;
        Tue, 21 Sep 2021 01:35:52 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id c185sm2235289wma.8.2021.09.21.01.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 01:35:52 -0700 (PDT)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com>
 <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
 <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default
 config logic
Message-ID: <2c8a79f7-711a-b075-745f-ea77b82a1117@canonical.com>
Date:   Tue, 21 Sep 2021 10:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/09/2021 09:50, Geert Uytterhoeven wrote:
> On Tue, Sep 21, 2021 at 9:31 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 20/09/2021 21:03, Will McVicker wrote:
>>> COMMON_CLK_SAMSUNG is selected by ARCH_EXYNOS which forces this config
>>> to be built-in when ARCH_EXYNOS is enabled. Switch the logic to use a
>>> "default y if ARCH_EXYNOS" to provide flexibilty for vendors to disable
>>> or modularize this driver.
>>
>> The clock drivers are essential, you cannot disable them for a generic
>> kernel supporting ARCH_EXYNOS. Such kernel won't work properly on platforms.
> 
> Obviously it's not gonna work if the clock driver is not enabled
> at all.  But does it work if you make the clock driver modular, and
> put it with all other essential driver modules in initramfs?  Debugging
> would be hard, as the serial console driver also relies on clocks
> and PM Domains etc.

The kernel could boot without clock drivers (default settings from
bootloader), probe clocks from initramfs and proceed with rootfs from
eMMC/SD/net.

In theory.

However I have no reports that it ever worked. If there is such working
upstream configuration, I don't mind here. Just please explain this in
the commit msg.

> 
> If not, this patch should be NAKed, until it works with a modular
> clock driver.
> 
> If yes, perhaps another line should be added (_before_ the other line)?
> 
>   + default m if ARCH_EXYNOS && MODULES
>     default y if ARCH_EXYNOS
> 
> However, many developers may want MODULES=y, but not want to bother
> with an initramfs.  So perhaps we need a new symbol
> MINIMUM_GENERIC_KERNEL or so, protected by EXPERT, and make the
> driver default to m if that is enabled?

Yeah, that's indeed a problem to solve. For most users (and distros)
building kernel for Exynos this should be built-in by default.

Anyway, the option is non-selectable so it cannot be converted to "m" or
disabled. And this is claimed in the commit msg:
"provide flexibilty for vendors to disable or modularize this driver."

The commit does not achieve it.

Best regards,
Krzysztof
