Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA17DC6379D
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 10:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8904B24137
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Nov 2020 10:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgKOKid convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 Nov 2020 05:38:33 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34106 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgKOKi3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Nov 2020 05:38:29 -0500
Received: by mail-wr1-f66.google.com with SMTP id r17so15515589wrw.1;
        Sun, 15 Nov 2020 02:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XCV5uHgY6DODvj6+GlYS+gOQA/O+rbI8DOr62ByZ6eU=;
        b=WL+Zg/p1D9RWyWi/GK+kU6+qKOigK+4n3+XRLKZJ6lMe+Vif/rfk/q3Vqe3fLrfZL2
         kpsMpNVF6NRutZeOo5JaEKuDwwgzHFpBslEqwBETexgnxCRhivGFS9VifE1fSdxA3JpZ
         U4u9IBUGGARhqot+bPr53zoQpiOCWqU2cJefo0nzKpYIXgeF+QMCHcGtrZovoa2h0KuM
         zEQak25ZVKkw1DmbER++UueGNTcryDGuMJvFomgWrCpPc9UOcZ9mlBpKx7XKKuanLyJn
         Yw4/jK7MxXBtKmn/opEAjuOFYVe3Y2Hjkutm3Jqev+3AmGwUOvQIR/Kf9fuviC2FeImI
         jrjQ==
X-Gm-Message-State: AOAM532vd/f1Z7XSmRfoQre/oCgYGjTr978SoUZ8eC0IgZLXt5NAVfZF
        YaQ24zKf5QJs1Cs8bjEBEohOAJ9+Qvw=
X-Google-Smtp-Source: ABdhPJzh3+bVuPf93jFxrqUZ1Vvz7MreEq74HTKtU2MUccKvCdL71LjIV7WIgEeWQqEbc+1t+deF7Q==
X-Received: by 2002:adf:eb91:: with SMTP id t17mr13246256wrn.330.1605436707236;
        Sun, 15 Nov 2020 02:38:27 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id r10sm15568035wmg.16.2020.11.15.02.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 02:38:25 -0800 (PST)
Date:   Sun, 15 Nov 2020 11:38:24 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/6] ARM: dts: exynos: Fix Ethernet interface
 description for Odroid XU3
Message-ID: <20201115103824.GA5751@kozik-lap>
References: <20201103184412.18874-1-l.stelmach@samsung.com>
 <CGME20201103184417eucas1p2ae35b1c02361c2814d31ddc5fb27794d@eucas1p2.samsung.com>
 <20201103184412.18874-2-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103184412.18874-2-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 07:44:07PM +0100, Łukasz Stelmach wrote:
> Assign appropriate compatible properties.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

