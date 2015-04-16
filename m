From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: Don't enable PM runtime on the adapter
	device
Date: Thu, 16 Apr 2015 11:48:02 +0100
Message-ID: <20150416104802.GA3480@opensource.wolfsonmicro.com>
References: <1429179025-5352-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <552F8FE4.7040905@samsung.com> <552F916F.6070700@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <552F916F.6070700-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 16, 2015 at 12:39:43PM +0200, Lars-Peter Clausen wrote:
> On 04/16/2015 12:33 PM, Sylwester Nawrocki wrote:
>> On 16/04/15 12:10, Charles Keepax wrote:
>>> Commit 523c5b89640e ("i2c: Remove support for legacy PM") removed the PM
>>> ops from the bus type, which causes the pm operations on the s3c2410
>>> adapter device to fail (-ENOSUPP in rpm_callback). The adapter device
>>> doesn't get bound to a driver and as such can't have its own pm_runtime
>>> callbacks. Previously this was fine as the bus callbacks would have been
>>> used, but now this can cause devices which use PM runtime and are
>>> attached over I2C to fail to resume.
>>>
>>> This commit fixes this issue by just doing the PM operations directly on
>>> the I2C device, rather than the adapter device in the driver and adding
>>> some stub callbacks for runtime suspend and resume.
>>>
>>> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
>>> ---
>>>   drivers/i2c/busses/i2c-s3c2410.c |   21 ++++++++++++++++-----
>>>   1 files changed, 16 insertions(+), 5 deletions(-)
>>
>>> @@ -1253,7 +1253,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>>>   	platform_set_drvdata(pdev, i2c);
>>>
>>
>> Wouldn't adding
>>
>> 	pm_runtime_no_callbacks(&pdev->dev);
>>
>> here let us avoid the runtime resume/suspend stubs?
>
> Or just do pm_runtime_no_callbacks on the adapter device. Preferably in 
> the I2C core. That should solve the issue without requiring any other 
> changes.
>
> - Lars

Ooops... missed that function, yeah that looks like a much better
option.

Thanks,
Charles
