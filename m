From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add MFC device tree support
Date: Wed, 05 Sep 2012 11:42:44 +0900
Message-ID: <5046BC24.8010704@samsung.com>
References: <31269552.67881346148504997.JavaMail.weblogic@epml04>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46272 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751216Ab2IECmz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 22:42:55 -0400
Received: from eusync2.samsung.com (mailout3.w1.samsung.com [210.118.77.13])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9U00HWPVKCXI20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 03:43:24 +0100 (BST)
Received: from [10.0.2.15] ([10.90.7.33])
 by eusync2.samsung.com (Oracle Communications Messaging Server 7u4-23.01
 (7.0.4.23.0) 64bit (built Aug 10 2011))
 with ESMTPA id <0M9U00AFRVJDGZ60@eusync2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 03:42:53 +0100 (BST)
In-reply-to: <31269552.67881346148504997.JavaMail.weblogic@epml04>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arun.kk@samsung.com
Cc: Thomas Abraham <thomas.abraham@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>, SUNIL JOSHI <joshi@samsung.com>

On 08/28/2012 07:08 PM, Arun Kumar K wrote:

> Hi Karol,
> Thanks for your comments. 
> Please find my response inline.

Hi... and sorry for so much delayed response.

>>> +
>>> +static void __init exynos5_reserve(void)
>>> +{
>>> +     s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
>>
>>
>> I think it would make sense to make this memory reservation dependent
>> on "mfc*" node being present in DTS.  It's to early to use of_* functions
>> (because tree is not populated at this stage) but fdt_* family of functions
>> work just fine.
>>
> 
> As I can see the fdt_* functions are not used in any of the ARM based SoC
> init codes. Though I can see some references in powerpc.
> The implementation and includes are present in arch/arm/boot/compressed/
> which I think cannot be used directly in mach-exynos unless we make some
> comon makefile changes. 


It looks like I was writing from memory, and I actually mixed things 
up.  To be clear this time - we can't use regular device tree handling
functions in reserve() as it's too early.  Namely, flattened device tree
is not yet converted to kernel's-natural representation.  However, 
I think we can scan fdt just fine.  To do so one just needs to use
functions declared here

  #include <linux/of_fdt.h>

Actual architecture-independent code is in drivers/of/fdt.c.  This
provides of_fdt_ family of functions. Please see below for example.


> Please clarify whether its ok to use fdt_* functions to parse the dts in 
> exynos machine init or please point me to some sample implementations
> which I can refer to.


It should be ok to use anything that works on flattened device tree
rather than its uncompressed version.  I've experimented a bit and
something like this worked for me just fine (it was around 3.3-kernel
timeframe, but I don't think that fdt api has changed):

[mach-exynos4-dt.c]

#include <linux/of_fdt.h>

int fdt_find_compat(unsigned long node, const char *uname, int depth, void *data)
{
        if (of_flat_dt_is_compatible(node, (char *)data))
                return 1;

        return 0;
}

static void __init exynos4210_dt_reserve(void)
{
        /* Reserve memory for MFC only if it's available */
        if (of_scan_flat_dt(fdt_find_compat, "samsung,s5pv210-mfc")) {
                printk(KERN_NOTICE "exynos4-dt: mfc device node found - setting up memory area for dma\n");
                s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
        }
}

[.dts]

 codec@some-addr {
      compatible = "samsung,s5pv210-mfc";
 };


So, in above code fragment I just check if mfc was defined in dts.
This could probably stay as it is.

Then I allocate _predefined_ region - and this part should be fixed.

If you have nodes like "mfc-r-size"/offset, then you could just get
this information directly from (f)dt rather than hardcoding it in the code.
Precisely, after we find compatible node we could do something like
following (untested):

unsigned long lsize, loff, rsize, roff len;
__be32 *prop;

prop = of_get_flat_dt_prop(node, "samsung,mfc-l-size", &len);
if (!prop)
   return;
lsize = of_read_ulong(prop, len/4);
...

Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
