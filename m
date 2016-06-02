From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 3/4] ARM: multi_v7_defconfig: Enable s5p-secss driver
Date: Thu, 2 Jun 2016 09:52:07 -0400
Message-ID: <b3518170-bf5c-dde0-b170-68910a2aaf42@osg.samsung.com>
References: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
 <1464846916-3110-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39470 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750914AbcFBNwR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 09:52:17 -0400
In-Reply-To: <1464846916-3110-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Krzysztof,

On 06/02/2016 01:55 AM, Krzysztof Kozlowski wrote:
> The Exynos SoC provides a Security SubSystem block for accelerating some
> cryptographic operations.  Enable the driver for it - s5p-secss to
> utilize the hardware acceleration.
> 
> Currently the s5p-secss driver supports AES in CBC and ECB modes.
> However its usefulness could be doubted. Excerpt of tests on Odroid XU3
> (Exynos5422), for 256 bit key, encryption, performance CPU freq governor:
> 
>   algorithm        | block size [b] | average speed [MB/s] |
>   cbc-aes-s5p      |             16 |                 11.5 |
>   cbc-aes-s5p      |             64 |                 25.4 |
>   cbc-aes-s5p      |            256 |                 41.0 |
>   cbc-aes-s5p      |           1024 |                 47.4 |
>   cbc-aes-s5p      |           8192 |                 49.0 |
>   cbc(aes-generic) |             16 |                  0.4 |
>   cbc(aes-generic) |             64 |                  1.8 |
>   cbc(aes-generic) |            256 |                  6.6 |
>   cbc(aes-generic) |           1024 |                 25.2 |
>   cbc(aes-generic) |           8192 |                 83.1 |
> 
> Anyway enable the driver so it will get some testing coverage by
> community.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
