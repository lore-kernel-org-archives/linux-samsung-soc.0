From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Tue, 22 Jan 2013 09:49:39 +0100
Message-ID: <50FE52A3.8030807@samsung.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
 <20121215072014.2E05E3E0AE3@localhost>
 <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
 <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
 <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
 <016901cde163$6be034c0$43a09e40$@samsung.com>
 <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
 <50DB811A.8010408@gmail.com> <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Sylwester Nawrocki' <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Vivek Gautam' <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Doug Anderson' <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01/22/2013 06:35 AM, Kukjin Kim wrote:
>>>>> -     { .compatible = "samsung,exynos-dwc3" },
>>>>> +     { .compatible = "samsung,synopsis-dwc3" },
>>>>>
>>>>> Or if any version or something, how about following?
>>>>>
>>>>> +     { .compatible = "samsung,dwc-v3" },
>>>>>
>>> Well, yes the newer SoCs with same IP using the chip name can cause some
>>> confusion, but won't it be fine that -
>>> "Newer parts using the same core can claim compatibility by
>>> including the older string in the compatible list" - as quoted by Grant
> Likely
>>>
>>> Or, can we try another option, using multiple compatible strings for
>>> SoC specific
>>> in of_match_table, so that we don't create any confusion by using same
>>> compatible for newer SoCs also. Like,
>>>
>>> -     { .compatible = "samsung,exynos-dwc3" },
>>> +     { .compatible = "samsung,exynos5250-dwc3" },
>>> +     { .compatible =<new SoC using same IP>  },
>>
>> Yes, why not just use an SoC name where given IP first appeared ? I
> believe
>> IP revision numbers are not always well documented. Also when an IP is
>> instantiated multiple times in specific SoC, its revision number might not
>> be sufficient to determine the system integration details for each
> instance.
>> I think having version for some devices and SoC name for others just adds
>> to the confusion. Thus using specific chip name in the compatible property
>> seems more clear to me.
>>
> Well, I don't think so. Let's see the DMAC PL330. Its compatible is
> "arm,pl330" and "arm,primecell" not SoC/Chip name. I think DWC is a same
> case or at least similar.
> 
> You know, the DWC is a IP from Synopsis and I _Believe_ it has a kind of
> version and it can be used for identify.

That's a good point, but isn't DesignWare just a name of a family of IP
cores from Synopsys [1] ? And what would DWC be supposed to signify ?
DesignWare Controller ? Wouldn't that be too generic ? Synopsys seems
to offer multiple different controllers and any of them could eventually
end up in a specific SoC [2].

Maybe the compatible property should be something like:

compatible = "samsung,exynos5250-dwc-3", "synopsys,dw-usb-3";
or
compatible = "samsung,exynos5250-usb3", "synopsys,dw-ss-usb3";

? Or anything more specific in the synopsys part to indicate which
exactly USB controller IP is used ?

[1] http://www.synopsys.com/IP/InterfaceIP/USB/Pages/default.aspx
[2] http://www.synopsys.com/IP/InterfaceIP/Pages/default.aspx

--

Regards,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
