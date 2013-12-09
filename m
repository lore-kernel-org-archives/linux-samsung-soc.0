From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Add initial support for Arndale Octa board
Date: Mon, 09 Dec 2013 17:37:17 +0100
Message-ID: <1532760.vJJg0eBWoc@amdc1227>
References: <1385635081-21072-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29608 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932702Ab3LIQha (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 11:37:30 -0500
In-reply-to: <1385635081-21072-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com

Hi Sachin,

On Thursday 28 of November 2013 16:08:01 Sachin Kamat wrote:
> Arndale Octa board is based on Exynos5420 SoC. This patch
> adds the basic support required for booting it through DT.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/Makefile                    |    1 +
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |   66 +++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/arm/boot/dts/exynos5420-arndale-octa.dts

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
