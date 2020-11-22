Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A2FC56202
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 Nov 2020 15:16:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B21F20781
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 Nov 2020 15:16:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgKVPQH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 22 Nov 2020 10:16:07 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:39648 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbgKVPQG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 Nov 2020 10:16:06 -0500
Received: by mail-ej1-f66.google.com with SMTP id s25so19752496ejy.6;
        Sun, 22 Nov 2020 07:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m40ePb0WowbyEBeP3p9wxNvULWshRU43UNkM2KlTYek=;
        b=G0W4HmqABjAU5CONb2mblEfAcM/9sEQ4GfnKOMLnsSP5xMRw6/CDtTnjPKrUbIgUyQ
         Sjl24PrwBiwHC/llp+IhWyIjcgZoFPI8MFak4yS3G0+DZ/PLdZM+37ENBeWFBNREEEHR
         z1m/sw3hrTgQeRTZ8XQI4xrhveK8JNhveBjYGpYNaCemhft6eQWCbhwjf5+waAsFvtqL
         olylJlIUze5MCNJP3LRU4YqjN7dCPII7KGz2p7DKUhe9tQHlm4MJd7QxT6e+bj47piv/
         xU5W2TnVj9gmfSRdxxQBCL3yog4ZmXinatcVOm1IYwyFV52jo/lTnk9gQyR4lOlH+qvy
         sVzA==
X-Gm-Message-State: AOAM531c0IUFuN0mxcPh5XnzekVxr1iWOqdlcf8DQSOF4AfTF+33F6dy
        vZTa/uvyl5soWIOk3OSwdtbIkBoiCLc=
X-Google-Smtp-Source: ABdhPJycg25qQotskeOlIwboUWBXMQDXocn+7gf+sHWwOPyDFL2dv4FyyMO9CUAJTMLfGVfNSor4Gg==
X-Received: by 2002:a17:906:f289:: with SMTP id gu9mr10602939ejb.514.1606058164678;
        Sun, 22 Nov 2020 07:16:04 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id f25sm3671593edr.53.2020.11.22.07.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 07:16:03 -0800 (PST)
Date:   Sun, 22 Nov 2020 16:16:02 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-clk@vger.kernel.org, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, m.szyprowski@samsung.com, sboyd@kernel.org,
        mturquette@baylibre.com, b.zolnierkie@samsung.com,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v5] clk: samsung: Prevent potential endless loop in the
 PLL ops
Message-ID: <20201122151602.GA5346@kozik-lap>
References: <CGME20201120155747eucas1p248a1f0b71fbd8f329271494d7a207347@eucas1p2.samsung.com>
 <20201120155731.26898-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120155731.26898-1-s.nawrocki@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 20, 2020 at 04:57:31PM +0100, Sylwester Nawrocki wrote:
> The PLL status polling loops in the set_rate callbacks of some PLLs
> have no timeout detection and may become endless loops when something
> goes wrong with the PLL.
> 
> For some PLLs there is already the ktime API based timeout detection,
> but it will not work in all conditions when .set_rate gets called.
> In particular, before the clocksource is initialized or when the
> timekeeping is suspended.
> 
> This patch adds a common helper with the PLL status bit polling and
> timeout detection. For conditions where the timekeeping API should not
> be used a simple readl_relaxed/cpu_relax() busy loop is added with the
> iterations limit derived from measurements of readl_relaxed() execution
> time for various PLL types and Exynos SoCs variants.
> 
> Actual PLL lock time depends on the P divider value, the VCO frequency
> and a constant PLL type specific LOCK_FACTOR and can be calculated as
> 
>  lock_time = Pdiv * LOCK_FACTOR / VCO_freq
> 
> For the ktime API use cases a common timeout value of 20 ms is applied
> for all the PLLs with an assumption that maximum possible value of Pdiv
> is 64, maximum possible LOCK_FACTOR value is 3000 and minimum VCO
> frequency is 24 MHz.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
