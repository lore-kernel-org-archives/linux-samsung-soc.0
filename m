From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 08/14] mfd: max77686/802: Remove support for board files
Date: Tue, 04 Nov 2014 08:51:50 +0100
Message-ID: <1415087510.2389.4.camel@AMDC1943>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
 <1414668053-31370-9-git-send-email-k.kozlowski@samsung.com>
 <20141103170128.GD12011@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11863 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751989AbaKDHvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 02:51:54 -0500
In-reply-to: <20141103170128.GD12011@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>

On pon, 2014-11-03 at 17:01 +0000, Lee Jones wrote:
> On Thu, 30 Oct 2014, Krzysztof Kozlowski wrote:
> 
> > The driver is used only on Exynos based boards with DTS support.
> > Convert the driver to DTS-only version. This simplifies a little the
> > code:
> > 1. No dead (unused) entries in platform_data structure.
> > 2. More code removed.
> > 3. Regulator driver does not depend on allocated memory
> >    from MFD driver.
> > 4. It makes also easier extending the regulator driver.
> > 
> > Add to the max77686 MFD driver dependency on CONFIG_OF because without
> > DTS the regulator drivers won't bind.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> > ---
> >  drivers/mfd/Kconfig                  |  1 +
> >  drivers/mfd/max77686.c               | 23 -----------------------
> >  include/linux/mfd/max77686-private.h |  1 -
> >  include/linux/mfd/max77686.h         | 28 ----------------------------
> >  4 files changed, 1 insertion(+), 52 deletions(-)
> 
> Applied, thanks.


Noooo, don't apply it. It depends on previous patches removing the board
file support from regulators.

If the patch looks OK, please only ack it. I would like to push
everything through regulator tree.

Best regards,
Krzysztof
