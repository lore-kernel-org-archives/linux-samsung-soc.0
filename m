Return-Path: <SRS0=Xdun=4R=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82FCC3F2C6
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Feb 2020 14:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FADC2469C
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Feb 2020 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582987315;
	bh=STSoDdJKQL3abYIO8hqVrEo5PlwXllMSpcu3RGmfMuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Jgbs9fSaCpJuGv/fBpWpYPgh8WEGLXQE/F88PVpwmGiXVXe3IDXSVgyA1b1ftCj+W
	 /+3jvH2Cs/skuFP2aCl0hn5SKBmsobIahql1zwLcPXupXJGM/obwvQffWGyf7dEhVJ
	 bk64pkdG0MoOf9kp2JyZmDLH5rD0N6eLFCOyI8lc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgB2Olz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Feb 2020 09:41:55 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36713 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgB2Olz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Feb 2020 09:41:55 -0500
Received: by mail-ed1-f67.google.com with SMTP id j17so7167155edp.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Feb 2020 06:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5s+Eqt7aDuEf11S+CghqPcLJFZAAk4mEKyUtaEuFO38=;
        b=KYRZ3ehaVGl9x0BLnIhF+YHCXT/eLxswIU82uydTIn4xaHq6qKXnWDSUvKIzQuvO0b
         HgGqBTCgg0Ru0y2p4eOIQb8XkQwbdBjUcr7LhiK5LeDuWa5wx0we/S884ST/ljCIQzPC
         LvMeeCkAaOrBk2pKs/B8DbSJUf9v64ico3/H40hSXBGVtIxZDQQvgTAoVW8AR5zF5si6
         rqLYsVquWVLmo3EXq9M/f2XZU3RnBM63G0LWTMqB7EgsXWJsbFCnFcKPXrBxDN+LCkWY
         PGsmL/JJz5Lm+wSCwOam+Sq7gfERCH8VNchwLuNMDB25iIIq4YrVIwJoimRBlVhy7wMh
         xpFg==
X-Gm-Message-State: APjAAAWB9RSJNvHR6C2bpPSf2StUpw95jcWV5eAz9Gt4H2KLhKw1w1xh
        ir+lGeWzWoh57tW+5qTPdJk=
X-Google-Smtp-Source: APXvYqzUIfzoGIWFWri9lwxVYLpDQIulJpXQST2RXwKxRcIy5LeX4yS0EUJ182vVs7B0bqqYtdDK1g==
X-Received: by 2002:a17:906:68e:: with SMTP id u14mr8129049ejb.188.1582987311951;
        Sat, 29 Feb 2020 06:41:51 -0800 (PST)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id y18sm348036edq.27.2020.02.29.06.41.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Feb 2020 06:41:51 -0800 (PST)
Date:   Sat, 29 Feb 2020 15:41:49 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Fix G3D power domain supply on
 Odroid XU3/XU4/HC1 boards
Message-ID: <20200229144149.GA29448@kozik-lap>
References: <CGME20200228145516eucas1p229d1500f0b4025699a1aab5e2d33423c@eucas1p2.samsung.com>
 <20200228145502.8316-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228145502.8316-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 28, 2020 at 03:55:01PM +0100, Marek Szyprowski wrote:
> G3D power domain in Exynos5422 SoC is supplied from VDD_G3D. Besides the
> main GPU MALI module it also contains the power domain control logic and
> clocks. Turning the VDD_G3D power supply off causes the power domain to
> fail to operate properly and breaks for example system suspend/resume.
> GPU should use VDD_G3D supply mainly to control the DVFS.
> 
> Fixes: 1a5a85c56402 ("ARM: dts: exynos: Add Mali/GPU node on Exynos5420 and enable it on Odroid XU3/4")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 1 +

Thanks, applied.

Best regards,
Krzysztof

