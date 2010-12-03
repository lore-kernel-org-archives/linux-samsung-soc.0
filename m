From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
Date: Fri, 3 Dec 2010 14:36:34 +0900
Message-ID: <AANLkTimg_COsOnfLbgTC36EgZvBnuWaGrygbWz-Sk+6m@mail.gmail.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
	<1291307862-8125-4-git-send-email-s.nawrocki@samsung.com>
	<AANLkTimgazoKTyuG37oUbD_45Cv7Un4=GDMsXXxCuH5U@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:41888 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709Ab0LCFgf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Dec 2010 00:36:35 -0500
Received: by gxk1 with SMTP id 1so1639387gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 21:36:35 -0800 (PST)
In-Reply-To: <AANLkTimgazoKTyuG37oUbD_45Cv7Un4=GDMsXXxCuH5U@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

On Fri, Dec 3, 2010 at 2:14 PM, Jassi Brar <jassisinghbrar@gmail.com> w=
rote:
> On Fri, Dec 3, 2010 at 1:37 AM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> There may be up to 2 MIPI-CSI2 interfaces depending on SoC version.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
0 ++++++++
>> =A0arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +
>> =A0arch/arm/plat-s5p/dev-csis0.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 34 ++=
+++++++++++++++++++++++++++
>> =A0arch/arm/plat-s5p/dev-csis1.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 33 ++=
++++++++++++++++++++++++++
>> =A0arch/arm/plat-samsung/include/plat/csis.h | =A0 28 ++++++++++++++=
+++++++++
>> =A0arch/arm/plat-samsung/include/plat/devs.h | =A0 =A03 ++
>> =A06 files changed, 110 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/plat-s5p/dev-csis0.c
>> =A0create mode 100644 arch/arm/plat-s5p/dev-csis1.c
>> =A0create mode 100644 arch/arm/plat-samsung/include/plat/csis.h
>>
>> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
>> index 65dbfa8..2fb0c88 100644
>> --- a/arch/arm/plat-s5p/Kconfig
>> +++ b/arch/arm/plat-s5p/Kconfig
>> @@ -56,3 +56,13 @@ config S5P_DEV_ONENAND
>> =A0 =A0 =A0 =A0bool
>> =A0 =A0 =A0 =A0help
>> =A0 =A0 =A0 =A0 =A0Compile in platform device definition for OneNAND=
 controller
>> +
>> +config S5P_DEV_CSIS0
>> + =A0 =A0 =A0 bool
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 Compile in platform device definitions for MIPI-CS=
I2 interface 0
>> +
>> +config S5P_DEV_CSIS1
>> + =A0 =A0 =A0 bool
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 Compile in platform device definitions for MIPI-CS=
I2 interface 1
>> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
>> index de65238..2b73173 100644
>> --- a/arch/arm/plat-s5p/Makefile
>> +++ b/arch/arm/plat-s5p/Makefile
>> @@ -28,3 +28,5 @@ obj-$(CONFIG_S5P_DEV_FIMC0) =A0 +=3D dev-fimc0.o
>> =A0obj-$(CONFIG_S5P_DEV_FIMC1) =A0 =A0+=3D dev-fimc1.o
>> =A0obj-$(CONFIG_S5P_DEV_FIMC2) =A0 =A0+=3D dev-fimc2.o
>> =A0obj-$(CONFIG_S5P_DEV_ONENAND) =A0+=3D dev-onenand.o
>> +obj-$(CONFIG_S5P_DEV_CSIS0) =A0 =A0+=3D dev-csis0.o
>> +obj-$(CONFIG_S5P_DEV_CSIS1) =A0 =A0+=3D dev-csis1.o
>
> When we do have defines for each device, why not have both in one fil=
e
> with each contained in ifdef for it's define ? That will reduce file =
count.

To Jassi,

Please make a conclusion from LSI first, I'm confused, I insisted it
as you, but kgene rejected it.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
