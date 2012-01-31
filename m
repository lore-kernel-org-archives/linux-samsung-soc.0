From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/3] ARM: EXYNOS/S5PV210: Add missing FIMC media device
Date: Tue, 31 Jan 2012 13:20:00 +0900
Message-ID: <4F276BF0.5030409@samsung.com>
References: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:49489 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753135Ab2AaEUI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jan 2012 23:20:08 -0500
Received: by dadi2 with SMTP id i2so4150454dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2012 20:20:08 -0800 (PST)
In-Reply-To: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, snjw23@gmail.com

On 12/29/11 15:29, Sachin Kamat wrote:
> FIMC media device (md) registers all required video nodes.
> This is required for functioning of FIMC devices.
>
> Thanks to Sylwester Nawrocki for pointing this out.
>
> This patchset is based on the latest for-next branch of Kukjin Kim's tree.
>
> Sachin Kamat (3):
>    ARM: S5PV210: Add missing FIMC media device to Aquila
>    ARM: EXYNOS: Add missing FIMC media device to SMDKV310
>    ARM: EXYNOS: Add missing FIMC media device to Origen
>
>   arch/arm/mach-exynos/mach-origen.c   |    1 +
>   arch/arm/mach-exynos/mach-smdkv310.c |    1 +
>   arch/arm/mach-s5pv210/mach-aquila.c  |    1 +
>   3 files changed, 3 insertions(+), 0 deletions(-)
>

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
