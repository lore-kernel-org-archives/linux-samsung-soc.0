From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: EXYNOS4: Add platform device for dwmci driver.
Date: Wed, 13 Jul 2011 09:34:33 +0100
Message-ID: <20110713083433.GG23270@n2100.arm.linux.org.uk>
References: <1310541479-32252-1-git-send-email-tgih.jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:45583 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965080Ab1GMIep (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jul 2011 04:34:45 -0400
Content-Disposition: inline
In-Reply-To: <1310541479-32252-1-git-send-email-tgih.jun@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwon Jeon <tgih.jun@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, JaeHun Jung <jh0801.jung@samsung.com>, ByungJae Lee <bjlee@samsung.com>, linux-arm-kernel@lists.infradead.org, SeungKwon Ko <skwon.ko@samsung.com>

On Wed, Jul 13, 2011 at 04:17:59PM +0900, Seungwon Jeon wrote:
> +#include <linux/kernel.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/mmc/dw_mmc.h>
> +#include <linux/mmc/host.h>
> +#include <linux/io.h>
> +
> +#include <mach/map.h>
> +#include <mach/gpio.h>

This should be linux/gpio.h
