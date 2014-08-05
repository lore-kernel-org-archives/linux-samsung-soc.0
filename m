From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH RESEND] usb: ehci/ohci-exynos: Fix PHY getting sequence
Date: Tue, 5 Aug 2014 17:05:19 +0530
Message-ID: <CAK5sBcGq1XzCkLz_f5q+5ik9shQSJ=pqzQkrtXbKzJFYfOUnPw@mail.gmail.com>
References: <1407235148-31790-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:45915 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751743AbaHELfW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Aug 2014 07:35:22 -0400
In-Reply-To: <1407235148-31790-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Jingoo Han <jg1.han@samsung.com>

Hi Vivek,

On Tue, Aug 5, 2014 at 4:09 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> Since we want to keep support for both older usb-phys as well as the
> newer generic phys, lets first get the generic PHYs and fallback to
> older USB-PHYs only when we fail to get the former.
> This should fix the issue with ehci-exynos and ohci-exynos, wherein
> in the absence of SAMSUNG_USB2PHY config symbol, we end up getting
> the NOP_USB_XCEIV phy when the same is enabled. And thus the PHYs
> are not configured properly.
>
> Reported-by: Sachin Kamat <sachin.kamat@samsung.com>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Jingoo Han <jg1.han@samsung.com>

Tested this patch on Exynos5250 based Arndale and Snow boards.
Fixes the said issue. Thanks.

Tested-by: Sachin Kamat <sachin.kamat@samsung.com>

-- 
Regards,
Sachin.
