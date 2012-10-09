From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH 2/5] ARM: S3C64XX: Add phy_type to pmu_isolation
Date: Tue, 9 Oct 2012 18:05:33 +0530
Message-ID: <CAFp+6iGGH2-Ln2Cx2EKLtN+bz3zs18dEhEQf0zuGxLrCH+eLug@mail.gmail.com>
References: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
	<1349705548-15207-3-git-send-email-gautam.vivek@samsung.com>
	<5073B743.9000200@ti.com>
	<CAFp+6iE6Er088dYwp8q7uQuZhw9bdYbJXQDbJp66W6tD7+C-Xw@mail.gmail.com>
	<004901cda60e$f3a45ac0$daed1040$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:45746 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889Ab2JIMff (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Oct 2012 08:35:35 -0400
In-Reply-To: <004901cda60e$f3a45ac0$daed1040$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: kishon <kishon@ti.com>, Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, balbi@ti.com, rob.herring@calxeda.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, p.paneri@samsung.com, yulgon.kim@samsung.com

Hi,

On Tue, Oct 9, 2012 at 4:42 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Tuesday, October 09, 2012 7:51 PM Vivek Gautam wrote
>>
>> Hi Kishon,
>>
>> Firstly, thanks for the quick review.
>>
>> On Tue, Oct 9, 2012 at 11:03 AM, kishon <kishon@ti.com> wrote:
>> > Hi,
>> >
>> >
>> > On Monday 08 October 2012 07:42 PM, Vivek Gautam wrote:
>> >>
>> >> It adds 'type' argument to pmu_isolation function, aligning
>> >> with other platforms, which keeps track of usbphy_type.
>> >>
>> >> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>> >> ---
>> >>   arch/arm/mach-s3c64xx/setup-usb-phy.c |    2 +-
>> >>   1 files changed, 1 insertions(+), 1 deletions(-)
>> >>
>> >> diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> >> b/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> >> index 3aee778..b7d1d95 100644
>> >> --- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> >> +++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> >> @@ -13,7 +13,7 @@
>> >>   #include <mach/map.h>
>> >>   #include <mach/regs-sys.h>
>> >>
>> >> -void s5p_usb_phy_pmu_isolation(int on)
>> >> +void s5p_usb_phy_pmu_isolation(int on, int type)
>> >
>> >
>> > IMO, this patch should have been squashed with the previous patch. IIUC, you
>> > have changed the call to this function for taking two arguments in your
>> > previous patch. Wouldn't that introduce compilation break after applying
>> > your first patch?
>> Yes, that's right it will introduce compilation break, my fault.
>> Just one querry, will it be good to put this arch change in [patch 1/5]?
>> and then can i move similar change in [patch 3/5] as given below again
>> in [patch 1/5]?
>
> In my opinion, it would be better.
> This is because it can prevent build errors.
>
Sure, I shall update this in the next patchset.
>
> Best regards,
> Jingoo Han
>
>>
>> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c
>> b/arch/arm/mach-exynos/setup-usb-phy.c
>> index 1c62d20..039d246 100644
>> --- a/arch/arm/mach-exynos/setup-usb-phy.c
>> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
>> @@ -222,15 +226,40 @@ int s5p_usb_phy_exit(struct platform_device
>> *pdev, int type)
>>         return -EINVAL;
>>  }
>>
>> -void s5p_usb_phy_pmu_isolation(int on)
>> +void s5p_usb_phy_pmu_isolation(int on, int type)
>>
>> >
>> > Thanks
>> > Kishon
>> >
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>> Best regards
>> Vivek
>

Thanks
Vivek
