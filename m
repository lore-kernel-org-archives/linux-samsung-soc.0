From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH] ARM: S3C64XX: Add USB clock source frequency as driver
 data to s3c-hsotg
Date: Thu, 06 May 2010 12:05:34 +0200
Message-ID: <4BE2946E.1080508@gmail.com>
References: <4BE00124.7030702@gmail.com> <20100506012608.GB6684@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.26]:18304 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755448Ab0EFKFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 06:05:37 -0400
Received: by ey-out-2122.google.com with SMTP id d26so48903eyd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2010 03:05:35 -0700 (PDT)
In-Reply-To: <20100506012608.GB6684@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Op 06-05-10 03:26, Ben Dooks schreef:
> On Tue, May 04, 2010 at 01:12:36PM +0200, Maurus Cuelenaere wrote:
>   
>> The upcoming SmartQ machines use a different base clock frequency
>> for the USB block, this patch allows passing it as platform data
>> to the driver.
>>     
> When I merge thomas' patch for addign a clock for this crystal, it might
> be worth changing the driver to get this and see what rate the clock is
> at by that method.
>   

Do you mean [PATCH] ARM: S5P: Add USB External Crystal clock definition?
Other then that I can't really find any USB clock related patches.

> Will hold off on this patch, also going to do some woth on the hsotg
> driver anyway, since it could really do with some work on DMA support
> and some debugging.
>   

-- 
Maurus Cuelenaere
