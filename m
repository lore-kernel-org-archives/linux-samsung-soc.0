From: Wolfgang Denk <wd@denx.de>
Subject: Re: [PATCH V4] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Thu, 15 Sep 2011 11:14:23 +0200
Message-ID: <20110915091423.80E7C11F9E77@gemini.denx.de>
References: <1316076867-2138-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:35725 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755714Ab1IOJO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Sep 2011 05:14:26 -0400
In-reply-to: <1316076867-2138-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org

Dear Tushar Behera,

In message <1316076867-2138-1-git-send-email-tushar.behera@linaro.org> you wrote:
> ORIGEN board is fitted with 7" LCD panel HV070WSA. The pixel
> resolution of the LCD panel is 1024x600.
...
> +static struct s3c_fb_pd_win origen_fb_win0 = {
> +	.win_mode = {
> +		.left_margin	= 64,
> +		.right_margin	= 16,
> +		.upper_margin	= 64,
> +		.lower_margin	= 16,
> +		.hsync_len	= 48,
> +		.vsync_len	= 3,
> +		.xres		= 1024,
> +		.yres		= 600,
> +	},
> +	.max_bpp		= 32,
> +	.default_bpp		= 24,
> +};

Does it still make sense to hard-code such parameters?

In PowerPC-land we pass display mode information in the device tree
using a verbatim EDID block.

Would it be not better (and way more flexible) to do the same here,
now that ARM has device tree support?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
The only way to get rid of a temptation is to yield to it.
                                                        - Oscar Wilde
