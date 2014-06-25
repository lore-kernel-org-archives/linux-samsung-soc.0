From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] arm: exynos: Support cluster power off on
 exynos5420/5800
Date: Wed, 25 Jun 2014 19:14:53 +0900
Message-ID: <01b501cf905e$4e95cf00$ebc16d00$@samsung.com>
References: <1403104722-14848-1-git-send-email-a.kesavan@samsung.com>
 <1403181617-19743-1-git-send-email-a.kesavan@samsung.com>
 <7hy4wsvdsm.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58989 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752683AbaFYKO4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 06:14:56 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7P000O4Z4UXL00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 19:14:54 +0900 (KST)
In-reply-to: <7hy4wsvdsm.fsf@paris.lan>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kevin Hilman' <khilman@linaro.org>, 'Abhilash Kesavan' <a.kesavan@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, nicolas.pitre@linaro.org, kesavan.abhilash@gmail.com, abrestic@chromium.org

Kevin Hilman wrote:
> 
> Abhilash Kesavan <a.kesavan@samsung.com> writes:
> 
Hi,

> > Turning off a cluster when all 4 cores of the cluster are powered off
> > saves power significantly. Powering off the A15 L2 alone gives around
> > 100mW in savings. Add support for powering off the A15/A7 clusters on
> > exynos5420/5800.
> >
> > The patch enables specific register bits which ensure that:
> >    - cluster L2 will be turned on before the first man is powered up.
> >    - last man will be turned off before the cluster L2 is turned off.
> >    - core is powered down before powering it up.
> >
> > Remove the exynos_cluster_power_control function completely as we can
> > rely on the above mentioned bits rather than polling the cluster power
> > status register.
> >
> > Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> > Acked-by: Nicolas Pitre <nico@linaro.org>
> > ---
> > Change in v2:
> > Added a macro for the COMMON_OPTION register and used it in the MCPM
> > back-end.
> >
> > The patch is based on Linux-next 20140619. It has been tested on an
> > exynos5420-based chromebook using the "/dev/bL_switcher" interface as
> > well as the script provided by Nicolas Pitre and Dave Martin [1].
> >
> > Patch depends on:
> > [v2] ARM: EXYNOS: mcpm: Don't rely on firmware's secondary_cpu_start
> >
> > [1] http://www.spinics.net/lists/linux-samsung-soc/msg31257.html
> 
> Tested on exynos5800/Chromebook2 along with the dependency patch and using
> the script from Dave and Nico.
> 
> Tested-by: Kevin Hilman <khilman@linaro.org>
> 
Kevin, thanks for your test on the board ;-)

Applied into samsung tree.

Thanks,
Kukjin
