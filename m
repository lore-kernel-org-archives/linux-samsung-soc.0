From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/4] pinctrl: add samsung pinctrl and gpiolib driver
Date: Fri, 07 Sep 2012 07:03:53 +0900
Message-ID: <241701cd8c7b$81022580$83067080$%kim@samsung.com>
References: <226e01cd8ae6$928010b0$b7803210$%kim@samsung.com>
 <1346826046-30484-1-git-send-email-thomas.abraham@linaro.org>
 <5048DE83.4050203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44946 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777Ab2IFWD4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 18:03:56 -0400
In-reply-to: <5048DE83.4050203@wwwdotorg.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Stephen Warren' <swarren@wwwdotorg.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, dong.aisheng@linaro.org, patches@linaro.org

Stephen Warren wrote:
> 
> On 09/05/2012 12:20 AM, Thomas Abraham wrote:
> > Add a new device tree enabled pinctrl and gpiolib driver for Samsung
> > SoC's. This driver provides a common and extensible framework for all
> > Samsung SoC's to interface with the pinctrl and gpiolib subsystems. This
> > driver supports only device tree based instantiation and hence can be
> > used only on those Samsung platforms that have device tree enabled.
> >
> > This driver is split into two parts: the pinctrl interface and the
> gpiolib
> > interface. The pinctrl interface registers pinctrl devices with the
> pinctrl
> > subsystem and gpiolib interface registers gpio chips with the gpiolib
> > subsystem. The information about the pins, pin groups, pin functions and
> > gpio chips, which are SoC specific, are parsed from device tree node.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> 
> Acked-by: Stephen Warren <swarren@nvidia.com>

Applied this whole series, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
