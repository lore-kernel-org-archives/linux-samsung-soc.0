From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable CPUFreq governors as modules
Date: Tue, 12 Apr 2016 16:15:13 +0200
Message-ID: <CAJKOXPd+YstrV92ON+0CUzMXGccsYo9G0QDrx=WTaujoPDwDZw@mail.gmail.com>
References: <1460142130-31822-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33830 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964847AbcDLOPO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Apr 2016 10:15:14 -0400
In-Reply-To: <1460142130-31822-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On Fri, Apr 8, 2016 at 9:02 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Currently only the ondemand and performance CPUFreq policy governors are
> enabled in the Exynos defconfig. But the other governors are also useful
> for some cases, enable them to allow users change the default if needed.
>
> The options are enabled as module to keep the kernel image size minimal.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>
>  arch/arm/configs/exynos_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Krzysztof
