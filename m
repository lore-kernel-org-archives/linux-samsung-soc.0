From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCHv2 0/2]
Date: Wed, 4 Oct 2017 09:52:24 +0530
Message-ID: <b9aad201-78b9-f04b-238d-5297e6096ee7@ti.com>
References: <ba580a0c-36c3-b227-61ee-97637532823e@ti.com>
 <CGME20171003125944eucas1p1fad23e6171786fda69ccd9419354911b@eucas1p1.samsung.com>
 <1507035578-24945-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:23703 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750945AbdJDEXU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 00:23:20 -0400
In-Reply-To: <1507035578-24945-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi,

On Tuesday 03 October 2017 06:29 PM, Andrzej Pietrasiewicz wrote:
> Hi all,
> 
> This is the second version of patches in this thread.
> 
> The series fixes problems with enumerating of SuperSpeed devices
> on an Odroid XU3. There was a patch series from Vivek Gautam in
> circulation, but it got lost somehow. Please see:
> 
> https://lkml.org/lkml/2014/9/2/166
> https://lkml.org/lkml/2015/2/2/257
> 
> I adapted his patch so that it does not use a hacky solution to force
> additional initialization in order for calibration to happen.
> With this patch enumeration happens correctly and a super speed device
> is recognized as such.
> 
> @Kishon:
> 
> As far as I understand what you suggest is to move phy_init() and
> phy_power_on() invocations from dwc3/core.c to xhci-plat, but,
> to the best of my knowledge, they are needed in device mode, too.

What I meant is perform phy initializations for host mode in xhci and keep only
device mode phy initialization in dwc3.

Thanks
Kishon
