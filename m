Return-Path: <SRS0=fCds=BR=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287CAC433E3
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  7 Aug 2020 04:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D93F22CAF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  7 Aug 2020 04:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wdxYhCbW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgHGE4j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 7 Aug 2020 00:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgHGE4i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 00:56:38 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B2DC061756
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 21:56:38 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id p1so494927pls.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 21:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wd1MfQvSWLmmJO4zDD5azoRIzS7zA7zFDWuYNS3rHPI=;
        b=wdxYhCbW/m9+zY/y0s3LI+VPcTgpUnboEDxgwnGr6LXNgCYUf5jwgSrVZ9BP9ToPOC
         ObrAx0k+uhECSfgtk3CqG7vaa7z/DqKeS3kuNDs0gmWC9QUkHXWs3AH8xvhmwKQRC0JC
         Dg/eOOioHwt5SvDMzv6zMwZ8ALjjGcHqRaQExTVpmEiH6ZsDa+4kkE3gZwlayWUHWH72
         h7Mvr1zwPrdplvHtkSj8G6PVOUFheA7Wh3JF5zz2IK7MBBNaO52GZlf5GxAb0woqOiJb
         7D4mu4iACmUXP9uKJAzyr4MmiIQiOKvyfM15qk8+28/xfJWbY9IUbT46EwxyqcLUCoGo
         tVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wd1MfQvSWLmmJO4zDD5azoRIzS7zA7zFDWuYNS3rHPI=;
        b=pNY2Gy4R/IYqSRcsN/LmlTupr0dZvUb8HjSlvQoPHSDPgUdShK4s/G9n918SLCTG3e
         DcrfnZ4FV0miuRO8PGo7Mxx71WwFth5wXTjHh6e1zccV/DRCQocCh8fYrZ3Q9S6UHQ9m
         JemUlKNOutmBerdUsijIJLM629aSdoWzicPKQyqdm7PvjgDQqbmZRSN9p5/+30Qy9ZAO
         K4NhZPFBYGrShsArmgc7HtvfeIPo7tYKo73w76x4GmKZHfwb4CGA3xpfDd3XJ8FwXe0w
         LPU0QGNlKn6GfpiEmqbrHOG0O9/h7xoCQrlDVP8+1Cklc20COdE9gufE2NMbzipFoXig
         d8YQ==
X-Gm-Message-State: AOAM533Btfbr81hLpifZQRgciGxuZgw6qRmj5Brv1BBFuJmWswcf4m5f
        58KVrK0+IAK22CMfQKfx7HkIgQ==
X-Google-Smtp-Source: ABdhPJz9XIc3pjV5fb0FJWvryYU8Y62DTGqhWirVLCiOsji8ipi2ZdmEZzkrs4uzUoaN9T6Vh7TSoQ==
X-Received: by 2002:a17:90a:3ccc:: with SMTP id k12mr10904883pjd.184.1596776197482;
        Thu, 06 Aug 2020 21:56:37 -0700 (PDT)
Received: from localhost ([223.190.59.99])
        by smtp.gmail.com with ESMTPSA id e14sm11011839pfh.108.2020.08.06.21.56.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 21:56:36 -0700 (PDT)
Date:   Fri, 7 Aug 2020 10:26:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 35/41] ARM: s3c: remove cpufreq header dependencies
Message-ID: <20200807045630.zq6gayz65rdxaiy4@vireshk-mac-ubuntu>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-35-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200806182059.2431-35-krzk@kernel.org>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06-08-20, 20:20, Krzysztof Kozlowski wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The cpufreq drivers are split between the machine directory
> and the drivers/cpufreq directory. In order to share header
> files after we convert s3c to multiplatform, those headers
> have to live in a different global location.
> 
> Move them to linux/soc/samsung/ in lack of a better place.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-s3c24xx/common.c                         |  1 -
>  arch/arm/mach-s3c24xx/cpufreq-utils.c                  |  2 +-
>  arch/arm/mach-s3c24xx/iotiming-s3c2410.c               |  2 +-
>  arch/arm/mach-s3c24xx/iotiming-s3c2412.c               |  2 +-
>  arch/arm/mach-s3c24xx/mach-bast.c                      |  2 +-
>  arch/arm/mach-s3c24xx/mach-osiris-dvs.c                |  2 +-
>  arch/arm/mach-s3c24xx/mach-osiris.c                    |  2 +-
>  arch/arm/mach-s3c24xx/pll-s3c2410.c                    |  4 ++--
>  arch/arm/mach-s3c24xx/pll-s3c2440-12000000.c           |  4 ++--
>  arch/arm/mach-s3c24xx/pll-s3c2440-16934400.c           |  4 ++--
>  arch/arm/mach-s3c24xx/s3c2410.c                        |  1 -
>  arch/arm/mach-s3c24xx/s3c2412.c                        |  1 -
>  arch/arm/mach-s3c24xx/s3c244x.c                        |  2 --
>  arch/arm/mach-s3c64xx/s3c6400.c                        |  1 -
>  arch/arm/mach-s3c64xx/s3c6410.c                        |  2 +-
>  arch/arm/plat-samsung/include/plat/cpu.h               |  9 ---------
>  drivers/cpufreq/s3c2410-cpufreq.c                      |  5 ++---
>  drivers/cpufreq/s3c2412-cpufreq.c                      |  5 ++---
>  drivers/cpufreq/s3c2440-cpufreq.c                      |  5 ++---
>  drivers/cpufreq/s3c24xx-cpufreq-debugfs.c              |  2 +-
>  drivers/cpufreq/s3c24xx-cpufreq.c                      |  5 ++---
>  .../linux/soc/samsung/s3c-cpu-freq.h                   |  4 ++++
>  .../linux/soc/samsung/s3c-cpufreq-core.h               |  6 +++++-
>  include/linux/soc/samsung/s3c-pm.h                     | 10 ++++++++++
>  24 files changed, 41 insertions(+), 42 deletions(-)
>  rename arch/arm/plat-samsung/include/plat/cpu-freq.h => include/linux/soc/samsung/s3c-cpu-freq.h (97%)
>  rename arch/arm/plat-samsung/include/plat/cpu-freq-core.h => include/linux/soc/samsung/s3c-cpufreq-core.h (98%)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
