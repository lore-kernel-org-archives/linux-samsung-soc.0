From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: [PATCH v4 3/7] arm64: Introduce a kernel configuration option for
 VA_BITS
Date: Wed, 30 Apr 2014 11:21:00 +0900
Message-ID: <007901cf641a$d3fbb710$7bf32530$@samsung.com>
References: <000301cf6367$ca12e150$5e38a3f0$@samsung.com>
 <20140429144506.GK17007@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14876 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750974AbaD3CVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 22:21:03 -0400
In-reply-to: <20140429144506.GK17007@arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Catalin Marinas' <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 'Marc Zyngier' <Marc.Zyngier@arm.com>, 'Christoffer Dall' <christoffer.dall@linaro.org>, linux-kernel@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, steve.capper@linaro.org, sungjinn.chung@samsung.com, 'Arnd Bergmann' <arnd@arndb.de>, kgene.kim@samsung.com, ilho215.lee@samsung.com

On Tuesday, April 29, 2014 11:45 PM, Catalin Marinas wrote:
> On Tue, Apr 29, 2014 at 05:59:23AM +0100, Jungseok Lee wrote:
> > +config ARM64_VA_BITS
> > +	int "Virtual address space size"
> > +	range 39 39 if ARM64_4K_PAGES && ARM64_3_LEVELS
> > +	range 42 42 if ARM64_64K_PAGES && ARM64_2_LEVELS
> > +	help
> > +	  This feature is determined by a combination of page size and
> > +	  level of translation tables.
> 
> OK, so you are doing the VA bits selection already. But see my other
> email about setting only exposing this and hiding the number of levels
> (though number of levels can be mentioned in the help).

Okay. I will hide the number of levels.

Best Regards
Jungseok Lee
