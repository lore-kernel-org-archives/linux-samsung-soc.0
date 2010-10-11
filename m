From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3] ARM: S5PV310: Add I2C channel 3, 4, 5, 6,
 and 7 device support
Date: Tue, 12 Oct 2010 07:54:34 +0900
Message-ID: <00ec01cb6997$48fe3ab0$dafab010$%kim@samsung.com>
References: <1286455601-25360-4-git-send-email-m.szyprowski@samsung.com>
 <1286784948-27094-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58535 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751108Ab0JKWyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Oct 2010 18:54:19 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA5000A7EAHYVB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Oct 2010 07:54:17 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA500JNGEAH1L@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Oct 2010 07:54:17 +0900 (KST)
In-reply-to: <1286784948-27094-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> S5PV310 and S5PC210 support more I2C devices than previous SoCs.
> Add the device support code for them.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> 
> Changes since V2:
> - removed some s5p reference leftovers from V1
> - adapted setup-i2cX.c to use s3c_gpio_cfgall_range()
> - added missing entries in plat-samsung/include/plat/devs.h
> - added missing 'select HAVE_S3C2410_I2C' in KConfig
> 
Hi, Marek

Thanks for your update.

(snip)

> +void s3c_i2c4_cfg_gpio(struct platform_device *dev)
> +{
> +	s3c_gpio_cfgall_range(S5PV310_GPB(2), 2,
> +			      S3C_GPIO_SFN(3), S3C_GPIO_PULL_UP);

Following is from your previous patch.

void s3c_i2c4_cfg_gpio(struct platform_device *dev)
{
	s3c_gpio_cfgpin(S5PV310_GPB(0), S3C_GPIO_SFN(3));
	s3c_gpio_setpull(S5PV310_GPB(0), S3C_GPIO_PULL_UP);
	s3c_gpio_cfgpin(S5PV310_GPB(1), S3C_GPIO_SFN(3));
	s3c_gpio_setpull(S5PV310_GPB(1), S3C_GPIO_PULL_UP);
}

So...should be...
s3c_gpio_cfgall_range(S5PV310_GPB(0), 2, S3C_GPIO_SFN(3), S3C_GPIO_PULL_UP);

will fix it myself :-)

(snip)

others, ok to me...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
