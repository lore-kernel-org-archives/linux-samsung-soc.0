From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/4] ARM: multi_v7_defconfig: Enable drivers for
 Exynos4210 Universal C210 board
Date: Thu, 2 Jun 2016 09:49:19 -0400
Message-ID: <7d3698c1-c1ff-3528-8c1f-cd462ca24701@osg.samsung.com>
References: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
 <1464846916-3110-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39451 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750744AbcFBNt3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 09:49:29 -0400
In-Reply-To: <1464846916-3110-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 06/02/2016 01:55 AM, Krzysztof Kozlowski wrote:
> Enable drivers needed to get Exynos 4210 Universal C210 board working:
> MAX8998 MFD and regulators, GPIO-based bit-bang SPI, Exynos DRM FIMD
> parallel output and Samsung LD9040 RGB panel.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
