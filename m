From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/4] ARM: EXYNOS: Update & move usb-phy types to
 generic include layer
Date: Fri, 21 Dec 2012 00:33:19 +0530
Message-ID: <CAFp+6iHcF44BWxq-1avHJM8BvU6c0oSMk=-SRTGHCLNT9-DwrQ@mail.gmail.com>
References: <1355841786-13307-1-git-send-email-gautam.vivek@samsung.com>
	<1355841786-13307-2-git-send-email-gautam.vivek@samsung.com>
	<CAD=FV=Ved4TSr7v413u5_o2cBrfegGrpKe1V2qKwQ36v-MQTHA@mail.gmail.com>
	<CAFp+6iEGhrSh+oFnv1s_Tqdzxh_nhy=NEhCetVF20KVehy3PLw@mail.gmail.com>
	<CAD=FV=UeAN103KVLb_z-oF8AXu7m00uZs6jw_BOHTz9RExK4SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=UeAN103KVLb_z-oF8AXu7m00uZs6jw_BOHTz9RExK4SA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Doug,

On Thu, Dec 20, 2012 at 10:23 PM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Vivek,
>
> On Wed, Dec 19, 2012 at 9:51 PM, Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Doug,
>>
>>
>> On Thu, Dec 20, 2012 at 3:18 AM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> Vivek,
>>>
>>> Since you're changing the name, I would have expected to see a removal
>>> of the old enum type in this patch.  I don't see it.  After applying
>>> all of your patches I find that S5P_USB_PHY_HOST and
>>> S5P_USB_PHY_DEVICE are still defined and used.
>>>
>>
>> True that we should have removed the earlier defined enums, infact i
>> did the same
>> in patchset v4 for this series. But since in this patchset i separated
>> out drivers and
>> architecture part, i thought it would be easier to remove them in one
>> shot in a latter commit
>> which will actually touch upon all architecture related code
>> (mach-exynos/setup-usb-phy.c,
>> mach-s5pv210/setup-usb-phy.c, and include/plat/usb-phy.h) once this
>> approach is accepted.
>>
>>> $ git grep S5P_USB_PHY_HOST
>>> arch/arm/mach-exynos/setup-usb-phy.c:   else if (type == S5P_USB_PHY_HOST)
>>> arch/arm/mach-exynos/setup-usb-phy.c:   else if (type == S5P_USB_PHY_HOST)
>>> arch/arm/plat-samsung/include/plat/usb-phy.h:   S5P_USB_PHY_HOST,
>>>
>>> I believe that those usages of the old enum should also be switched
>>> over and the old enum removed.
>>>
>> Sure, those enums need to be removed.
>> If you say i will submit a patch for the same.
>
> It would be nice to add it to the patch series in the next version.  Thanks!
>

Sure i shall add the same to the arch patches in the next version, or
if needed will send a separate patch for this.

> -Doug



-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
