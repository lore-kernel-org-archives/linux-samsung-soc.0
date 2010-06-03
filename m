From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: ARM: SAMSUNG: question about cfg_eint field of struct
	s3c_gpio_cfg
Date: Thu, 3 Jun 2010 01:51:03 +0100
Message-ID: <20100603005103.GF30276@trinity.fluff.org>
References: <4C039BE4.3040904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:37872 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932771Ab0FCAvE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jun 2010 20:51:04 -0400
Content-Disposition: inline
In-Reply-To: <4C039BE4.3040904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Mon, May 31, 2010 at 08:22:12PM +0900, Joonyoung Shim wrote:
> Hi,
> 
> There is cfg_eint field in struct s3c_gpio_cfg at 
> arch/arm/plat-samsung/include/plat/gpio-cfg.h. I don't know the usage of 
> cfg_eint. It isn't used anywhere or just assigned. Does it need really?

It was there for the interrupt code to configure the external-interrupt
information, but it was never used. It probably wants deleting if we can't
re-use it.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
