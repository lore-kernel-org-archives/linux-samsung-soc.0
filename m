From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/2] EXYNOS4_DT fixes for 3.3-rc1+ kernels
Date: Tue, 31 Jan 2012 20:18:05 +0530
Message-ID: <CAJuYYwQepKi+TG1tOaZ=X9WEi3cwbwsoofuZBSqSiBb4LA_YoA@mail.gmail.com>
References: <1328006193-13902-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:61658 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753280Ab2AaOsG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 09:48:06 -0500
In-Reply-To: <1328006193-13902-1-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Karol Lewandowski <k.lewandowsk@samsung.com>
Cc: m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

Hi Karol,

On 31 January 2012 16:06, Karol Lewandowski <k.lewandowsk@samsung.com> =
wrote:
> Device Tree-based Exynos4 machine prepared by Thomas Abraham and
> included in 3.3-rc1 hasn't been adjusted to changes that have happene=
d
> to mach-exynos during 3.3 merge window.
>
> Following patch series fixes one build and one boot error making it
> possible to boot system with SMP disabled.
>
> SMP support is still broken for unknown reason, though.
>
> [ To use it it's also required to cherry-pick "ARM: EXYNOS: fix
> =A0non-SMP builds for EXYNOS4" already found in kgene's
> =A0linux-samsung.git (branch v3.3-samsung-fixes-2) ]
>
>
> Karol Lewandowski (2):
> =A0ARM: Exynos4: Make exynos4-dt compile again
> =A0ARM: Exynos4: Convert exynos4-dt to CONFIG_MULTI_IRQ_HANDLER
>
> =A0arch/arm/mach-exynos/mach-exynos4-dt.c | =A0 =A07 +++++--
> =A01 files changed, 5 insertions(+), 2 deletions(-)

Thanks for these patches and identifying the issue.

Regards,
Thomas.

> --
> 1.7.8.3
>
