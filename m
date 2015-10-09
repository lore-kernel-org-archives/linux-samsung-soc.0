From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv3 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4
Date: Fri, 09 Oct 2015 10:15:02 +0200
Message-ID: <18718651.GRDoBKLmUe@wuerfel>
References: <1444276117-3657-1-git-send-email-linux.amoon@gmail.com> <5551783.9EQ5GEjhxX@wuerfel> <CANAwSgS1AKwg8U0WBW8JmveHd0qdRL6RAOV4F4P22a9F28xopQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:63850 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756065AbbJIIPn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Oct 2015 04:15:43 -0400
In-Reply-To: <CANAwSgS1AKwg8U0WBW8JmveHd0qdRL6RAOV4F4P22a9F28xopQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>

On Friday 09 October 2015 09:14:33 Anand Moon wrote:
> As long as we use correct exynos5422-odroidxu4.dtb is used in the
> boot.scr/boot.ini ethernet come up,
> build and tested using CONFIG_USB_RTL8152=m using multi_v7_defconfig.
> 
> Not sure what is the policy for NFS booting.
> 
> Do you want CONFIG_USB_RTL8152 to be build as module in
> exynos/multi_v7_defconfig.

The NFS booting is exactly the question here: Would it be a significant
hassle for anyone to require using a ramdisk if they need NFS root?

If we all think it would be an acceptable price, we should probably
make all ethernet drivers loadable modules, as it is commonly
done on distros.

	Arnd
