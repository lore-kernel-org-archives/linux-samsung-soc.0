From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Update video-phy node with syscon phandle for
 Exynos3250
Date: Thu, 18 Jun 2015 12:58:08 +0900
Message-ID: <558241D0.50002@samsung.com>
References: <1434355966-4566-1-git-send-email-b.michalska@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21661 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882AbbFRD6K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Jun 2015 23:58:10 -0400
In-reply-to: <1434355966-4566-1-git-send-email-b.michalska@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Beata Michalska <b.michalska@samsung.com>, kgene@kernel.org, kishon@ti.com, javier.martinez@collabora.co.uk, s.nawrocki@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, human.hwang@samsung.com

On 15.06.2015 17:12, Beata Michalska wrote:
> As a follow-up to recent changes to Exynos mipi video phy
> driver, introducing support for PMU regmap in commit
> e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression
> by adding support for PMU regmap") add a syscon phandle to
> video-phy node to bring back to life both MIPI DSI display
> and MIPI CSIS-2 camera sensor on Exynos3250.
> 
> Signed-off-by: Beata Michalska <b.michalska@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Thanks for the patch, I applied it to my tree. Since it is a fix for
regression, I'll sent it to Kukjin for v4.2-rc cycle, unless he picks it
up from LKML.

Best regards,
Krzysztof
