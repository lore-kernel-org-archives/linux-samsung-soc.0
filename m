From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH v4 5/9] usb: s3c-hsotg: Use the new Exynos USB phy driver
 with the generic phy framework
Date: Fri, 06 Dec 2013 17:29:21 +0100
Message-ID: <00fd01cef2a0$51fc4720$f5f4d560$%debski@samsung.com>
References: <1386246579-25141-1-git-send-email-k.debski@samsung.com>
 <1386246579-25141-6-git-send-email-k.debski@samsung.com>
 <52A1B0F7.2050501@ti.com> <20131206150101.GA31091@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14904 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753539Ab3LFQ33 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Dec 2013 11:29:29 -0500
In-reply-to: <20131206150101.GA31091@beef>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Matt Porter' <matt.porter@linaro.org>, 'Kishon Vijay Abraham I' <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org

Hi,

> From: Matt Porter [mailto:matt.porter@linaro.org]
> Sent: Friday, December 06, 2013 4:01 PM
> 
> On Fri, Dec 06, 2013 at 04:41:51PM +0530, Kishon Vijay Abraham I wrote:
> > Hi,
> >
> > On Thursday 05 December 2013 05:59 PM, Kamil Debski wrote:
> > > Change the used phy driver to the new Exynos USB phy driver that
> > > uses the generic phy framework.
> > >
> > > Signed-off-by: Kamil Debski <k.debski@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > ---
> > >  .../devicetree/bindings/usb/samsung-hsotg.txt      |    4 ++++
> > >  drivers/usb/gadget/s3c-hsotg.c                     |   11 ++++++--
> ---
> > >  2 files changed, 10 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/samsung-
> hsotg.txt
> > > b/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
> > > index b83d428..9340d06 100644
> > > --- a/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
> > > +++ b/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
> > > @@ -24,6 +24,8 @@ Required properties:
> > >      - first entry: must be "otg"
> > >  - vusb_d-supply: phandle to voltage regulator of digital section,
> > >  - vusb_a-supply: phandle to voltage regulator of analog section.
> > > +- phys: from general PHY binding: phandle to the PHY device
> > > +- phy-names: from general PHY binding: should be "usb2-phy"
> >
> > are you sure it's usb2-phy. The example below seems to have a
> different value.
> 
> I requested this be changed to usb2-phy, looks like he just missed the
> update to the example.

This is true. I missed the change in the example part of the file.

> 
> >
> > >
> > >  Example
> > >  -----
> > > @@ -36,5 +38,7 @@ Example
> > >  		clock-names = "otg";
> > >  		vusb_d-supply = <&vusb_reg>;
> > >  		vusb_a-supply = <&vusbdac_reg>;
> > > +		phys = <&usb2phy 0>;
> > > +		phy-names = "device";
> > >  	};

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
