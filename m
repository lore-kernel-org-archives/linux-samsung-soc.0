From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: clock sourcing suggestion
Date: Wed, 30 Sep 2009 22:13:44 +0100
Message-ID: <20090930211343.GA28928@trinity.fluff.org>
References: <1b68c6790909291936s9fc10c2t8385f094980ef13a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:58721 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754569AbZI3VNk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2009 17:13:40 -0400
Content-Disposition: inline
In-Reply-To: <1b68c6790909291936s9fc10c2t8385f094980ef13a@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

On Wed, Sep 30, 2009 at 11:36:27AM +0900, jassi brar wrote:
> Hi,
> 
>  I2S audio-bus[0,1] in s3c6410 can source clock, among other options,
>  from dedicated pcm_cdclk[0,1] respectively.
>  Whereas in s3c6400, both I2S audio-bus[0,1]  share one common pcm_cdclk.
> 
> The arch/arm/plat-s3c64xx/s3c6400-clock.c  makes audio-bus-0,1 share the same
> pcm_cdclk(s3c6400 case).
> 
> Should we use #ifdef CPU_S3C6410 to assign proper clock sources ?
> But I am afraid that might come in the way of building common kernel
> for 6400 and 6410.
> 
> What should be the solution, please suggest?

A quick think would suggest two solutions:

1) Change the clocks before registering in the relevant init function

2) Moving those clocks out of the common clock code and registering
   s3c6400 version in s3c6400 clock setup and s3c6410 in s3c6410 clock
   setup.

I can have a look tommorow at the code if any further info is required.

(2) is probably the best thing to do.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

