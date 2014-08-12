From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=n
Date: Tue, 12 Aug 2014 22:49:12 +0200
Message-ID: <53EA7DC8.6040801@linaro.org>
References: <1407856317-2457-1-git-send-email-b.zolnierkie@samsung.com> <1407856317-2457-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:58345 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752213AbaHLUtP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Aug 2014 16:49:15 -0400
Received: by mail-wg0-f47.google.com with SMTP id b13so10364259wgh.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2014 13:49:14 -0700 (PDT)
In-Reply-To: <1407856317-2457-2-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Olof Johansson <olof@lixom.net>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 08/12/2014 05:11 PM, Bartlomiej Zolnierkiewicz wrote:
> Fix building of exynos_defconfig with disabled CONFIG_PM_SLEEP by
> adding checking whether Exynos cpuidle support is enabled before
> accessing exynos_enter_aftr.
>
> The build error message:
> arch/arm/mach-exynos/built-in.o:(.data+0x74): undefined reference to =
`exynos_enter_aftr'
> make: *** [vmlinux] Error 1
 >
> This patch has been tested on Exynos4210 based Origen board.
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/exynos.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exy=
nos.c
> index 6a24e11..d57f136 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -161,7 +161,9 @@ static void exynos_restart(enum reboot_mode mode,=
 const char *cmd)
>
>   static struct platform_device exynos_cpuidle =3D {
>   	.name              =3D "exynos_cpuidle",
> +#ifdef CONFIG_ARM_EXYNOS_CPUIDLE
>   	.dev.platform_data =3D exynos_enter_aftr,
> +#endif
>   	.id                =3D -1,
>   };

This patch does not address the real issue of the compilation error. Th=
e=20
cpuidle driver needs the exynos_enter_aftr function in order to work=20
correctly. Hence the Makefile should be fixed in order to compile pm.o=20
if cpuidle or pm_sleep are set.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
