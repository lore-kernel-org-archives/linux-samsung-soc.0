From: Chanho Park <parkch98@gmail.com>
Subject: Re: [RFC] ARM: EXYNOS: reset KFC cores when cpu is up
Date: Thu, 16 Jul 2015 09:34:02 +0900
Message-ID: <CAPTzV15kQjrnJCuwXGBdzzY6rjP1495Q=PbuCYHic0JakxD2QQ@mail.gmail.com>
References: <1436924213-29732-1-git-send-email-parkch98@gmail.com>
	<55A618C6.3020603@osg.samsung.com>
Reply-To: chanho61.park@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:38841 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424AbbGPAeD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jul 2015 20:34:03 -0400
Received: by iggf3 with SMTP id f3so2153014igg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jul 2015 17:34:02 -0700 (PDT)
In-Reply-To: <55A618C6.3020603@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@kernel.org>, Heesub Shin <heesub.shin@samsung.com>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Przemyslaw Marczak <p.marczak@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Javier,

> I believe of_machine_is_compatible("samsung,exynos5800") is preferred
> nowadays over soc_is_exynos5800().
>
> Now, is correct to do this for all Exynos5422/5800 based boards? AFAIU
> from the previous discussions, this behavior is specific to the Odroid
> XU3 so maybe of_machine_is_compatible("hardkernel,odroid-xu3") instead?
>
> I know this can affect other Exynos5800 boards that are shipped with a
> similar binary BL1/BL2 blobs that also use SPARE2 as a sync mechanism
> but maybe is better to add more exceptions later rather than do it for
> all Exynos5800?
>
> The Exynos5800 based Chromebook doesn't have this issue for example and
> all the 8 cores are brought up correctly.
>
> Having said that, I tested this patch on an Exynos5800 Peach Pi and all
> the 8 cores are up and also after a S2R so seems to be a no-op when the
> PMU_SPARE2 is not used for this.

Thanks for the testing. I'll find more proper way it could be applied
only for exynos5422 boards.

-- 
Best Regards,
Chanho Park
