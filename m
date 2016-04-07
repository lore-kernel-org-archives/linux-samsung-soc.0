From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] regulator: s2mps11: Use module_platform_driver()
 instead subsys initcall
Date: Thu, 7 Apr 2016 14:16:29 -0400
Message-ID: <5706A3FD.4030509@osg.samsung.com>
References: <1459950587-8807-1-git-send-email-javier@osg.samsung.com>
 <20160407123024.GA6765@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34730 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756860AbcDGSQh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Apr 2016 14:16:37 -0400
In-Reply-To: <20160407123024.GA6765@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>

Hello Krzysztof,

On 04/07/2016 08:30 AM, Krzysztof Kozlowski wrote:
> On Wed, Apr 06, 2016 at 09:49:46AM -0400, Javier Martinez Canillas wrote:
>> The driver's init and exit function don't do anything besides registering
>> and unregistering the platform driver, so the module_platform_driver()
>> macro could just be used instead of having separate functions.
>>
>> Currently the macro is not being used because the driver is initialized at
>> subsys init call level but this isn't necessary since consumer devices are
>> defined in the DT as dependencies so there's no need for init calls order.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>> This patch was tested on an Exynos5422 Odroid XU4 board.
> 
> This test might not be sufficient. XU4 is not a mobile device like many
> other users of this driver (except Arndale Octa and Artiks all of other
> users are mobiles/wearables).
> 
> For example XU4 does not have USB OTG (like other devices and like XU3).
>

All the consumer device nodes for these regulators are defined in the
exynos5422-odroidxu3-common.dtsi that is shared by all the Odroid XU*
so I thought testing in the XU4 was as good as testing in the XU3
(since the USB OTG doesn't use a regulator from this PMIC).

I've also checked the DTS for all the boards that use regulators that
are registered by this driver and all consumer drivers supports probe
deferral so I think this change is safe.

Also, the driver Kconfig symbol is tristate already so the driver can be
built as module and the init func won't be executed at subsys init call.
 
> Best regards,
> Krzysztof
> 
>>
>>  drivers/regulator/s2mps11.c | 12 +-----------
>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
