From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/3] i2c-s3c2410: Rework device type handling
Date: Wed, 18 Apr 2012 13:55:00 +0200
Message-ID: <4F8EAB94.7080707@samsung.com>
References: <1332357113-2973-1-git-send-email-k.lewandowsk@samsung.com>
 <1332357113-2973-3-git-send-email-k.lewandowsk@samsung.com>
 <20120417173136.GB22406@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20120417173136.GB22406-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 17.04.2012 19:31, Wolfram Sang wrote:

> Hi,


Hi Wolfram!

> 
> On Wed, Mar 21, 2012 at 08:11:52PM +0100, Karol Lewandowski wrote:
>> Reorganize driver a bit to better handle device tree-based systems:
>>
>>  - move machine type to driver's private structure instead of
>>    quering platform device variants in runtime
>>
>>  - replace s3c24xx_i2c_type enum with unsigned int that holds
>>    bitmask with revision-specific quirks
>>
>> Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> Okay, so this driver needs to the 'data' field from either
> platform_device_id or of_device_id and implements a function for that,
> namely s3c24xx_get_device_quirks(). Grant, Rob: I'd think there might be
> more drivers in need of that, so maybe it makes sense to have a generic
> of-helper function?
> 
>> ---
>>  drivers/i2c/busses/i2c-s3c2410.c |   47 ++++++++++++++++++-------------------
>>  1 files changed, 23 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
>> index 85e3664..f7b6a14 100644
>> --- a/drivers/i2c/busses/i2c-s3c2410.c
>> +++ b/drivers/i2c/busses/i2c-s3c2410.c
>> @@ -44,8 +44,14 @@
>>  #include <plat/regs-iic.h>
>>  #include <plat/iic.h>
>>  
>> -/* i2c controller state */
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id s3c24xx_i2c_match[];
>> +#endif
> 
> Uh, forward declaration with #ifdef. I'd think we should get this simply
> to the front.


Ok, as I think it's better to have dt and non-dt definitions together
I'll move both of_device_id and platform_device_id to the top.

>> +/* Treat S3C2410 as baseline hardware, anything else is supported via quirks */
>> +#define QUIRK_S3C2440		(1 << 0)
> 
> Minor: Is it really a quirk being s3c2440? Maybe FLAG_*, dunno.


In first version[1] of this patch I've used TYPEs for device types
and FLAGS for quirks. However, I've squashed these into "quirks" after
discussion with Mark[2].

[1] http://permalink.gmane.org/gmane.linux.kernel/1266759
[2] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/10255


>> -static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
>> +static inline unsigned int s3c24xx_get_device_quirks(struct platform_device *pdev)
>>  {
>> -	struct platform_device *pdev = to_platform_device(i2c->dev);
>> -	enum s3c24xx_i2c_type type;
>> -
>>  #ifdef CONFIG_OF
>> -	if (i2c->dev->of_node)
>> -		return of_device_is_compatible(i2c->dev->of_node,
>> -				"samsung,s3c2440-i2c");
>> +        if (pdev->dev.of_node) {
>> +		const struct of_device_id *match;
>> +		match = of_match_node(&s3c24xx_i2c_match[0], pdev->dev.of_node);
> 
> Minor: I think it is more readable to drop the [0]


I prefer explicit version, but I'll drop [] as both you and Thomas
found implicit version more readable.

[ I'll also drop above CONFIG_OF ifdef, as of_match_node() seem
  to be always defined since v3.2-rc1. ]

Thanks for review!  I'll resubmit updated version shortly.

Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
