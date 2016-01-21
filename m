From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 0/8] rtc: max77686: Extend driver and add max77802 support
Date: Thu, 21 Jan 2016 01:30:47 +0100
Message-ID: <20160121003047.GF3367@piout.net>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:47991 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751430AbcAUAat (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 19:30:49 -0500
Content-Disposition: inline
In-Reply-To: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

Hi,

On 20/01/2016 at 14:14:40 -0300, Javier Martinez Canillas wrote :
> One thing that I'm not sure is how to handle bisectability, in patch #5
> there will be two drivers that matches "rtc-max77802". So I don't know
> if I should use a different platform_device_id name and change in the
> same patch that max77802 is removed or if this is not a big deal so the
> patches could stay as is.
> 

I'm fine with those patches as is.

> I believe all patches should go through the RTC tree with proper acks or
> wait until the RTC patches land to pick the defconfig changes.
> 

I think Olof would prefer the last patches to go through arm-soc.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
