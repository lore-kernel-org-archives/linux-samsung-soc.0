From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] ARM: multi_v7_defconfig: Enable CPUFreq governors as
 modules
Date: Sun, 10 Apr 2016 10:14:26 +0200
Message-ID: <20160410081426.GA9519@kozik-lap>
References: <1460142130-31822-1-git-send-email-javier@osg.samsung.com>
 <1460142130-31822-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33498 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbcDJIOb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Apr 2016 04:14:31 -0400
Content-Disposition: inline
In-Reply-To: <1460142130-31822-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On Fri, Apr 08, 2016 at 03:02:10PM -0400, Javier Martinez Canillas wrote:
> Currently only the ondemand and performance CPUFreq policy governors are
> enabled in multi_v7 defconfig. But the other governors are also useful
> for some cases, enable them to allow users change the default if needed.
> 
> The options are enabled as module to keep the kernel image size minimal.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  arch/arm/configs/multi_v7_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Hi,

Makes sense for me. If there are no objections I can take it through
samsung-soc tree along with exynos_defconfig change.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
