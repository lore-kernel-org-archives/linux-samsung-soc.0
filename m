From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: exynos7: Add pmic s2mps15 device tree
 node
Date: Fri, 06 Nov 2015 08:55:08 +0900
Message-ID: <563BEC5C.9040707@samsung.com>
References: <1446724341-3568-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16895 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756455AbbKEXzJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 18:55:09 -0500
In-reply-to: <1446724341-3568-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 05.11.2015 20:52, Alim Akhtar wrote:
> This patch add pmic (s2mps15) node of espresso board,
> which includes addition of regulators and pmic-clk sub-nodes.

My comment for fixing capital letters was ignored. Do you disagree with it?

> 
> This patch also adds {vmmc,vqmmc}-supply properties for mmc2 node.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> Changes since v1:
> * Addressed Javier and Krzysztof review comments.
> * Removed unused ldo/buck nodes.
> * Removed always-on properties from ldo/buck to disable them
> * Added a consumer of pmic supply (like mmc)
> 
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |  280 +++++++++++++++++++++++
>  1 file changed, 280 insertions(+)
> 

Rest looks good, so with the fix above:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
