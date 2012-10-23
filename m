From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v5] ARM: EXYNOS: Add MFC device tree support
Date: Tue, 23 Oct 2012 23:30:00 +0900
Message-ID: <021401cdb12a$e2793730$a76ba590$%kim@samsung.com>
References: <1348765784-7508-1-git-send-email-arun.kk@samsung.com>
 <1348765784-7508-2-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:58565 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648Ab2JWOaC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:30:02 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC0049DO9ZDYK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:30:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC006UKOA0LWC0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:30:01 +0900 (KST)
In-reply-to: <1348765784-7508-2-git-send-email-arun.kk@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arun Kumar K' <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, joshi@samsung.com

Arun Kumar K wrote:
> 
> This patch adds device tree entry for MFC v6 in the Exynos5
> SoC. Makes the required changes in the clock files and adds
> MFC to the DT device list.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt          |   23 +++++++++++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    5 +++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 +++
>  arch/arm/mach-exynos/Kconfig                       |    1 +
>  arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |   16 +++++++++
>  arch/arm/plat-samsung/devs.c                       |    1 +
>  arch/arm/plat-samsung/include/plat/mfc.h           |   11 ++++++
>  arch/arm/plat-samsung/s5p-dev-mfc.c                |   34
++++++++++++++++++++
>  9 files changed, 98 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
> 
Looks ok to me, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
