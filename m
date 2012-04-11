From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/2] ARM: EXYNOS: Add DRM device to Origen and SMDKV310
Date: Wed, 11 Apr 2012 10:00:54 +0530
Message-ID: <CAK9yfHw8bfnrmw5yw66C2v162vr6h3eW6SOAU-0=vqVVzFYiWg@mail.gmail.com>
References: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f42.google.com ([209.85.216.42]:50324 "EHLO
	mail-qa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893Ab2DKEaz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Apr 2012 00:30:55 -0400
Received: by qafi31 with SMTP id i31so4113647qaf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Apr 2012 21:30:55 -0700 (PDT)
In-Reply-To: <1332823239-12280-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

ping...

On 27/03/2012, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> This patch series adds DRM core device and FIMD DRM platform device support
> to Origen and SMDKV310 boards.
>
> This series depends on the following patch:
> http://www.spinics.net/lists/arm-kernel/msg164762.html
>
> Sachin Kamat (2):
>   ARM: EXYNOS: Add DRM device to Origen
>   ARM: EXYNOS: Add DRM device to SMDKV310
>
>  arch/arm/mach-exynos/Kconfig         |    2 ++
>  arch/arm/mach-exynos/mach-origen.c   |   31 +++++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/mach-smdkv310.c |   30 ++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 0 deletions(-)
>
> --
> 1.7.4.1
>
>


-- 
With warm regards,
Sachin
