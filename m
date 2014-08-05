From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND] usb: ehci/ohci-exynos: Fix PHY getting sequence
Date: Tue, 05 Aug 2014 17:14:26 +0530
Message-ID: <4F887641414547418FB42327CF5E09DF@sisodomain.com>
References: <1407235148-31790-1-git-send-email-gautam.vivek@samsung.com>
 <000d01cfb09c$239a8670$6acf9350$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=iso-8859-1; reply-type=original
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <000d01cfb09c$239a8670$6acf9350$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jingoo,


On Tuesday, August 05, 2014 4:28 PM, Jingoo Han wrote:
> On Tuesday, August 05, 2014 7:39 PM, Vivek Gautam wrote:
>>
>> Since we want to keep support for both older usb-phys as well as the
>> newer generic phys, lets first get the generic PHYs and fallback to
>> older USB-PHYs only when we fail to get the former.
>> This should fix the issue with ehci-exynos and ohci-exynos, wherein
>> in the absence of SAMSUNG_USB2PHY config symbol, we end up getting
>> the NOP_USB_XCEIV phy when the same is enabled. And thus the PHYs
>> are not configured properly.
>>
>> Reported-by: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
>> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Right, we would get the generic PHYs first, then get the older
> usb-phys. Then, the older one will be removed from the kernel.

Right, I have a set of patches to remove the older phy support for Exynos 
SoC series,
keeping the support for S3C64XX, which I shall send soon.

[snip]

Thanks
Vivek Gautam 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
