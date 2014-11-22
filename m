From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v5] ARM: EXYNOS: add Exynos3250 PMU support
Date: Sat, 22 Nov 2014 11:27:09 +0900
Message-ID: <02fb01d005fb$d105c1d0$73114570$@kernel.org>
References: <4728982.ETBlJctOKU@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61243 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752503AbaKVC1M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 21:27:12 -0500
In-reply-to: <4728982.ETBlJctOKU@amdc1032>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>
Cc: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Vikas Sajjan' <vikas.sajjan@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Bartlomiej Zolnierkiewicz wrote:
> 
> This patch prepares the PMU code for the future:
> - suspend/resume (S2R) support
> - cpuidle AFTR/W-AFTR modes support
> on Exynos3250.
> 
> Cc: Vikas Sajjan <vikas.sajjan@samsung.com>
> Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
> v5:
> - added Reviewed-by tag from Pankaj Dubey
> - fixed form -> from typo
> 
> v4:
> - rebased on top of next-20141114 branch of linux-next kernel tree
>   (it also applies fine to for-next branch of linux-samsung.git)
> - removed writing to undocumented CORE2 and CORE3 related registers
> - fixed values used for EXYNOS3_[G3D,LCD]_SYS_PWR_REG registers
> - added defines for values used for EXYNOS3_*_DURATION registers
> - removed redundat pr_info("EXYNOS3250 PMU Initialize\n")
> 
> v3:
> - rebased on top of for-next branch of linux-samsung.git and
>   [PATCH v7] mfd: syscon: Decouple syscon interface from platform devices
>   (https://lkml.org/lkml/2014/9/30/156)
>   [PATCH v9 0/2] ARM: Exynos: Convert PMU implementation into a platform driver
>   (https://lkml.org/lkml/2014/10/6/89)
>   [PATCH v9 0/2] Adds PMU and S2R support for exynos5420
>   (http://www.spinics.net/lists/arm-kernel/msg368207.html)
> 
> v2:
> - rebased on top of next-20140708 and
>   http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg32410.html
>   http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33660.html
>   http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33675.html
> 
>   this patch also applies fine after/before Exynos5800 PMU support:
>   http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg33835.html
> 
>  arch/arm/mach-exynos/pmu.c      | 167 ++++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-exynos/regs-pmu.h | 128 ++++++++++++++++++++++++++++++
>  2 files changed, 295 insertions(+)

Looks good to me, I think each SoC specific pm features would be handled in
each file like cpufreq though...maybe next time? :-)

BTW, I need to sort out pmu related changes from Pankaj, Amit and you. If
anything is required, I'll let you know.

Thanks,
Kukjin
