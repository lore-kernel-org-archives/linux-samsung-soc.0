From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/8] rtc: max77686: Add an indirection level to access RTC
 registers
Date: Thu, 21 Jan 2016 10:05:51 +0900
Message-ID: <56A02EEF.2060604@samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <1453310088-29985-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34073 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbcAUBFw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 20:05:52 -0500
In-reply-to: <1453310088-29985-5-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

On 21.01.2016 02:14, Javier Martinez Canillas wrote:
> The max77686 driver is generic enough that can be used for other
> Maxim RTC IP blocks but these might not have the same registers
> layout so instead of accessing the registers directly, add a map
> to translate offsets to the real registers addresses for each IP.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  drivers/rtc/rtc-max77686.c | 75 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
> index 441d163dcbeb..7316e41820c7 100644
> --- a/drivers/rtc/rtc-max77686.c
> +++ b/drivers/rtc/rtc-max77686.c
> @@ -41,6 +41,8 @@
>  #define ALARM_ENABLE_SHIFT		7
>  #define ALARM_ENABLE_MASK		(1 << ALARM_ENABLE_SHIFT)
>  
> +#define REG_RTC_NONE			0xdeadbeef
> +
>  enum {
>  	RTC_SEC = 0,
>  	RTC_MIN,
> @@ -55,6 +57,7 @@ enum {
>  struct rtc_driver_data {
>  	unsigned long		delay;
>  	int			mask;
> +	const unsigned int	*map;
>  };
>  
>  struct max77686_rtc_info {
> @@ -77,9 +80,53 @@ enum MAX77686_RTC_OP {
>  	MAX77686_RTC_READ,
>  };
>  
> +/* These are not registers but just offsets that are mapped to addresses */
> +enum rtc_reg {

enum max77686_rtc_reg_offset?

> +	REG_RTC_CONTROLM = 0,
> +	REG_RTC_CONTROL,
> +	REG_RTC_UPDATE0,
> +	REG_RTC_UPDATE1,
> +	REG_WTSR_SMPL_CNTL,
> +	REG_RTC_SEC,
> +	REG_RTC_MIN,
> +	REG_RTC_HOUR,
> +	REG_RTC_WEEKDAY,
> +	REG_RTC_MONTH,
> +	REG_RTC_YEAR,
> +	REG_RTC_DATE,
> +	REG_ALARM1_SEC,
> +	REG_ALARM1_MIN,
> +	REG_ALARM1_HOUR,
> +	REG_ALARM1_WEEKDAY,
> +	REG_ALARM1_MONTH,
> +	REG_ALARM1_YEAR,
> +	REG_ALARM1_DATE,
> +	REG_ALARM2_SEC,
> +	REG_ALARM2_MIN,
> +	REG_ALARM2_HOUR,
> +	REG_ALARM2_WEEKDAY,
> +	REG_ALARM2_MONTH,
> +	REG_ALARM2_YEAR,
> +	REG_ALARM2_DATE,
> +	REG_RTC_END,
> +};
> +

A short comment what is mapped into what would be appreciated.

> +static const unsigned int max77686_map[REG_RTC_END] = {
> +	MAX77686_RTC_CONTROLM, MAX77686_RTC_CONTROL, MAX77686_RTC_UPDATE0,
> +	REG_RTC_NONE, MAX77686_WTSR_SMPL_CNTL, MAX77686_RTC_SEC,
> +	MAX77686_RTC_MIN, MAX77686_RTC_HOUR, MAX77686_RTC_WEEKDAY,
> +	MAX77686_RTC_MONTH, MAX77686_RTC_YEAR, MAX77686_RTC_DATE,
> +	MAX77686_ALARM1_SEC, MAX77686_ALARM1_MIN, MAX77686_ALARM1_HOUR,
> +	MAX77686_ALARM1_WEEKDAY, MAX77686_ALARM1_MONTH, MAX77686_ALARM1_YEAR,
> +	MAX77686_ALARM1_DATE, MAX77686_ALARM2_SEC, MAX77686_ALARM2_MIN,
> +	MAX77686_ALARM2_HOUR, MAX77686_ALARM2_WEEKDAY, MAX77686_ALARM2_MONTH,
> +	MAX77686_ALARM2_YEAR, MAX77686_ALARM2_DATE,
> +};

It is difficult to check for mistakes here. I would prefer direct mapping:
	[REG_RTC_CONTROLM] = MAX77686_RTC_CONTROLM,
	....


Rest looks good but I did not check the correctness of mapping above.

BR,
Krzysztof
