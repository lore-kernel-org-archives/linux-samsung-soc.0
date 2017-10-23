From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] extcon: max77843: Add support for SmartDock
 accessory
Date: Mon, 23 Oct 2017 16:46:27 +0100
Message-ID: <20171023154627.zizsfbhkfn5lvau4@dell>
References: <20171018095622.23738-1-m.szyprowski@samsung.com>
 <CGME20171018095631eucas1p1238fdd6c4180f5c753fa20c4aac7b821@eucas1p1.samsung.com>
 <20171018095622.23738-3-m.szyprowski@samsung.com>
 <20171023154414.44rtitbjpp7thb2u@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171023154414.44rtitbjpp7thb2u@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 23 Oct 2017, Lee Jones wrote:

> On Wed, 18 Oct 2017, Marek Szyprowski wrote:
> 
> > SmartDock uses ADC_RESERVED_ACC_3 (0x10) ADC ID type and provides following
> > features:
> > 1. USB host with embedded USB hub (2-4 ports) for mice, keyboard, etc,
> > 2. MHL for video output,
> > 3. charging.
> > 
> > Tested with Unitek Y-2165 MHL+OTG Hub Smart Phone Dock.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > ---
> >  drivers/extcon/extcon-max77843.c     | 77 +++++++++++++++++++++++++++++-------
> 
> >  include/linux/mfd/max77843-private.h |  2 +
> 
> Applied, thanks.

Sorry, wrong key combo:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
