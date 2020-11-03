Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FF5C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 16:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EBAC2072D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604421422;
	bh=nY5J7cl8i0kym1Uk20r+esqLoQzL8GRvGud9Vr+hdfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NS8E5rgAZXVpjASOmq0LspV0GZv3FWH2alXMetvo5nTatQOwjLatBxfnEOpewxq1W
	 Lwu4Y9PwNdBxqadLxGOOVeaGC+tlGVbhiPOKUUGF2LS+yoZXG5eRlQJRPsSo+ZPYmS
	 4/o/YW6ZhFIX/rmc+HAvYrUwgtYAOdxsAucO0Cno=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgKCQg5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 11:36:57 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34647 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728206AbgKCQg5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:36:57 -0500
Received: by mail-wr1-f67.google.com with SMTP id e6so1974329wro.1;
        Tue, 03 Nov 2020 08:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9339Ql77ZQ0jEYcQyRqfksinw/kbvFYNoM8CloaNm3Y=;
        b=bOz4EJm1fD0GdN1WlnJcVUKUDzFaQywWK2XvIOUEESQShKYs2XPjIqFw6pFbGjCcLN
         4LssWihEKllTnKSIGquTggj695npDeGZs55VeVH73OXUKhkT9CjNmsA/6YFtddLrplwC
         wWd9/4UsOIVWfLG+auIZJo8W5yXDvlAEnbpnzCd6xcFYPa5VHAbr5pi7M/4Zu51ocemH
         6W38bswA4DsPebaJ8NNYvei5F1XnVbSZ1oro0owPFYp9DEAHRXHr7w8D8Q0xpYBzMvZo
         6zLOf3tmQBXi50KEyMjN6H41qJDgrDr0OVP8Iv/xHg4bFEYFASkwwbOMYwbebvwlD63G
         Cf3A==
X-Gm-Message-State: AOAM532yiarBV2HgHiQFu6JJDFuRZGKnHla3QPwTiTZqce1v+teDuK8R
        OyEnJNKaaGCFlDYxjzivq94=
X-Google-Smtp-Source: ABdhPJzZvnP0UG68K+ro46SVQPXJAWRuEVe7heabHmXePvLf/aQSxj9RwAll1rN4sLsdEEujn4Rtrw==
X-Received: by 2002:a5d:4f07:: with SMTP id c7mr28482029wru.296.1604421415200;
        Tue, 03 Nov 2020 08:36:55 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id u81sm3746562wmb.27.2020.11.03.08.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 08:36:53 -0800 (PST)
Date:   Tue, 3 Nov 2020 17:36:52 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Bart=C5=82omiej_=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 1/5] ARM: dts: exynos: Fix ethernet description for
 Odroid XU3
Message-ID: <20201103163652.GB14739@kozik-lap>
References: <20201103124618.21358-1-l.stelmach@samsung.com>
 <CGME20201103124620eucas1p14e76afe9fd53184f1a689b5a654e7e1e@eucas1p1.samsung.com>
 <20201103124618.21358-2-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201103124618.21358-2-l.stelmach@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 03, 2020 at 01:46:14PM +0100, Łukasz Stelmach wrote:
> Create ethernet alias and assign appropriate compatible properties.
> 
> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index d0f6ac5fa79d..2a4153484664 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -15,6 +15,10 @@
>  / {
>  	model = "Hardkernel Odroid XU3";
>  	compatible = "hardkernel,odroid-xu3", "samsung,exynos5800", "samsung,exynos5";
> +
> +	aliases {
> +		ethernet = &ethernet;

Ahh, and one more thing - these are two separate issues to fix, so two
patches.

Best regards,
Krzysztof
