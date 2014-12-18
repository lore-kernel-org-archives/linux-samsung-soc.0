From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: Weird/Unneeded call to msleep in exynos_mipi_dsi_wr_data in
 exynos_mipi_dsi_common.c
Date: Thu, 18 Dec 2014 14:39:38 +0100
Message-ID: <1418909978.2236.0.camel@pengutronix.de>
References: <54920A54.2060608@gmail.com> <5492ABE7.1060900@samsung.com>
	 <5492D80E.3010906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60352 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751705AbaLRNjq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:39:46 -0500
In-Reply-To: <5492D80E.3010906@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nick <xerofoify@gmail.com>
Cc: Krzysztof =?UTF-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>, inki.dae@samsung.com, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dh09.lee@samsung.com, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, tomi.valkeinen@ti.com, kgene@kernel.org, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org

Am Donnerstag, den 18.12.2014, 08:35 -0500 schrieb nick:
> Krzysztof,
> If we look at the code for this function, it already is handling the data correctly. In addition  the locks 
> seem to be better protection then msleep. Further more is no reason for this delay as we are neither resetting 
> the hardware or waiting for the hardware here so why is it needed? I don't have Exynos based hardware lying
> around through to test it.

If you can't test it, don't touch it. It's that simple.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
