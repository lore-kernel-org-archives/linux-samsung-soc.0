From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 3/5] usb: phy: samsung: remove old USB 2.0 PHY driver
Date: Thu, 21 Aug 2014 14:11:09 +0900
Message-ID: <008601cfbcfe$51a70890$f4f519b0$%han@samsung.com>
References: <1408026327-31437-1-git-send-email-b.zolnierkie@samsung.com>
 <1408026327-31437-4-git-send-email-b.zolnierkie@samsung.com>
 <34FCC3B2EE8F481198CEF3037F168FB3@sisodomain.com>
 <3463371.y41zGdSnsX@amdc1032> <53F1E1EA.8060708@gmail.com>
 <CAFp+6iGtMUEncFwJ=B_p=q8Bs_O9EMyjsL+ZP9PveO=VMrLmpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAFp+6iGtMUEncFwJ=B_p=q8Bs_O9EMyjsL+ZP9PveO=VMrLmpA@mail.gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Felipe Balbi' <balbi@ti.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Kamil Debski' <k.debski@samsung.com>, 'Mark Brown' <broonie@linaro.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, August 21, 2014 1:31 PM, Vivek Gautam wrote:
> On Mon, Aug 18, 2014 at 4:52 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> > On 18.08.2014 13:02, Bartlomiej Zolnierkiewicz wrote:
> >> On Thursday, August 14, 2014 08:07:40 PM Vivek Gautam wrote:
> >>> On Thursday, August 14, 2014 7:55 PM, Bartlomiej Zolnierkiewicz
> >>> <b.zolnierkie@samsung.com> wrote
> >>
> >>> There's one thing that I would want to comment here, since we don't have any
> >>> new usb-phy driver for S3C64XX,
> >>> so we can't simply remove this entire driver.
> >>> I have posted my patch-series [1], which does cleanup while keeping the
> >>> support for S3C64XX.
> >>
> >> AFAIK S3C64XX code from drivers/usb/phy/phy-samsung-usb2.c has
> >> never been used as this platform still uses its own code from
> >> arch/arm/mach-s3c64xx/setup-usb-phy.c (there are no users in
> >> the kernel tree of either s3c64xx-usb2phy platform device or
> >> "samsung,s3c64xx-usb2phy" DT compatible) .  Therefore I think
> >> that the entire drivers/usb/phy/phy-samsung-usb2.c driver
> >> should be removed (somebody with the hardware can as well add
> >> S3C64XX support to the new drivers/phy/phy-samsung-usb2.c
> >> driver and port the platform to use it).
> >>
> >
> > I agree with removal of this driver. As Bart said, it is not used for
> > S3C64xx at all. The platform was supposed to be moved to this driver,
> > but that never happened.

Yes, right. As far as I know, you're right.

> > In fact, I already have a patch adding support
> > for S3C64xx to the new driver.

Good!

> 
> Cool then, lets remove this driver completely and use the new generic
> PHY based driver
> once that comes (from Tomasz).

I agree with this opinion.

> 
> I shall drop the patches for cleaning up the usb-phy drivers from my series.

Best regards,
Jingoo Han
