Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F890C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:44:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3873220578
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603820647;
	bh=14bqUosqcuUCY0ZrNFS94kHi0dQxVigoipleFGTa8xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=smxgZlV9avOQTdxIF/E4ZwmG4Ay8Sc64Q94tkhLOmmTlguMwJ0gz0FK6qt5BsGxFD
	 X+uJfrYpJejMnzf6+Z/h/9K1n1hwrb8e6dbG7po453tIicyGRRaXqaRkUadIjWVJOb
	 /W/98vA4lnsRA8GdQTSCK3KeYWx0Gxz9rxnlggx8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1821467AbgJ0RoE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:44:04 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:46168 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1821449AbgJ0Rnv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:43:51 -0400
Received: by mail-ej1-f68.google.com with SMTP id t25so3421970ejd.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 10:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gb9rORXmj9e7k2/cGD0/grAcFw6yTc2vIt7AFkb+R8c=;
        b=OpCJJWljZW3/PMfDMH4GoXvuw7idichTh+ZITD27hQx4cd6HNwDYJCNuzNHV63VJQJ
         RHhECrD1M5LiTKLcF/UR29/E83R+0M1f2WcuRZjiANOKTy+y0WMUEEy4gnx1LxhMcKXc
         fvrbOOzezZaPaiiDog2ZSnPYaF/S5qWapqzDP73X+s9cyIv5JCfIKK63jxueudpNCfN/
         1cFeWoaOUdyIHSiyXhhWq9//y8mdqQs9u9iQCT9xKJV68jGbmSMqd92coY02c9dvsXHl
         aNs6LHNBg/GfjExILL5MNTF4fmG7SHMuh5VoF3SbU8dFj4Q1Xnglc9e6UJE1nC0Yio3q
         2E2g==
X-Gm-Message-State: AOAM5326kVvK3FyXOAA3O7Yz73ZEh3x9gXabOjPSeraTrUVpoXFzBjtP
        0Sb0XASbzQ264BUTUanNDZCyhzHdC86R1XG2
X-Google-Smtp-Source: ABdhPJzh26ynFel6AxxZ3leruS6ekSzicUJX/wkM3/L34+7WDedee3RE5sZ5g5lx5qKsfnw9hwhPmQ==
X-Received: by 2002:a17:906:f90a:: with SMTP id lc10mr3652945ejb.272.1603820629619;
        Tue, 27 Oct 2020 10:43:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id u18sm1394516ejn.122.2020.10.27.10.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:43:48 -0700 (PDT)
Date:   Tue, 27 Oct 2020 18:43:46 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos4412
 bus OPP-tables
Message-ID: <20201027174346.GB135184@kozik-lap>
References: <CGME20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df@eucas1p1.samsung.com>
 <20200911122236.16805-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200911122236.16805-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 02:22:36PM +0200, Marek Szyprowski wrote:
> Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
> values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
> exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
> revealed that 'opp-shared' property for the Exynos bus OPPs was used
> incorrectly, what had the side-effect of disabling frequency scaling for
> the second and latter buses sharing given OPP-table.
> 
> Fix this by removing bogus 'opp-shared' properties from Exynos4412 bus
> OPP-tables. This restores frequency scaling for the following busses:
> C2C, RightBus, and MFC.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 6 ------
>  1 file changed, 6 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

