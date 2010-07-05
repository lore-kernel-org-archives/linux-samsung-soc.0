From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH] ARM: S5P: Add PMU device
Date: Mon, 05 Jul 2010 13:39:40 +0200
Message-ID: <4C31C47C.1050905@gmail.com>
References: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:40217 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0GELjn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jul 2010 07:39:43 -0400
Received: by ewy23 with SMTP id 23so1599311ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jul 2010 04:39:42 -0700 (PDT)
In-Reply-To: <1278294411-5104-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

 Op 05-07-10 03:46, Joonyoung Shim schreef:
> This patch adds an initcall for the s5p platforms so that they register
> their PMU IRQs with the PMU framework in the Kernel.
>
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  arch/arm/mach-s5p6442/include/mach/irqs.h |    2 +-
>  arch/arm/mach-s5pc100/include/mach/irqs.h |    1 +
>  arch/arm/mach-s5pv210/include/mach/irqs.h |    1 +
>  arch/arm/plat-s5p/Makefile                |    1 +
>  arch/arm/plat-s5p/dev-pmu.c               |   37 +++++++++++++++++++++++++++++
>  5 files changed, 41 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/dev-pmu.c

Wouldn't it be better if this was in plat-samsung? I can see that the S3C6410
datasheet mentions a PMU_IRQ_ENABLE bit in SYS_OTHERS so I suspect that it has
the same functionality (even though there's no mention of which interrupt this
is).


-- 
Maurus Cuelenaere
