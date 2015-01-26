From: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add sd0_rst pinctrl node to exynos5420
Date: Mon, 26 Jan 2015 10:47:24 +0900
Message-ID: <54C59CAC.8020509@samsung.com>
References: <1422023038-11842-1-git-send-email-jh80.chung@samsung.com>
 <CABxcv=mJhHTBKes38+6kHi5o3RmBHHN6sVqBUDRc-YyNvkdESQ@mail.gmail.com>
 <1422028075.15395.92.camel@collabora.co.uk>
 <CABxcv=kARp8xLYCqf8dfdKd9ehs1u=qTEjkn1iujhN77ZjPdTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CABxcv=kARp8xLYCqf8dfdKd9ehs1u=qTEjkn1iujhN77ZjPdTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 01/24/2015 12:59 AM, Javier Martinez Canillas wrote:
> Hello Sjoerd,
> 
> On Fri, Jan 23, 2015 at 4:47 PM, Sjoerd Simons
> <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
>>>
>>> If this pin is used by the Odroid XU3 board, shouldn't be defined in
>>> the exynos5422-odroidxu3.dts instead?
>>
>> It's not just used by the XU3 though, it's also hooked up on the peach
>> pi chromebook for example and i would expect it to be hooked up on most
>> board with an eMMC
>>
>> This change is consistent with most of the special purpose GPIO pins
>> defined in that file, so i don't see the problem with including it in
>> that pinctrl file
> 
> In that case I completely agree that it should be defined in the .dtsi
> but that is not what the commit message said though :-)

I will resend the patch with obvious commit message.
Thanks for review.

Best Regards,
Jaehoon Chung

> 
> Best regards,
> Javier
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
