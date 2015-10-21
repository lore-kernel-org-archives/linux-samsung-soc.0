From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] MAINTAINERS: ARM: EXYNOS: Add documentation and
 dt-bindings
Date: Wed, 21 Oct 2015 10:45:18 +0200
Message-ID: <5627509E.6090503@osg.samsung.com>
References: <1445391203-3819-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:42060 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753231AbbJUIpY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Oct 2015 04:45:24 -0400
In-Reply-To: <1445391203-3819-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>

Hello Krzysztof,

Patch looks good to me, I've only one comment.

On 10/21/2015 03:33 AM, Krzysztof Kozlowski wrote:
> Extend the Samsung Exynos maintainer entry to match SoC documentation
> and SoC dt-bindings directories. Without that some files, like
> bindings/arm/samsung/pmu.txt, are not matched by existing patterns.
> 
> This also may serve as a hint where new documentation and bindings (not
> matching specific subsystem) should be put.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b556aad90930..cad7b6b628b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1459,6 +1459,8 @@ F:	drivers/*/*s3c2410*
>  F:	drivers/*/*/*s3c2410*
>  F:	drivers/spi/spi-s3c*
>  F:	sound/soc/samsung/*
> +F:	Documentation/arm/Samsung/

That there is also a Documentation/arm/Samsung-S3C24XX/ so
I think this should be Documentation/arm/Samsung*/ instead.

> +F:	Documentation/devicetree/bindings/arm/samsung/
>  N:	exynos
>  
>  ARM/SAMSUNG MOBILE MACHINE SUPPORT
> 

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
