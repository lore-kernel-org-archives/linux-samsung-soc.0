From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/3] ARM: multi_v7_defconfig: Enable max77802 regulator
Date: Thu, 16 Jul 2015 07:44:41 +0200
Message-ID: <55A744C9.6040703@osg.samsung.com>
References: <1436977965-7078-1-git-send-email-javier@osg.samsung.com>
 <1436977965-7078-2-git-send-email-javier@osg.samsung.com>
 <55A6FEA0.8090202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:53179 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752068AbbGPFoq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 01:44:46 -0400
In-Reply-To: <55A6FEA0.8090202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

Hello Krzysztof,

Thanks for the feedback.

On 07/16/2015 02:45 AM, Krzysztof Kozlowski wrote:
> On 16.07.2015 01:32, Javier Martinez Canillas wrote:
>> The Maxim max77802 Power Management IC has besides other devices, a set of
>> regulators. Commit f3caa529c6f5 ("ARM: multi_v7_defconfig: Enable max77802
>> regulator, rtc and clock drivers") was supposed to enable the config option
>> for the regulator driver as a module but the final version that landed did
>> not include this. So this patch enables the needed Kconfig option.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Please describe why do you want to enable it (IOW who will benefit from
> enabling it?). This symbol was removed by Kukjin from your commit:
> 	[kgene@kernel.org: removing useless REGULATOR_MAX77802 config]
> so justification would be welcomed.
>

You are right, sorry for not making the commit message clear. This PMIC
is used by a couple of Exynos5 based boars such as the Peach Pit and Pi
Chromebooks. I expect it to be found in other designs too just like the
max77686 is found in many Exynos5 based boards.

I'll add this to the commit message on v2.
 
> Beside the commit description I agree with the patch.
>

Does this mean I can add your Reviewed-by to this patch as well?

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
