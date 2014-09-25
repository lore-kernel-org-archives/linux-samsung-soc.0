From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/2] Samsung cleanup for 3.18
Date: Thu, 25 Sep 2014 23:24:24 +0200
Message-ID: <201409252324.24297.arnd@arndb.de>
References: <5418BC87.8000306@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:64699 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751649AbaIYVYb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 17:24:31 -0400
In-Reply-To: <5418BC87.8000306@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wednesday 17 September 2014, Kukjin Kim wrote:
> Samsung cleanup for 3.18
> - remove unused <mach/memory.h> in exynos
> - local <mach/regs-clock.h> for s5pv210
> - cleanup boot address calculate for exynos
> - remove separate restart code for s3c24xx

Pulled into next/cleanup, thanks!

	Arnd
