From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 06/11] PM / devfreq: move definitions for exynos4_bus into drivers/devfreq
Date: Wed, 18 Dec 2013 15:11:17 +0900
Message-ID: <CAJ0PZbTH0kga7Gbb87umJpCF_ih3TQrxKS0xBbofDvJq+_wj5Q@mail.gmail.com>
References: <116401cefb1e$75b83440$61289cc0$@kernel.org>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f43.google.com ([209.85.212.43]:61141 "EHLO
	mail-vb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868Ab3LRGLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 01:11:18 -0500
Received: by mail-vb0-f43.google.com with SMTP id p6so4737250vbe.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2013 22:11:18 -0800 (PST)
In-Reply-To: <116401cefb1e$75b83440$61289cc0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>

On Tue, Dec 17, 2013 at 8:52 PM,  <kgene@kernel.org> wrote:
> From: Kukjin Kim <kgene.kim@samsung.com>
>
> We don't need to keep the definitions for exynos4_bus into
> mach-exynos/ so this moves them into drviers/devfreq with
> adding header file.

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

However, how are you going to merge this patch?
Do you need me to get this handled or are you going to do it yourself
with Samsung-SoC tree?

Cheers,
MyungJoo.

>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/regs-clock.h |   94 --------------------
>  drivers/devfreq/exynos/exynos4_bus.c           |    4 +-
>  drivers/devfreq/exynos/exynos4_bus.h           |  110
> ++++++++++++++++++++++++
>  3 files changed, 112 insertions(+), 96 deletions(-)
>  create mode 100644 drivers/devfreq/exynos/exynos4_bus.h
>

-- 
MyungJoo Ham, Ph.D.
System S/W Lab, S/W Center, Samsung Electronics
