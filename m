From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [RFC/PATCH 01/13] ARM: Samsung: Extend MIPI PHY callback with
 an index argument
Date: Thu, 26 Jul 2012 22:15:40 +0200
Message-ID: <5011A56C.6050503@gmail.com>
References: <4FBFE1EC.9060209@samsung.com> <1337975573-27117-1-git-send-email-s.nawrocki@samsung.com> <3148357.irbGOBJ73x@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <3148357.irbGOBJ73x@avalon>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Laurent,

On 07/26/2012 04:42 PM, Laurent Pinchart wrote:
> Hi Sylwester,
>
> On Friday 25 May 2012 21:52:40 Sylwester Nawrocki wrote:
>> For systems instantiated from device tree struct platform_device id
>> field is always -1, add an 'id' argument to the s5p_csis_phy_enable()
>> function so the MIPI-CSIS hardware instance index can be passed in
>> by driver, for CONFIG_OF=y.
>>
>> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>>   arch/arm/plat-s5p/setup-mipiphy.c              |   20 ++++++++------------
>>   arch/arm/plat-samsung/include/plat/mipi_csis.h |   10 ++++++----
>>   2 files changed, 14 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm/plat-s5p/setup-mipiphy.c
>> b/arch/arm/plat-s5p/setup-mipiphy.c index 683c466..146ecc3 100644
>> --- a/arch/arm/plat-s5p/setup-mipiphy.c
>> +++ b/arch/arm/plat-s5p/setup-mipiphy.c
>> @@ -14,24 +14,19 @@
>>   #include<linux/spinlock.h>
>>   #include<mach/regs-clock.h>
>>
>> -static int __s5p_mipi_phy_control(struct platform_device *pdev,
>> +static int __s5p_mipi_phy_control(struct platform_device *pdev, int id,
>>   				  bool on, u32 reset)
>
> What about removing the pdev argument, as it's now not needed ?

Indeed, it isn't useful any more. I'm not sure what I intended to
keep it for, perhaps just some sentimental reasons.. :)
Thanks for pointing out, I'll remove it in the next iteration.

--

Regards,
Sylwester
