From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 4/4] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Thu, 1 Oct 2015 22:21:22 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290901DC383EFF@US01WEMBX2.internal.synopsys.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
 <1442830572-6765-5-git-send-email-m.szyprowski@samsung.com>
 <20151001155018.GC4469@saruman.tx.rr.com>
 <2B3535C5ECE8B5419E3ECBE30077290901DC383B31@US01WEMBX2.internal.synopsys.com>
 <20151001220355.GB32355@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>, John Youn <John.Youn@synopsys.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/1/2015 3:04 PM, Felipe Balbi wrote:
> On Thu, Oct 01, 2015 at 09:04:59PM +0000, John Youn wrote:
>> On 10/1/2015 8:50 AM, Felipe Balbi wrote:
>>> On Mon, Sep 21, 2015 at 12:16:12PM +0200, Marek Szyprowski wrote:
>>>> DWC2 module on some platforms needs three additional hardware
>>>> resources: phy controller, clock and power supply. All of them must be
>>>> enabled/activated to properly initialize and operate. This was initially
>>>> handled in s3c-hsotg driver, which has been converted to 'gadget' part
>>>> of dwc2 driver. Unfortunately, not all of this code got moved to common
>>>> platform code, what resulted in accessing DWC2 registers without
>>>> enabling low-level hardware resources. This fails for example on Exynos
>>>> SoCs. This patch moves all the code for managing those resources to
>>>> common platform.c file and provides convenient wrappers for controlling
>>>> them.
>>>>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> I just caught several build errors which this patch. I hope you can
>>> send me a follow-up fix (which I can amend to $subject) otherwise
>>> I'll have to drop this series
>>>
>>
>> I forgot that this was initially part of a larger
>> patch-set. Maybe that is causing issues? If this wasn't intended
>> to go through Felipe's tree then my bad.
>>
>> Also, I noticed this patch causes deadlock warnings with lockdep
>> enabled.
>>
>> Can you look into that also while you investigate this?
> 
> John, do you want me to drop the series meanwhile ? I can do that no problems.
> 

You can drop this one. I think leaving in patch 1-3 is fine as
they are small cleanup patches. Unless you or Marek prefer to
drop all of them.

Regards,
John
