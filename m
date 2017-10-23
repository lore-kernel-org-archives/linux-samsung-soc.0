From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/2] extcon: max77843: Add OTG power control to the
 MUIC driver
Date: Mon, 23 Oct 2017 16:43:40 +0100
Message-ID: <20171023154340.z2vmkbfoey2xtgks@dell>
References: <20171018095622.23738-1-m.szyprowski@samsung.com>
 <CGME20171018095630eucas1p263041d2da8d87aef67162fc13a01affb@eucas1p2.samsung.com>
 <20171018095622.23738-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:56078 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932141AbdJWPnx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 11:43:53 -0400
Received: by mail-wm0-f66.google.com with SMTP id u138so10723688wmu.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Oct 2017 08:43:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20171018095622.23738-2-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, 18 Oct 2017, Marek Szyprowski wrote:

> Enabling power on VBUS micro-usb pin is required only when passive OTG
> cable is connected. Initially OTG VBUS power control was planned to be
> done in charger driver. However such information is not really available
> from the extcon notifications, so VBUS power control has to be done
> directly in MUIC driver, which has all information about the attached
> accessory.
> 
> For example SmartDock is externally powered accessory, provides OTG
> (USB HOST) functionality and use VBUS pin for charging a device battery,
> so the VBUS charging pump should be disabled in such case.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  drivers/extcon/extcon-max77843.c     | 16 ++++++++++++++++

>  include/linux/mfd/max77843-private.h |  3 +++

Applied, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
