From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
Date: Thu, 11 Apr 2013 10:11:02 -0700
Message-ID: <20130411171102.GA31066@quad.lixom.net>
References: <2f3001ce3515$9a9ae1b0$cfd0a510$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:38794 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754001Ab3DKRLD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 13:11:03 -0400
Received: by mail-pd0-f170.google.com with SMTP id 10so961851pdi.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Apr 2013 10:11:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <2f3001ce3515$9a9ae1b0$cfd0a510$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, kyungmin.park@samsung.com, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>

On Tue, Apr 09, 2013 at 08:30:14PM +0900, Kukjin Kim wrote:
> 
> As we discussed in mailing list, non-DT for EXYNOS SoCs will not be
> supported from v3.10. This patch removes regarding files for non-DT
> including board files.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/configs/exynos4_defconfig         |   68 --

I think you can just delete this and move the contents over to exynos_defconfig
instead.

The original argument for keeping exynos4_defconfig was to provide a defconfig
for non-DT platforms on exynos4. That's gone now, and you can just roll them
into exynos_defconfig instead.



-Olof
