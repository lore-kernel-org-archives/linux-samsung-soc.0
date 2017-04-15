From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] regulator: s2mps11: Use kcalloc() in
 s2mps11_pmic_probe()
Date: Sat, 15 Apr 2017 12:48:45 +0200
Message-ID: <20170415104845.bofxl34wr7z7khix@kozik-lap>
References: <b0fc50c2-4552-93d1-1ae0-42f78d255fe9@users.sourceforge.net>
 <542252e0-817f-ce13-fbd5-8fd8dda4c746@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35759 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752884AbdDOKst (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Apr 2017 06:48:49 -0400
Content-Disposition: inline
In-Reply-To: <542252e0-817f-ce13-fbd5-8fd8dda4c746@users.sourceforge.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Apr 14, 2017 at 11:01:25PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 14 Apr 2017 22:00:35 +0200
> 
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kcalloc".
> 
> This issue was detected by using the Coccinelle software.

Unfortunately you write mostly cryptic commit messages. This does not
answer for the main question - why this change is needed. Code looks
okay, but you should explain in simple words why this is needed.

Best regards,
Krzysztof

> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/regulator/s2mps11.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index 7726b874e539..b4e588cce03d 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -1162,7 +1162,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	rdata = kzalloc(sizeof(*rdata) * rdev_num, GFP_KERNEL);
> +	rdata = kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
>  	if (!rdata)
>  		return -ENOMEM;
>  
> -- 
> 2.12.2
> 
