From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [rtc-linux] [PATCH] rtc: s5m: fix to update ctrl register
Date: Thu, 13 Aug 2015 19:02:16 +0900
Message-ID: <55CC6B28.5010707@samsung.com>
References: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
Sender: stable-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, sbkim73@samsung.com, jy0922.shim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 13.08.2015 o 17:49, Joonyoung Shim pisze:
> According to datasheet, the S2MPS13X and S2MPS14X should update write
> buffer via setting WUDR bit to high after ctrl register is updated.

Hi,

I cannot find this information in S2MPS14 datasheet. On which page is it?


> 
> If not, ALARM interrupt of rtc-s5m doesn't happen first time when i use
> tools/testing/selftests/timers/rtctest.c test program and hour format is
> used to 12 hour mode in Odroid-XU3 board.

Two questions here:
1. Earlier you mentioned S2MPS1[34], now Odroid XU3 which has S2MPS11.
Are you sure that this applies to all of them (S2MPS11, S2MPS13 and
S2MP14)? There are some minor differences between them so I would not be
surprised if only some of them required this action.

2. The driver operates in 24-hour omode. Actually it sets the 24-hour
mode just before your new regmap_update_bits() call. What do you mean by
12-hour mode?

> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: <stable@vger.kernel.org>

Thanks for putting a cc-stable tag. How far this should be ported? If
this is needed only for S2MPS11 then v4.1. If all of them then probably
for earlier version?

Best regards,
Krzysztof

> ---
>  drivers/rtc/rtc-s5m.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
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
> +		if (ret < 0)
> +			break;
> +
> +		ret = s5m8767_wait_for_udr_update(info);
> +
>  		break;
>  
>  	default:
> 
