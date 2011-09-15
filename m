From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH V2] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Thu, 15 Sep 2011 09:06:54 +0530
Message-ID: <4E7172D6.4060601@linaro.org>
References: <1315998112-31395-1-git-send-email-tushar.behera@linaro.org>	<CAOMZO5Cgq=+ukcyox9pz=2jWhQmfKXsqbXWLZ+Q=RkSJqBfpbg@mail.gmail.com>	<4E7098FD.2090905@linaro.org> <CAOMZO5DmwKOkHk2+FQ00Jjfo-SJ_Te97Mmypm+0XH=YBd8KUAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57940 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754112Ab1IODgz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 23:36:55 -0400
Received: by iaqq3 with SMTP id q3so725613iaq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 20:36:53 -0700 (PDT)
In-Reply-To: <CAOMZO5DmwKOkHk2+FQ00Jjfo-SJ_Te97Mmypm+0XH=YBd8KUAA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Hi Fabio Estevam,

On Wednesday 14 September 2011 06:09 PM, Fabio Estevam wrote:
> On Wed, Sep 14, 2011 at 9:07 AM, Tushar Behera<tushar.behera@linaro.org>  wrote:
> ...
>
>> Will this be better?
>>
>> static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, \
>>                                         unsigned int power)
>> {
>>         int ret;
>>         unsigned long flag = power ? GPIOF_OUT_INIT_HIGH : \
>>                                         GPIOF_OUT_INIT_LOW;
>>
>>         ret = gpio_request_one(EXYNOS4_GPE3(4), flag, "GPE3_4");
>>
>>         if (ret)
>>                 printk(KERN_ERR "Could not request gpio for LCD power");
>> }
>
> Looks better. You can use pr_err instead of printk(KERN_ERR .
>
Thanks for your review comments. I will send the next version with these 
changes.
> Regards,
>
> Fabio Estevam


-- 
Tushar Behera
