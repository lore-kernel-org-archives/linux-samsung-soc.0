From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 05/15] ARM: S5PC100: Use common functions for gpiolib
 implementation
Date: Mon, 17 May 2010 15:59:41 +0200
Message-ID: <4BF14BCD.3050500@gmail.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com> <1273817946-29404-6-git-send-email-m.szyprowski@samsung.com> <003201caf5b2$2d641d00$882c5700$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f216.google.com ([209.85.219.216]:61078 "EHLO
	mail-ew0-f216.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750896Ab0EQN7p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 09:59:45 -0400
Received: by ewy8 with SMTP id 8so1857297ewy.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 May 2010 06:59:44 -0700 (PDT)
In-Reply-To: <003201caf5b2$2d641d00$882c5700$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org

Op 17-05-10 13:14, Kukjin Kim schreef:
> Marek Szyprowski wrote:
>   
> <snip>
>> -
>>  static __init int s5pc1xx_gpiolib_init(void)
>>  {
>> -	struct s3c_gpio_chip *chips;
>> +	struct s3c_gpio_chip *chip;
>>  	int nr_chips;
>>
>> -		chips = s5pc100_gpio_chips;
>> -		nr_chips = ARRAY_SIZE(s5pc100_gpio_chips);
>> +	chip = s5pc100_gpio_chips;
>> +	nr_chips = ARRAY_SIZE(s5pc100_gpio_chips);
>> +
>> +	for (; nr_chips > 0; nr_chips--, chip++)
>> +		s5pc100_gpiolib_link(chip);
>>
>> -	s5pc1xx_gpiolib_add(chips, nr_chips, s5pc1xx_gpiolib_link);
>> +	samsung_gpiolib_add_4bit_chips(s5pc100_gpio_chips,
>> +				       ARRAY_SIZE(s5pc100_gpio_chips));
>>     
> nr_chips?
>   

You can't use nr_chips as it has been decremented to 0 in the for loop
above it.

-- 
Maurus Cuelenaere
