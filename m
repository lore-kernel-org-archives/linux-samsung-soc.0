From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Add clk enable/disable of pwm
Date: Thu, 03 Nov 2011 16:53:42 +0900
Message-ID: <4EB24886.8080002@samsung.com>
References: <1319505701-9784-1-git-send-email-jy0922.shim@samsung.com>
 <012701cc99cc$300dca50$90295ef0$%kim@samsung.com>
 <4EB1FB58.9050503@samsung.com>
 <018e01cc99fc$bb4d5ec0$31e81c40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40203 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932203Ab1KCHxZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Nov 2011 03:53:25 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU2001I2R34XFH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Nov 2011 16:53:24 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LU200MKDR903LB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Nov 2011 16:53:24 +0900 (KST)
In-reply-to: <018e01cc99fc$bb4d5ec0$31e81c40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kyungmin.park@samsung.com

11/03/2011 04:46 PM, Kukjin Kim =EC=93=B4 =EA=B8=80:
> Joonyoung Shim wrote:
>> 11/03/2011 10:59 AM, Kukjin Kim =EC=93=B4 =EA=B8=80:
>>> Joonyoung Shim wrote:
>>>> PWM timers use pclk("timers" clk) as parent clk. If this pclk is t=
he
>>>> disabled state when PWM driver is probed, then it causes wrong rea=
d and
>>>> write operation about registers of PWM.
>>>>
>>>> Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
>>>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>>>> ---
>>>>    arch/arm/plat-samsung/pwm.c |    7 +++++++
>>>>    1 files changed, 7 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/p=
wm.c
>>>> index f37457c..dc1185d 100644
>>>> --- a/arch/arm/plat-samsung/pwm.c
>>>> +++ b/arch/arm/plat-samsung/pwm.c
>>>> @@ -299,6 +299,9 @@ static int s3c_pwm_probe(struct platform_devic=
e *pdev)
>>>>    		goto err_clk_tin;
>>>>    	}
>>>>
>>>> +	clk_enable(pwm->clk);
>>>> +	clk_enable(pwm->clk_div);
>>>> +
>>>>    	local_irq_save(flags);
>>>>
>>>>    	tcon =3D __raw_readl(S3C2410_TCON);
>>>> @@ -326,6 +329,8 @@ static int s3c_pwm_probe(struct platform_devic=
e *pdev)
>>>>    	return 0;
>>>>
>>>>     err_clk_tdiv:
>>>> +	clk_disable(pwm->clk_div);
>>>> +	clk_disable(pwm->clk);
>>>>    	clk_put(pwm->clk_div);
>>>>
>>>>     err_clk_tin:
>>>> @@ -340,6 +345,8 @@ static int __devexit s3c_pwm_remove(struct
>>>> platform_device *pdev)
>>>>    {
>>>>    	struct pwm_device *pwm =3D platform_get_drvdata(pdev);
>>>>
>>>> +	clk_disable(pwm->clk_div);
>>>> +	clk_disable(pwm->clk);
>>>>    	clk_put(pwm->clk_div);
>>>>    	clk_put(pwm->clk);
>>>>    	kfree(pwm);
>>>> --
>>>> 1.7.5.4
>>> Well, I wonder when this is needed. I think it should be enabled du=
ring
>>> kernel booting...
>> The exynos4 machine using just timer turns on "timer" clock in the p=
ast,
>> but "timer" clock is disable state when boot since MCT is used. MCT
>> doesn't control "timer" clock.
>>
>> I think pwm driver should control(enable/disable) using clocks
>> regardless of their parents clock.
>>
> I mean, why that is disabled when kernel boot...
>

Please see arch/arm/mach-exynos4/clock.c
There is "timers' clock in the clk init_clocks_off[].

Thanks.
