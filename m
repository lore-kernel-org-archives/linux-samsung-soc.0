From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: smdk2410: Fix compile breakage
Date: Fri, 08 Feb 2013 14:48:19 -0800
Message-ID: <1a6101ce064e$657204f0$30560ed0$@samsung.com>
References: <1360174228-29950-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31939 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947111Ab3BHWsg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 17:48:36 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHX001CRBCR13F0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:48:35 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHX00GRPBCX7V60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Feb 2013 07:48:35 +0900 (KST)
In-reply-to: <1360174228-29950-1-git-send-email-shc_work@mail.ru>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alexander Shiyan' <shc_work@mail.ru>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Alexander Shiyan wrote:
> 
> Symbol S3C_DEV_USB_HOST should be defined to avoid this problem.
>   LINK    vmlinux
>   LD      vmlinux.o
>   MODPOST vmlinux.o
> WARNING: modpost: Found 2 section mismatch(es).
> To see full details build your kernel with:
> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
>   GEN     .version
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
> arch/arm/mach-s3c24xx/built-in.o:(.init.data+0x660): undefined reference
to
> `s3c_device_ohci'
> make: *** [vmlinux] Error 1
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  arch/arm/mach-s3c24xx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-
> s3c24xx/Kconfig
> index ba6c501..8080dc1 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -350,6 +350,7 @@ config MACH_QT2410
>  config ARCH_SMDK2410
>  	bool "SMDK2410/A9M2410"
>  	select S3C24XX_SMDK
> +	select S3C_DEV_USB_HOST
>  	help
>  	  Say Y here if you are using the SMDK2410 or the derived module
> A9M2410
>  	  <http://www.fsforth.de>
> --
> 1.7.12.4

Applied, thanks.

- Kukjin
