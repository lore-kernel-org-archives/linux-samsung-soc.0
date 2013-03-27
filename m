From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/6] usb: phy: samsung: Consolidate reference clock rate
 handling
Date: Wed, 27 Mar 2013 14:26:08 +0100
Message-ID: <1418529.52pdDLWkRZ@amdc1227>
References: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
 <1364309595-16102-4-git-send-email-t.figa@samsung.com>
 <20130327131958.GH4626@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:41300 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751602Ab3C0N0W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 09:26:22 -0400
In-reply-to: <20130327131958.GH4626@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, p.paneri@samsung.com, gautam.vivek@samsung.com, m.szyprowski@samsung.com

Hi Felipe,

On Wednesday 27 of March 2013 15:19:58 Felipe Balbi wrote:
> Hi,
> 
> On Tue, Mar 26, 2013 at 03:53:12PM +0100, Tomasz Figa wrote:
> > @@ -307,6 +310,7 @@ static int samsung_usb3phy_remove(struct
> > platform_device *pdev)> 
> >  static struct samsung_usbphy_drvdata usb3phy_exynos5 = {
> >  
> >  	.cpu_type		= TYPE_EXYNOS5250,
> >  	.devphy_en_mask		= EXYNOS_USBPHY_ENABLE,
> > 
> > +	.rate_to_clksel		= samsung_usbphy_rate_to_clksel_4x12,
> 
> why isn't this just a clk_get_rate() ???

As the name suggests, this is a function to get appropriate CLKSEL value to 
write into PHYCLK register for reference clock rate on particular platform 
(clk_get_rate is used inside to get the rate).

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
