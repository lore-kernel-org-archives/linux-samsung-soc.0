From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 14/19] ARM: remove unneeded vic.h includes
Date: Thu, 3 Jan 2013 21:53:17 +0000
Message-ID: <201301032153.17476.arnd@arndb.de>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com> <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:60577 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753737Ab3ACVx2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 16:53:28 -0500
In-Reply-To: <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Rob Herring <rob.herring@calxeda.com>, Hartley Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>, Hubert Feurstein <hubert.feurstein@contec.at>, Alessandro Rubini <rubini@unipv.it>, Linus Walleij <linus.walleij@linaro.org>, STEricsson <STEricsson_nomadik_linux@list.st.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Thursday 03 January 2013, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Numerous includes of asm/hardware/vic.h aren't needed, so remove them.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Ryan Mallon <rmallon@gmail.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Hubert Feurstein <hubert.feurstein@contec.at>
> Cc: Alessandro Rubini <rubini@unipv.it>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: STEricsson <STEricsson_nomadik_linux@list.st.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: patches@opensource.wolfsonmicro.com

Acked-by: Arnd Bergmann <arnd@arndb.de>
