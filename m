From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Wed, 23 Jan 2013 18:46:03 +0530
Message-ID: <CAFp+6iH7Jkc1ER6O4jUhMaLQ_hTJLNqXMb6tg85J+sbOY+OeMA@mail.gmail.com>
References: <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
	<CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
	<CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
	<016901cde163$6be034c0$43a09e40$@samsung.com>
	<CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
	<50DB811A.8010408@gmail.com>
	<054601cdf862$534a8ad0$f9dfa070$@samsung.com>
	<CAFp+6iGrp8b+T3n+xNha7jMFMgDsFR8E9zCijoUANZgmN4QL_A@mail.gmail.com>
	<20130122084817.GC16143@arwen.pp.htv.fi>
	<063e01cdf8ec$85e637c0$91b2a740$@samsung.com>
	<20130123095021.GB22054@arwen.pp.htv.fi>
	<CAFp+6iH2_18s=HwsLhekyUZW=yNCjZzskiA5s-ofrCbzDBGL4Q@mail.gmail.com>
	<50FFDA2B.4010506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50FFDA2B.4010506-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,


On Wed, Jan 23, 2013 at 6:10 PM, Sylwester Nawrocki
<s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi,
>
> On 01/23/2013 01:20 PM, Vivek Gautam wrote:
>>>>>> -     { .compatible = "samsung,exynos-dwc3" },
>>>>>> +     { .compatible = "samsung,synopsis-dwc3" }
>>>>>
>>>>> You're both missing a point here. The synopsys IP driver is called
>>>>> dwc3.ko and that's compatible with synopsys,dwc3. Your glue layer driver
>>>>> (dwc3-exynos.ko) is compatible with your platform, so
>>>>> samsung,exynos-dwc3 sounds correct to me.
>>>>>
>>>> Hmm...yeah, you're right and agreed.
>>>>
>>>> However, we need to use more clear name there like "samsung,exynos-dwusb3"
>>>> in compatible, because you know there are lots of other IPs in Synopsis
>>>> Design Ware brand. So we have to include usb in compatible for that.
>>>
>>> fair enough.
>>>
>>
>> Thanks for your suggestions. This definitely make things clear.
>> I shall then keep "samsung,exynos-dwusb3" as the compatible string or,
>> should i be including '5250' string as well, something like
>> "samsung,exynos5250-dwusb3"
>> as pointed out by Grant earlier ?  :-O
>
> IMHO this needs to be "samsung,exynos5250-dwusb3", rather than
> "samsung,exynos-dwusb3". :)
>

Alright, thanks.
I shall update this patch.  :)


-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
