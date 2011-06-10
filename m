From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 5/5] ASoC: SMDKV310: Enable SPDIF device
Date: Fri, 10 Jun 2011 12:17:12 +0530
Message-ID: <BANLkTikVeCoLei6xXHz1JU6Fb-ZC6gkQVA@mail.gmail.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
	<1307687667-9127-6-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64394 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753092Ab1FJGrO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 02:47:14 -0400
Received: by bwz15 with SMTP id 15so1942353bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2011 23:47:12 -0700 (PDT)
In-Reply-To: <1307687667-9127-6-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Jun 10, 2011 at 12:04 PM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> =C2=A0sound/soc/samsung/Kconfig | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> index d155cbb..92236eb 100644
> --- a/sound/soc/samsung/Kconfig
> +++ b/sound/soc/samsung/Kconfig
> @@ -158,7 +158,7 @@ config SND_SOC_GONI_AQUILA_WM8994
>
> =C2=A0config SND_SOC_SAMSUNG_SMDK_SPDIF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "SoC S/PDIF Audio support for SMD=
K"
> - =C2=A0 =C2=A0 =C2=A0 depends on SND_SOC_SAMSUNG && (MACH_SMDKC100 |=
| MACH_SMDKC110 || MACH_SMDKV210)
> + =C2=A0 =C2=A0 =C2=A0 depends on SND_SOC_SAMSUNG && (MACH_SMDKC100 |=
| MACH_SMDKC110 || MACH_SMDKV210 || MACH_SMDKV310)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select SND_SAMSUNG_SPDIF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y if you want to add support fo=
r SoC S/PDIF audio on the SMDK.

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
