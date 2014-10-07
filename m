From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v9 2/2] ARM: EXYNOS: Move PMU specific definitions from common.h
Date: Tue, 7 Oct 2014 14:30:59 +0200
Message-ID: <CABxcv=mWCDh2esb6c0Y4pLy70RUrhwZxBiarKNOoxD+gC3gLfw@mail.gmail.com>
References: <1412587602-7763-1-git-send-email-pankaj.dubey@samsung.com>
	<1412587602-7763-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:44203 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334AbaJGMbB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Oct 2014 08:31:01 -0400
Received: by mail-wi0-f175.google.com with SMTP id d1so7688048wiv.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2014 05:30:59 -0700 (PDT)
In-Reply-To: <1412587602-7763-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Russell King <linux@arm.linux.org.uk>, Vikas Sajjan <vikas.sajjan@samsung.com>, naushad@samsung.com, thomas.ab@samsung.com

Hello Pankaj,

On Mon, Oct 6, 2014 at 11:26 AM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> This patch moves PMU specific definitions into a new file
> as exynos-pmu.h.
> This will help in reducing dependency of common.h in pmu.c.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/common.h     |   17 -----------------
>  arch/arm/mach-exynos/exynos-pmu.h |   24 ++++++++++++++++++++++++
>  arch/arm/mach-exynos/pm.c         |    1 +
>  arch/arm/mach-exynos/pmu.c        |   20 +++++++++++++++++++-
>  arch/arm/mach-exynos/suspend.c    |    1 +
>  5 files changed, 45 insertions(+), 18 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/exynos-pmu.h
>

Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
