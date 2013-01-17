From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: S3C24XX: Make 'clk_msysclk' static
Date: Wed, 16 Jan 2013 16:06:03 -0800
Message-ID: <0c0001cdf446$71eb5a70$55c20f50$@samsung.com>
References: <1357813191-1873-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55626 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752446Ab3AQAGY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jan 2013 19:06:24 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGQ00BNFTMM5LB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 09:06:22 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGQ00EBRTMKW7B0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Jan 2013 09:06:22 +0900 (KST)
In-reply-to: <1357813191-1873-1-git-send-email-sachin.kamat@linaro.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Fixes the following warning:
> arch/arm/mach-s3c24xx/common-s3c2443.c:135:19: warning:
> symbol 'clk_msysclk' was not declared. Should it be static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-s3c24xx/common-s3c2443.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/common-s3c2443.c b/arch/arm/mach-
> s3c24xx/common-s3c2443.c
> index aeb4a24..f6b9f2e 100644
> --- a/arch/arm/mach-s3c24xx/common-s3c2443.c
> +++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
> @@ -132,7 +132,7 @@ static struct clk *clk_msysclk_sources[] = {
>  	[3] = &clk_mpllref,
>  };
> 
> -struct clksrc_clk clk_msysclk = {
> +static struct clksrc_clk clk_msysclk = {
>  	.clk	= {
>  		.name		= "msysclk",
>  		.parent		= &clk_xtal,
> --
> 1.7.4.1

Applied, thanks.

- Kukjin
