From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4] ARM: EXYNOS: Add MFC device tree support
Date: Wed, 26 Sep 2012 11:12:25 +0900
Message-ID: <136b01cd9b8c$5edd98c0$1c98ca40$%kim@samsung.com>
References: <1348337237-15426-1-git-send-email-arun.kk@samsung.com>
 <1348337237-15426-2-git-send-email-arun.kk@samsung.com>
 <50601831.1020400@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20119 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751034Ab2IZCM0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Sep 2012 22:12:26 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAX0050PQ4D8PH0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Sep 2012 11:12:25 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAX00BDOQ4P1R00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Sep 2012 11:12:25 +0900 (KST)
In-reply-to: <50601831.1020400@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Karol Lewandowski' <k.lewandowsk@samsung.com>, 'Arun Kumar K' <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, s.nawrocki@samsung.com, ch.naveen@samsung.com, joshi@samsung.com, thomas.ab@samsung.com

Karol Lewandowski wrote:
> 
> On 09/22/2012 08:07 PM, Arun Kumar K wrote:
> 
> > This patch adds device tree entry for MFC v6 in the Exynos5
> > SoC. Makes the required changes in the clock files and adds
> > MFC to the DT device list.
> >
> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> 
> 
> Looks good for me. FWIW, I could probably add
> 
> Acked-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> 
Happens following build error with exynos4_defconfig because of non-DT ?

arch/arm/mach-exynos/common.c: In function 'exynos_fdt_find_mfc_mem':
arch/arm/mach-exynos/common.c:1058: error: implicit declaration of function 'of_flat_dt_is_compatible'
arch/arm/mach-exynos/common.c:1061: error: implicit declaration of function 'of_get_flat_dt_prop'
arch/arm/mach-exynos/common.c:1061: warning: assignment makes pointer from integer without a cast
arch/arm/mach-exynos/common.c:1064: error: implicit declaration of function 'of_read_ulong'
arch/arm/mach-exynos/common.c:1066: warning: assignment makes pointer from integer without a cast
arch/arm/mach-exynos/common.c:1071: warning: assignment makes pointer from integer without a cast
arch/arm/mach-exynos/common.c:1076: warning: assignment makes pointer from integer without a cast
make[1]: *** [arch/arm/mach-exynos/common.o] Error 1

And I think, firstly we could move the function exynos_fdt_find_mfc_mem() into plat-samsung/ for using on other Samsung stuff such as s5pv210 and need to enclose '#ifdef CONFIG_OF" for non-DT?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
