From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/8 v2] ARM: EXYNOS5: Add EHCI device from device tree
Date: Thu, 26 Jul 2012 11:57:13 +0000
Message-ID: <201207261157.14441.arnd@arndb.de>
References: <1342866729-30460-1-git-send-email-gautam.vivek@samsung.com> <1342866729-30460-5-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:58476 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753252Ab2GZVpA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jul 2012 17:45:00 -0400
In-Reply-To: <1342866729-30460-5-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vivek Gautam <gautam.vivek@samsung.com>, kgene.kim@samsung.com, l.majewski@samsung.com, kyungmin.park@samsung.com, thomas.abraham@linaro.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, m.szyprowski@samsung.com, yulgon.kim@samsung.com, av.tikhomirov@samsung.com, prashanth.g@samsung.com, boyko.lee@samsung.com, joshi@samsung.com, a.kesavan@samsung.com, olofj@google.com, ajaykumar.rs@samsung.com

On Saturday 21 July 2012, Vivek Gautam wrote:
> @@ -28,6 +29,11 @@ static struct exynos4_ohci_platdata smdk5250_ohci_pdata = {
>         .phy_exit = s5p_usb_phy_exit,
>  };
>  
> +static struct s5p_ehci_platdata smdk5250_ehci_pdata = {
> +       .phy_init = s5p_usb_phy_init,
> +       .phy_exit = s5p_usb_phy_exit,
> +};
> +
>  /*
>   * The following lookup table is used to override device names when devices
>   * are registered from device tree. This is temporarily added to enable

I'm a bit confused of the purpose of setting the function pointers here
when the pointers are always to the same s5p_usb_phy_init/s5p_usb_phy_exit
identifiers, but you have different definitions of those functions
depending on which platforms you are building for.

What is the idea here? Are you going to unify the three definitions of
s5p_usb_phy_init, or is that function going away eventually when we
get to the point of building exynos/s5p/s3c64xx into the same kernel
binary?

	Arnd
