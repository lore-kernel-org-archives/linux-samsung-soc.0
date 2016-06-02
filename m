From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/4] ARM: multi_v7_defconfig: Enable Trats2 audio codec,
 touchscreen and sensors
Date: Thu, 2 Jun 2016 09:43:33 -0400
Message-ID: <2cc696db-554b-643e-d075-a3b47da33587@osg.samsung.com>
References: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39422 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751338AbcFBNno (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 09:43:44 -0400
In-Reply-To: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 06/02/2016 01:55 AM, Krzysztof Kozlowski wrote:
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
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
