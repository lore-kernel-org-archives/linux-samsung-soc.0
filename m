From: =?ISO-8859-1?Q?St=E9phane_Marchesin?=
	<stephane.marchesin@gmail.com>
Subject: Re: [PATCH 0/3] add mie driver for exynos
Date: Sun, 9 Dec 2012 23:45:47 -0800
Message-ID: <CACP_E+JdiVxD05k0F57bmXWw1WKiS_NNviXOXYUVegwi5MnrsQ@mail.gmail.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com> <CAAQKjZM278TfT=dcVJoKRPqWpdChaJv2N6v4O_D-xsxJOLKeRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:34388 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176Ab2LJHq2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Dec 2012 02:46:28 -0500
Received: by mail-qa0-f53.google.com with SMTP id a19so1196806qad.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 09 Dec 2012 23:46:27 -0800 (PST)
In-Reply-To: <CAAQKjZM278TfT=dcVJoKRPqWpdChaJv2N6v4O_D-xsxJOLKeRQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: "R. Chandrasekar" <rcsekar@samsung.com>, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, rcsekar.samsung@gmail.com

On Sun, Dec 9, 2012 at 10:26 PM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
> 2012/12/6 R. Chandrasekar <rcsekar@samsung.com>
>
>> From: "R. Chandrasekar" <rcsekar@samsung.com>
>>
>> this patch set adds the driver support for the dithering functionali=
ty of
>> the
>> mobile image enhancement (mie) module.
>>
>> device tree support is added for mie.
>>
>> fimd adds the mie module as plugin and calls the dithering function.
>> dithere is
>> required when the panels bpp is less then fimd output.
>>
>> though mie mie has other functionalities, current system uses only
>> dithereing.
>>
>
> Please, move mie module into drivers/video/exynos. The mie is a inter=
face
> between fimd and lcd panel(or mipi-dsi, eDP) to enhance image to be
> displayed. And it seems like that this doesn't need drm framework-rel=
evant
> interfaces, such as gem.

Well, if you want to support it from the DRM, it should live in
drivers/gpu/drm, and I don't think you should add another platform
driver in the first place. The profusion of platform drivers in exynos
makes it really difficult to support suspend/resume and initialization
properly as many devices which operate separately need to sync through
global variables.

St=E9phane


>
> And also, please refer to the below link, Common Display Framework, f=
or more
> generic way.
>
> http://lists.freedesktop.org/archives/dri-devel/2012-November/030888.=
html
>
> Thanks,
> Inki Dae
>
>>
>> R. Chandrasekar (3):
>>   DTS: exynos: add device tree support for exynos mie
>>   drm: fimd: add mie plugin support for dithering
>>   drm: mie: add mie driver for exynos
>>
>>  arch/arm/boot/dts/exynos5250.dtsi               |    7 +-
>>  drivers/gpu/drm/exynos/Kconfig                  |    7 +
>>  drivers/gpu/drm/exynos/Makefile                 |    1 +
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 +++++-
>>  drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++
>>  drivers/gpu/drm/exynos/exynos_drm_mie.c         |  250
>> +++++++++++++++++++++++
>>  drivers/gpu/drm/exynos/exynos_drm_mie.h         |   50 +++++
>>  drivers/gpu/drm/exynos/exynos_regs-mie.h        |   75 +++++++
>>  8 files changed, 465 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
>>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
>>  create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
>>  create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
