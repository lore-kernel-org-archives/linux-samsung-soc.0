From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/7] ARM: exynos_defconfig: enable Exynos DRM Mixer driver
Date: Mon, 30 May 2016 08:37:19 +0200
Message-ID: <574BDF9F.8080509@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
 <1445861025-23266-4-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12312 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751658AbcE3GhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 May 2016 02:37:22 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O7Z00A1A928TX40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 May 2016 07:37:20 +0100 (BST)
In-reply-to: <1445861025-23266-4-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

On 10/26/2015 01:03 PM, Andrzej Hajda wrote:
> Mixer driver is selected by CONFIG_DRM_EXYNOS_HDMI option. Since Exynos5433
> HDMI does not require Mixer. There will be separate options to select Mixer
> and HDMI. Adding new option to defconfig before Kconfig will allow to keep
> bisectability.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied.

Krzysztof
