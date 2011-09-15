From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2] ARM: EXYNOS4: Add machine support for 7" LCD on ORIGEN
Date: Thu, 15 Sep 2011 13:54:53 +0900
Message-ID: <00a101cc7363$9b8960d0$d29c2270$%kim@samsung.com>
References: <1315998112-31395-1-git-send-email-tushar.behera@linaro.org>
 <CAOMZO5Cgq=+ukcyox9pz=2jWhQmfKXsqbXWLZ+Q=RkSJqBfpbg@mail.gmail.com>
 <4E7098FD.2090905@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48861 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752012Ab1IOEzA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Sep 2011 00:55:00 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRJ00JDJSBDLTD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Sep 2011 13:54:53 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRJ007CMSBH4C10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 15 Sep 2011 13:54:53 +0900 (KST)
In-reply-to: <4E7098FD.2090905@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Fabio Estevam' <festevam@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

Tushar Behera wrote:
> 
> Hi Fabio,
> 
> On Wednesday 14 September 2011 05:06 PM, Fabio Estevam wrote:
> > On Wed, Sep 14, 2011 at 8:01 AM, Tushar Behera<tushar.behera@linaro.org>
> wrote:
> > ...
> >> +static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, unsigned int
> power)
> >> +{
> >> +       int gpio = EXYNOS4_GPE3(4);
> >> +
> >> +       gpio_request(gpio, "GPE3_4");
> >> +       gpio_direction_output(gpio, power);
> >
> > You should check for returned errors for these functions.
> >
> Ok.
> 
> Will this be better?
> 
> static void lcd_hv070wsa_set_power(struct plat_lcd_data *pd, \

No need '\'

> 					unsigned int power)
> {
> 	int ret;
> 	unsigned long flag = power ? GPIOF_OUT_INIT_HIGH : \

Same as above.

> 					GPIOF_OUT_INIT_LOW;
> 
> 	ret = gpio_request_one(EXYNOS4_GPE3(4), flag, "GPE3_4");
> 
> 	if (ret)
> 		printk(KERN_ERR "Could not request gpio for LCD power");
> }

How about following?

	if (power)
		ret = gpio_request_one(EXYNOS4_GPE3(4), GPIOF_OUT_INIT_HIGH, "GPE3_4");
	else
		ret = gpio_request_one(EXYNOS4_GPE3(4), GPIOF_OUT_INIT_LOW, "GPE3_4");

	if (ret)
		pr_err("failed to request gpio for LCD power: %d\n", ret);

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
