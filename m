From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Thu, 1 Oct 2015 21:04:59 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290901DC383B31@US01WEMBX2.internal.synopsys.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
 <1442830572-6765-5-git-send-email-m.szyprowski@samsung.com>
 <20151001155018.GC4469@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/1/2015 8:50 AM, Felipe Balbi wrote:
> On Mon, Sep 21, 2015 at 12:16:12PM +0200, Marek Szyprowski wrote:
>> DWC2 module on some platforms needs three additional hardware
>> resources: phy controller, clock and power supply. All of them must be
>> enabled/activated to properly initialize and operate. This was initially
>> handled in s3c-hsotg driver, which has been converted to 'gadget' part
>> of dwc2 driver. Unfortunately, not all of this code got moved to common
>> platform code, what resulted in accessing DWC2 registers without
>> enabling low-level hardware resources. This fails for example on Exynos
>> SoCs. This patch moves all the code for managing those resources to
>> common platform.c file and provides convenient wrappers for controlling
>> them.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> 
> I just caught several build errors which this patch. I hope you can
> send me a follow-up fix (which I can amend to $subject) otherwise
> I'll have to drop this series
> 

I forgot that this was initially part of a larger
patch-set. Maybe that is causing issues? If this wasn't intended
to go through Felipe's tree then my bad.

Also, I noticed this patch causes deadlock warnings with lockdep
enabled.

Can you look into that also while you investigate this?

Regards,
John

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
