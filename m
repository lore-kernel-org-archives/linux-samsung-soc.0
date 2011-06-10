From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/5] ARM: EXYNOS4: Add SPDIF for SMDKV310
Date: Fri, 10 Jun 2011 12:14:00 +0530
Message-ID: <BANLkTi=NPaw37BPadkA79uwsZkjjASFMrA@mail.gmail.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
	<1307687667-9127-5-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:40817 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634Ab1FJGoB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 02:44:01 -0400
Received: by bwz15 with SMTP id 15so1940969bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2011 23:44:00 -0700 (PDT)
In-Reply-To: <1307687667-9127-5-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Jun 10, 2011 at 12:04 PM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> This patch adds spdif to the machine supported device list for
> SMDKV310.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> =C2=A0arch/arm/mach-exynos4/mach-smdkv310.c | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-ex=
ynos4/mach-smdkv310.c
> index 7e3ee6c..966c6f2 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -190,6 +190,7 @@ static struct platform_device *smdkv310_devices[]=
 __initdata =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&exynos4_device_pd[PD_CAM],
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&exynos4_device_pd[PD_TV],
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&exynos4_device_pd[PD_GPS],
> + =C2=A0 =C2=A0 =C2=A0 &exynos4_device_spdif,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&exynos4_device_sysmmu,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&exynos4_device_pcm0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0&samsung_asoc_dma,

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
