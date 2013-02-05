From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] cpufreq: exynos: add missing variable initialization
Date: Mon, 04 Feb 2013 21:00:58 -0800
Message-ID: <124501ce035d$ca953120$5fbf9360$@samsung.com>
References: <000301ce0348$43aec960$cb0c5c20$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55633 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720Ab3BEFBM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 00:01:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHQ008PBDXW50B0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 14:01:10 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHQ00JCHDXWYC00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Feb 2013 14:01:10 +0900 (KST)
In-reply-to: <000301ce0348$43aec960$cb0c5c20$%han@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, rjw@sisk.pl, jhbird.choi@samsung.com

Jingoo Han wrote:
> 
> Fixed build warning as below:
> 
> drivers/cpufreq/exynos-cpufreq.c: In function 'exynos_target':
> drivers/cpufreq/exynos-cpufreq.c:182:2: warning: 'ret' may be used
> uninitialized in this function [-Wuninitialized]
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/cpufreq/exynos-cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-
> cpufreq.c
> index 88401ba..4268e46 100644
> --- a/drivers/cpufreq/exynos-cpufreq.c
> +++ b/drivers/cpufreq/exynos-cpufreq.c
> @@ -159,7 +159,7 @@ static int exynos_target(struct cpufreq_policy
*policy,
>  {
>  	struct cpufreq_frequency_table *freq_table = exynos_info-
> >freq_table;
>  	unsigned int index;
> -	int ret;
> +	int ret = 0;
> 
>  	mutex_lock(&cpufreq_lock);
> 
> --
> 1.7.2.5

I already applied Sachin's patch for this.
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg15019.html

Thanks.

- Kukjin
