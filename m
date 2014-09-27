From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] clk: samsung: remove unnecessary CONFIG_OF from clk.c
Date: Sat, 27 Sep 2014 15:20:59 +0200
Message-ID: <5426B9BB.90606@gmail.com>
References: <1411796519-19417-1-git-send-email-pankaj.dubey@samsung.com> <1411796519-19417-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:48130 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbaI0NVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Sep 2014 09:21:03 -0400
Received: by mail-wi0-f174.google.com with SMTP id hi2so892851wib.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Sep 2014 06:21:01 -0700 (PDT)
In-Reply-To: <1411796519-19417-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, naushad@samsung.com

Hi Pankaj,

On 27.09.2014 07:41, Pankaj Dubey wrote:
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Missing patch description.

> ---
>  drivers/clk/samsung/clk.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index deab84d..31bf391 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -281,7 +281,6 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
>   * obtain the clock speed of all external fixed clock sources from device
>   * tree and register it
>   */
> -#ifdef CONFIG_OF

We still have non-DT platforms which use this code, i.e. s3c24xx and
s3c64xx. Have you checked if this compiles fine on them with CONFIG_OF
disabled?

Best regards,
Tomasz
