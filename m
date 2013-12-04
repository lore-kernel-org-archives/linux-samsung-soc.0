From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RFC 1/4] phy: Add new Exynos5 USB 3.0 PHY driver
Date: Wed, 4 Dec 2013 19:58:44 +0530
Message-ID: <529F3C1C.2050509@ti.com>
References: <1383205544-32244-1-git-send-email-gautam.vivek@samsung.com>	<1383205544-32244-2-git-send-email-gautam.vivek@samsung.com>	<527744B2.4090303@ti.com>	<030d01ced946$d6e23490$84a69db0$%debski@samsung.com>	<52779D28.9000905@ti.com>	<CAFp+6iH7vQ-OtMFL4pyr4tFDRchH4oh1Z0753WNgrHiUzj+kzw@mail.gmail.com>	<00fe01ceda0a$941957a0$bc4c06e0$%debski@samsung.com>	<000001ceda17$f41c2030$dc546090$%han@samsung.com>	<000101ceda1f$04ca6f20$0e5f4d60$%han@samsung.com>	<CAFp+6iFAZab35F-MOOZHcHpzSEOL=51gWBK2KZbOJS+0731GJQ@mail.gmail.com>	<000301ceda84$1d648bf0$582da3d0$%han@samsung.com>	<5280BB65.5040305@ti.com>	<CAFp+6iGKpzOHjwnSMvSgTehzPLQMB8madoYqMk5JPSAZfSGSTg@mail.gmail.com>	<528C7B0E.3080401@ti.com> <CAFp+6iF3UnV-w2pYQE2THQZBGma8xpp6pqSuwXzjUN3emJnftQ@mail.gmail.com> <528CD8EC.9050403@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528CD8EC.9050403-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vivek,

On Wednesday 20 November 2013 09:14 PM, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Wednesday 20 November 2013 03:02 PM, Vivek Gautam wrote:
>> On Wed, Nov 20, 2013 at 2:34 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>>> On Wednesday 20 November 2013 02:27 PM, Vivek Gautam wrote:
>>>> Hi Kishon,
>>>>
>>>>
>>>> On Mon, Nov 11, 2013 at 4:41 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>>>>> Hi,
>>>> sorry for the delayed response.
>>>>
>>>>>
>>>>> On Wednesday 06 November 2013 05:37 AM, Jingoo Han wrote:
>>>>>> On Wednesday, November 06, 2013 2:58 AM, Vivek Gautam wrote:
>>>>>>> On Tue, Nov 5, 2013 at 5:33 PM, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>>>
>>>>>> [.....]
>>>>>>
>>>>>>>> USB3.0 PHY consists of two blocks such as 3.0 block and 2.0 block.
>>>>>>>> This USB3.0 PHY can support UTMI+ and PIPE3 interface for 3.0 block
>>>>>>>> and 2.0 block, respectively.
>>>>>>>>
>>>>>>>> Conclusion:
>>>>>>>>
>>>>>>>>    1) USB2.0 PHY: USB2.0 HOST, USB2.0 Device
>>>>>>>>                        Base address: 0x1213 0000
>>>>>>>>
>>>>>>>>    2) USB3.0 PHY: USB3.0 DRD (3.0 HOST & 3.0 Device)
>>>>>>>>                        Base address: 0x1210 0000
>>>>>>>>                        2.0 block(UTMI+) & 3.0 block(PIPE3)
>>>>>>>
>>>>>>> And this is of course the PHY used by DWC3 controller, which works at
>>>>>>> both High speed as well as Super Speed.
>>>>>>> Right ?
>>>>>>
>>>>>> Right.
>>>>>>
>>>>>> While 3.0 block(PIPE3) can be used for Super Speed, 2.0 block(UTMI+)
>>>>>> can be used for High speed.
>>>>>
>>>>> It should then come under *single IP muliple PHY* category similar to what
>>>>> Sylwester has done.
>>>>
>>>> Do you mean that i should be including PHY IDs for UTMI+ phy and PIPE3
>>>> phy present in this PHY block ?
>>>> AFAICS the two phys (UTMI+ and PIPE3) do not really have separate
>>>> registers to program, and that's the reason
>>>> we program the entire PHY in a shot.
>>>
>>> you mean you program the same set of bits for UTMI+ and PIPE3?
>>
>> No, looking closely into PHY datasheet as well as Exynos5250 manual, i
>> can see that UTMI+ and PIPE3
>> phys have separate bit settings. So i think we should be able to
>> segregate the two PHYs (UTMI+ and PIPE3).
>> Pardon me for my earlier observations.
> 
> no problem..
>> Let me clarify more with our h/w team also on this and then i will
>> confirm with this.

Did you get more information on this?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
