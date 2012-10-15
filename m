From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH V5 1/2] video: exynos_dp: Add device tree support to DP
 driver
Date: Mon, 15 Oct 2012 23:14:06 +0200
Message-ID: <507C7C9E.1030503@gmail.com>
References: <1350074859-23226-1-git-send-email-ajaykumar.rs@samsung.com> <50788F25.2040003@gmail.com> <009d01cdaaad$0fa33230$2ee99690$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:39329 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752165Ab2JOVOL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 17:14:11 -0400
In-Reply-To: <009d01cdaaad$0fa33230$2ee99690$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, FlorianSchandinat@gmx.de, tomasz.figa@gmail.com, thomas.ab@samsung.com

On 10/15/2012 10:14 AM, Jingoo Han wrote:
> On Saturday, October 13, 2012 6:44 AM Sylwester Nawrocki wrote
>>
>> On 10/12/2012 10:47 PM, Ajay Kumar wrote:
>>> This patch enables device tree based discovery support for DP driver.
>>> The driver is modified to handle platform data in both the cases:
>>> with DT and non-DT.
>>>
>>> Signed-off-by: Ajay Kumar<ajaykumar.rs@samsung.com>
>>> Acked-by: Jingoo Han<jg1.han@samsung.com>
>>> ---
>>>    drivers/video/exynos/exynos_dp_core.c |  161 ++++++++++++++++++++++++++++++---
>>>    drivers/video/exynos/exynos_dp_core.h |    2 +
>>>    2 files changed, 149 insertions(+), 14 deletions(-)
...
>>> @@ -953,8 +1062,13 @@ static int __devexit exynos_dp_remove(struct platform_device *pdev)
>>>    	struct exynos_dp_platdata *pdata = pdev->dev.platform_data;
>>>    	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
>>
>> This doesn't belong to your patch, but the above 2 lines could be written as:
>>
>>    	struct exynos_dp_device *dp = dev_get_drvdata(&pdev->dev);
>>
>> Same in functions exynos_dp_suspend() and exynos_dp_resume().
>
> No, above 2 lines cannot be reduced to 1 line, as you mentioned.
> This is because it makes build error.

Sorry, my bad. It looks fine in case of exynos_dp_remove().

But at exynos_dp_suspend/resume() there is something like:


static int exynos_dp_suspend(struct device *dev)
{
	struct platform_device *pdev = to_platform_device(dev);
	struct exynos_dp_platdata *pdata = pdev->dev.platform_data;
	struct exynos_dp_device *dp = platform_get_drvdata(pdev);


You need only pdata and dp there. I think that simpler form would
do as well:

	struct exynos_dp_device *dp = dev_get_drvdata(dev);
	struct exynos_dp_platdata *pdata = dev->platform_data;


Sorry, this is just a nitpicking.

BTW, shouldn't CONFIG_EXYNOS_VIDEO depend on ARCH_EXYNOS ?


--
Regards,
Sylwester
