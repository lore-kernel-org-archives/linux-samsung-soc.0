From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH v3] phy: Add new Exynos5 USB 3.0 PHY driver
Date: Mon, 17 Feb 2014 15:31:41 +0530
Message-ID: <CAFp+6iF+-C0KgRW9EXPxEeKnkWOjp2UueAGeSUUqs6coAftgFQ@mail.gmail.com>
References: <1386151747-3209-2-git-send-email-gautam.vivek@samsung.com>
	<1390225363-24210-1-git-send-email-gautam.vivek@samsung.com>
	<52F39710.80101@samsung.com>
	<CAFp+6iFYoN1w_BX7mMEa-Xx5ADaPTTKeDzjsSbQmwVKdSEsmOw@mail.gmail.com>
	<52FE3A91.1090107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52FE3A91.1090107@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, kishon <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Julius Werner <jwerner@chromium.org>, Jingoo Han <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,


On Fri, Feb 14, 2014 at 9:17 PM, Tomasz Figa <t.figa@samsung.com> wrote:

mistakenly didn't do "Reply All", so sending it again.

> Hi Vivek,
>
>
> On 14.02.2014 14:53, Vivek Gautam wrote:
>>>>
>>>> Changes from v2:
>>>> 1) Added support for multiple PHYs (UTMI+ and PIPE3) and
>>>>      related changes in the driver structuring.
>>>
>>>
>>>
>>> I'm a bit skeptical about this separation. Can the PHY operate with just
>>> the
>>> UTMI+ or PIPE3 part enabled alone without the other? Can any PHY consumer
>>> operate this way?
>>
>>
>> Yes :-)
>> As also pointed by Kishon the PHY consumer (which is DWC3 in case of
>> Exynos5 SoC series)
>> should theoretically be able use either UTMI+ phy for High speed
>> operations or both (UTMI+ and PIPE3)
>> for Super Speed operations.
>
>
> OK, that's fine then. This is the explanation I needed, thanks.
>
>
>>>
>>> I believe the right thing to do here is to do all the initialization in
>>> .power_on() and let the driver simply call phy_power_on() when it needs
>>> the
>>> PHY and phy_power_off() otherwise.
>>
>>
>> If this is what we should be doing then what will be the purpose of
>> two separate APIs :
>> phy_power_on() and phy_init().
>> Am i missing while understanding the things.
>>
>
> I don't understand this separation as well. Operations that should be done
> together shouldn't be separated. Is there any case when you can call one of
> phy_power_on() and phy_init() without calling another one right before/after
> it?

Most of the PHY consumers need to call phy_power_on() as well as phy_init()
to get PHY working (if the PHY provider gives callback to both).
I think the idea would have been to separate out the initialization
related and power related
jobs (which may include setting up the PMUs and may be regulators ?)
But, i think it's true, if the PHY provider callback for both
phy_power_on() and phy_init()
then the consumer __has__ to call both to get things working.



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
