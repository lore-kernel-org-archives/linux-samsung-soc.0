Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FB4C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 27 Nov 2021 13:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355005AbhK0NYL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 27 Nov 2021 08:24:11 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33668
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355009AbhK0NWK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 27 Nov 2021 08:22:10 -0500
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F41E94002E
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638019128;
        bh=kPJVl6Z5We0DFc0ztiQFBcLbP1LtPc3m0qtRs2jiBFM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=SfprYOjXEWVRMiK/jS7zKq69e0SSyjircYCgmtqwGjTahuEGosvpUUOR+TWyhcN30
         3GnCnPcztvdc3sBhFKEdBubpGvxOJH4Z1wDJgcF6nXTwUxTgK9ZpnrtWGHbNlA7/F6
         PZP9A10/sB+cdLvqnyrVoFys9y3zt0BNYFtil6wOXSyKeYFWcc8Hq1eLxnwr7KhpoI
         sDFNgnfvFHYxFMB7g9UVft6nM8g6Tca052XU+3yfL7KfA4IYfYA5JmLs9eXRdF2NnR
         yVRjJJaYKgrtDRrYWPbFHccsqq3/1/anrSnUw3esPSKD9fGBIc9T5qCjiV5FDlMKfP
         rbyF4EtO2LXxw==
Received: by mail-wr1-f71.google.com with SMTP id x17-20020a5d6511000000b0019838caab88so2022241wru.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Nov 2021 05:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kPJVl6Z5We0DFc0ztiQFBcLbP1LtPc3m0qtRs2jiBFM=;
        b=ij1hFrH/AHcaitm9czIxaIKp0MENlGD3Znl8oFSQURSvSlzTA3zOKRyHjwy4oVIBpQ
         tEowjDK+g3/ushFA1F4djEVQiFiJFKVycn3EmH+mPzZ7ls9ikFa2dxcr4K9IGQMPCbfA
         lxZgX7Cze7uMsYQ4BSlrxBVc1DecJWPvGOrwcrXKzoXKIM1c+L8i+yRJugkqdTAP6hNM
         EscXExcMBwMecVkLXfz5/WTfPE/xru/m9liKHNrEZ8lzoOCH04637JSsxROX14WSKkTp
         tM6/a1HcZuDjNAejYeQAXZmKgS9nRuefU94iml6u6vr65EQnAmj9Y45GkZ3Db6Ggi43W
         nr1g==
X-Gm-Message-State: AOAM5318u2ZNktGvntJfLH+dvO5KVXUuL3u4Lk8xZ/WI41bBhcHPsEED
        mClnf2l0OlEb4RG5OYZZLGv9rQvdeIH0R4ulQ7E9ofwj90QswJL9jgyA5iwXzQccmJ3Uy7UEDeh
        KTL5nWPA72JHD0KtoSkJk6rfZWSwiVeF+lT5eOIW2iNuQCVfJ
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr20815937wrw.124.1638019128227;
        Sat, 27 Nov 2021 05:18:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOO+IlyrDLaZIl7/rvRYOzotxIQrszQV6Kgfuzv1tBT3sR0cBtSxbFds7/SxM0S0FlFjSohQ==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr20815919wrw.124.1638019128093;
        Sat, 27 Nov 2021 05:18:48 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d15sm12021086wri.50.2021.11.27.05.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Nov 2021 05:18:47 -0800 (PST)
Message-ID: <18e105d0-7df9-9f5e-e2e0-1859ee18e3f1@canonical.com>
Date:   Sat, 27 Nov 2021 14:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/2] clk: samsung: exynos850: Add missing sysreg clocks
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211126203641.24005-1-semen.protsenko@linaro.org>
 <20211126203641.24005-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211126203641.24005-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/11/2021 21:36, Sam Protsenko wrote:
> System Register is used to configure system behavior, like USI protocol,
> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> make it possible to modify SYSREG registers.
> 
> While at it, add also missing PMU and GPIO clocks, which looks necessary
> and might be needed for corresponding Exynos850 features soon.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos850.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
