From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V4] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Thu, 15 Sep 2011 16:59:18 +0530
Message-ID: <4E71E18E.2020205@linaro.org>
References: <1316076867-2138-1-git-send-email-tushar.behera@linaro.org> <20110915091423.80E7C11F9E77@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f170.google.com ([209.85.161.170]:53969 "EHLO
	mail-gx0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933271Ab1IOL3R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Sep 2011 07:29:17 -0400
Received: by gxk27 with SMTP id 27so3315619gxk.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Sep 2011 04:29:16 -0700 (PDT)
In-Reply-To: <20110915091423.80E7C11F9E77@gemini.denx.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfgang Denk <wd@denx.de>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org

Dear Wolfgang Denk,

On Thursday 15 September 2011 02:44 PM, Wolfgang Denk wrote:
> Dear Tushar Behera,
>
> In message<1316076867-2138-1-git-send-email-tushar.behera@linaro.org>  you wrote:
>> ORIGEN board is fitted with 7" LCD panel HV070WSA. The pixel
>> resolution of the LCD panel is 1024x600.
> ...
>> +static struct s3c_fb_pd_win origen_fb_win0 = {
>> +	.win_mode = {
>> +		.left_margin	= 64,
>> +		.right_margin	= 16,
>> +		.upper_margin	= 64,
>> +		.lower_margin	= 16,
>> +		.hsync_len	= 48,
>> +		.vsync_len	= 3,
>> +		.xres		= 1024,
>> +		.yres		= 600,
>> +	},
>> +	.max_bpp		= 32,
>> +	.default_bpp		= 24,
>> +};
>
> Does it still make sense to hard-code such parameters?
>
> In PowerPC-land we pass display mode information in the device tree
> using a verbatim EDID block.
>
> Would it be not better (and way more flexible) to do the same here,
> now that ARM has device tree support?
>
Thanks for your suggestions.

Currently work for enabling device tree support for EXYNOS4 based 
machine is going on. Once it is done, we should be able to pass this 
information through device tree blob.

For non-DT machines, IMHO, we have to follow the current approach.
> Best regards,
>
> Wolfgang Denk
>


-- 
Tushar Behera
