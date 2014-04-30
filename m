From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: [PATCH v4 2/7] arm64: Decouple page size from level of translation
 tables
Date: Wed, 30 Apr 2014 11:44:13 +0900
Message-ID: <007d01cf641e$122f9b20$368ed160$@samsung.com>
References: <000201cf6367$c8084440$5818ccc0$@samsung.com>
 <20140429144052.GJ17007@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31755 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751263AbaD3CoT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 22:44:19 -0400
In-reply-to: <20140429144052.GJ17007@arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Catalin Marinas' <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 'Marc Zyngier' <Marc.Zyngier@arm.com>, 'Christoffer Dall' <christoffer.dall@linaro.org>, linux-kernel@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, steve.capper@linaro.org, sungjinn.chung@samsung.com, 'Arnd Bergmann' <arnd@arndb.de>, kgene.kim@samsung.com, ilho215.lee@samsung.com

On Tuesday, April 29, 2014 11:41 PM, Catalin Marinas wrote:
> Jungseok,

Hi, Catalin

> On Tue, Apr 29, 2014 at 05:59:20AM +0100, Jungseok Lee wrote:
> > +choice
> > +	prompt "Level of translation tables"
> > +	default ARM64_3_LEVELS if ARM64_4K_PAGES
> > +	default ARM64_2_LEVELS if ARM64_64K_PAGES
> > +	help
> > +	  Allows level of translation tables.
> > +
> > +config ARM64_2_LEVELS
> > +	bool "2 level"
> > +	depends on ARM64_64K_PAGES
> > +	help
> > +	  This feature enables 2 levels of translation tables.
> > +
> > +config ARM64_3_LEVELS
> > +	bool "3 level"
> > +	depends on ARM64_4K_PAGES
> > +	help
> > +	  This feature enables 3 levels of translation tables.
> > +
> > +endchoice
> 
> As I mentioned previously
> (http://www.spinics.net/linux/lists/arm-kernel/msg319552.html), just expose options for the VA space
> bits rather than the number of levels.
> You can still keep the number of levels config options but not visible in menuconfig (though I think
> you could also hide them in some header and avoid config altogether). The VA bits config options can
> be:
> 
> VA_BITS_39 if 4K (3 levels)
> VA_BITS_42 if 64K (2 levels)
> VA_BITS_47 if 16K (3 levels)
> VA_BITS_48 if 4K || 16K || 64K (4/4/3 levels depending on page size)
> 
> That's more meaningful to people configuring the kernel.

Okay, I will revise VA_BITS config as hiding the number of levels.

Best Regards
Jungseok Lee
