From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/2] extcon: max77843: Add OTG power control to the
 MUIC driver
Date: Mon, 23 Oct 2017 16:46:54 +0100
Message-ID: <20171023154654.mzomcxhkk4zmcmr5@dell>
References: <20171018095622.23738-1-m.szyprowski@samsung.com>
 <CGME20171018095630eucas1p263041d2da8d87aef67162fc13a01affb@eucas1p2.samsung.com>
 <20171018095622.23738-2-m.szyprowski@samsung.com>
 <20171023154340.z2vmkbfoey2xtgks@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171023154340.z2vmkbfoey2xtgks@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 23 Oct 2017, Lee Jones wrote:

> On Wed, 18 Oct 2017, Marek Szyprowski wrote:
> 
> > Enabling power on VBUS micro-usb pin is required only when passive OTG
> > cable is connected. Initially OTG VBUS power control was planned to be
> > done in charger driver. However such information is not really available
> > from the extcon notifications, so VBUS power control has to be done
> > directly in MUIC driver, which has all information about the attached
> > accessory.
> > 
> > For example SmartDock is externally powered accessory, provides OTG
> > (USB HOST) functionality and use VBUS pin for charging a device battery,
> > so the VBUS charging pump should be disabled in such case.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > ---
> >  drivers/extcon/extcon-max77843.c     | 16 ++++++++++++++++
> 
> >  include/linux/mfd/max77843-private.h |  3 +++
> 
> Applied, thanks.

Sorry, wrong key combo:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
