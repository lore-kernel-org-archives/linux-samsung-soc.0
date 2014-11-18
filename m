From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5 2/2] ARM: EXYNOS: PMU: move restart code into pmu driver
Date: Tue, 18 Nov 2014 16:19:49 +0100
Message-ID: <546B6395.8020403@samsung.com>
References: <1416307650-15162-1-git-send-email-pankaj.dubey@samsung.com>
 <1416307650-15162-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64332 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933750AbaKRPT4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 10:19:56 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NF8004EWQPSD200@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Nov 2014 15:22:40 +0000 (GMT)
In-reply-to: <1416307650-15162-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, linux@roeck-us.net

On 18/11/14 11:47, Pankaj Dubey wrote:
> diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
> index 6c8a76d..e4c3512 100644
> --- a/arch/arm/mach-exynos/pmu.c
> +++ b/arch/arm/mach-exynos/pmu.c
> @@ -11,8 +11,11 @@

> @@ -716,6 +719,13 @@ static void exynos5420_pmu_init(void)
>  	pr_info("EXYNOS5420 PMU initialized\n");
>  }
>  
> +static int pmu_restart_notify(struct notifier_block *this,
> +		unsigned long code, void *unused)
> +{
> +	pmu_raw_writel(0x1, EXYNOS_SWRESET);

Is it also valid on exynos5440 ? Doesn't it cause any harm there ?
Perhaps we could add a comment saying it has not effect on that SoC ?

> +	return NOTIFY_DONE;
> +}

--
Thanks,
Sylwester
