From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH] ARM: S5PV310: Optimize interrupt source searching code
Date: Tue, 28 Sep 2010 16:45:59 +0400
Message-ID: <4CA1E387.709@ru.mvista.com>
References: <1285637510-16740-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:61048 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753302Ab0I1Mrn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 08:47:43 -0400
Received: by ewy23 with SMTP id 23so1733564ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2010 05:47:42 -0700 (PDT)
In-Reply-To: <1285637510-16740-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org

Hello.

On 28-09-2010 5:31, Kukjin Kim wrote:

> From: Changhwan Youn<chaos.youn@samsung.com>

> It is reported by Junseok Jung that using clz instruction is
> better instead of using for-loop to find the interrupt source.
> This patch modifies interrupt source searching code using __fls().
> The __fls() is implemented using clz instruction.

> Suggested-by: Junseok Jung<jundols.jung@samsung.com>
> Signed-off-by: Changhwan Youn<chaos.youn@samsung.com>
> Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
> ---
>   arch/arm/mach-s5pv310/irq-combiner.c |    6 +-----
>   1 files changed, 1 insertions(+), 5 deletions(-)

> diff --git a/arch/arm/mach-s5pv310/irq-combiner.c b/arch/arm/mach-s5pv310/irq-combiner.c
> index 0f70521..39e3647 100644
> --- a/arch/arm/mach-s5pv310/irq-combiner.c
> +++ b/arch/arm/mach-s5pv310/irq-combiner.c
> @@ -66,11 +66,7 @@ static void combiner_handle_cascade_irq(unsigned int irq, struct irq_desc *desc)
>   	if (status == 0)
>   		goto out;
>
> -	for (combiner_irq = 0; combiner_irq<  32; combiner_irq++) {
> -		if (status & 0x1)
> -			break;
> -		status>>= 1;
> -	}
> +	combiner_irq = __fls(status);

    But the loop finds the *first* set bit, not the last...

WBR, Sergei
