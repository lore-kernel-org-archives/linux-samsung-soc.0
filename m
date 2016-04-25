From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RESEND PATCH v3 2/2] ARM: multi_v7_defconfig: Enable Samsung
 media platform drivers as modules
Date: Mon, 25 Apr 2016 16:48:56 -0400
Message-ID: <cf7c155d-5807-ea37-c00c-b3608248186d@osg.samsung.com>
References: <1461603086-21288-1-git-send-email-javier@osg.samsung.com>
 <1461603086-21288-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56028 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964779AbcDYUtH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 16:49:07 -0400
In-Reply-To: <1461603086-21288-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kevin Hilman <khilman@baylibre.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On 04/25/2016 12:51 PM, Javier Martinez Canillas wrote:
> There are a bunch of media platform drivers under drivers/media/platform/
> for Samsung SoCs that are enabled in exynos_defconfig but no in multi_v7.
> 
> This patch enables them as a module to improve build coverage for these
> drivers and also to allow people use them with proper hardware if modules
> are installed.
> 
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> Hello,
> 
> I'm resending the patches because Krzysztof pointed out that they didn't
> end in patchwork. Sorry for the noise.
>

...and I see the patches didn't make it to LKML again, since are neither
in the archives nor in patchwork. I wonder what I'm doing wrong for these
since I post them just like all the other patches that make to the lists.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
