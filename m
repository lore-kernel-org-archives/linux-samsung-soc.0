From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 4/4] ARM: exynos_defconfig: Save defconfig on current
 linux-next
Date: Thu, 2 Jun 2016 09:54:08 -0400
Message-ID: <f5faaac7-7e26-b1fa-4327-fb3e4daee754@osg.samsung.com>
References: <1464846916-3110-1-git-send-email-k.kozlowski@samsung.com>
 <1464846916-3110-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39486 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751650AbcFBNyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 09:54:19 -0400
In-Reply-To: <1464846916-3110-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hello Krzysztof,

On 06/02/2016 01:55 AM, Krzysztof Kozlowski wrote:
> Save defconfig on next-20160602. Most of changes are just re-ordering of
> symbols.  Removed symbols:
>  - FHANDLE (default y),
>  - THERMAL, EXYNOS_THERMAL (selected by ARCH_EXYNOS),
>  - CHROME_PLATFORMS (selected by MFD_CROS_EC),
>  - EXT4_FS (selected by EXT3_FS)
>  - SND_SOC_ODROIDX2 (obsolete since commit ee12a817bb4b ("ASoC: samsung:
>    Remove unused Odroid x2/u3 machine driver"), replaced with
>    SND_SIMPLE_CARD).
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
