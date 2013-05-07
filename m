From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ASoC: Samsung: i2s: Fix crash in i2s driver
Date: Tue, 07 May 2013 11:50:51 +0200
Message-ID: <2286960.PxJxnETVLS@amdc1227>
References: <1367897941-18439-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43510 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753238Ab3EGJvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 May 2013 05:51:13 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMF00KQHA190VC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 May 2013 18:51:11 +0900 (KST)
In-reply-to: <1367897941-18439-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, alim.akhtar@samsung.com, thomas.ab@samsung.com

Hi Padmavathi,

On Tuesday 07 of May 2013 09:09:01 Padmavathi Venna wrote:
> This patch fixes a null pointer deference in i2s driver in DT
> case
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
> 
> This patch is dependent on below patch posted by Thomas Abraham.
> https://patchwork.kernel.org/patch/2224801/
> 
>  sound/soc/samsung/i2s.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 7ce7c50..eaf6439 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1182,7 +1182,7 @@ static int samsung_i2s_probe(struct platform_device
> *pdev) pri_dai->sec_dai = sec_dai;
>  	}
> 
> -	if (i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {
> +	if (i2s_pdata && i2s_pdata->cfg_gpio && i2s_pdata->cfg_gpio(pdev)) {

This is a problem that needs to be fixed indeed. However the same problem 
exists in samsung_i2s_remove() as well (at least in latest linux-next).

This makes me wonder what happens with i2s_pdata in DT case. Most of drivers 
allocate a pdata struct anyway and fill it with data parsed from device tree. 
This allows rest of the code to remain unmodified and consider DT and non-DT 
cases equal.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
