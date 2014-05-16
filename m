From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: RE: [PATCH v2] cpufreq: exynos:  Fix the compile error
Date: Fri, 16 May 2014 18:57:38 +0900
Message-ID: <000001cf70ed$451bbec0$cf533c40$@samsung.com>
References: <000001cf70dc$9ccfe4e0$d66faea0$@samsung.com>
 <5375D150.1020109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10910 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756662AbaEPJ5k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 May 2014 05:57:40 -0400
In-reply-to: <5375D150.1020109@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, cpufreq@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Jonghwan Choi' <jhbird.choi@gmail.com>, 'Viresh Kumar' <viresh.kumar@linaro.org>

On 16.05.2014 5:50 PM, Tomasz Figa wrote:

> We have been discussing Exynos cpufreq framework rework, including DT support since quite a long time.
> so if you want to know details, please look at respective discussion threads. I don't have time to
> find them for you right now, but if you look for threads of cpufreq patches by Thomas Abraham and ones
> about Exynos multiplatform support, then you should have quite complete set of information.
> 
I will check that.

> In general, I can see three ways to "fix" this for 3.15:
> 
> 1) revert moving soc_is_* macros to mach-exynos/common.h,
> 
> 2) move soc_is_* macros to a header in mach-exynos/include/mach/,
> 
> 3) use of_machine_is_compatible() or of_match_node() on root node in this driver to match directly
> with SoC compatible strings.
> 
> Probably option 3) would be preferred, as it would remove some of the dependencies of this driver on
> arch code and including plat/cpu.h (or mach/cpu.h as would be introduced by 2)) would be no longer
> necessary.

Thanks~

Best Regards.
