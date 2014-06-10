From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: Add support for clock handling in
 power domain
Date: Tue, 10 Jun 2014 17:38:16 +0200
Message-ID: <53972668.7090903@samsung.com>
References: <1401105384-8678-1-git-send-email-shaik.ameer@samsung.com>
 <1401105384-8678-2-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54442 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751063AbaFJPie (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 11:38:34 -0400
In-reply-to: <1401105384-8678-2-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com, joshi@samsung.com, Arun Kumar K <arun.kk@samsung.com>

Hi,

On 26.05.2014 13:56, Shaik Ameer Basha wrote:
> From: Prathyush K <prathyush.k@samsung.com>
> 
> While powering on/off a local powerdomain in exynos5 chipsets, the input
> clocks to each device gets modified. This behaviour is based on the
> SYSCLK_SYS_PWR_REG registers.
> E.g. SYSCLK_MFC_SYS_PWR_REG = 0x0, the parent of input clock to MFC
> 				   (aclk333) gets modified to oscclk
> 			    = 0x1, no change in clocks.
> The recommended value of SYSCLK_SYS_PWR_REG before power gating any
> domain is 0x0. So we must also restore the clocks while powering on a
> domain everytime.
> 
> This patch adds the framework for getting the required mux and parent clocks
> through a power domain device node. With this patch, while powering off
> a domain, parent is set to oscclk and while powering back on, its re-set
> to the correct parent which is as per the recommended pd on/off
> sequence.
> 
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  .../bindings/arm/exynos/power_domain.txt           |   20 +++++++
>  arch/arm/mach-exynos/pm_domains.c                  |   59 +++++++++++++++++++-
>  2 files changed, 78 insertions(+), 1 deletion(-)
> 

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz
