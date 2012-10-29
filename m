From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Mon, 29 Oct 2012 21:14:58 +0900
Message-ID: <508E7342.2090307@samsung.com>
References: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:32870 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759480Ab2J2Po1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Oct 2012 11:44:27 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so2049989bkc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Oct 2012 08:44:26 -0700 (PDT)
In-Reply-To: <1351243746-4173-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, amit.kachhap@linaro.org

On 10/26/12 18:29, Amit Daniel Kachhap wrote:
> From: Amit Daniel Kachhap<amit.daniel@samsung.com>
>
> These TMU enablement patches are needed for exynos4 and exynos5 TMU
> driver already merged(drivers/thermal/exynos_thermal.c).
>
> This patchset is based on Samsung Maintainer's tree,
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next
>
> Amit Daniel Kachhap (2):
>    ARM: exynos4: Add devicetree node for TMU driver
>    ARM: exynos5: Add devicetree node for TMU driver
>
>   arch/arm/boot/dts/exynos4210.dtsi        |    7 +++++++
>   arch/arm/boot/dts/exynos5250.dtsi        |    6 ++++++
>   arch/arm/mach-exynos/clock-exynos4.c     |    4 ++++
>   arch/arm/mach-exynos/clock-exynos5.c     |    5 +++++
>   arch/arm/mach-exynos/include/mach/irqs.h |    3 +++
>   arch/arm/mach-exynos/include/mach/map.h  |    3 +++
>   arch/arm/mach-exynos/mach-exynos4-dt.c   |    2 ++
>   arch/arm/mach-exynos/mach-exynos5-dt.c   |    2 ++
>   8 files changed, 32 insertions(+), 0 deletions(-)

Look good to me, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
