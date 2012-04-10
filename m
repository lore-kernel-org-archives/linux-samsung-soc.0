From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: exynos: add dts files to dtbs target
Date: Tue, 10 Apr 2012 09:53:19 -0700
Message-ID: <4F84657F.9060008@samsung.com>
References: <1333945993-20363-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:49173 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753279Ab2DJQyG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Apr 2012 12:54:06 -0400
Received: by dake40 with SMTP id e40so5490dak.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Apr 2012 09:54:05 -0700 (PDT)
In-Reply-To: <1333945993-20363-1-git-send-email-olof@lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> Add the currently in-tree device tree sources to the dtbs target.
> 
> Signed-off-by: Olof Johansson<olof@lixom.net>
> ---
>   arch/arm/mach-exynos/Makefile.boot |    3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/Makefile.boot b/arch/arm/mach-exynos/Makefile.boot
> index b9862e2..31bd181 100644
> --- a/arch/arm/mach-exynos/Makefile.boot
> +++ b/arch/arm/mach-exynos/Makefile.boot
> @@ -1,2 +1,5 @@
>      zreladdr-y	+= 0x40008000
>   params_phys-y	:= 0x40000100
> +
> +dtb-$(CONFIG_MACH_EXYNOS4_DT) += exynos4210-origen.dtb exynos4210-smdkv310.dtb
> +dtb-$(CONFIG_MACH_EXYNOS5_DT) += exynos5250-smdk5250.dtb

Applied, thanks.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
