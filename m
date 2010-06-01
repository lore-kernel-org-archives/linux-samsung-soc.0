From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 1/6] USB: s3c_hsotg: Add support for external USB clock
Date: Tue, 01 Jun 2010 23:40:50 +0200
Message-ID: <4C057E62.2030808@gmail.com>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org> <1274762213-3404-2-git-send-email-ben-linux@fluff.org> <20100601204142.GC2435@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:4462 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754812Ab0FAVky (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jun 2010 17:40:54 -0400
In-Reply-To: <20100601204142.GC2435@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org

Op 01-06-10 22:41, Greg KH schreef:
> On Tue, May 25, 2010 at 05:36:48AM +0100, Ben Dooks wrote:
>   
>> From: Maurus Cuelenaere <mcuelenaere@gmail.com>
>>
>> The PLL that drives the USB clock supports 3 input clocks: 12, 24 and 48Mhz.
>> This patch adds support to the USB driver for setting the correct register bit
>> according to the given clock.
>>
>> This depends on the following patch:
>> [PATCH] ARM: S3C64XX: Add USB external clock definition
>>     
> Care to take this through the arm tree then?
>
> thanks,
>
> greg k-h
>   

If I'm not mistaken, this patch is already in Ben's tree (the
USB_GADGET_DUALSPEED one too)

-- 
Maurus Cuelenaere
