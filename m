From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/4] ARM Exynos4210-Nuri: remove compiler errors
Date: Fri, 02 Dec 2011 17:59:39 +0900
Message-ID: <04f901ccb0d0$b94191b0$2bc4b510$%kim@samsung.com>
References: <1322730317-8171-1-git-send-email-myungjoo.ham@samsung.com>
 <1322730317-8171-4-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50855 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753117Ab1LBI7m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 03:59:42 -0500
In-reply-to: <1322730317-8171-4-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Kevin Hilman' <khilman@ti.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Kyungmin Park' <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com

MyungJoo Hamm wrote:
> 
What's the 'compiler errors'?

And I don't know why this patch included in this series, maybe this should
be separated from this series?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-nuri.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-
> nuri.c
> index 236bbe1..4cef1fb 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -11,6 +11,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/serial_core.h>
>  #include <linux/input.h>
> +#include <linux/irq.h>
> +#include <linux/export.h>
>  #include <linux/i2c.h>
>  #include <linux/i2c/atmel_mxt_ts.h>
>  #include <linux/i2c-gpio.h>
> --
> 1.7.4.1
