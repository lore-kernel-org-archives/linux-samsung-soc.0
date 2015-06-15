From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [patch] pinctrl: samsung: don't truncate the last char of "-grp"
Date: Mon, 15 Jun 2015 13:17:36 +0900
Message-ID: <CAJKOXPe8Pv5t9tLdFZAV+9CSiM302GTVt6_j3vKHkeFOK8U=Lw@mail.gmail.com>
References: <20150611154631.GA13202@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f51.google.com ([209.85.213.51]:34648 "EHLO
	mail-yh0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbbFOERh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 00:17:37 -0400
In-Reply-To: <20150611154631.GA13202@mwanda>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

2015-06-12 0:46 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> We allocate sizeof("-grp") which is 5 bytes but then we pass 4 to the
> snprintf() so the last 'p' char is truncated away.
>
> The kzalloc() can be made into kmalloc() since we are going to fill
> the whole buffer.  But I know that Walter Harms is going to grumble if I
> don't use kasprintf().  :P  And also checkpatch.pl these days complains
> that the "allocation failed" printks aren't needed so I removed them.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos5440.c b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
> index f5619fb..f804a61c 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos5440.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
> @@ -215,12 +215,9 @@ static int exynos5440_dt_node_to_map(struct pinctrl_dev *pctldev,
>          * Allocate memory for pin group name. The pin group name is derived
>          * from the node name from which these map entries are be created.
>          */
> -       gname = kzalloc(strlen(np->name) + GSUFFIX_LEN, GFP_KERNEL);
> -       if (!gname) {
> -               dev_err(dev, "failed to alloc memory for group name\n");
> +       gname = kasprintf(GFP_KERNEL, "%s%s", np->name, GROUP_SUFFIX);
> +       if (!gname)
>                 goto free_map;
> -       }
> -       snprintf(gname, strlen(np->name) + 4, "%s%s", np->name, GROUP_SUFFIX);

I would prefer splitting this into two patches: one for fixing
truncated name (by usage of kasprintf) and second for ENOMEM message.
The second patch can get rid of ENOMEM message in other places as
well.

As for the first issue I think that function suffix would also be
truncated in the same way.

Best regards,
Krzysztof
