From: Donghwa Lee <dh09.lee@samsung.com>
Subject: Re: [PATCH v2] ARM: EXYNOS4: enabled lcd and backlight in NURI board
Date: Mon, 07 Mar 2011 17:15:17 +0900
Message-ID: <4D749415.7080705@samsung.com>
References: <1299460218-22748-1-git-send-email-dh09.lee@samsung.com>
 <032401cbdc96$e134f360$a39eda20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50812 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469Ab1CGImH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2011 03:42:07 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHO008NBHLIDN60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 17:15:18 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHO00391HLI1F@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Mar 2011 17:15:18 +0900 (KST)
In-reply-to: <032401cbdc96$e134f360$a39eda20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

 Thank you for your comments.
I had answer below and will fix it along your comments.

On 2011-03-07, Kukjin Kim wrote:
> Donghwa Lee wrote:
>> This patch enables lcd and backlight drivers in NURI board.
>>
>> Signed-off-by: Donghwa Lee <dh09.lee@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> Changes since v1:
>> - Adds backlight platform data to control brightness and GPIO
>> - Modify inappropriate function name and remove useless codes.
>> - And so on.
>>
>>  arch/arm/mach-exynos4/Kconfig     |    1 +
>>  arch/arm/mach-exynos4/mach-nuri.c |   81
>> +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 82 insertions(+), 0 deletions(-)
> Thanks for re-work :)
> There are small comments below.
>
> (snip)
>
>> +static void nuri_lcd_power_on(struct plat_lcd_data *pd, unsigned int
> power)
>> +{
>> +	int gpio = EXYNOS4_GPE1(5);
>> +
>> +	if (power)
>> +		gpio_direction_output(gpio, 1);
>> +	else
>> +		gpio_direction_output(gpio, 0);
> 	gpio_direction_output(gpio, power);
>

Ok, I will fix it.

>> +}
>> +
>> +static int nuri_bl_init(struct device *dev)
>> +{
>> +	int ret, gpio = EXYNOS4_GPE2(3);
>> +
>> +	ret = gpio_request(gpio, "LCD_LDO_EN");
>> +	if (!ret)
>> +		gpio_direction_output(gpio, 0);
>> +
>> +	return 0;
> 	return ret;
>

I will fix it.

>> +}
> (snip)
>
>> +static struct platform_device nuri_lcd_device = {
>> +	.name			= "platform-lcd",
>> +	.id			= -1,
>> +	.dev			= {
>> +		.platform_data	= (void *) &nuri_lcd_platform_data,
> 		.platform_data = &nuri_lcd_platform_data,
>
>> +	},
>> +};

I will fix it.

> (snip)
>
> You used gpio_request() for EXYNOS4_GPE2(3) and EXYNOS4_GPE1(5), but
> EXYNOS4_GPE1(5). Is there any reason or policy for it?
>
>

You mean why I left out the gpio_free() after gpio_request(), right?
There was my mistake, I will add it.

Thank you,
Donghwa Lee
