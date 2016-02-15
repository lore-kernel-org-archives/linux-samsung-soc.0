From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH 0/4] mfd: max77686: Allow the driver to be built as a module
Date: Mon, 15 Feb 2016 16:04:25 +0900
Message-ID: <20160215070425.GD10719@samsunx.samsung>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58110 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996AbcBOHE1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Feb 2016 02:04:27 -0500
Content-disposition: inline
In-reply-to: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>

I like all the four patches

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

Thanks,
Andi

On Fri, Feb 12, 2016 at 01:30:15AM -0300, Javier Martinez Canillas wrote:
> Hello,
> 
> The Maxim77802 PMIC driver uses a boolean Kconfig symbol but there isn't
> really a reason to require the driver to be built-in.
> 
> It is true that since the PMIC provides clocks and regulators that could
> be critical on a system, most integrators are not going to build it as a
> module but it could be useful for multi-platform or distribution kernels
> that support different systems by building as much as possible as module.
> 
> Besides this series, a patch for the max77686 regulator driver is needed
> or the MFD max77686 driver module won't be installed by kbuild. I didn't
> include the patch in this series to avoid cross-subsystems churn for the
> maintainers and also because I don't consider that a regression since it
> was not possible to build the driver as a module before anyways.
> 
> Also, all the defconfigs in mainline that enable the MFD max77686 driver
> Kconfig symbol are using =y of course so it shouldn't be an issue to get
> this set merged, before the max77686 regulator patch already posted [0].
> 
> [0]: https://patchwork.kernel.org/patch/8287431/
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (4):
>   mfd: max77686: Add max77802 to I2C device ID table
>   mfd: max77686: Use module_i2c_driver() instead of subsys initcall
>   mfd: max77686: Allow driver to be built as a module
>   mfd: max77686: Export OF module alias information
> 
>  drivers/mfd/Kconfig    |  4 ++--
>  drivers/mfd/max77686.c | 15 +++------------
>  2 files changed, 5 insertions(+), 14 deletions(-)
> 
> -- 
> 2.5.0
> 
