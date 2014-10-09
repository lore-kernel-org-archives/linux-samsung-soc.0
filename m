From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Thu, 09 Oct 2014 14:58:18 -0700
Message-ID: <7hzjd4lxc5.fsf@deeprootsystems.com>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:35957 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbaJIV6W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Oct 2014 17:58:22 -0400
Received: by mail-pa0-f50.google.com with SMTP id kx10so478255pab.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2014 14:58:21 -0700 (PDT)
In-Reply-To: <7133556.456161412823997169.JavaMail.weblogic@epml02> (Abhilash
	Kesavan's message of "Thu, 09 Oct 2014 03:06:38 +0000 (GMT)")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: a.kesavan@samsung.com
Cc: CHANDER KASHYAP <k.chander@samsung.com>, Mauro Ribeiro <mdrjr0@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>

Hi Abhilash,

Abhilash Kesavan <a.kesavan@samsung.com> writes:

> I had noticed a similar issue where only 6 cores would come up during
> development on 5420. This was because there was a check in our u-boot
> secondary boot-up path which would put a core into WFI if a flag was
> not present and hence fail to boot. I wonder if it is the same
> situation in your case too.
> Is the u-boot for odroid-xu3 publically available or can you check if there is any such code present in your secondary bring-up path.

I'm using the hardkernel u-boot[1], branch: odroidxu3-v2012.07.  I'm
currently using the pre-built binaries that are in the
sd_fuse/hardkernel directory of that branch, but I can rebuild u-boot if
needed.

I'm not very familiar with u-boot, but if f you have some pointers where
to start looking in that code, that would be helpful.

Kevin

[1] https://github.com/hardkernel/u-boot.git
