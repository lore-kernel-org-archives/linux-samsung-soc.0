From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2 RESEND] usb: core: phy: add support for PHY
 calibration
Date: Thu, 29 Aug 2019 13:22:01 +0200
Message-ID: <20190829112201.GA23823@kroah.com>
References: <20190808094128.27213-1-m.szyprowski@samsung.com>
 <CGME20190808094146eucas1p2a5a88ce5e7a87d47c4bcececab4df9a5@eucas1p2.samsung.com>
 <20190808094128.27213-2-m.szyprowski@samsung.com>
 <a380a635-e036-1a18-bc0f-947931f8735c@samsung.com>
 <20190828204146.GA21235@kroah.com>
 <e801e7a4-f525-baae-4c02-d271db308b5f@samsung.com>
 <20190829102113.GA20823@kroah.com>
 <91b0a341-e561-43f5-3daa-c6aaf33e3287@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <91b0a341-e561-43f5-3daa-c6aaf33e3287@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Aug 29, 2019 at 12:27:34PM +0200, Marek Szyprowski wrote:
> Hi Greg,
> 
> On 2019-08-29 12:21, Greg Kroah-Hartman wrote:
> > On Thu, Aug 29, 2019 at 07:26:50AM +0200, Marek Szyprowski wrote:
> >> Hi Greg,
> >>
> >> On 2019-08-28 22:41, Greg Kroah-Hartman wrote:
> >>> On Mon, Aug 26, 2019 at 10:55:33AM +0200, Marek Szyprowski wrote:
> >>>> Hi Greg
> >>>>
> >>>> On 2019-08-08 11:41, Marek Szyprowski wrote:
> >>>>> Some PHYs (for example Exynos5 USB3.0 DRD PHY) require calibration to be
> >>>>> done after every USB HCD reset. Generic PHY framework has been already
> >>>>> extended with phy_calibrate() function in commit 36914111e682 ("drivers:
> >>>>> phy: add calibrate method"). This patch adds support for it to generic
> >>>>> PHY handling code in USB HCD core.
> >>>>>
> >>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>> Tested-by: Anand Moon <linux.amoon@gmail.com>
> >>>>> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> >>>> Greg: any chance to give it this a try in -next? If not, maybe You can
> >>>> point someone whose review will help?
> >>> Ah crap, this is me, not the PHY maintainer :(
> >>>
> >>> Can you resend this and I will be glad to review it.  But it would also
> >>> be good to get Felipe's review as well.
> >> No problem, I will resend it again in a few minutes. Felipe already
> >> acked it: https://lkml.org/lkml/2019/8/8/460
> > I don't see the resend, did I miss it?
> 
> I looks so: https://lkml.org/lkml/2019/8/29/31

Got it now, thanks.

greg k-h
