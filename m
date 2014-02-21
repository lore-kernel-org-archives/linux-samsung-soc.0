From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] phy: Select PHY_EXYNOS_DP_VIDEO by default for ARCH_EXYNOS
Date: Fri, 21 Feb 2014 16:59 +0100
Message-ID: <1753680.KKj0Q1erxA@wuerfel>
References: <1392997802-29050-1-git-send-email-s.nawrocki@samsung.com> <1392997802-29050-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:56875 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932244AbaBUP7g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Feb 2014 10:59:36 -0500
In-Reply-To: <1392997802-29050-2-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, kishon@ti.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, linux-kernel@vger.kernel.org

On Friday 21 February 2014 16:50:02 Sylwester Nawrocki wrote:
>  config PHY_EXYNOS_DP_VIDEO
>         tristate "EXYNOS SoC series Display Port PHY driver"
>         depends on OF
> +       depends on ARCH_EXYNOS || COMPILE_TEST
> +       default y
>         select GENERIC_PHY
>         help
> 

That would turn them on automatically if you enable COMPILE_TEST, which
is probably not what you want.

How about "default ARCH_EXYNOS"?

	Arnd
