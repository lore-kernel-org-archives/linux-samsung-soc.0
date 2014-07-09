From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/2] phy: Kconfig: Re-organize Exynos USB 2.0 PHY configs
Date: Wed, 09 Jul 2014 13:07:31 +0900
Message-ID: <001701cf9b2b$4e228d60$ea67a820$%han@samsung.com>
References: <1404118582-21993-1-git-send-email-sachin.kamat@samsung.com>
 <53BC122C.9090505@samsung.com>
 <CAK5sBcHJeK5=LrYfBO5C4Ht1upLes2ynvofuhBo3_xYsxGO1=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27762 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbaGIEHd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 00:07:33 -0400
In-reply-to: <CAK5sBcHJeK5=LrYfBO5C4Ht1upLes2ynvofuhBo3_xYsxGO1=g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <spk.linux@gmail.com>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: 'open list' <linux-kernel@vger.kernel.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Doug Anderson' <dianders@chromium.org>, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, July 09, 2014 12:42 PM, Sachin Kamat wrote:
> On Tue, Jul 8, 2014 at 9:15 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> > On 30.06.2014 10:56, Sachin Kamat wrote:
> >> Since the USB 2.0 PHYs are required only with EHCI/OHCI USB drivers,
> >
> > That's not true. They are also required for USB gadget controller
> > supported by the DWC2 gadget driver (formerly s3c-hsotg). Otherwise the
> > change makes sense to me.
> 
> Do you propose I amend just the patch description or also add a dependency on
> USB_DWC2 along with EHCI and OHCI. I do not have anything to test this. Based
> on your input I will re-spin the patch.

I agree with Tomasz Figa's statement. Personally, I think that it would
be good to amend the commit message and add a dependency on USB_DWC2. :-)
Thank you.

Best regards,
Jingoo Han

> 
> --
> Regards,
> Sachin.
