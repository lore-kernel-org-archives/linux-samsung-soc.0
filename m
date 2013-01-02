From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: fix uncompress.h and debug-macro.S for EXYNOS5440
Date: Wed, 2 Jan 2013 17:29:34 +0530
Message-ID: <CAK9yfHycpk6S1e3wW-8hLB7HM2tFykZGOSiz2jaYVwMf2khOUA@mail.gmail.com>
References: <1356632834-8934-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:47016 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752090Ab3ABL7f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 06:59:35 -0500
Received: by mail-oa0-f43.google.com with SMTP id k1so12871877oag.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jan 2013 03:59:35 -0800 (PST)
In-Reply-To: <1356632834-8934-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On 27 December 2012 23:57, Kukjin Kim <kgene.kim@samsung.com> wrote:
> This patch fixes uart base address for uncompress and debug-macro
> on EXYNOS5440.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/debug-macro.S |   25 +++++++++++++++++------
>  arch/arm/mach-exynos/include/mach/map.h         |    1 +
>  arch/arm/mach-exynos/include/mach/uncompress.h  |   20 +++++++++++-------
>  3 files changed, 33 insertions(+), 13 deletions(-)

With this patch I found that Origen board does not boot.
It stops at "Uncompressing Linux...".
Tested using your latest for-next branch.

---
With warm regards,
Sachin
