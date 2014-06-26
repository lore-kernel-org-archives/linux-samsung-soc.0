From: Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Thu, 26 Jun 2014 14:23:25 +0530
Message-ID: <CAK5sBcG1cQNKd5=qSXM9D2Dde3ejmbYOX4BKaLwOETJOJx5+sA@mail.gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
	<CAFp+6iGOHu2pOcQu+BxVY7yAcchau92GQF7zPiDhRXZyh73YoA@mail.gmail.com>
	<CAK5sBcHL0f+UVFoyQT3O8m+NAv3rNjiq=aEH4xh9BV3tFbYcSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5sBcHL0f+UVFoyQT3O8m+NAv3rNjiq=aEH4xh9BV3tFbYcSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vivek,

On Thu, Jun 26, 2014 at 1:55 PM, Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Vivek,
>
> On Thu, Jun 26, 2014 at 1:39 PM, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> Hi Sachin,
>>
>>
>> On Thu, Jun 26, 2014 at 11:09 AM, Sachin Kamat <sachin.kamat-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>> EHCI and OHCI drivers on Exynos platforms do not work without their
>>> corresponding SoC specific phy drivers. Hence it makes no sense to
>>> keep these phy drivers as user selectable. Instead select them from
>>> the respective USB configs to make things easier for the end user.
>>> While at it enable 5250 phy for Exynos 5420 SoC too.
>
> <snip>
>
>>> +       select PHY_EXYNOS4210_USB2 if CPU_EXYNOS4210
>>> +       select PHY_EXYNOS4X12_USB2 if (SOC_EXYNOS4212 || SOC_EXYNOS4412)
>>> +       select PHY_EXYNOS5250_USB2 if (SOC_EXYNOS5250 || SOC_EXYNOS5420)
>>
>> also || SOC_EXYNOS5800
>> same controller present on Exynos5800 too.

Just checked that SOC_EXYNOS5800 is dependent on SOC_EXYNOS5420. Hence
explicit option for SOC_EXYNOS5800 is redundant here. Will keep it as is.

Regards,
Sachin.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
