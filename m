From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] cpufreq: exynos: Fix unsigned variable being checked
 for negative value
Date: Fri, 25 Jan 2013 10:24:28 -0800
Message-ID: <013b01cdfb29$37a714a0$a6f53de0$@samsung.com>
References: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41668 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932344Ab3AYSYu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 13:24:50 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH700A4C1TDD820@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:24:49 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MH700HJ61TAOK30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 26 Jan 2013 03:24:49 +0900 (KST)
In-reply-to: <1358932932-14094-1-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: rjw@sisk.pl, jhbird.choi@samsung.com, patches@linaro.org

Sachin Kamat wrote:
> 
> exynos_cpufreq_scale function returns signed value which was
> assigned to an unsigned variable and checked for negative value which
> is always false. Hence make it signed.
> 
> Fixes the following smatch warnings:
> drivers/cpufreq/exynos-cpufreq.c:83 exynos_cpufreq_scale() warn:
> unsigned 'old_index' is never less than zero.
> drivers/cpufreq/exynos-cpufreq.c:89 exynos_cpufreq_scale() warn:
> unsigned 'index' is never less than zero.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Rafael J. Wysocki suggested these 2 patches be taken through the
> Samsung tree.
> ---
>  drivers/cpufreq/exynos-cpufreq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
Looks OK to me, applied.

Thanks.

- Kukjin
