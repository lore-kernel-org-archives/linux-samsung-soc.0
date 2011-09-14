From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Wed, 14 Sep 2011 17:37:25 +0530
Message-ID: <4E7098FD.2090905@linaro.org>
References: <1315998112-31395-1-git-send-email-tushar.behera@linaro.org> <CAOMZO5Cgq=+ukcyox9pz=2jWhQmfKXsqbXWLZ+Q=RkSJqBfpbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:59888 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756484Ab1INMHZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 08:07:25 -0400
Received: by pzk32 with SMTP id 32so2995902pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 05:07:24 -0700 (PDT)
In-Reply-To: <CAOMZO5Cgq=+ukcyox9pz=2jWhQmfKXsqbXWLZ+Q=RkSJqBfpbg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Hi Fabio,

On Wednesday 14 September 2011 05:06 PM, Fabio Estevam wrote:
> On Wed, Sep 14, 2011 at 8:01 AM, Tushar Behera<tushar.behera@linaro.org>  wrote:
> ...
>> +static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, unsigned int power)
>> +{
>> +       int gpio = EXYNOS4_GPE3(4);
>> +
>> +       gpio_request(gpio, "GPE3_4");
>> +       gpio_direction_output(gpio, power);
>
> You should check for returned errors for these functions.
>
Ok.

Will this be better?

static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, \
					unsigned int power)
{
	int ret;
	unsigned long flag = power ? GPIOF_OUT_INIT_HIGH : \
					GPIOF_OUT_INIT_LOW;

	ret = gpio_request_one(EXYNOS4_GPE3(4), flag, "GPE3_4");

	if (ret)
		printk(KERN_ERR "Could not request gpio for LCD power");
}

> Regards,
>
> Fabio Estevam


-- 
Tushar Behera
