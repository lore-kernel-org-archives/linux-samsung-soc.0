Return-Path: <SRS0=2lPF=5M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8371C43331
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:35:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 701672082E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585312510;
	bh=mMcycu48gjpvse5IGYdxuHURVysD/6Gem4N+hwN98gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ty85P0Q4UKMIjoYhUUrhwRoud5NdXKhukxw3cWa+6RKhZGHZOF58dSrpYDmsnQjQw
	 13MeDxtBvSwMNJftM/ifWaRKKPckRWoOfAvparfxbdnFVA9ffpZd86b4kS1P5CYiSK
	 KE4rOEfDefMS4xL1TAEwaDzFJwvh2iG3JiRfKHrw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgC0MfK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 08:35:10 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40276 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0MfJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 08:35:09 -0400
Received: by mail-ed1-f66.google.com with SMTP id w26so10867132edu.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 05:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hpFr+OR3LsiMB0+WT5dUrU3N3Q1a50vtvlvHDVMlFWw=;
        b=BCw6wFS2vu+u5RZi0r67dHoWLfnR7+GL8O5Za9G27AVFsJWnVJJIhDduoY6G8dM9BE
         nBwsQTs01iit4+VJc7Pms9GqjTFh8lijmq7fArgjuJdCCejQ50suGf61Xy0m5UbqOvJe
         gsMasbcec8GcDIaJoNA4CYQ0Nyq02/y82HNma3t3A5hMByHVCQQ/BDMn+HpUVuzQQqIL
         ZeejX23s2BvYIkKNcs5GUtL14Pe4K5100k+Mqde8iZscnnsPeribl+Ce+X5IVv2SVuQt
         KaNVhQ3fifyZh7+0oGEreyxrgVVr43Gr0j2dHspaVx4IA+02JU6cS+ea7CCBnXD3mMS7
         3Q2A==
X-Gm-Message-State: ANhLgQ2WhwDync8kTaG0gpZkOC6zvfrk358uNBSywP+fNyH2kpEGPlGY
        oWF3fvS7f3xw/SI44E4h3N4=
X-Google-Smtp-Source: ADFU+vuDb244Ch64BXzAUdDO4zrBi7JIc9zhsrOn1nmQf9xLxdpIMJ+N3RbDOR1vRCN53DMTJSMJbw==
X-Received: by 2002:a50:d24c:: with SMTP id o12mr4984484edg.219.1585312508092;
        Fri, 27 Mar 2020 05:35:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id s12sm701597ejm.73.2020.03.27.05.35.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 05:35:07 -0700 (PDT)
Date:   Fri, 27 Mar 2020 13:35:05 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Convert to new i2c-gpio bindings
Message-ID: <20200327123505.GG7233@kozik-lap>
References: <CGME20200326143927eucas1p2f9c85d3eaf4beaf07d0ff55a9be768a9@eucas1p2.samsung.com>
 <20200326143909.21798-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200326143909.21798-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 26, 2020 at 03:39:09PM +0100, Marek Szyprowski wrote:
> The updated "i2c-gpio" driver bindings require to define the SDA and SCL
> GPIO lines in the separate properties and mark both as GPIO_OPEN_DRAIN.
> Covert all Exynos dts files to follow this style.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-monk.dts           | 3 ++-
>  arch/arm/boot/dts/exynos3250-rinato.dts         | 3 ++-
>  arch/arm/boot/dts/exynos4210-i9100.dts          | 4 ++--
>  arch/arm/boot/dts/exynos4210-universal_c210.dts | 3 ++-
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi     | 6 ++++--
>  arch/arm/boot/dts/exynos4412-midas.dtsi         | 9 ++++++---
>  arch/arm/boot/dts/exynos5250-arndale.dts        | 5 ++---

Thanks, applied.

Best regards,
Krzysztof

