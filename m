From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v7 2/6] clk: samsung: register exynos5420 apll/kpll configuration
 data
Date: Sat, 19 Jul 2014 14:57:17 +0200
Message-ID: <53CA6B2D.9090104@gmail.com>
References: <1405345118-4269-1-git-send-email-thomas.ab@samsung.com> <1405345118-4269-3-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:59740 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754707AbaGSM5g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jul 2014 08:57:36 -0400
In-Reply-To: <1405345118-4269-3-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de, cw00.choi@samsung.com

On 14.07.2014 15:38, Thomas Abraham wrote:
> From: Thomas Abraham <thomas.ab@samsung.com>
> 
> Register the PLL configuration data for APLL and KPLL on Exynos5420. This
> configuration data table specifies PLL coefficients for supported PLL
> clock speeds when a 24MHz clock is supplied as the input clock source
> for these PLLs.
> 
> Cc: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Reviewed-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> Tested-by: Arjun K.V <arjun.kv@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c |   28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Looks good. Will apply.

Best regards,
Tomasz
