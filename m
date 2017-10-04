From: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv2 0/2] dwc3 on XU3
Date: Wed, 04 Oct 2017 09:05:49 +0200
Message-ID: <6935498c-9788-14e6-844f-f9e8288026dc@samsung.com>
References: <ba580a0c-36c3-b227-61ee-97637532823e@ti.com>
        <CGME20171003125944eucas1p1fad23e6171786fda69ccd9419354911b@eucas1p1.samsung.com>
        <1507035578-24945-1-git-send-email-andrzej.p@samsung.com>
        <b9aad201-78b9-f04b-238d-5297e6096ee7@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <b9aad201-78b9-f04b-238d-5297e6096ee7-l0cyMroinI0@public.gmane.org>
Content-language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

W dniu 04.10.2017 o 06:22, Kishon Vijay Abraham I pisze:
> Hi,
> 

<snip>

>>
>> @Kishon:
>>
>> As far as I understand what you suggest is to move phy_init() and
>> phy_power_on() invocations from dwc3/core.c to xhci-plat, but,
>> to the best of my knowledge, they are needed in device mode, too.
> 
> What I meant is perform phy initializations for host mode in xhci and keep only
> device mode phy initialization in dwc3.
> 

Ah, I should have been more explicit.
Unfortunately, without phy initialization dwc3 registers are unavailable,
so it looks like it is really needed at the point it is done now.

Andrzej
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
