From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 RE-SEND] [CPUFREQ] EXYNOS5250: Add support cpufreq
 for EXYNOS5250
Date: Wed, 14 Mar 2012 11:24:28 -0700
Message-ID: <4F60E25C.9060005@samsung.com>
References: <1331377202-25173-1-git-send-email-kgene.kim@samsung.com> <4F60D5FE.7080400@samsung.com> <20120314175703.GA3803@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:37552 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758394Ab2CNSYd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 14:24:33 -0400
Received: by ghrr11 with SMTP id r11so2118578ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 11:24:32 -0700 (PDT)
In-Reply-To: <20120314175703.GA3803@redhat.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Jones <davej@redhat.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jaecheol Lee <jc.lee@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

2012-03-14 =EC=98=A4=EC=A0=84 10:57, Dave Jones =EC=93=B4 =EA=B8=80:
> On Wed, Mar 14, 2012 at 10:31:42AM -0700, Kukjin Kim wrote:
>   >  Kukjin Kim wrote:
>   >  >  From: Jaecheol Lee<jc.lee@samsung.com>
>   >  >
>   >  >  This patch adds support cpufreq for EXYNOS5250 SoC. Basically=
,
>   >  >  the exynos-cpufreq.c is used commonly and exynos5250-cpufreq.=
c
>   >  >  is used for EXYNOS5250(two Cortex-A15 cores) SoC.
>   >  >
>   >  >  Signed-off-by: Jaecheol Lee<jc.lee@samsung.com>
>   >  >  Signed-off-by: Kukjin Kim<kgene.kim@samsung.com>
>   >
>   >  Hi again Dave :)
>   >
>   >  Please pick up this patch for v3.4.
>   >  If any problems, please kindly let us know.
>
> this, and the other patch doesn't apply against current cpufreq.git
>
Oops, maybe you applied this first. Pleae try again EXYNOS4X12 first=20
then, this. I applied on top of cpufreq/next and there was no complain.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> patching file arch/arm/mach-exynos/include/mach/cpufreq.h
> patching file drivers/cpufreq/Kconfig.arm
> Hunk #1 succeeded at 30 (offset -17 lines).
> Hunk #2 succeeded at 43 (offset -18 lines).
> patching file drivers/cpufreq/Makefile
> Hunk #1 FAILED at 45.
> 1 out of 1 hunk FAILED -- saving rejects to file drivers/cpufreq/Make=
file.rej
> patching file drivers/cpufreq/exynos-cpufreq.c
> Hunk #1 succeeded at 252 (offset -2 lines).
> patching file drivers/cpufreq/exynos4x12-cpufreq.c
> patching file arch/arm/mach-exynos/include/mach/cpufreq.h
> Hunk #1 FAILED at 33.
> 1 out of 1 hunk FAILED -- saving rejects to file arch/arm/mach-exynos=
/include/mach/cpufreq.h.rej
> patching file drivers/cpufreq/Kconfig.arm
> Hunk #1 FAILED at 48.
> Hunk #2 FAILED at 67.
> 2 out of 2 hunks FAILED -- saving rejects to file drivers/cpufreq/Kco=
nfig.arm.rej
> patching file drivers/cpufreq/Makefile
> Hunk #1 FAILED at 46.
> 1 out of 1 hunk FAILED -- saving rejects to file drivers/cpufreq/Make=
file.rej
> patching file drivers/cpufreq/exynos-cpufreq.c
> Hunk #1 FAILED at 256.
> 1 out of 1 hunk FAILED -- saving rejects to file drivers/cpufreq/exyn=
os-cpufreq.c.rej
> patching file drivers/cpufreq/exynos5250-cpufreq.c
