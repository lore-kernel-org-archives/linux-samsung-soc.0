From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
Date: Fri, 3 Dec 2010 14:14:27 +0900
Message-ID: <AANLkTimgazoKTyuG37oUbD_45Cv7Un4=GDMsXXxCuH5U@mail.gmail.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-4-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50380 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750932Ab0LCFO3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 00:14:29 -0500
Received: by bwz15 with SMTP id 15so7990137bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 21:14:27 -0800 (PST)
In-Reply-To: <1291307862-8125-4-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

On Fri, Dec 3, 2010 at 1:37 AM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> There may be up to 2 MIPI-CSI2 interfaces depending on SoC version.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =C2=A0arch/arm/plat-s5p/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 10 ++++++++
> =C2=A0arch/arm/plat-s5p/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +
> =C2=A0arch/arm/plat-s5p/dev-csis0.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 34 +++++++++++++++++++++++++++++
> =C2=A0arch/arm/plat-s5p/dev-csis1.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 33 ++++++++++++++++++++++++++++
> =C2=A0arch/arm/plat-samsung/include/plat/csis.h | =C2=A0 28 +++++++++=
++++++++++++++
> =C2=A0arch/arm/plat-samsung/include/plat/devs.h | =C2=A0 =C2=A03 ++
> =C2=A06 files changed, 110 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 arch/arm/plat-s5p/dev-csis0.c
> =C2=A0create mode 100644 arch/arm/plat-s5p/dev-csis1.c
> =C2=A0create mode 100644 arch/arm/plat-samsung/include/plat/csis.h
>
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index 65dbfa8..2fb0c88 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -56,3 +56,13 @@ config S5P_DEV_ONENAND
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Compile in platform device definiti=
on for OneNAND controller
> +
> +config S5P_DEV_CSIS0
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Compile in platform device definitions =
for MIPI-CSI2 interface 0
> +
> +config S5P_DEV_CSIS1
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Compile in platform device definitions =
for MIPI-CSI2 interface 1
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index de65238..2b73173 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_S5P_DEV_FIMC0) =C2=A0 +=3D dev-fimc0.o
> =C2=A0obj-$(CONFIG_S5P_DEV_FIMC1) =C2=A0 =C2=A0+=3D dev-fimc1.o
> =C2=A0obj-$(CONFIG_S5P_DEV_FIMC2) =C2=A0 =C2=A0+=3D dev-fimc2.o
> =C2=A0obj-$(CONFIG_S5P_DEV_ONENAND) =C2=A0+=3D dev-onenand.o
> +obj-$(CONFIG_S5P_DEV_CSIS0) =C2=A0 =C2=A0+=3D dev-csis0.o
> +obj-$(CONFIG_S5P_DEV_CSIS1) =C2=A0 =C2=A0+=3D dev-csis1.o

When we do have defines for each device, why not have both in one file
with each contained in ifdef for it's define ? That will reduce file co=
unt.
