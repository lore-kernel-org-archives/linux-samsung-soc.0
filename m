From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Add hs-i2c nodes to exynos5420
Date: Thu, 05 Dec 2013 12:36:31 +0100
Message-ID: <4767310.mAz1U2YlJK@amdc1227>
References: <1385982702-18335-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20278 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754532Ab3LELgl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Dec 2013 06:36:41 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXC00JGN093CH10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Dec 2013 11:36:39 +0000 (GMT)
In-reply-to: <1385982702-18335-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Sachin,

On Monday 02 of December 2013 16:41:42 Sachin Kamat wrote:
> Added high speed I2C nodes to Exynos5420 DT file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> Changes since v1:
> Changed the node name to i2c as suggested by Tomasz Figa.
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   98 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
