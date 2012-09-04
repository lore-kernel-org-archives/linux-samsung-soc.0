From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/4] pinctrl: add samsung pinctrl and gpiolib driver
Date: Wed, 05 Sep 2012 06:45:16 +0900
Message-ID: <226e01cd8ae6$928010b0$b7803210$%kim@samsung.com>
References: <1345720529-32315-1-git-send-email-thomas.abraham@linaro.org>
 <1345720529-32315-2-git-send-email-thomas.abraham@linaro.org>
 <CACRpkdbVe77pAYdOw0+_2G2FWVWcn4GKQty6R-LXXEz-OkUdUg@mail.gmail.com>
 <CAJuYYwTD+vMg=YjUj4G0E-uakk=Y_SD+cUU22QSx0yRC50V75w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40198 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753762Ab2IDVpS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 17:45:18 -0400
In-reply-to: <CAJuYYwTD+vMg=YjUj4G0E-uakk=Y_SD+cUU22QSx0yRC50V75w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, dong.aisheng@linaro.org, swarren@wwwdotorg.org, patches@linaro.org

Thomas Abraham wrote:
> 
> On 3 September 2012 16:44, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Thu, Aug 23, 2012 at 1:15 PM, Thomas Abraham
> > <thomas.abraham@linaro.org> wrote:
> >
> >> Add a new device tree enabled pinctrl and gpiolib driver for Samsung
> >> SoC's. This driver provides a common and extensible framework for all
> >> Samsung SoC's to interface with the pinctrl and gpiolib subsystems.
> This
> >> driver supports only device tree based instantiation and hence can be
> >> used only on those Samsung platforms that have device tree enabled.
> >>
> >> This driver is split into two parts: the pinctrl interface and the
> gpiolib
> >> interface. The pinctrl interface registers pinctrl devices with the
> pinctrl
> >> subsystem and gpiolib interface registers gpio chips with the gpiolib
> >> subsystem. The information about the pins, pin groups, pin functions
> and
> >> gpio chips, which are SoC specific, are parsed from device tree node.
> >>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Kukjin Kim <kgene.kim@samsung.com>
> >> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >
> > Looks good to me, I saw Stephen had some minor comments and
> > I expect that you probably fix them before applying to the Samsung
> > tree so:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Feel free to push this through ARM SoC, I guess that's the plan?
> 
> Hi Linus,
> 
> Thanks for reviewing the Samsung pinctrl driver patches. I will do the
> changes that Stephen has listed and resubmit. I will request Samsung
> maintainer to consider the support for pinctrl driver for 3.7.
> 
Looks OK, I will apply updated patches Thomas said into Samsung tree.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
