From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL 5/5] Samsung mach updates for v4.2
Date: Thu, 11 Jun 2015 14:45:58 -0700
Message-ID: <7hmw05dill.fsf@deeprootsystems.com>
References: <5571E4F7.40706@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:35088 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753104AbbFKVqF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 17:46:05 -0400
Received: by pacyx8 with SMTP id yx8so9912936pac.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 14:46:05 -0700 (PDT)
In-Reply-To: <5571E4F7.40706@kernel.org> (Kukjin Kim's message of "Sat, 06 Jun
	2015 03:05:43 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Kukjin Kim <kgene@kernel.org> writes:

> Hi,
>
> Here is Samsung mach updates for v4.2 and this is based on v4.1-rc4
> because of dependencies with previous Samsung fixes during -rc
>
> Please pull and if any problems, please let me know.
>
> Thanks,
> Kukjin
>
>
> The following changes since commit e26081808edadfd257c6c9d81014e3b25e9a6118:
>
>   Linux 4.1-rc4 (2015-05-18 10:13:47 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-mach-1
>
> for you to fetch changes up to 2be2a3ff42a52e926cbd1cc1d376a161a9a73667:
>
>   ARM: EXYNOS: register power domain driver from core_initcall
> (2015-06-06 02:18:03 +0900)
>
> ----------------------------------------------------------------
> Samsung updates for v4.2
>
> - add failure(exception) handling
>   : of_iomap(), of_find_device_by_node() and kstrdup()
>
> - add common poweroff to use PS_HOLD based for all of exynos SoCs
> - add exnos_get/set_boot_addr() helper
> - constify platform_device_id and irq_domain_ops
> - get current parent clock for power domain on/off
> - use core_initcall to register power domain driver
> - make exynos_core_restart() less verbose
>
> - add support coupled CPUidle for exynos3250
>
> - fix exynos_boot_secondary() return value on timeout
> - fix clk_enable() in s3c24xx adc
> - fix missing of_node_put() for power domains
>
> ----------------------------------------------------------------

Pulled into next/soc,

Thanks,

Kevin
