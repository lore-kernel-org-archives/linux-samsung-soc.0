From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: Can't compile with exynos4_defconfig
Date: Fri, 03 Jun 2011 15:35:55 -0700
Message-ID: <4DE961CB.1010005@samsung.com>
References: <03ae01cc2195$8fee3ae0$afcab0a0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:43900 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754247Ab1FCWf7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 18:35:59 -0400
Received: by pwi15 with SMTP id 15so1187924pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2011 15:35:58 -0700 (PDT)
In-Reply-To: <03ae01cc2195$8fee3ae0$afcab0a0$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On 06/02/11 19:25, Sangbeom Kim wrote:
 > Hi,
 >
Hi Sangbeom Kim,

 > By default exynos4_defconfig, 3.0-rc1 can't compile the code.
 > It seem to have dependency on usb configuration.
 >
 > Error message:
 > arch/arm/plat-s5p/built-in.o: In function `s5p_ehci_set_platdata':
 > /home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:54: undefined
 > reference to `s5p_usb_phy_init'
 > /home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:54: undefined
 > reference to `s5p_usb_phy_init'
 > /home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:56: undefined
 > reference to `s5p_usb_phy_exit'
 > /home/cornus/tmp/linux-3.0-rc1/arch/arm/plat-s5p/dev-ehci.c:56: undefined
 > reference to `s5p_usb_phy_exit'
 > make: *** [.tmp_vmlinux1] Error 1

Thanks for your pointing out.

As a note, submitted Thushar's patch(ARM: S5P: Fix compilation error
for exynos4_defconfig) can solve this build error.

Could you please test kernel 'Linux 3.0-rc1' on SMDKV310 or SMDKC210
with exynos4_defconfig? If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
