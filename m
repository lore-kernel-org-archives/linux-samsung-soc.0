From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: Exynos: Remove unused non-dt support for dwmci controller
Date: Tue, 27 Nov 2012 14:20:25 +0530
Message-ID: <CAJuYYwT+p3PdALE8uHQ9hszbYBxnjg-joZZtU3_gmDfjG4FL=g@mail.gmail.com>
References: <1353914155-1716-1-git-send-email-thomas.abraham@linaro.org>
	<001301cdcc5c$3e87b0f0$bb9712d0$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:52352 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758404Ab2K0Iu0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 03:50:26 -0500
Received: by mail-vb0-f46.google.com with SMTP id ff1so6591607vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 00:50:25 -0800 (PST)
In-Reply-To: <001301cdcc5c$3e87b0f0$bb9712d0$%jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, yuvaraj.cd@gmail.com

On 27 November 2012 10:31, Seungwon Jeon <tgih.jun@samsung.com> wrote:
> On Monday, November 26, 2012, Thomas Abraham <thomas.abraham@linaro.org> wrote:
>> With device tree support enabled for dwmci controller, the unused non-dt support
>> for dwmci controller can be removed.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>>  arch/arm/mach-exynos/Makefile             |    1 -
>>  arch/arm/mach-exynos/dev-dwmci.c          |   75 -----------------------------
>>  arch/arm/mach-exynos/include/mach/dwmci.h |   20 --------
>>  3 files changed, 0 insertions(+), 96 deletions(-)
>>  delete mode 100644 arch/arm/mach-exynos/dev-dwmci.c
>>  delete mode 100644 arch/arm/mach-exynos/include/mach/dwmci.h
>
> Hi Thomas,
>
> The following parts are remained. Also, no used code.
> Could you check it?
>
> ./plat-samsung/include/plat/devs.h:126:extern struct platform_device exynos4_device_dwmci;
> ./Kconfig:111:config EXYNOS4_DEV_DWMCI

Hi Seungwon,

Yes, I have missed that. Thanks for pointing this out. I will take care of this.

Thanks,
Thomas.
