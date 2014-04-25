From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 03/10] ARM: EXYNOS: Move SYSREG definition into sys-reg
 specific file.
Date: Fri, 25 Apr 2014 23:08:15 +0200
Message-ID: <535ACEBF.3090201@gmail.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com> <1398429166-5539-1-git-send-email-pankaj.dubey@samsung.com> <1398429166-5539-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:63563 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751364AbaDYVIS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 17:08:18 -0400
In-Reply-To: <1398429166-5539-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, s.nawrocki@samsung.com, b.zolnierkie@samsung.com

Hi Pankaj,

On 25.04.2014 14:32, Pankaj Dubey wrote:
> From: Young-Gun Jang <yg1004.jang@samsung.com>
>
> While making PMU implementation to be device tree based, there are
> few register offsets related with SYSREG present in regs-pmu.h, so
> let's make a new header file "regs-sys.h" to keep all such SYSREG
> related register offsets and remove them from "regs-pmu.h"
>
> Signed-off-by: Young-Gun Jang <yg1004.jang@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   arch/arm/mach-exynos/exynos.c   |    1 +
>   arch/arm/mach-exynos/pm.c       |    1 +
>   arch/arm/mach-exynos/regs-pmu.h |    3 ---
>   arch/arm/mach-exynos/regs-sys.h |   22 ++++++++++++++++++++++
>   4 files changed, 24 insertions(+), 3 deletions(-)
>   create mode 100644 arch/arm/mach-exynos/regs-sys.h

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
