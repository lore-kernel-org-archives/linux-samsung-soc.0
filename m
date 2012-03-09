From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/4] ARM: SAMSUNG: JPEG support on Exynos and S5PV210
Date: Fri, 09 Mar 2012 08:26:33 -0800
Message-ID: <4F5A2F39.6030205@samsung.com>
References: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:43476 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757905Ab2CIQ0g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:26:36 -0500
Received: by mail-gy0-f174.google.com with SMTP id r11so941202ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:26:36 -0800 (PST)
In-Reply-To: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 02/29/12 20:05, Sachin Kamat wrote:
> This patch series adds JPEG platform support to S5PV210 and board support to
> SMDKV210, SMDKV310 and Origen.
> This series is based on Kukjin Kim's for-next branch.
>
> This series depends on the following patches:
>
> http://www.spinics.net/lists/linux-samsung-soc/msg09163.html
> http://www.spinics.net/lists/linux-samsung-soc/msg09475.html
> http://www.spinics.net/lists/linux-samsung-soc/msg09554.html
>
>
> Sachin Kamat (4):
>    ARM: EXYNOS: Enable JPEG on SMDKV310
>    ARM: EXYNOS: Enable JPEG on Origen
>    ARM: S5PV210: Add JPEG board definition
>    ARM: S5PV210: Enable JPEG on SMDKV210
>
>   arch/arm/mach-exynos/Kconfig             |    2 ++
>   arch/arm/mach-exynos/mach-origen.c       |    1 +
>   arch/arm/mach-exynos/mach-smdkv310.c     |    1 +
>   arch/arm/mach-s5pv210/Kconfig            |    1 +
>   arch/arm/mach-s5pv210/clock.c            |    5 +++++
>   arch/arm/mach-s5pv210/include/mach/map.h |    4 ++++
>   arch/arm/mach-s5pv210/mach-smdkv210.c    |    1 +
>   7 files changed, 15 insertions(+), 0 deletions(-)

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
