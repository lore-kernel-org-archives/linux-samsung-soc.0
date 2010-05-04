From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: S3C64XX & S3C24XX TS/ADC support in mainline
Date: Tue, 4 May 2010 07:55:29 +0100
Message-ID: <20100504065529.GA26401@trinity.fluff.org>
References: <1270530310-24119-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:49508 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751472Ab0EDGzb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 02:55:31 -0400
Content-Disposition: inline
In-Reply-To: <1270530310-24119-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ch.naveen@samsung.com
Cc: linux-samsung-soc@vger.kernel.org

On Tue, Apr 06, 2010 at 10:35:10AM +0530, ch.naveen@samsung.com wrote:
> From: Naveen Krishna CH <ch.naveen@samsung.com>
> 
> Hi Ben,
> 
> This is Naveen from Samsung, India. 
> 
> I'm working on adding support for TS/ADC for the following boards
> 6410, 6440 and V210 on 2.6.34-rc2 kernel. 
> 
> 1)
> I did some initial work and found that the current driver 
> (s3c24xx_ts.c) exists for ARCH_S3C24XX alone 
> and which requires ADC for S3C24XX.  
> 
> Though. there is no board under (mach-s3c24XX) implementing the 
> touchscreen driver.
> 
> I would like to know, on what all boards is this driver tested  & 
> how much compatible it is with S3C64XX and S5P series SoCs.

The h1940 should be using the touchscreen, since this is what it was
originally written for.
 
> 2)
> I also have a design issue with 
> a.  There are some GPIO config specific to 2410 in the current driver.

yes, although this could be removed and given to the relevant machine.

> b.  It uses only 1 IRQ (PenDown) and 

yes.

> c.  The ISR for this IRQ uses the ADC APIs.
> 
> I have a reference driver, which uses 2 IRQs 
> One for PENDOWN and another Stylus Action.
> And this driver does not use the ADC driver.

either update the existing driver to use the StylusAction IRQ
or do without it.
 
> TS on S3C64XX and S5P series does not seem to need
> ADC driver as such. 

please dont' assume you know bettert than any of your potentuial
customers... the ADC API is there for a reason, there are more than
just the TS ADC inputs and it is entirly possible something else
will need acces to them.

On some of our boards, they provide input voltage monitoring and
feedback from sensors.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
