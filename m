From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] ARM: multi_v7_defconfig: Enable Trats2 audio codec, touchscreen and sensors
Date: Thu, 02 Jun 2016 09:58:16 +0200
Message-ID: <13343743.82cem7RKKT@wuerfel>
References: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:60557 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbcFBH6X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 03:58:23 -0400
In-Reply-To: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kevin Hilman <khilman@kernel.org>

On Thursday, June 2, 2016 7:55:13 AM CEST Krzysztof Kozlowski wrote:
> The Exynos4412-based Trats2 board has CM36651 proximity/ambient light
> sensor, MMS114 touchscreen and Wolfson Microelectronics WM1811 CODEC.
> Enable them in defconfig to get some testing coverage and use its
> features.
> 
> While saving defconfig the SND_SOC_ODROIDX2 is removed because it does
> not exist since commit ee12a817bb4b ("ASoC: samsung: Remove unused
> Odroid x2/u3 machine driver").
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 

All four look good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de> 
