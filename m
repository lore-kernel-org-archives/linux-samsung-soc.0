From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 1/6] USB: s3c_hsotg: Add support for external USB clock
Date: Tue, 1 Jun 2010 13:41:42 -0700
Message-ID: <20100601204142.GC2435@kroah.com>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:33237 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753192Ab0FAVHY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jun 2010 17:07:24 -0400
Content-Disposition: inline
In-Reply-To: <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>

On Tue, May 25, 2010 at 05:36:48AM +0100, Ben Dooks wrote:
> From: Maurus Cuelenaere <mcuelenaere@gmail.com>
> 
> The PLL that drives the USB clock supports 3 input clocks: 12, 24 and 48Mhz.
> This patch adds support to the USB driver for setting the correct register bit
> according to the given clock.
> 
> This depends on the following patch:
> [PATCH] ARM: S3C64XX: Add USB external clock definition

Care to take this through the arm tree then?

thanks,

greg k-h
