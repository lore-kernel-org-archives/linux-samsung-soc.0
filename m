From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] i2c-s3c2410: Add HDMIPHY quirk for S3C2440
Date: Tue, 13 Mar 2012 19:00:40 +0100
Message-ID: <4F5F8B48.7080803@samsung.com>
References: <1331657679-31302-1-git-send-email-k.lewandowsk@samsung.com>
 <1331657679-31302-4-git-send-email-k.lewandowsk@samsung.com>
 <4F5F838A.6030908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <4F5F838A.6030908-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 13.03.2012 18:27, Tomasz Stanislawski wrote:

> Hi Karol,
> Please refer to comments below,
> 
> Regards,
> Tomasz Stanislawski
> 
> On 03/13/2012 05:54 PM, Karol Lewandowski wrote:
>> This patch adds support for s3c2440 I2C bus controller dedicated HDMIPHY device on
>> Exynos4 platform. Some quirks are introduced due to differences between HDMIPHY
>> and other I2C controllers on Exynos4.  These differences are:
>> - no GPIOs, HDMIPHY is inside the SoC and the controller is connected
>>   internally
>> - due to unknown reason (probably HW bug in HDMIPHY and/or the controller) a
>>   transfer fails to finish. The controller hangs after sending the last byte,
>>   the workaround for this bug is resetting the controller after each transfer
>>
>> Signed-off-by: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Tested-by: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/i2c/samsung-i2c.txt        |   10 ++++-
>>  drivers/i2c/busses/i2c-s3c2410.c                   |   36 ++++++++++++++++++++
>>  2 files changed, 44 insertions(+), 2 deletions(-)
>>
> [snip]
>> @@ -871,6 +896,14 @@ s3c24xx_i2c_parse_dt(struct device_node *np, struct s3c24xx_i2c *i2c)
>>  		return;
>>  
>>  	pdata->bus_num = -1; /* i2c bus number is dynamically assigned */
>> +
>> +	if (s3c24xx_i2c_is_type(i2c, TYPE_S3C2440) &&
> 
> I think that type checking should be removed because hdmiphy quirk is something
> orthogonal to the controller type.


Ok, I'll drop this test and resend patch in a minute.

Thanks!
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
