From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 03/11] ARM: EXYNOS: local regs-pmu.h header file
Date: Sat, 28 Dec 2013 15:09:16 -0800
Message-ID: <CAOesGMjJXodfZUSwHWdYgJsTWL4FANxXnP519B0AUiwpEn4bQQ@mail.gmail.com>
References: <116101cefb1e$69ddfe70$3d99fb50$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:32838 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037Ab3L1XJR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Dec 2013 18:09:17 -0500
Received: by mail-qc0-f169.google.com with SMTP id r5so9909707qcx.14
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Dec 2013 15:09:16 -0800 (PST)
In-Reply-To: <116101cefb1e$69ddfe70$3d99fb50$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,


On Tue, Dec 17, 2013 at 3:52 AM,  <kgene@kernel.org> wrote:
> From: Kukjin Kim <kgene.kim@samsung.com>
>
> This moves regs-pmu.h file into mach-exynos directory.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/mach-exynos/common.c                      |    3 ++-
>  arch/arm/mach-exynos/cpuidle.c                     |    2 +-
>  arch/arm/mach-exynos/hotplug.c                     |    2 +-
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +-
>  arch/arm/mach-exynos/platsmp.c                     |    2 +-
>  arch/arm/mach-exynos/pm.c                          |    2 +-
>  arch/arm/mach-exynos/pm_domains.c                  |    3 ++-
>  arch/arm/mach-exynos/pmu.c                         |    2 +-
>  arch/arm/mach-exynos/{include/mach => }/regs-pmu.h |    0
>  9 files changed, 10 insertions(+), 8 deletions(-)
>  rename arch/arm/mach-exynos/{include/mach => }/regs-pmu.h (100%)

This looks OK, but when you committed, you did the move of the include
file in another commit (e44de221d3ddb99387b04cfd49483bcd05daa6fb).
That means that between that commit and this patch, there's build
breakage. Please try to avoid that in the future since if something
needs to be bisected near here it can cause problems.


-Olof
