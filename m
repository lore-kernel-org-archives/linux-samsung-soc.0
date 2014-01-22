From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] Documentation: devicetree: mct: Fix counter bit of CPU
 local timers
Date: Wed, 22 Jan 2014 17:08:53 +0900
Message-ID: <000101cf1749$30ae3b50$920ab1f0$%han@samsung.com>
References: <000001cf1687$a0e5e250$e2b1a6f0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64924 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751113AbaAVIJA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jan 2014 03:09:00 -0500
In-reply-to: <000001cf1687$a0e5e250$e2b1a6f0$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daniel Lezcano' <daniel.lezcano@linaro.org>
Cc: 'Thomas Gleixner' <tglx@linutronix.de>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, January 21, 2014 6:03 PM, Jingoo Han wrote:
> 
> According to the datasheet of Exynos SoCs, the counter bit
> of CPU local timers is 31-bit, not 32-bit; thus, it should
> be fixed.

Please, ignore this patch.
There is a 31-bit counter in CPU local timers; however,
FRC (free running down-counters) of CPU local timers is
32-bit. Thus, there is no need to fix it.
Thank you.

Best regards,
Jingoo Han

> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
> b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
> index 167d5da..8c77791 100644
> --- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
> +++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
> @@ -3,7 +3,7 @@ Samsung's Multi Core Timer (MCT)
>  The Samsung's Multi Core Timer (MCT) module includes two main blocks, the
>  global timer and CPU local timers. The global timer is a 64-bit free running
>  up-counter and can generate 4 interrupts when the counter reaches one of the
> -four preset counter values. The CPU local timers are 32-bit free running
> +four preset counter values. The CPU local timers are 31-bit free running
>  down-counters and generate an interrupt when the counter expires. There is
>  one CPU local timer instantiated in MCT for every CPU in the system.
> 
> --
> 1.7.10.4
