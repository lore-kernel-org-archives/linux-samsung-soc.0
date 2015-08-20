From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: s5m: fix to update ctrl register
Date: Fri, 21 Aug 2015 01:15:51 +0200
Message-ID: <20150820231551.GE3769@piout.net>
References: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:49078 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753110AbbHTXPx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 19:15:53 -0400
Content-Disposition: inline
In-Reply-To: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, k.kozlowski@samsung.com
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, sbkim73@samsung.com

Hi,

On 13/08/2015 at 17:49:24 +0900, Joonyoung Shim wrote :
> According to datasheet, the S2MPS13X and S2MPS14X should update write
> buffer via setting WUDR bit to high after ctrl register is updated.
> 
> If not, ALARM interrupt of rtc-s5m doesn't happen first time when i use
> tools/testing/selftests/timers/rtctest.c test program and hour format is
> used to 12 hour mode in Odroid-XU3 board.
> 

>From what I understood, I should expect a v2 of tihat patch also setting
RUDR, is that right? OR would you prefer that I apply that one and then
fix RUDR in a following patch?

> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: <stable@vger.kernel.org>

can you update the stable tag with the kernel version introducing the
issue?

> ---
>  drivers/rtc/rtc-s5m.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> index 8c70d78..03828bb 100644
> --- a/drivers/rtc/rtc-s5m.c
> +++ b/drivers/rtc/rtc-s5m.c
> @@ -635,6 +635,18 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
>  	case S2MPS13X:
>  		data[0] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>  		ret = regmap_write(info->regmap, info->regs->ctrl, data[0]);
> +		if (ret < 0)
> +			break;
> +
> +		ret = regmap_update_bits(info->regmap,
> +				info->regs->rtc_udr_update,
> +				info->regs->rtc_udr_mask,
> +				info->regs->rtc_udr_mask);

Very small indentation issue here, it should be aligned with the open
parenthesis.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
