From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [linux-next:master 3331/3796] Error:
 arch/arm/boot/dts/exynos5250.dtsi:65.21-22 syntax error
Date: Thu, 23 Jul 2015 09:29:57 +0900
Message-ID: <55B03585.7020703@samsung.com>
References: <201507222329.EDXw3ZRS%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34611 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752589AbbGWA37 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jul 2015 20:29:59 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NRX00JMM01W9140@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jul 2015 01:29:56 +0100 (BST)
In-reply-to: <201507222329.EDXw3ZRS%fengguang.wu@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>, Thomas Abraham <thomas.ab@samsung.com>
Cc: kbuild-all@01.org, Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

On 23.07.2015 00:00, kbuild test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   72a68fd733c8b6cd2e0ebc0586a9103067cd4ed7
> commit: 565872a601c4d91a75b917b1fb40ff27ad7ebb08 [3331/3796] ARM: dts: add CPU OPP and regulator supply property for exynos5250
> config: arm-exynos_defconfig (attached as .config)
> reproduce:
>   wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>   chmod +x ~/bin/make.cross
>   git checkout 565872a601c4d91a75b917b1fb40ff27ad7ebb08
>   # save the attached .config to linux build tree
>   make.cross ARCH=arm 
> 
> Note: the linux-next/master HEAD 72a68fd733c8b6cd2e0ebc0586a9103067cd4ed7 builds fine.
>       It may have been fixed somewhere.
> 
> All error/warnings (new ones prefixed by >>):
> 
>>> Error: arch/arm/boot/dts/exynos5250.dtsi:65.21-22 syntax error
>    FATAL ERROR: Unable to parse input tree

I reported this to Kukjin already, after he released the non-bisectable
branches. Unfortunately no response...

Dear Kukjin,

Are you going to fix your branches?

Best regards,
Krzysztof
