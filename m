Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E86C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Dec 2020 08:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B8FE23A68
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Dec 2020 08:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgLHIse (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Dec 2020 03:48:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42143 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbgLHIsd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 03:48:33 -0500
Received: by mail-wr1-f66.google.com with SMTP id m5so5770690wrx.9;
        Tue, 08 Dec 2020 00:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BrKBGmXKIXaqQceh5B/pGrdX0KS0UAwbEoaskmukc98=;
        b=CnlkDiLWRNP4VLJUS9M/0HToASVNwE91L3Svqhjz2SgYwbnu6BLqH4o5PkfXYLODj1
         1QlcYkQPe9PXct8jHuQYxNjbK3a/vG3iaeyJdxrKDMQkysoAY/ge03zjFBHlzoeDm+pA
         SyLH7K0WtHl1m8Y+0PWPOvBuAcZnqcBI/rxuiA4rcemwO4P1/I9++8nP2xrHmYV7DJsA
         vz8r6m7p79qBBwIMvqoixJdg0B1OIQr2xQeHfO3fjuwUXzaym3fATSNIJk/bCg6JIllG
         +nLwAum6AiX8V3qUwx26W9iGIM3WsFLJ4Vp+Yr7kH12biJ8Pd7d3sTcQ1USnztjie1bN
         GeuA==
X-Gm-Message-State: AOAM533YWLR+L2CZz/RESVreGQL+soRwEL//q4jUnV+NFUA/eWwBc2AU
        EuYLuakSVequqj9ez1/TnHIEjp4Koxo=
X-Google-Smtp-Source: ABdhPJyWAMROP+PK0mBF0qHHxOHNLgfpd53EYC6W7uJnzsNAJQpQgVl4cP5/RA0/PWZoHpWsIU92oQ==
X-Received: by 2002:a5d:400a:: with SMTP id n10mr24060883wrp.362.1607417271681;
        Tue, 08 Dec 2020 00:47:51 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id h15sm13812204wru.4.2020.12.08.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 00:47:50 -0800 (PST)
Date:   Tue, 8 Dec 2020 09:47:49 +0100
From:   'Krzysztof Kozlowski' <krzk@kernel.org>
To:     Pankaj Dubey <pankaj.dubey@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        'Sylwester Nawrocki' <snawrocki@kernel.org>,
        'Marek Szyprowski' <m.szyprowski@samsung.com>,
        'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>,
        'Arnd Bergmann' <arnd@arndb.de>,
        'Chanwoo Choi' <cw00.choi@samsung.com>,
        'Alim Akhtar' <alim.akhtar@samsung.com>
Subject: Re: [PATCH v2 4/4] soc: samsung: exynos-chipid: convert to driver
 and merge exynos-asv
Message-ID: <20201208084718.GA6767@kozik-lap>
References: <20201207190517.262051-1-krzk@kernel.org>
 <CGME20201207190545epcas5p2e46fcf0e430b2ae9a2ecaf140d197327@epcas5p2.samsung.com>
 <20201207190517.262051-5-krzk@kernel.org>
 <001101d6cd2f$f1e4a9a0$d5adfce0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <001101d6cd2f$f1e4a9a0$d5adfce0$@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Dec 08, 2020 at 12:31:23PM +0530, Pankaj Dubey wrote:
> 
> 
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Tuesday, December 8, 2020 12:35 AM
> > To: Krzysztof Kozlowski <krzk@kernel.org>; linux-arm-
> > kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Cc: Sylwester Nawrocki <snawrocki@kernel.org>; Marek Szyprowski
> > <m.szyprowski@samsung.com>; Bartlomiej Zolnierkiewicz
> > <b.zolnierkie@samsung.com>; Arnd Bergmann <arnd@arndb.de>; Chanwoo
> > Choi <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>;
> > Pankaj Dubey <pankaj.dubey@samsung.com>
> > Subject: [PATCH v2 4/4] soc: samsung: exynos-chipid: convert to driver and
> > merge exynos-asv
> > 
> > The Exynos Chip ID driver on Exynos SoCs has so far only informational
> > purpose - to expose the SoC device in sysfs.  No other drivers depend on
> it
> > so there is really no benefit of initializing it early.
> > 
> 
> One of the intention behind initializing Exynos Chip ID driver in early
> stage was to simplify code in arch/arm/mach-exynos specifically calls such
> as soc_is_exynosXXXX. 
> But there were lot of resistance from community to add any such calls (or
> exported function) from mach-exynos files to the driver file. Whereas some
> other SoC code is using the same, e.g. tegra_get_chip_id being called from
> mach-tegra files to drivers/soc/tegra/. Unfortunately we could not accept
> similar solution for Exynos SoC and hence could not get rid of
> soc_is_exynosxXXX and similar macros from various file in mach-exynos and
> eventually converting those files into a full-fledged driver files. 
> 
> Any opinion how can we achieve this if we convert Exynos Chip ID driver to a
> regular driver?

a. Some parts of mach code can be moved to drivers and then use OF calls.

b. The ones which cannot be moved, could use soc_device_match() assuming
   they are called after the soc-bus is operational - so after
   core_initcalls.

c. The ones which are called early or without cache coherency
   (soc_device_match() uses krefs()), cannot be converted.

This chip ID conversion indeed kills case (b) above... which I am not
sure is worth bothering. Which parts of code could be moved like this?
Not mentioning that none of this work have happened since few years...

Best regards,
Krzysztof
