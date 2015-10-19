From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Increase CONFIG_BLK_DEV_RAM_SIZE to 64K
Date: Mon, 19 Oct 2015 15:22:54 +0200
Message-ID: <4039144.iLSv7qv3SU@wuerfel>
References: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:62255 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753546AbbJSNXf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 09:23:35 -0400
In-Reply-To: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com, k.kozlowski@samsung.com, kgene@kernel.org

On Monday 19 October 2015 16:18:35 Alim Akhtar wrote:
> Spam Status: CRM114    
> CONFIG_BLK_DEV_RAM_SIZE is currently set to 8K, which is a bit on the
> smaller side, lets bump it up to 64K so that a bigger RAM_DISK can
> be used with defconfig.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> Every time I build exynos_defconfig, I need to manually change RAM_SIZE
> to match my ramdisk image size. I am not sure what is the best ramdisk size
> might be, but bumping it to 64K might be a reasonable one.

Is there still a reason to use ramdisks these days? If 8MB is not
enough to have a useful initrd, that might mean that everyone else
uses initramfs and you should just do the same thing?

Then we can also remove this option here.

	Arnd
