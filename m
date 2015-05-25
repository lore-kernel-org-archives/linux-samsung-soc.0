From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/2] of: Add vendor prefix for Hardkernel
Date: Mon, 25 May 2015 14:29:00 +0200
Message-ID: <5563158C.2040404@collabora.co.uk>
References: <1432556810-11597-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59816 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751924AbbEYM3H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 May 2015 08:29:07 -0400
In-Reply-To: <1432556810-11597-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

Hello Krzysztof,

On 05/25/2015 02:26 PM, Krzysztof Kozlowski wrote:
> Add Hardkernel Co., Ltd. to the list of device tree vendor prefixes.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 80339192c93e..e8a00b74d8fe 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -90,6 +90,7 @@ gumstix	Gumstix, Inc.
>  gw	Gateworks Corporation
>  hannstar	HannStar Display Corporation
>  haoyu	Haoyu Microelectronic Co. Ltd.
> +hardkernel	Hardkernel Co., Ltd
>  himax	Himax Technologies, Inc.
>  hisilicon	Hisilicon Limited.
>  hit	Hitachi Ltd.
> 

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
