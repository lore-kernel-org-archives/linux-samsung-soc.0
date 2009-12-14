From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/7] ARM: S5P6440: Board and configuration file
Date: Mon, 14 Dec 2009 20:19:22 +0900
Message-ID: <000e01ca7caf$49b0e050$dd12a0f0$%kim@samsung.com>
References: <1260525300-4322-1-git-send-email-kgene.kim@samsung.com>
 <20091211170413.4f6d2744@life-in-the-fast-lane>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29209 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756828AbZLNLRe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Dec 2009 06:17:34 -0500
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUN00LTW3D8SZ@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:17:32 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUN00HUC3D80Q@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Dec 2009 20:17:33 +0900 (KST)
In-reply-to: <20091211170413.4f6d2744@life-in-the-fast-lane>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marc Zyngier' <maz@misterjones.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Adityapratap Sharma' <aditya.ps@samsung.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Atul Dahiya' <atul.dahiya@samsung.com>

On Sat, Dec 12, 2009 at 01:04 +0900, Marc Zyngier wrote:
> On Fri, 11 Dec 2009 18:55:00 +0900
> Kukjin Kim <kgene.kim@samsung.com> wrote:
> 
> > +static struct s3c2410_uartcfg smdk6440_uartcfgs[] __initdata = {
> > +	[0] = {
> > +		.hwport	     = 0,
> > +		.flags	     = 0,
> > +		.ucon	     = S5P6440_UCON_DEFAULT,
> > +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> > +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> > +	},
> > +	[1] = {
> > +		.hwport	     = 1,
> > +		.flags	     = 0,
> > +		.ucon	     = S5P6440_UCON_DEFAULT,
> > +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> > +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> > +	},
> > +	[2] = {
> > +		.hwport	     = 2,
> > +		.flags	     = 0,
> > +		.ucon	     = S5P6440_UCON_DEFAULT,
> > +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> > +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> > +	},
> > +	[3] = {
> > +		.hwport	     = 3,
> > +		.flags	     = 0,
> > +		.ucon	     = S5P6440_UCON_DEFAULT,
> > +		.ulcon	     = S5P6440_ULCON_DEFAULT,
> > +		.ufcon	     = S5P6440_UFCON_DEFAULT,
> > +	},
> > +};
> 
> Doing so means that UARTs will get the default clock (PCLK), which is
> always wrong on s5p6440. You should here set the .clock field of each
> UART, according to your specific configuration (probably PCLK_LOW).
> 
> Or at least make sure it gets set to some sane default in the CPU
> support code.
Ok. As you know, my clock codes have something to change about PCLK and
PCLK_LOW. I will check this code when I fix clock codes. And change it.


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
