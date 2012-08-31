From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/6] ARM: EXYNOS: exynos4-dt: Use exynos4 prefix instead
 of exynos4210
Date: Fri, 31 Aug 2012 09:21:05 +0530
Message-ID: <CAJuYYwTcAjgqLgp0tLSu-Tms1JEAk0WMjYC-Gx3YK1JVOm4VFQ@mail.gmail.com>
References: <1346311903-15920-1-git-send-email-t.figa@samsung.com>
	<1346311903-15920-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:52708 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752008Ab2HaDvH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Aug 2012 23:51:07 -0400
Received: by lagy9 with SMTP id y9so2011982lag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Aug 2012 20:51:05 -0700 (PDT)
In-Reply-To: <1346311903-15920-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com

On 30 August 2012 13:01, Tomasz Figa <t.figa@samsung.com> wrote:
> Since mach-exynos4-dt.c is also going to be used for other SoCs from Exynos4
> line, rename internal structures and functions to use exynos4_ prefix, instead
> of exynos4210_.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos4-dt.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
