From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH RESEND 0/4] ARM: EXYNOS: Add s3c-hsotg support for Exynos4210
 and S5PV210 boards
Date: Sun, 13 May 2012 08:53:37 +0900
Message-ID: <4FAEF801.7040202@samsung.com>
References: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33949 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754347Ab2ELWxo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 May 2012 18:53:44 -0400
Received: by pbbrp8 with SMTP id rp8so4660460pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 15:53:44 -0700 (PDT)
In-Reply-To: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On 05/10/12 22:16, Lukasz Majewski wrote:
> This patch series adds S3C-HSOTG UDC support for Exynos4210 and S5PV210 based targets; namely
>   Universal_C210, Nuri and GONI.
>
> Tested HW:
> - Exynos4210 NURI target rev.1
> - Exynos4210 Universal_C210 target rev.0
> - S5PV210 GONI target
>
> Dependencies:
> - usb:hsotg:samsung USB S3C-HSOTG driver fixes and code cleanup
>    patches, which have been already pulled to usb for-next branch.
>
> http://permalink.gmane.org/gmane.linux.usb.general/62101
>
> Those patches are enabling this UDC driver on GONI, NURI and Universal_C210 targets
>
> Joonyoung Shim (1):
>    ARM: EXYNOS: Add s3c-hsotg device support for NURI board
>
> Lukasz Majewski (3):
>    ARM: EXYNOS: Add usb otg phy control for EXYNOS4210
>    ARM: EXYNOS: Add s3c-hsotg device support for GONI board
>    ARM: EXYNOS: Add s3c-hsotg device support for Universal C210 board
>
>   arch/arm/mach-exynos/Kconfig                 |    3 +
>   arch/arm/mach-exynos/include/mach/irqs.h     |    1 +
>   arch/arm/mach-exynos/include/mach/map.h      |    4 +
>   arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
>   arch/arm/mach-exynos/mach-nuri.c             |    9 ++-
>   arch/arm/mach-exynos/mach-universal_c210.c   |   10 +++
>   arch/arm/mach-exynos/setup-usb-phy.c         |   95 +++++++++++++++++++-------
>   arch/arm/mach-s5pv210/Kconfig                |    1 +
>   arch/arm/mach-s5pv210/mach-goni.c            |    5 ++
>   9 files changed, 105 insertions(+), 26 deletions(-)
>
Applied,

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
