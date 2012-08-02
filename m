From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/5] usb: phy: samsung: Introducing usb phy driver for samsung SoCs
Date: Thu, 2 Aug 2012 11:26:52 +0000
Message-ID: <201208021126.52307.arnd@arndb.de>
References: <1343826351-8756-1-git-send-email-p.paneri@samsung.com> <201208011520.02353.arnd@arndb.de> <CAD6zSYN-prJO=dp8tJT8+4qcC3TxCXyVTU6-Xf5p20650Zb-ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:62848 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752558Ab2HBL06 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Aug 2012 07:26:58 -0400
In-Reply-To: <CAD6zSYN-prJO=dp8tJT8+4qcC3TxCXyVTU6-Xf5p20650Zb-ow@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, l.majewski@samsung.com, kgene.kim@samsung.com, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, balbi@ti.com, grant.likely@secretlab.ca, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, ben-linux@fluff.org

On Thursday 02 August 2012, Praveen Paneri wrote:
> Yes! I understand this problem and this is the reason these patches
> were sitting in my system for couple of weeks. In a  discussion with
> Thomas an idea of using the existing regulator framework to
> enable/disable numerous PHYs came up. For example the PMU unit
> of Exynos4210 has a register set dedicated just to control USBD_PHY,
> HDMI_PHY, MIPI_PHY, DAC_PHY and more. If a regulator with
> each phy control register as LDO is written, the phy driver becomes a
> static consumer and will modify as below.

This is roughly what I had in mind, yes. The part I'm not sure about
is the subsystem to use. One could obviously express the same logic
using the clock or gpio framework, which would work but be conceptually
wrong.

Some other parts of the PMU functionality are provided through
pm-domains rather than regulators and I guess in theory it could
all be controlled through pm-domains. Maybe someone else has a better
understanding than me what the tradeoffs are here and which subsystem
should be used for the PMU.

	Arnd
