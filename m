From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Thu, 15 Sep 2011 11:03:39 +0530
Message-ID: <4E718E33.4070608@linaro.org>
References: <1315998112-31395-1-git-send-email-tushar.behera@linaro.org> <CAOMZO5Cgq=+ukcyox9pz=2jWhQmfKXsqbXWLZ+Q=RkSJqBfpbg@mail.gmail.com> <4E7098FD.2090905@linaro.org> <00a101cc7363$9b8960d0$d29c2270$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:51461 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754263Ab1IOFdh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Sep 2011 01:33:37 -0400
Received: by pzk32 with SMTP id 32so1826078pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 22:33:37 -0700 (PDT)
In-Reply-To: <00a101cc7363$9b8960d0$d29c2270$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Fabio Estevam' <festevam@gmail.com>, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

Hi Kukjin,

On Thursday 15 September 2011 10:24 AM, Kukjin Kim wrote:
> Tushar Behera wrote:
>>
>> Hi Fabio,
>>
>> On Wednesday 14 September 2011 05:06 PM, Fabio Estevam wrote:
>>> On Wed, Sep 14, 2011 at 8:01 AM, Tushar Behera<tushar.behera@linaro.org>
>> wrote:
>>> ...
>>>> +static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, unsigned int
>> power)
>>>> +{
>>>> +       int gpio = EXYNOS4_GPE3(4);
>>>> +
>>>> +       gpio_request(gpio, "GPE3_4");
>>>> +       gpio_direction_output(gpio, power);
>>>
>>> You should check for returned errors for these functions.
>>>
>> Ok.
>>
>> Will this be better?
>>
>> static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, \
>
> No need '\'
>
>> 					unsigned int power)
>> {
>> 	int ret;
>> 	unsigned long flag = power ? GPIOF_OUT_INIT_HIGH : \
>
> Same as above.
>
>> 					GPIOF_OUT_INIT_LOW;
>>
>> 	ret = gpio_request_one(EXYNOS4_GPE3(4), flag, "GPE3_4");
>>
>> 	if (ret)
>> 		printk(KERN_ERR "Could not request gpio for LCD power");
>> }
>
> How about following?
>
> 	if (power)
> 		ret = gpio_request_one(EXYNOS4_GPE3(4), GPIOF_OUT_INIT_HIGH, "GPE3_4");
> 	else
> 		ret = gpio_request_one(EXYNOS4_GPE3(4), GPIOF_OUT_INIT_LOW, "GPE3_4");
>
> 	if (ret)
> 		pr_err("failed to request gpio for LCD power: %d\n", ret);
Thanks, I will update accordingly.

Also I will remove the .refresh value as suggested in the other thread.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim<kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>


-- 
Tushar Behera
