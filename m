From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable fan, sensors and audio
 for Odroid XU3
Date: Thu, 7 Jan 2016 06:16:14 +0100
Message-ID: <20160107051614.GE26875@localhost>
References: <1450867037-19705-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:35711 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753297AbcAGO5b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jan 2016 09:57:31 -0500
Received: by mail-lb0-f171.google.com with SMTP id bc4so208392045lbc.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Jan 2016 06:57:31 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450867037-19705-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Wed, Dec 23, 2015 at 07:37:17PM +0900, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> For Odroid XU3-family enable the:
>  - PWM fan (to control the CPU fan using thermal subsystem),
>  - TI INA231 sensors (provide power measurements of big.LITTLE cores,
>    DRAM and GPU),
>  - Samsung sound (for Odroid XU3 and Snow as well).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Resending with Javier's tag.

Thanks, applied but had to resolve conflicts.


-Olof
