From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] i2c: exynos5: Fix possible ABBA deadlock by keeping I2C
 clock prepared
Date: Mon, 18 Apr 2016 09:29:14 -0400
Message-ID: <5714E12A.8090100@osg.samsung.com>
References: <1460757887-18128-1-git-send-email-javier@osg.samsung.com>
 <571491AE.30908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:59764 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548AbcDRN3j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 09:29:39 -0400
In-Reply-To: <571491AE.30908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Marek,

On 04/18/2016 03:50 AM, Marek Szyprowski wrote:
> Hello,
> 
> On 2016-04-16 00:04, Javier Martinez Canillas wrote:
>> The exynos5 I2C controller driver always prepares and enables a clock
>> before using it and then disables unprepares it when the clock is not
>> used anymore.
>>
>> But this can cause a possible ABBA deadlock in some scenarios since a
>> driver that uses regmap to access its I2C registers, will first grab
>> the regmap lock and then the I2C xfer function will grab the prepare
>> lock when preparing the I2C clock. But since the clock driver also
>> uses regmap for I2C accesses, preparing a clock will first grab the
>> prepare lock and then the regmap lock when using the regmap API.
>>
>> An example of this happens on the Exynos5422 Odroid XU board where a
>> s2mps11 PMIC is used and both the s2mps11 regulators and clk drivers
>> share the same I2C regmap.
>>
>> The possible deadlock is reported by the kernel lockdep:
>>
>>    Possible unsafe locking scenario:
>>
>>          CPU0                    CPU1
>>          ----                    ----
>>     lock(sec_core:428:(regmap)->lock);
>>                                  lock(prepare_lock);
>>                                  lock(sec_core:428:(regmap)->lock);
>>     lock(prepare_lock);
>>
>>    *** DEADLOCK ***
>>
>> Fix this by only preparing the clock on probe and {en,dis}able in the
>> rest of the driver.
>>
>> This patch is similar to commit 34e81ad5f0b6 ("i2c: s3c2410: fix ABBA
>> deadlock by keeping clock prepared") that fixes the same bug in other
>> driver for an I2C controller found in Samsung SoCs.
> 
> I'm sorry, but this is not the right approach imho. It is just a workaround
> applied to specific driver, it also duplicates incorrect clock usage
> pattern (there is really no point keeping clock prepared all the time).
> 
> IMHO this ABBA deadlock should be really fixed in clocks core (probably
> by removing global prepare mutex and replacing it with per clock
> controller mutexes). Without a proper patch this issue will hit us again
> with other i2c controllers or other drivers as well.
>

Agreed, Krzysztof mentioned the same before. I'll take a look to the global
mutex to see how I can make it more fine grained to prevent these deadlocks.
 
>> Reported-by: Anand Moon <linux.amoon@gmail.com>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
