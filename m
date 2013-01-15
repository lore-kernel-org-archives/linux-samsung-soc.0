From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Tue, 15 Jan 2013 13:58:59 +0530
Message-ID: <CAFp+6iG0WCx7HwiTPDWENRgM3M2FDUq2Bna4frgrNLUX04sTug@mail.gmail.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
	<20121215072014.2E05E3E0AE3@localhost>
	<CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
	<CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
	<CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
	<016901cde163$6be034c0$43a09e40$@samsung.com>
	<CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
	<50DB811A.8010408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50DB811A.8010408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 27, 2012 at 4:28 AM, Sylwester Nawrocki
<sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/24/2012 09:13 AM, Vivek Gautam wrote:
>>>>>
>>>>> These two changes look good to me.  For both of them:
>>>>>
>>>>> Reviewed-by: Doug Anderson<dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>
>>>>
>>>> Well, I have another idea. Yes, I know, specific chip name should be
>>>> used.
>>>
>>> But
>>>>
>>>> you know the specific chip name in compatible can cause another
>>>> confusion
>>>> on other SoC which has same IP. So I think, we need to consider to use
>>>> common name or any specific name not chip in compatible for IP/driver
>>>> like
>>>> following?
>>>>
>>>> -     { .compatible = "samsung,exynos-dwc3" },
>>>> +     { .compatible = "samsung,synopsis-dwc3" },
>>>>
>>>> Or if any version or something, how about following?
>>>>
>>>> +     { .compatible = "samsung,dwc-v3" },
>>>>
>> Well, yes the newer SoCs with same IP using the chip name can cause some
>> confusion, but won't it be fine that -
>> "Newer parts using the same core can claim compatibility by
>> including the older string in the compatible list" - as quoted by Grant
>> Likely
>>
>> Or, can we try another option, using multiple compatible strings for
>> SoC specific
>> in of_match_table, so that we don't create any confusion by using same
>> compatible for newer SoCs also. Like,
>>
>> -     { .compatible = "samsung,exynos-dwc3" },
>> +     { .compatible = "samsung,exynos5250-dwc3" },
>> +     { .compatible =<new SoC using same IP>  },
>
>
> Yes, why not just use an SoC name where given IP first appeared ? I believe
> IP revision numbers are not always well documented. Also when an IP is
> instantiated multiple times in specific SoC, its revision number might not
> be sufficient to determine the system integration details for each instance.
> I think having version for some devices and SoC name for others just adds
> to the confusion. Thus using specific chip name in the compatible property
> seems more clear to me.
>

Ping !!


-- 
Thanks & Regards
Vivek
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
