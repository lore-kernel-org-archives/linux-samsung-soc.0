From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/3] ARM: EXYNOS5250: Register architected timers
Date: Thu, 14 Mar 2013 23:07:06 +0400
Message-ID: <51421FDA.8070507@cogentembedded.com>
References: <1363222742-15220-1-git-send-email-agraf@suse.de> <1363222742-15220-4-git-send-email-agraf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:37828 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752530Ab3CNTHx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Mar 2013 15:07:53 -0400
Received: by mail-lb0-f182.google.com with SMTP id gg6so2112766lbb.41
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Mar 2013 12:07:51 -0700 (PDT)
In-Reply-To: <1363222742-15220-4-git-send-email-agraf@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Graf <agraf@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu

Hello.

On 14-03-2013 4:59, Alexander Graf wrote:

> When running on an exynos 5250 SoC, we don't initialize the architected
> timers. The chip however supports architected timers.

> When we don't initialize them, KVM will try to access them and run into
> NULL pointer dereferences attempting to do so.

> This patch is really more of a hack than a real fix, but does get me
> working with KVM on Arndale.

> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>   arch/arm/mach-exynos/mct.c |    4 ++++
>   1 file changed, 4 insertions(+)

> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
> index c9d6650..eefb8af 100644
> --- a/arch/arm/mach-exynos/mct.c
> +++ b/arch/arm/mach-exynos/mct.c
> @@ -482,4 +482,8 @@ void __init exynos4_timer_init(void)
>   	exynos4_timer_resources();
>   	exynos4_clocksource_init();
>   	exynos4_clockevent_init();
> +
> +	if (soc_is_exynos5250()) {
> +		arch_timer_of_register();
> +	}

    {} not needed here. scripts/checkpatch.pl should probabl;y warn about it.

WBR, Sergei
