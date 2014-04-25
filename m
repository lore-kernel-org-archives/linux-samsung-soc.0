From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 04/10] ARM: EXYNOS: Remove file path from comment section
Date: Fri, 25 Apr 2014 23:14:01 +0200
Message-ID: <535AD019.8050207@gmail.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com> <1398429166-5539-1-git-send-email-pankaj.dubey@samsung.com> <1398429166-5539-5-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:52592 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbaDYVOE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 17:14:04 -0400
In-Reply-To: <1398429166-5539-5-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, s.nawrocki@samsung.com, b.zolnierkie@samsung.com

Hi Pankaj,

On 25.04.2014 14:32, Pankaj Dubey wrote:
> Many files under "arm/mach-exynos" are having file path in file
> comment section which is invalid now.
> So for better code maintainability let's remove them.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   arch/arm/mach-exynos/headsmp.S             |    2 --
>   arch/arm/mach-exynos/hotplug.c             |    3 +--
>   arch/arm/mach-exynos/include/mach/memory.h |    3 +--
>   arch/arm/mach-exynos/platsmp.c             |    3 +--
>   4 files changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
