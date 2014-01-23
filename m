From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2 03/10] pinctrl: exynos: add exynos5260 SoC specific data
Date: Thu, 23 Jan 2014 19:38:02 +0100
Message-ID: <52E1618A.2040704@samsung.com>
References: <1389099548-14649-1-git-send-email-rahul.sharma@samsung.com>
 <1389099548-14649-4-git-send-email-rahul.sharma@samsung.com>
 <3846194.a18yHpXxuP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13903 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806AbaAWSiT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 13:38:19 -0500
In-reply-to: <3846194.a18yHpXxuP@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, kgene.kim@samsung.com, thomas.ab@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Young-Gun Jang <yg1004.jang@samsung.com>



On 07.01.2014 14:31, Arnd Bergmann wrote:
> On Tuesday 07 January 2014 18:29:01 Rahul Sharma wrote:
>> From: Young-Gun Jang <yg1004.jang@samsung.com>
>>
>> Add Samsung Exynos5260 SoC specific data to enable pinctrl
>> support for all platforms based on EXYNOS5260.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Signed-off-by: Young-Gun Jang <yg1004.jang@samsung.com>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>
> On a similar note to the comment about the platform patch, I think
> it would be good to extend the DT binding in a way that allows
> you to describe the differences between the SoCs without having
> to change the driver every time a new model comes out.
>
> We still have to maintain backwards compatibility with the
> existing bindings I suppose, but I'd rather not see new ones
> added like this. I realize that there is a tradeoff between
> having too much information in DT when it is always fixed, and
> having too much hardcoded in the driver, and at some point there
> was a conscious decision to do it like this, but I fear the
> tradeoff has changed with the number of EXYNOS implementations
> that really only differ in their pin banks.

There isn't really too much data being added to the driver on per-SoC 
basis. Anyway, I remember that when I was trying to move all the data to 
DT long time ago when refactoring the driver, after a long discussion on 
the ML it was decided that it is not really a good idea and so we have 
the end result as we can see now.

Personally I'd prefer all the static data of struct samsung_pin_bank to 
be located in DT, with each bank having a compatible string that would 
translate to appropriate struct samsung_pin_bank_type, which is common 
across multiple SoCs (basically all >= S5PV210), and parameters such as 
pin-count, control-base, and geint-/weint-base (which would also imply 
interrupt type) - name (which is used only for human readable text) 
could be implied by node names. However that would mean quite 
significant effort (and churn), especially considering the fact that we 
need to maintain compatibility with existing bindings, due to "ABI 
stability" (which I'm slowly losing my faith in), so I don't think it's 
worth it.

So, from me:

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
