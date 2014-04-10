From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 1/5] phy: Add new Exynos5 USB 3.0 PHY driver
Date: Thu, 10 Apr 2014 17:09:56 +0530
Message-ID: <CAFp+6iHU0YXj18ajDwOqPh_SJWr6GkMPRr6qaGdmPoCc0+tz5g@mail.gmail.com>
References: <1396967803-28868-1-git-send-email-gautam.vivek@samsung.com>
	<1396967803-28868-2-git-send-email-gautam.vivek@samsung.com>
	<534529B2.2020107@samsung.com>
	<CAFp+6iEzaxCQNkGZWuBnAaAHk0uXrX4KhjVbaJfZFChB6uzk4A@mail.gmail.com>
	<53454C11.7060607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53454C11.7060607-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon <kishon-l0cyMroinI0@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Apr 9, 2014 at 7:03 PM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 09.04.2014 13:49, Vivek Gautam wrote:
>>
>> Hi,
>>
>>
>> On Wed, Apr 9, 2014 at 4:36 PM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>
>>> Hi Vivek,
>>>
>>> Please see my comments inline.
>>>
>>>
>>> On 08.04.2014 16:36, Vivek Gautam wrote:
>>>>
>>>>
>>>> Add a new driver for the USB 3.0 PHY on Exynos5 series of SoCs.
>>>> The new driver uses the generic PHY framework and will interact
>>>> with DWC3 controller present on Exynos5 series of SoCs.
>>>> Thereby, removing old phy-samsung-usb3 driver and related code
>>>> used untill now which was based on usb/phy framework.
>>>>
>>>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>> ---
>>>>    .../devicetree/bindings/phy/samsung-phy.txt        |   42 ++
>>>>    drivers/phy/Kconfig                                |   11 +
>>>>    drivers/phy/Makefile                               |    1 +
>>>>    drivers/phy/phy-exynos5-usbdrd.c                   |  668
>>>> ++++++++++++++++++++
>>>>    4 files changed, 722 insertions(+)
>>>>    create mode 100644 drivers/phy/phy-exynos5-usbdrd.c
>>>
>>>
>>>
>>> [snip]
>>>
>>>
>>>> +       Additional clock required for Exynos5420:
>>>> +       - usb30_sclk_100m: Additional special clock used for PHY
>>>> operation
>>>> +                          depicted as 'sclk_usbphy30' in CMU of
>>>> Exynos5420.
>>>
>>>
>>>
>>> Are you sure this isn't simply a gate for the ref clock, as it can be
>>> found
>>> on another SoC that is not upstream yet? I don't have documentation for
>>> Exynos 5420 so I can't tell, but I'd like to ask you to recheck this.
>>
>>
>>> From what i can see in the manual :
>>
>> sclk_usbphy30 is derived from OSCCLK.
>> It is coming from a MUX (default input line to this is OSCCLK)  and
>> then through a DIV
>> there's this gate.
>>
>>        {OSCCLK  + other sources} --->[MUX] ---> [DIV] --> [GATE for
>> sclk_usbphy30]
>>
>> the {rate of sclk_usbphy30} == OSCCLK
>>
>> However the 'ref' clock that we have been using is the actual oscillator
>> clock.
>> And on SoC Exynos5250, we don't have any such gate (sclk_usbphy30).
>> So should this mean that ref clock and sclk_usbphy30 are still be
>> controlled by
>> two different gates ?
>>
>
> Is there maybe a diagram of PHY input clocks in the datasheet, like for USB
> 2.0 PHY in Exynos4210/4412/5250 datasheets in the chapter about USB2.0
> Device? Something like:
>
>                      ____________________________________
>                     |                                    |
>                     |                         ___________|
> XusbXTI             |   Phy_fsel[2:0]        |  _______  |
>    _______[X]_______|    |         __________|_|___|\__|_|
>   |                 |   _v___     |  _____   ^ |   |/  | |
> _____               |  |     |    | |     |  | |  ___  | |
>  ___                |  |     |    | |     |  | | |   |_|_|
> |___|               |  | X 0 |____|_| PLL |__|_|_|CLK|_|_|
> _____               |  |     |      |     |    | |DIV|_|_|
>   |_______[X]       |  |_____| 12   |_____|480 | |___| | |
>                     |          MHz         MHz |Digital| |
> XusbXTO             |   USB PHY                |_______| |
>                     |____________________________________|
>
>

Below is the block diagram given for DRD controller.

___________________
|                                |
|      ____________     |
|      | PHY           |      |
|      | controller     |-----|-----------------------------------------------
|      |__________  |     |                                               |
|                                |
          |
|         USB 3.0           |                                              V
|           DRD              |
-----------------------
|        Controller          |                                      |
                     |
|                                |    USB30_SCLK_100M    | USB 3.0 DRD  |
|      ----------------          |           ----------------------->
|       PHY         |
|     | Link cont. |         |                                      |
                     |
|      -------------             |
 |                       |
|___________________|                                     |_____________|

Does this help ?

So, USB30_SCLK_100M is the SCLK that we are talking in the driver. I
don't see any reference to XXTI in the USB 3.0 DRD controller chapter
(in both Exynos5250 and 5420)
In addition to this there's one more point to be noticed here.
On Exynos5420 system, the sclk_usbphy300 (which is the sclk_usbphy30
for USB DRD channel 0), is also the PICO phy clock, i.e. USB 2.0 phy
clock.
So we should add a similar clk_get() for this clock in the
phy-exynos5250-usb2 driver too, to support Exynos5420.


>
> Best regards,
> Tomasz
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
