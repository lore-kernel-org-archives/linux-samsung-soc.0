From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: ARM: SAMSUNG: question about cfg_eint field of struct s3c_gpio_cfg
Date: Mon, 31 May 2010 20:22:12 +0900
Message-ID: <4C039BE4.3040904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:58221 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632Ab0EaLWZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 May 2010 07:22:25 -0400
Received: from epmmp2 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L3A006O97L0TP@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 May 2010 20:22:12 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L3A00B8C7L03I@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 May 2010 20:22:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-samsung-soc@vger.kernel.org

Hi,

There is cfg_eint field in struct s3c_gpio_cfg at 
arch/arm/plat-samsung/include/plat/gpio-cfg.h. I don't know the usage of 
cfg_eint. It isn't used anywhere or just assigned. Does it need really?

struct s3c_gpio_cfg {
	unsigned int	cfg_eint;

	s3c_gpio_pull_t	(*get_pull)(struct s3c_gpio_chip *chip, unsigned offs);
	int		(*set_pull)(struct s3c_gpio_chip *chip, unsigned offs,
				    s3c_gpio_pull_t pull);

	unsigned (*get_config)(struct s3c_gpio_chip *chip, unsigned offs);
	int	 (*set_config)(struct s3c_gpio_chip *chip, unsigned offs,
			       unsigned config);
};
