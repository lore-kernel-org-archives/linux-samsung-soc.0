From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: S5PV210: Add G2D to mach-s5pv210
Date: Tue, 31 Jan 2012 11:24:56 +0530
Message-ID: <CAK9yfHxjFz1Z+dn+g2wpv23wd3aW5dpx=QUXHs8Gf5zs0VJ_Hw@mail.gmail.com>
References: <1325496717-11115-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:54240 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344Ab2AaFy5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 00:54:57 -0500
Received: by qcqw6 with SMTP id w6so117706qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2012 21:54:56 -0800 (PST)
In-Reply-To: <1325496717-11115-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Ping Kukjin...


On 2 January 2012 15:01, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
> =A0arch/arm/mach-s5pv210/include/mach/map.h | =A0 =A03 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach=
-s5pv210/include/mach/map.h
> index 89c34b8..721df50 100644
> --- a/arch/arm/mach-s5pv210/include/mach/map.h
> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> @@ -80,6 +80,8 @@
>
> =A0#define S5PV210_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00xF800000=
0
>
> +#define S5PV210_PA_G2D =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xFA000000
> +
> =A0#define S5PV210_PA_MDMA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A00xFA200000
> =A0#define S5PV210_PA_PDMA0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xE0900000
> =A0#define S5PV210_PA_PDMA1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0xE0A00000
> @@ -119,6 +121,7 @@
> =A0#define S5P_PA_MIPI_CSIS0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_MI=
PI_CSIS
> =A0#define S5P_PA_MFC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210=
_PA_MFC
> =A0#define S5P_PA_IIC_HDMIPHY =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_IIC_=
HDMIPHY
> +#define S5P_PA_G2D =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_P=
A_G2D
>
> =A0#define S5P_PA_SDO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210=
_PA_SDO
> =A0#define S5P_PA_VP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV2=
10_PA_VP
> --
> 1.7.4.1
>



--=20
With warm regards,
Sachin
