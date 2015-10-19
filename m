From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RFC PATCH] ARM: exynos_defconfig: Increase
 CONFIG_BLK_DEV_RAM_SIZE to 64K
Date: Mon, 19 Oct 2015 13:48:13 +0200
Message-ID: <5624D87D.4090901@osg.samsung.com>
References: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34209 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750784AbbJSLsS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 07:48:18 -0400
In-Reply-To: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, linux-arm-kernel@lists.infradead.org

Hello Alim,

On 10/19/2015 12:48 PM, Alim Akhtar wrote:
> CONFIG_BLK_DEV_RAM_SIZE is currently set to 8K, which is a bit on the
> smaller side, lets bump it up to 64K so that a bigger RAM_DISK can
> be used with defconfig.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

I agree that 8KiB is too small and that should be bumped, I'm also
not sure what the best size would be but 64KiB sounds reasonable
to me. So for this patch:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

> Every time I build exynos_defconfig, I need to manually change RAM_SIZE
> to match my ramdisk image size. I am not sure what is the best ramdisk size
> might be, but bumping it to 64K might be a reasonable one.
>

In case you are interested, I got some stats by doing grep on the ARM
defconfigs using this [0]. Of course the sizes depends on the platform
but just to have an idea about what sizes are more popular than others.

SIZE	COUNT
1024	17
8192	43
10240	1
16384	20
20000	25
32768	36
65536	15

[0]: http://hastebin.com/buqukimede.bash

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
