From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance
 to non-dt build
Date: Wed, 14 Sep 2011 23:26:49 +0530
Message-ID: <CAJuYYwRX20_qB69--dz2a9WrShN3hpUc_wSepdQ14D0Vr5QXoQ@mail.gmail.com>
References: <1315852165-32402-1-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-2-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-3-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-4-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-5-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-6-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-7-git-send-email-thomas.abraham@linaro.org>
	<20110914162633.GL3134@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:62591 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757221Ab1INR4u convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 13:56:50 -0400
Received: by gyg10 with SMTP id 10so1607425gyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 10:56:49 -0700 (PDT)
In-Reply-To: <20110914162633.GL3134@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>

Hi Grant,

On 14 September 2011 21:56, Grant Likely <grant.likely@secretlab.ca> wr=
ote:
> On Mon, Sep 12, 2011 at 11:59:25PM +0530, Thomas Abraham wrote:
>> The pl330 device instances and associated platform data is required =
only
>> for non-device-tree builds. With device tree enabled, the data about=
 the
>> platform is obtained from the device tree. For images that include b=
oth
>> dt and non-dt platforms, an addditional check is added to ensure tha=
t
>> static amba device registrations is applicable to only non-dt platfo=
rms.
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-exynos4/dma=
=2Ec
>> index c3c0d17..3203a31 100644
>> --- a/arch/arm/mach-exynos4/dma.c
>> +++ b/arch/arm/mach-exynos4/dma.c
>> @@ -24,6 +24,7 @@
>> =A0#include <linux/dma-mapping.h>
>> =A0#include <linux/amba/bus.h>
>> =A0#include <linux/amba/pl330.h>
>> +#include <linux/of.h>
>>
>> =A0#include <asm/irq.h>
>> =A0#include <plat/devs.h>
>> @@ -138,6 +139,11 @@ struct amba_device exynos4_device_pdma1 =3D {
>>
>> =A0static int __init exynos4_dma_init(void)
>> =A0{
>> +#ifdef CONFIG_OF
>> + =A0 =A0 if (of_have_populated_dt())
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> +#endif
>> +
>
> Drop the #ifdef. =A0of_have_populated_dt() has an empty stub for
> !CONFIG_OF. =A0Otherwise looks good to me. =A0Well done not breaking
> non-DT support when CONFIG_OF is enabled. =A0:-)

Ok. I will drop the #ifdef. Well, I actually learnt from you on not
breaking non-dt support because of your comments on my earlier patches
which did break non-dt support. Thanks.

>
> The other patches in this series look good to me too.
>
> g.

Thanks for your review. I will do the changes you have recommended for
the pl330 dt support patches and resubmit. I would like to add your
Ack to the patches when resubmitting.

Regards,
Thomas.
