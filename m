Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493EEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 08:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28E7061175
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 08:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhIUIU7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 04:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbhIUIU6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 04:20:58 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC0AC061575
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 01:19:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q11so36670454wrr.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Sep 2021 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wH7aVEoWyehzkD0h73DUT/McpJdWLDN0h1l+JEQJkcU=;
        b=B/4ldlixfTn7/tps9gpihrAijxaNvMGu81l3uux3dH5H/bKRX9za1v5kr+DBM2NLCi
         Nel4L7xNILtICZ5lOWiUvmdZQIu4QYmzPFmoajvVc0m5epFSSfQbaLPwOf4/Vg/EPDBA
         4o/s4UZjRaBu5gs9SXUvtyJMd/TYOK5rBuUULLWujkE4g4TVej1EaPTiFE9VjqCRsU5e
         IIeVcmkmNmjbdAOVYYh47Y8sjeiv+MrfBlMLEIMS6dJMpLg7+THxFlUxhtuiPtPSf1PO
         bmnvms7IDO5gau3ehssraWZaXbQ3A2uTifQpQTvAYtWo6BdMABwbc1JLfJNdMFnfgw59
         O/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wH7aVEoWyehzkD0h73DUT/McpJdWLDN0h1l+JEQJkcU=;
        b=UvDuQsLkXL/aPJqyR9mASEW7KHky2fem3vR8j25LwYU0W8OearRJsfzl6asEFEW+3y
         DkMCM2rRCRCn/PQ66YSoe2Xo6RgNP8NmuMh1K7/b5YoEvKfgsTsJQtzNehKJPUVhpTj9
         gp67rmPU0bw9/FD+d+jWvlQYYjHjU+zY70Vm+92gBQgQoIKKriReO4GiiEmw2mnE0Y2v
         O+9h2BevuMqDrl2xQSpJ+J56EcumlKaLvspRuVNh0U0wbczCsGlXt8XC7WHG+1rBtEfv
         V/QnCRGLTGeiJBQF98ytno2JmXMwjl3fXf5xtggtBQXEiWTqglBO52vKjTp/0yyQqrpm
         vx7w==
X-Gm-Message-State: AOAM531yBB5yPiBcZv18GA8kvhGkTsulX4NLEiK8UEtAar00LGa1Q50R
        k0PH/e1Xw8LeUzVhAMGez01h1w==
X-Google-Smtp-Source: ABdhPJwe0qY6ZcHLtE/qce8fQemsDGqQ7MvsikM6esPCzG1DMDD0ZhKjuXQSwXCww6BMjs/AbS79mA==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr3106873wmi.169.1632212369510;
        Tue, 21 Sep 2021 01:19:29 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id j20sm18541774wrb.5.2021.09.21.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 01:19:29 -0700 (PDT)
Date:   Tue, 21 Sep 2021 09:19:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config
 logic
Message-ID: <YUmVj80m/rEC2mT7@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-3-willmcvicker@google.com>
 <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b48a41a-9130-b4cc-40d3-0bc7930ac76a@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:

> On 20/09/2021 21:03, Will McVicker wrote:
> > Switch the default logic to enable SOC_SAMSUNG and it's sub-configs to
> > be enabled by default via "default y if ARCH_EXYNOS" versus being
> > selected by the ARCH_EXYNOS config directly. This allows vendors to
> > disable these configs if they wish and provides additional flexibility
> > to modularize them in the presence of a generic kernel.
> 
> This is not true. Vendors cannot disable these options as they are not
> visible.

Good point, well made.

> Although I understand that Arnd prefers this way and I do not
> object it, but your explanation is incorrect.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
