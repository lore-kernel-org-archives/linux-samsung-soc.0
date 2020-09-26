Return-Path: <SRS0=/9gS=DK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F16DC41604
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 19:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AD5220738
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Oct 2020 19:29:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="o1B64Sz5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgJCT3X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 3 Oct 2020 15:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbgJCT3X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Oct 2020 15:29:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3D1C0613D0
        for <linux-samsung-soc@vger.kernel.org>; Sat,  3 Oct 2020 12:29:22 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m5so6097132lfp.7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 03 Oct 2020 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6apILh/pOBmMJaPWqV+iIu8fFhBDqWAm6/FGBYx5eqA=;
        b=o1B64Sz5ZHFWERP/mq911Y4fSS4n2fyjhUtxwee9c5J/yiJ4ynyKHSL0CRxxnfUest
         n3sFQtymgXePC/V3j/DskZ725ur7LFjHihkDAs35AOXQprHRx8ZLoxAMlZxteGIjGCF8
         9H/HxFxWFYDuT13gIBBV+l+HslDIdN3Scwa/4PHZmhZ6dhoOoMZyUp/jQj5LZ52KslAw
         X3HASNGQOkAq2BqBxDtBgwu4VRdVG4nydnEuUsKu1+YhQSniN+b5jePtJ/n2QwW2Bh3z
         u2fp4L5zp/47y/Iw9afSwP9alSArrbUDg6sSAvtHyOlvP4chmx/90BsXvXcooDJUuxI1
         jrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6apILh/pOBmMJaPWqV+iIu8fFhBDqWAm6/FGBYx5eqA=;
        b=kWOJUh5jRsKbZrIeBF2395Ns2KxeJVktR8KBXfuMHCq2/rLZmZhLxXXEj6bXm+7n8e
         7j8WixB/SKAgYlinVsolYZuhQMeVWzxCc2CCRFBe/c81UmuJjdeGglZBXCC9HO/5FZbT
         PX7B0d9Qcpr6tf6fISYJPSHvcsxHQM6v4n5GySdkdku1VGJd106krKEJCkuCxHwJHhxt
         Gl4eJCrtgvJAzu6Ybi/Q6ej5go0FzhFZauZZF7CprZ6iZbytGfPnFusuOPsQ2u/BGtKa
         SDy0JBKzOresLoI1Rk9xvj59aOiWR5jFdigeTOXRGGSY5tIHYSjBdJbj/ZNTuGFqVRKF
         EyAA==
X-Gm-Message-State: AOAM533WeBWp1uEpjOAo0a43y5vnYO67NEpE9gZgL/74msA8M2mbZk2b
        rzpypCjEz7y9REceiV+pKaMDWQ==
X-Google-Smtp-Source: ABdhPJyOe1QQXBpLdw5uNxP+eiD7p47Cr/n0DtPXX7KSdg7+Ulmgo5tIiP8wiubrO4P3eYbzBvkicg==
X-Received: by 2002:ac2:5291:: with SMTP id q17mr2583609lfm.3.1601753360279;
        Sat, 03 Oct 2020 12:29:20 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id l188sm1836722lfd.127.2020.10.03.12.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 12:29:18 -0700 (PDT)
Date:   Sat, 26 Sep 2020 12:50:26 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 4/5] ARM: samsung: mach/soc for v5.10
Message-ID: <20200926195026.GA2230@lx2k>
References: <20200920160705.9651-1-krzk@kernel.org>
 <20200920160705.9651-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920160705.9651-5-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Sun, Sep 20, 2020 at 06:07:04PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> This will conflict around renamed/moved files:
> 
> 1. arch/arm/mach-s3c/s3c24xx.c:
>    Merge both changes to new location, so:
> =======
>  +#include "s3c24xx.h"
>  +#include "fb-core-s3c24xx.h"
>  +#include "nand-core-s3c24xx.h"
>  +#include "spi-core-s3c24xx.h"
>   
> - static struct map_desc s3c2416_iodesc[] __initdata = {
> + static struct map_desc s3c2416_iodesc[] __initdata __maybe_unused = {
> =======
> 
> 2. drivers/soc/samsung/Kconfig
>    Add DEBUG_LL && MMU to SAMSUNG_PM_DEBUG section, so:
> 
> =======
>   config EXYNOS_PM_DOMAINS
>   	bool "Exynos PM domains" if COMPILE_TEST
>  -	depends on PM_GENERIC_DOMAINS || COMPILE_TEST
>  +	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
>  +
>  +config SAMSUNG_PM_DEBUG
>  +	bool "Samsung PM Suspend debug"
>  +	depends on PM && DEBUG_KERNEL
>  +	depends on PLAT_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
>  +	depends on DEBUG_S3C24XX_UART || DEBUG_S3C2410_UART
> ++	depends on DEBUG_LL && MMU
>  +	help
>  +	  Say Y here if you want verbose debugging from the PM Suspend and
>  +	  Resume code. See <file:Documentation/arm/samsung-s3c24xx/suspend.rst>
>  +	  for more information.
>  +
> =======

I don't mind doing this conflict resolution, and will merge it now,
but next time you can just base this branch on the cleanup branch.


-Olof
