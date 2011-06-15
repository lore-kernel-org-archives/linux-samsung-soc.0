From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RE-SEND] [PATCH 3/4] s3c-fb: Add support EXYNOS4 FIMD
Date: Wed, 15 Jun 2011 10:01:29 +0200
Message-ID: <4DF866D9.7090406@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
 <1307693723-14971-4-git-send-email-anand.kn@samsung.com>
 <4DF39A92.5050609@gmail.com>
 <BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14601 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752201Ab1FOIBe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 04:01:34 -0400
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LMT0095XNMIJH@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 Jun 2011 09:01:31 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMT00C4LNMH9J@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 15 Jun 2011 09:01:30 +0100 (BST)
In-reply-to: <BANLkTinuAnaoo2hA6MLBDncXxXtL8NO2pg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Sylwester Nawrocki <snjw23@gmail.com>, Anand Kumar N <anand.kn@samsung.com>, lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, linux@arm.linux.org.uk

Hi Thomas,

On 06/15/2011 08:14 AM, Thomas Abraham wrote:
> Hi Sylwester,
> 
> On 11 June 2011 22:10, Sylwester Nawrocki <snjw23@gmail.com> wrote:
>> Hello,
>>
>> On 06/10/2011 10:15 AM, Anand Kumar N wrote:
>>> From: Jonghun Han<jonghun.han@samsung.com>
>>>
>>> This patch adds struct s3c_fb_driverdata s3c_fb_data_exynos4 for EXYNOS4.
>>> The clk_type is added to distinguish clock type in it and lcd_clk is added
>>> in structure s3c_fb to calculate divider for lcd panel.
> 
> <snip>
> 
>>> +     default:
>>> +             dev_err(dev, "failed to enable clock for FIMD\n");
>>>               goto err_sfb;
>>>       }
>>
>> I'm not really a clock expert, but IMHO there is an issue in Thomas'
>> migration to clkdev proposal [1] that the device clock connection ids
>> (con_id) and clock names related to them are identical. Mostly it works
>> but in situation like this one it is not possible to remap two clocks
>> of different names onto a single connection id.
>>
>> For instance, looking at arch/arm/mach-omap2/clock3xxx_data.c:
>>
>> static struct clk i2c3_fck = {
>>        .name           = "i2c3_fck",
>>                           ^^^^^^^^^^
>>        .ops            = &clkops_omap2_dflt_wait,
>>        .parent         = &core_96m_fck,
>>        ...
>> };
>> static struct clk i2c2_fck = {
>>        .name           = "i2c2_fck",
>>                          ^^^^^^^^^^^
>>        .ops            = &clkops_omap2_dflt_wait,
>>        ...
>> };
>>
>> static struct omap_clk omap3xxx_clks[] = {
>>        ...
>>        CLK("omap_i2c.3", "fck", &i2c3_fck, CK_3XXX),
>>                          ^^^^^^^^^^^^^^^^^
>>        CLK("omap_i2c.2", "fck", &i2c2_fck, CK_3XXX),
>>                          ^^^^^^^^^^^^^^^^^
>>        ...
>>
>> Different clock names (i2c3_fck, i2c3_fck,..) are mapped to single
>> unified id (fck), which the driver only needs to care about.
>> The name is common across H/W instances and also SoC variants.
>> So it doesn't have to be driver's business to resolve clock differences.
>>
>> The same (con_id) name can be used on distinct SoC version providing
>> similar/same peripheral device IP.
>> It's aeasy to figure out by just comparing omap3xxx_clks[] and
>> omap44xx_clks arrays.
> 
> Sorry, I am not quite sure if I understand the problem here. For
> instance, all Samsung SoC's and each instance of i2c device in a SoC,
> use the same con_id for the i2c 'struct clock' instance. The con_id is
> 'i2c'. The i2c driver uses the con_id 'i2c' to lookup the 'struct
> clock' instance and it works for all Samsung SoC's and all instances
> of i2c device in the SoC.
> 
> Is your point different than what I understand? Please help.

I appreciate your efforts in converting all Samsung platforms to clkdev.

With the above I2C example I was trying to illustrate the additional
level of indirection that is present in case of OMAP clock mappings,
comparing to your implementation.
As long as IP clock names are same among various SoC there is no issue
at all with your clk lookup approach.
But this is already not the case with LCD controller IP. 
On S3C series the IP bus clock name is "lcd" while on S5P series it's "fimd".
There is a common framebuffer driver for S3C and S5P SoCs.
It just does not look right to me to be adding in the driver switch/case
for the clock names. I thought clkdev is meant to resolve such differences.

Then how it would be possible to map those clocks into single con_id with 
your patches? E.g.
 
S3C clk | S5P  clk | con_id
---------------------------
 "lcd"  | "fimd"   | "lcd" ?

I believe there will come more differences like that in the future.

Regards,
Sylwester
 
> Thanks,
> Thomas.
>>
>> That said I wouldn't go for a "devname" in struct clk, just create
>> an additional table matching device names, con_id and struct clk and
>> use it while registering clk_lookup items into clkdev.
...
>> [1] http://www.spinics.net/lists/arm-kernel/msg127901.html
>>    http://www.spinics.net/lists/arm-kernel/msg127907.html
