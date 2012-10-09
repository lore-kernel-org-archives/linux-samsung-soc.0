From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: S3C64XX: Add phy_type to pmu_isolation
Date: Tue, 9 Oct 2012 16:21:20 +0530
Message-ID: <CAFp+6iE6Er088dYwp8q7uQuZhw9bdYbJXQDbJp66W6tD7+C-Xw@mail.gmail.com>
References: <1349705548-15207-1-git-send-email-gautam.vivek@samsung.com>
	<1349705548-15207-3-git-send-email-gautam.vivek@samsung.com>
	<5073B743.9000200@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5073B743.9000200-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon <kishon-l0cyMroinI0@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kishon,

Firstly, thanks for the quick review.

On Tue, Oct 9, 2012 at 11:03 AM, kishon <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
>
> On Monday 08 October 2012 07:42 PM, Vivek Gautam wrote:
>>
>> It adds 'type' argument to pmu_isolation function, aligning
>> with other platforms, which keeps track of usbphy_type.
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   arch/arm/mach-s3c64xx/setup-usb-phy.c |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> b/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> index 3aee778..b7d1d95 100644
>> --- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> +++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
>> @@ -13,7 +13,7 @@
>>   #include <mach/map.h>
>>   #include <mach/regs-sys.h>
>>
>> -void s5p_usb_phy_pmu_isolation(int on)
>> +void s5p_usb_phy_pmu_isolation(int on, int type)
>
>
> IMO, this patch should have been squashed with the previous patch. IIUC, you
> have changed the call to this function for taking two arguments in your
> previous patch. Wouldn't that introduce compilation break after applying
> your first patch?
Yes, that's right it will introduce compilation break, my fault.
Just one querry, will it be good to put this arch change in [patch 1/5]?
and then can i move similar change in [patch 3/5] as given below again
in [patch 1/5]?

diff --git a/arch/arm/mach-exynos/setup-usb-phy.c
b/arch/arm/mach-exynos/setup-usb-phy.c
index 1c62d20..039d246 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -222,15 +226,40 @@ int s5p_usb_phy_exit(struct platform_device
*pdev, int type)
        return -EINVAL;
 }

-void s5p_usb_phy_pmu_isolation(int on)
+void s5p_usb_phy_pmu_isolation(int on, int type)

>
> Thanks
> Kishon
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Best regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
