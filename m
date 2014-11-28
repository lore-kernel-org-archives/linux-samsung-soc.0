From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable CONFIG_FHANDLE
Date: Fri, 28 Nov 2014 13:35:41 +0100
Message-ID: <54786C1D.3050306@collabora.co.uk>
References: <1417176414-21558-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43763 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041AbaK1MgD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Nov 2014 07:36:03 -0500
In-Reply-To: <1417176414-21558-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Andreas Faerber <afaerber@suse.de>

Hello Sjoerd,

On 11/28/2014 01:06 PM, Sjoerd Simons wrote:
> CONFIG_FHANDLE is required by systemd, which is the default init system
> in more and more distributions. So lets enable it for Exynos as well
> (it's already enabled in multi_v7_defconfig)
> 
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index e419fac..d4751ef 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -1,4 +1,5 @@
>  CONFIG_SYSVIPC=y
> +CONFIG_FHANDLE=y

This is certainly required for newer systemd and has to be enabled.

But it would also be great to have enabled all the config symbols
that are listed as requirements in the systemd README file:

http://cgit.freedesktop.org/systemd/systemd/tree/README.

Tony added that support to OMAP2+ defconfig in commit 673ce00c
("ARM: omap2plus_defconfig: Add support for distros with systemd")
so the same should be done in exynos_defconfig.

That can of course be a follow-up patch though, so for $subject:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
