From: Christoffer Dall <cdall@cs.columbia.edu>
Subject: Re: [kvmarm] [PATCH 3/3] ARM: EXYNOS5250: Register architected timers
Date: Wed, 13 Mar 2013 20:26:24 -0700
Message-ID: <CAEDV+gLmwa__PQ3cNaqmycAekMGY3QwvEkL2AB6gMt7n9Sxujg@mail.gmail.com>
References: <1363222742-15220-1-git-send-email-agraf@suse.de>
	<1363222742-15220-4-git-send-email-agraf@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:40157 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755675Ab3CND0Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 23:26:24 -0400
Received: by mail-da0-f49.google.com with SMTP id t11so697838daj.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 20:26:24 -0700 (PDT)
In-Reply-To: <1363222742-15220-4-git-send-email-agraf@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Graf <agraf@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu

On Wed, Mar 13, 2013 at 5:59 PM, Alexander Graf <agraf@suse.de> wrote:
> When running on an exynos 5250 SoC, we don't initialize the architected
> timers. The chip however supports architected timers.
>
> When we don't initialize them, KVM will try to access them and run into
> NULL pointer dereferences attempting to do so.
>
> This patch is really more of a hack than a real fix, but does get me
> working with KVM on Arndale.
>
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  arch/arm/mach-exynos/mct.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
> index c9d6650..eefb8af 100644
> --- a/arch/arm/mach-exynos/mct.c
> +++ b/arch/arm/mach-exynos/mct.c
> @@ -482,4 +482,8 @@ void __init exynos4_timer_init(void)
>         exynos4_timer_resources();
>         exynos4_clocksource_init();
>         exynos4_clockevent_init();
> +
> +       if (soc_is_exynos5250()) {
> +               arch_timer_of_register();
> +       }
>  }

I did something similar a while back:
https://github.com/columbia/linux-kvm-arm/commit/2a368f711893e8fb5fe5cf9e237a7631277f3fd1

But I'm not sure how exactly is the right way for exynos. The other
patches look good to me (you can find some very similar work around
that very commit in my tree).

-Christoffer
