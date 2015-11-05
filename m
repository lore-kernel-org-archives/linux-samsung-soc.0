From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos7: Enable HS200 mode operation
Date: Fri, 06 Nov 2015 08:56:28 +0900
Message-ID: <563BECAC.5080609@samsung.com>
References: <1446724341-3568-1-git-send-email-alim.akhtar@samsung.com>
 <1446724341-3568-2-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28135 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756455AbbKEX42 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2015 18:56:28 -0500
In-reply-to: <1446724341-3568-2-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 05.11.2015 20:52, Alim Akhtar wrote:
> This patch enables HS200 mode operation on exynos7 based
> espresso board.
> This also removes _broken-cd_ property as per mmc binding documentation
> which says one of the properties between broken-cd and non-removable
> should be used. And we already use _non-removable_ as emmc mounted
> on board which is a non-removable device.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> Changes since v1:
> * Addressed Krzysztof review comments
> 
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
