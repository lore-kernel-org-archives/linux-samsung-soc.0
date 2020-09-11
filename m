Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1853DC43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 17:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C95C7221E7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599844063;
	bh=GlNKX+YHW9dEPZCy0tcIbRfoSSXos3gHsmrpM7d5QIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=JhBa1F1+9y2y4dEUXWIyoN2hWMGDwd/DrMRn6XaZj64JGl/aqpusEzl8O68Wuz5Yu
	 cpkNWFrtj0QcAC3nlqJRkCRmgUybBXeY+HTieQsx79ieOebtfLIIJEHwV/ev7HoZWz
	 wokXkNxkRT1TUPdRRugvOel2KVydqv7NfgIjUnik=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgIKRHb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 13:07:31 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34796 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgIKPCG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:02:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id v23so12751250ljd.1;
        Fri, 11 Sep 2020 08:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dyRucZNm28md89mx/pOf3gZWnRQfYA7sbvDVwnAnZ74=;
        b=Nn3Hh2BryO8Bd9XXXy/bBY8oLYnhBQJWSXtwDotUr8HrZMQ+Py+6s3eSdiciuV6BpP
         AkiA6ARjC9d0EQzPMFw6WyomBCCfNNpeJK0CBLijmfhE8e5CduWiwqZCipKG1vrkojOT
         fBuURf6GjlKr5rs+eAPTGOoMxT0tTmWOlMmEpgGRptG5IPggDluZLvUL9rXYvHMVKZsD
         yG5KAczZPZb9fnTtQitoJ55INwDutrNzoRZsII8uloCL4LEzKa1G7q/Dyt70xAgdVjqD
         qBo5kq+h/sTHF61BPRtrphHfydAZGJJyKg2t6mkuW5ujWsrZ1/m6dWyZG2xhdx70kkqR
         ZeeQ==
X-Gm-Message-State: AOAM533hlk4oMtLGkc++Qf/BYtfdEKQwsww9lhGQfQZ5f8Ld/r2ok0Dh
        ZzYl8Pkn51KxGAGv2xlQOQnd7wi4iah8jQ==
X-Google-Smtp-Source: ABdhPJzEFJh32P9XFCoL6b6HJBE98lnsBmOx88hw37vP0PmvRkv5gR+ungj+zLUx4/JPA+XfKl1wAw==
X-Received: by 2002:a17:906:9389:: with SMTP id l9mr2465355ejx.537.1599836023257;
        Fri, 11 Sep 2020 07:53:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id h2sm1753694ejk.33.2020.09.11.07.53.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 07:53:42 -0700 (PDT)
Date:   Fri, 11 Sep 2020 16:53:40 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: exynos: Add assigned clock parent to
 CMU in Exynos3250
Message-ID: <20200911145340.GB15290@kozik-lap>
References: <20200906142146.21266-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200906142146.21266-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Sep 06, 2020 at 04:21:44PM +0200, Krzysztof Kozlowski wrote:
> Commit 52005dece527 ("ARM: dts: Add assigned clock parents to CMU node
> for exynos3250") added assigned clocks under Clock Management Unit to
> fix hangs when accessing ISP registers.
> 
> However the dtschema expects "clocks" property if "assigned-clocks" are
> used.  Add reference to input clock, the parent used in
> "assigned-clock-parents" to silence the dtschema warnings:
> 
>   arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Use XUSBXTI as real input clock.
> 
> Changes since v1:
> 1. Add clocks property.
> 
> This is a v2 for:
> https://lore.kernel.org/linux-samsung-soc/20200901101534.GE23793@kozik-lap/T/#me85ac382b847dadbc3f6ebf30e94e70b5df1ebb6
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 4 ++++
>  arch/arm/boot/dts/exynos3250-monk.dts    | 4 ++++
>  arch/arm/boot/dts/exynos3250-rinato.dts  | 4 ++++

Applied.

Best regards,
Krzysztof

