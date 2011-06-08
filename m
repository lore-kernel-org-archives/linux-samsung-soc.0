From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix build breakage due to renaming of
 S3C_VA_USB_HSPHY
Date: Wed, 08 Jun 2011 15:53:48 +0200
Message-ID: <005501cc25e3$7df601e0$79e205a0$%szyprowski@samsung.com>
References: <1307532337-29348-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41160 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755208Ab1FHNyM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2011 09:54:12 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LMH009UN5AABP@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Jun 2011 14:54:10 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMH00MPQ5AAT7@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Jun 2011 14:54:10 +0100 (BST)
In-reply-to: <1307532337-29348-1-git-send-email-thomas.ab@samsung.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Hello,

There is already the patch that fixes this issue available on 
kgene/s5p_fixes_for_linus branch. Please check commit 08115a139 from 
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

On Wednesday, June 08, 2011 1:26 PM Thomas Abraham wrote:

> Commit 8f1d169f999fea892c3fcbf5a79ae8525a477572
> ("ARM: EXYNOS4: Add usb host phy control") renamed S3C_VA_USB_HSPHY
> to S5P_VA_USB_HSPHY in s5p-map.h file. Fix build for S5PV210 platform.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/mach-s5pv210/cpu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
> index 61e6c24..b343582 100644
> --- a/arch/arm/mach-s5pv210/cpu.c
> +++ b/arch/arm/mach-s5pv210/cpu.c
> @@ -91,7 +91,7 @@ static struct map_desc s5pv210_iodesc[] __initdata = {
>  		.length		= SZ_4K,
>  		.type		= MT_DEVICE,
>  	}, {
> -		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
> +		.virtual	= (unsigned long)S5P_VA_USB_HSPHY,
>  		.pfn		=__phys_to_pfn(S5PV210_PA_HSPHY),
>  		.length		= SZ_4K,
>  		.type		= MT_DEVICE,
> --
> 1.6.6.rc2

S3C_VA_USB_HSPHY is the correct name, it is also used on s3c64xx and
s3c-hsotg driver (see drivers/usb/gadget).

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
