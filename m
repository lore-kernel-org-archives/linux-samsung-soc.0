From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: Fix sysreg node name in exynos4.dtsi
Date: Thu, 31 Oct 2013 13:39:20 +0100
Message-ID: <2265629.DOt1PljUhC@amdc1227>
References: <1383194814-18897-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22920 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752866Ab3JaMjY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Oct 2013 08:39:24 -0400
In-reply-to: <1383194814-18897-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com

On Thursday 31 of October 2013 10:16:53 Sachin Kamat wrote:
> Fix the name as per DT node naming convention.
> - rename the node to syscon which is a more generic name.
> - append the register value to the node name.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Changes since v1:
>  * Renamed the node to syscon as suggested by Tomasz Figa.
> ---
>  arch/arm/boot/dts/exynos4.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
