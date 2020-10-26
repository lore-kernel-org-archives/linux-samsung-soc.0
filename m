Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E55AC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:35:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C26DD22265
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603737332;
	bh=jc+5QP/pQfGHKvxXgkBZRgkvMOXNPazAbFK00Vgth4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pKnLBF82d3HmHZr2Ho5xzefKTup83yOH6Ibclfsy0vPR2PpcPifJd5W/wM8K6fh5I
	 z6UkaoOMuw7e2IQHCygNROxSlZLywGKDZ34VRD8mLhvtBGxuHsnCn+/2WXRkW5IrdL
	 /bbDwvUeeP1yhyuFx8EXHSAFYhA75U6QkO2zA7YU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1790002AbgJZSfc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:35:32 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38969 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1790000AbgJZSfb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:35:31 -0400
Received: by mail-ed1-f68.google.com with SMTP id a6so9140025edx.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 11:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fZn2k4ClqwYn6xjc0p+e8H/Ba+wOCpOYNH48+cYpzgs=;
        b=PxBwDX0UDHWr79B6BGae15mS5uyLytNvffCdYyaxVIrOZsP3hBH9mIqnhsDHSsI4Ou
         sQSzyMoIETn9oNy4I3FIQ8c1lax8ykEzB0J79oLMHCVUGzFDf47RqNvun8cRwzbcdQHW
         VxXetyfbmIpWY7Eh+QflkZzjqwh1soIZCDaLPBGXPpBOASAmy0o3cS5GDrjC4Jwo2N0m
         blVVT6nwL7jYty1RAUEtkU1r3wZbFAYZRgBrqbN5XETjhgjC7bibolYgKOiOM3yXYxx5
         42SoaXpdJtpBzgkj7xF25Y9uGoKKWWUac3+k2j5NusP63eScxhf1R68lUThQnvl/M5o5
         5xIw==
X-Gm-Message-State: AOAM530aEDZRCZy2YFllD0u/njl6YiRj9djbozgpYrpKjYMHvXNOqRJO
        Z/DD1KA/NqAbeNYMjzYOZZ/6XfGOZCU=
X-Google-Smtp-Source: ABdhPJw/KBbpTTQoSxXBtbqF3l4MYg1SjD1HupryWGrU+4+/yUBqXjtRPBaVRGoW6wL8pOCbBei/4Q==
X-Received: by 2002:a50:c04e:: with SMTP id u14mr17192606edd.134.1603737329909;
        Mon, 26 Oct 2020 11:35:29 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id b17sm5592727edx.89.2020.10.26.11.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:35:28 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:35:26 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos3 bus
 OPP-tables
Message-ID: <20201026183526.GA165326@kozik-lap>
References: <CGME20200911122231eucas1p2c0964f2dc4326522a87fc0571ae58c37@eucas1p2.samsung.com>
 <20200911122220.13698-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200911122220.13698-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 02:22:20PM +0200, Marek Szyprowski wrote:
> Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
> values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
> exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
> revealed that 'opp-shared' property for the Exynos bus OPPs was used
> incorrectly, what had the side-effect of disabling frequency scaling for
> the second and latter buses sharing given OPP-table.
> 
> Fix this by removing bogus 'opp-shared' properties from Exynos3 bus
> OPP-tables. This restores frequency scaling for the following busses:
> RightBus, LCD0, FSYS and MFC.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 5 -----
>  1 file changed, 5 deletions(-)

Hi Marek,

Any news on these two patches? Shall I still wait?

Best regards,
Krzysztof
