From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add missing frequency property to exynos5250
Date: Fri, 29 Nov 2013 18:29:13 +0100
Message-ID: <7860838.7Z1cWJA9lN@amdc1227>
References: <1385724892-20518-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39320 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882Ab3K2R3V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Nov 2013 12:29:21 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MX1002PNCKV0T80@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 29 Nov 2013 17:29:19 +0000 (GMT)
In-reply-to: <1385724892-20518-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Friday 29 of November 2013 17:04:52 Sachin Kamat wrote:
> Added missing clock frequency property to CPU node to avoid
> boot time warnings.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
