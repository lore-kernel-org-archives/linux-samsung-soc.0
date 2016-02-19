From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/3] thermal: exynos: List vtmu-supply as optional property
 in DT binding
Date: Fri, 19 Feb 2016 09:26:48 +0900
Message-ID: <56C66148.5060006@samsung.com>
References: <1455819551-4666-1-git-send-email-javier@osg.samsung.com>
 <1455819551-4666-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52510 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947724AbcBSA05 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Feb 2016 19:26:57 -0500
In-reply-to: <1455819551-4666-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-pm@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Zhang Rui <rui.zhang@intel.com>, Mark Rutland <mark.rutland@arm.com>, Eduardo Valentin <edubezval@gmail.com>

On 19.02.2016 03:19, Javier Martinez Canillas wrote:
> The Exynos Thermal Management Unit binding says that the vtmu-supply
> is optional but is listed in the required properties section. Add an
> optional properties section and move the regulator property there.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  Documentation/devicetree/bindings/thermal/exynos-thermal.txt | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
