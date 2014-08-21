From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 0/5] usb: phy: samsung: remove old USB PHY code
Date: Thu, 21 Aug 2014 14:20:19 +0900
Message-ID: <008a01cfbcff$994c98d0$cbe5ca70$%han@samsung.com>
References: <1408026327-31437-1-git-send-email-b.zolnierkie@samsung.com>
 <CAFp+6iG+BoE5O=EBxNOGPGU3Wws26xtQzzVx1HBhQ3R0SafiMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAFp+6iG+BoE5O=EBxNOGPGU3Wws26xtQzzVx1HBhQ3R0SafiMw@mail.gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Felipe Balbi' <balbi@ti.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Kamil Debski' <k.debski@samsung.com>, 'Mark Brown' <broonie@linaro.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, August 21, 2014 1:34 PM, Vivek Gautam wrote:
> On Thu, Aug 14, 2014 at 7:55 PM, Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com> wrote:
> > Hi,
> >
> > This patch series removes the old Samsung USB PHY drivers that
> > got replaced by the new ones using the generic PHY layer.
> >
> > Depends on:
> > - next-20140813 branch of linux-next kernel
> >
> > Best regards,
> > --
> > Bartlomiej Zolnierkiewicz
> > Samsung R&D Institute Poland
> > Samsung Electronics
> >
> >
> > Bartlomiej Zolnierkiewicz (5):
> >   ARM: dts: remove old USB2 PHY node hook for Arndale
> >   ARM: dts: remove old USB2 PHY node for Exynos5250
> >   usb: phy: samsung: remove old USB 2.0 PHY driver
> >   usb: phy: samsung: remove old USB 3.0 PHY driver
> >   usb: phy: samsung: remove old common USB PHY code
> 
> Reviewed-by: Vivek Gautam <gautam.vivek@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han
