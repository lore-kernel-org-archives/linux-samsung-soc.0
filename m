From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v5 10/14] regulator: Add driver for Maxim 77802 PMIC regulators
Date: Fri, 27 Jun 2014 11:42:25 +0200
Message-ID: <53AD3C81.7070607@collabora.co.uk>
References: <1403806546-31122-1-git-send-email-javier.martinez@collabora.co.uk> <1403806546-31122-11-git-send-email-javier.martinez@collabora.co.uk> <20140627092611.GI19645@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140627092611.GI19645@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Daniel Stone <daniels-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

Thanks a lot for your feedback.

On 06/27/2014 11:26 AM, Lee Jones wrote:
> On Thu, 26 Jun 2014, Javier Martinez Canillas wrote:
>> The MAX77802 PMIC has 10 high-efficiency Buck and 32 Low-dropout
>> (LDO) regulators. This patch adds support for all these regulators
>> found on the MAX77802 PMIC and is based on a driver added by Simon
>> Glass to the Chrome OS kernel 3.8 tree.
>> 
>> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
>> Tested-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>> 
>> Changes since v4: None
>> 
>> Changes since v3:
>>  - Set the supply_name for regulators to lookup their parent supply node.
>>    Suggested by Mark Brown.
>>  - Change Exyno5 for Exynos5420/Exynos5800 in regulator driver Kconfig.
>>    Suggested by Doug Anderson.
>> 
>> Changes since v2:
>>  - Use dev_warn() instead pr_warn(). Suggested by Mark Brown.
>>  - Add a generic function to regmap core to copy registers instead of
>>    having a driver-specific function. Suggested by Mark Brown.
>>  - Remove unnecessary probe debug log. Suggested by Mark Brown.
>>  - Set struct regulator_config dev field to MFD instead of the platform dev.
>>    Suggested by Mark Brown.
>>  - Read the regulators operational mode from the hardware registers instead
>>    of setting to normal as default on probe. Suggested by Mark Brown.
>>  - Remove unnecessary cross-subsystem dependencies. Suggested by Lee Jones.
>> 
>> Changes since v1:
>>  - Remove unneeded check if num_regulators != MAX77802_MAX_REGULATORS.
>>  - Fix .set_suspend_mode handler comment and split regulators ops for
>>    regulators that behave differently. Suggested by Mark Brown.
>>  - Use module_platform_driver() instead of having init/exit functions.
>>    Suggested by Mark Brown.
>>  - Use the new descriptor-based GPIO interface instead of the deprecated
>>    integer based GPIO one. Suggested by Mark Brown.
>>  - Look for "regulators" child node instead of "voltage-regulators" to be
>>    consistent with other PMIC drivers. Suggested by Mark Brown.
>> 
>>  drivers/mfd/max77802.c               |   8 +-
>>  drivers/regulator/Kconfig            |   9 +
>>  drivers/regulator/Makefile           |   1 +
>>  drivers/regulator/max77802.c         | 694 +++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/max77802-private.h |   3 -
>>  5 files changed, 711 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/regulator/max77802.c
>> 
>> diff --git a/drivers/mfd/max77802.c b/drivers/mfd/max77802.c
>> index 3d477fb..79d36b6 100644
>> --- a/drivers/mfd/max77802.c
>> +++ b/drivers/mfd/max77802.c
>> @@ -228,7 +228,7 @@ static int max77802_i2c_probe(struct i2c_client *i2c,
>>  
>>  	max77802 = devm_kzalloc(&i2c->dev, sizeof(struct max77802_dev),
>>  				GFP_KERNEL);
>> -	if (max77802 == NULL)
>> +	if (!max77802)
>>  		return -ENOMEM;
>>  
>>  	i2c_set_clientdata(i2c, max77802);
>> @@ -315,6 +315,12 @@ static int max77802_suspend(struct device *dev)
>>  	if (device_may_wakeup(dev))
>>  		enable_irq_wake(max77802->irq);
>>  
>> +	/*
>> +	 * The IRQ must be disabled during suspend since due wakeup
>> +	 * ordering issues it may be possible that the I2C controller
>> +	 * is still suspended when the interrupt happens so the IRQ
>> +	 * handler will fail to read the I2C bus.
>> +	 */
> 
> Please re-word this, the English is a little off.
> 

Ok, I found that drivers/mfd/max14577.c has a similar comment so I'll just reuse
that one since explains it way better.

>>  	disable_irq(max77802->irq);
>>  
>>  	return 0;
> 
> Please separate the MFD changes out.  There is no need for them to be
> munged in with regulator changes.
>

Yes, when preparing v5 I squashed the mfd driver changes into the patch adding
the regulator driver by mistake instead with the one adding the mfd driver.
Sorry about that...

I'll wait for your complete review so I can fix all the issues you find and post
a v6.

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
