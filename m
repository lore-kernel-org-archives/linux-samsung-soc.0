From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 8/9] ARM: EXYNOS: suspend requires regulator access
Date: Tue, 3 Mar 2015 08:29:49 +0100
Message-ID: <CABxcv=kMCiLui82eC6MNbH80qzdyzkJfUPgD3oWWfgL4voRTWw@mail.gmail.com>
References: <1423769746-582629-1-git-send-email-arnd@arndb.de>
	<2062492.pEav958W9c@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:39308 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602AbbCCH3u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Mar 2015 02:29:50 -0500
Received: by wggx12 with SMTP id x12so38118301wgg.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2015 23:29:49 -0800 (PST)
In-Reply-To: <2062492.pEav958W9c@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, arm@kernel.org

Hello Arnd,

On Mon, Mar 2, 2015 at 10:28 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> Building an exynos kernel without regulators but with suspend enabled results
> in a link error:
>
> arch/arm/mach-exynos/built-in.o: In function `exynos_suspend_finish':
> arch/arm/mach-exynos/suspend.c:532: undefined reference to `regulator_suspend_finish'
> arch/arm/mach-exynos/built-in.o: In function `exynos_suspend_prepare':
> arch/arm/mach-exynos/suspend.c:515: undefined reference to `regulator_suspend_prepare'
>
> This adds an appropriate 'select' statement in Kconfig to ensure the symbols
> are available.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
