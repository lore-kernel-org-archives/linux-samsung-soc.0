From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2 1/3] rtc: s5m: Cleanup by removing useless 'rtc'
 prefix from fields
Date: Tue, 5 Jan 2016 01:07:28 +0100
Message-ID: <20160105000728.GF32724@piout.net>
References: <1451450847-928-1-git-send-email-k.kozlowski@samsung.com>
 <20160104170841.GD32724@piout.net>
 <568B0601.5020808@samsung.com>
 <568B0897.4020403@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:53395 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753332AbcAEAHb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jan 2016 19:07:31 -0500
Content-Disposition: inline
In-Reply-To: <568B0897.4020403@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, Alim Akhtar <alim.akhtar@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>

On 05/01/2016 at 09:04:39 +0900, Krzysztof Kozlowski wrote :
> > 
> > Probably that's my fault because I rebased it on linux-next. I will
> > rebase the patches on rtc-next and resend.
> 
> Ah, no need for rebasing. I forgot about dependency - the support for
> S2MPS15 was added recently through Lee Jones' tree. Fortunately Lee put
> S2MPS15 patches in a separate branch and tag: "ib-mfd-regulator-rtc-4.5"
> 
> This means that to apply the patches this is needed first:
> https://git.kernel.org/cgit/linux/kernel/git/lee/mfd.git/log/?h=ib-mfd-regulator-rtc-4.5
> 

Ah, true, that's what I forgot, thanks.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
