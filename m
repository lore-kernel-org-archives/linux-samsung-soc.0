Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C525D3A8F0
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Oct 2024 03:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728273333; cv=none; b=U0CE/xvUnnvOZJ21uN1uP5K+5s68nsk36OQ+dP17Zu5qaCCQLOzcet0R8qV8WBxwdPOU8JPZXzccQXfVY+uu+8w0zdfq/t5EXjeHNd5zerstavqSyEsxFUBl3frHnWk2hOY2E4I6XBibKYNs/7kph6MDbSnYz8ge8lyv5wXFD/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728273333; c=relaxed/simple;
	bh=E0eUfEmaeQNn6bdFpqGrxTSNUwbXKH+6wYswkyCxs2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2yiSl+4smwLjMZbdTPyXkC8dclB4kAfwL5z/QdXzkm60vgoXmYVSJHV3gjEQeM94slwhl7VcIVQRgFmNLhZaCrIi3EyWyNr6foY5vLDrR9KdNR2bUjJ8EWBE7GsFH184ZV0dWvpfg79xCQYXTNbSwnpAKqrdIaTYjzYGkWyJCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIXMp9Qa; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIXMp9Qa"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4a3a4432737so2916646137.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Oct 2024 20:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728273330; x=1728878130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mANiwyb71q4xafpd8CIRoAtKTzAzPGHdv1+1/ckpIeI=;
        b=AIXMp9Qa8BSnTFwZOrcjgRv//N5WDpEN2s4JHLhfKY7XWBjYddn/SZbPtrEmBIq4rJ
         +Wx5Tk3z8VaJ9vcLneFbA+zAxVgRtasSxPYYmW1dNIOrSIQMB7YXsgV66XuHVDKcrNwL
         i/BDxty1x2/qylXMk2FZrg0DLbpvs1j0JaDJTdaPjBy95RxLXPFRVpSqAk3ZRB+xKiKj
         Gae1jHDfEgu+7/6oQmWj1vwA3DqUOzRnc88mRHclTBKzBvRfkzOjim4yA1DL6v9nrwjn
         EgUgiHPkQCfmre8J7hCksTssxI6a0TXZ8kgQL9pDflvcWh7CC1SScMXqJFCHQTXtQaOI
         jhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728273330; x=1728878130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mANiwyb71q4xafpd8CIRoAtKTzAzPGHdv1+1/ckpIeI=;
        b=CpI/Tctu7FnLIjuStkdTn8xvrarALWJaNfVlYbuyKJTcCYyzOtRp/ZpbeJPurEU7FT
         hoXUxk+p/mjic+VkjoOFn2muAEeHxU3qh1sjDlxWIaKsIi9K7xl3Npa6X8CA0zoqbBdE
         EU2ZUh3djDDA4JK7O2Dk/Dl2982ShrtXOZLD2vsAN3wMj+5Wd4Mw0apKx91xMsS8McaV
         LTE1NIveDStyS8PePZQQnYRZ8bsGCq6WLWW800OQ4BIcRVi/w2dwZaUggqxKEFWQBtMl
         Um2vGrcphgs61hBv6qT1kPjht1WIYNWISoHGADxvPmBdypM6i5UjTd+TlAYoFR+CQBX4
         8kdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8n9gnEXNUQ87LU51Dz7+aBt52cZ3v8X8T3XAL4uvToL+qPhcXmuRban7HJuBiVU5KbaIN19c8+iujaZGcN25GGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFiOiz+Zodo4/e21Hhpw61r35Sm4H6OH05eNXU1tiBqNfLQfEZ
	hqMvcIZOlYt7Nz9vNHfVxYq0lzqpH7IEKzMQgO/OW7DvSVIebDEQS2gq3DVXgJsA3HDa7wi44gX
	fDYszQGM+vr6h+9f0GY8dX4VyzPI=
X-Google-Smtp-Source: AGHT+IFLrph4tmOYV0V8hc6Dzf435O/hWzrbcMklYZvPYYM5MuX/2Lym07qJPlfBJ6dW7or4KofYeSdEFdik0X1I974=
X-Received: by 2002:a05:6102:508c:b0:4a3:d4bd:258b with SMTP id
 ada2fe7eead31-4a405d0dfa8mr5763888137.8.1728273330534; Sun, 06 Oct 2024
 20:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20241002053341epcas1p2b46acd87dacb4d4164402ae3ee02e968@epcas1p2.samsung.com>
 <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
In-Reply-To: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 7 Oct 2024 12:54:54 +0900
Message-ID: <CAAQKjZMdg1hXU7eZnkMGmNQhkTPGto_cnbX+faH4Pu6PNUxWSw@mail.gmail.com>
Subject: Re: [PATCH WIP 0/7] drm/exynos: Add autov9 DPU code
To: Kwanghoon Son <k.son@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	David Virag <virag.david003@gmail.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your contribution. Below are some comments.

2024=EB=85=84 10=EC=9B=94 2=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 2:33, K=
wanghoon Son <k.son@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Disclaimer: This code is WIP, not even ready for review.
> If you have no interest in Exynos DRM, don't waste your time to read
> it.
>
> 1. why share this ugly code?
>
> This patch is to share and discuss the necessary parts for recent
> upstream of exynos dpu_dma, dpp[1]
> Please don't look Patch 2-7, this is just proof that dpu_dma,
> dpp works. (Also has build break!)
> Also, since I don't have much experience in Linux kernel yet, I thought
> it's better to share before going too wrong direction.
> This patch is a code that successfully boots, modetest and drm from the
> latest v6.12-rc1 base.

Good try. If you're uncertain about a patch you've written, don't
hesitate to post it as a Work In Progress (WIP) to seek feedback and
assistance from the community. This is a valuable approach to
contributing to open source projects.

>
> [1] https://lore.kernel.org/linux-samsung-soc/2e4d3d180f535e57d9cb98e7bac=
1d14b51ffc5d4.camel@gmail.com/
>
> 2. some want to help or discuss
>
> -Naming problem
> Q: What is best naming for files and Kconfig var?
>
> As-is : exynos9_decon.c exynos_dpp.c exynos_dpu_dma.c
>
> For DMA, there already exists an exynos_drm_dma.c, so I named it as
> 'dpu_dma' according to the IP manual.
> But I'm considering make prefix 'exynosautov9_drm' for all or
> 'exynos_dpu'.

To share an insight regarding the Exynos SoC architecture, until the
Exynos5 series, the Exynos SoC family had a display controller (either
DECON for Exynos5 series or FIMD for Exynos4 series) that internally
included a DMA unit composed of multiple channels, with a separate
pre-processor unit (such as FIMC or GSC) existing as a distinct IP.
However, in the case of the ExynosAuto series, it appears that the DMA
IP (DPU DMA), pre-processing IP (DPP), and display controller IP
(DECON) are integrated into a single hardware block and designed to be
hardware-wired internally. As a result, it seems that these three IPs
must always be enabled simultaneously.

Regarding file naming, I would like to offer some insights. Starting
from the ExynosAuto series, there has been a significant change in the
display block structure from a hardware perspective. While the DECON
IP name existed previously, the key difference is that the earlier
DECON IP also controlled the DMA controller unit within the driver.
This means that the previous DECON driver cannot be universally
applied to the new structure.

Additionally, historically, the Exynos DRM driver has followed a
specific convention when determining file names, using the IP name as
a prefix. There are two rules for naming, as outlined below:
1. If two or more Exynos families share the same display block
hardware structure, the prefix is based on the lowest version of the
Exynos series (e.g., Exynos8 or Exynos8xx). This is because multiple
SoCs should be managed by the same driver. In such cases, a compatible
string is used to distinguish between the SoCs, allowing the driver to
identify the specific IP for each SoC at runtime.
2. If a new display block structure is introduced with a new SoC, the
driver name can be determined by using the SoC version as the prefix.

However, upon reviewing the device tree code, I noticed that the three
IPs share the same base address for memory-mapped I/O like below.
decon@18c30000
dpp@18c20000
dpu-dma@18c60000

In my opinion, these three IPs could be integrated into a single
module, Exynos8_drm_decon.c or other proper module name.
As you can see, same base address, 0x18c00000, are used for three IPs
and only difference is offset.

>
> -DECON interface
> Q: dpp_update(), dpu_dma_update() function are looks ok?
>
> Origin vendor code split each channel to comaptible data(dma_fg0,
> dma_g0, ...) using binding.
> Problem is Exynos850 or each SOC has own dma,dpp wiring. (e.g. some
> Exynos850 is not wiring with dma <-> dpp. they just dma <-> decon)
>
> So I changed it to code level that decon call register setting
> function.
> Decon will control dpp, dma based on channel parameter using
> dpp_update(), dpu_dma_update() function
>
> -DP
> I'm not familiar with almost all parts of DP. If someone is interested
> in Exynos DP, any advice would be appreciated.

The DP driver was originally implemented in the drm/exynos folder, but
since the Rockchip RK3288 SoC uses the same DP, it was moved to the
drm/bridge folder for sharing purposes. Therefore, for Exynos DRM
driver dependencies, it would be advisable to add the compatible
string for the ExynosAuto SoC version in the exynos5_dp.c module, and
implement the SoC-specific code under the drm/bridge/analogx/ folder.
For more details, you can refer to below link,
https://lwn.net/Articles/656254/

Thanks,
Inki Dae

>
> 3. About exynosv9 arhitecture
>
> In the case of the existing DRM 5 series, DECON played a role as CRTC
> and sent data to the panel.
> I don't know about the DRM 7 series, but the Exynos 8 and auto9 series ha=
ve
> DECON divided into three areas: DMA, DPP, and DECON, to started
> supporting more channels and formats.
>
> Exynos auto v9 has
>
> DPU_DMA - reads the image data from external memory, converts the image
> into pixels, and transfers them to remaining display processing
> pipeline
> DPP (Display Pre-Processor) - frame data from image DMA and applies the
> selected image processing function before transferring it to DECON
> DECON (Display and Enhancement Controller) - same as previous decon
> role.
>
> and dma and dpp are wired with hardware (They can not mix with other
> channel)
>
> channel> sysMMU> DMA> DPP
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ch0     MMU_0   GF0     GF0
> ch1     MMU_0   G0      GF1
> ch2     MMU_1   G1      GF2
> ch3     MMU_1   GF1     GF3
> ch4     MMU_2   VG0     VG0
> ch5     MMU_2   G2      GF4
> ch6     MMU_3   G3      GF5
> ch7     MMU_3   VG1     VG1
>
> note that exynos850 has 4 channel with different wiring.
>
> 4. Todos before RFC
>
> - remove all vendor style code
> - more features (resolution, format, plane)
> - proper way register setting for dma, dpp channel
> - make DP code to proper mainline code using helper functions
>
> To: Inki Dae <inki.dae@samsung.com>
> To: Krzysztof Kozlowski <krzk@kernel.org>
> To: Alim Akhtar <alim.akhtar@samsung.com>
> To: David Virag <virag.david003@gmail.com>
> To: Sam Protsenko <semen.protsenko@linaro.org>
> Cc: linux-samsung-soc@vger.kernel.org
>
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
> Kwanghoon Son (7):
>       drm/exynos: Initial Exynosautov9 drm
>       drm/exynos: Add Exynosautov9 decon
>       drm/exynos: Add drivers on drv.c
>       drm/exynos: exynos DPTX hw
>       clk: samsung: exynoautov9: Add dptx cmu
>       phy: samsung,dp-video-phy: Add exynosautov9 dp phy
>       arm64: dts: exynosautov9: Enable drm
>
>  arch/arm64/boot/dts/exynos/exynosautov9-dpu.dtsi   |  110 +
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   30 +
>  drivers/clk/samsung/clk-exynosautov9.c             |   35 +
>  drivers/gpu/drm/exynos/Kconfig                     |   17 +
>  drivers/gpu/drm/exynos/Makefile                    |    3 +
>  drivers/gpu/drm/exynos/exynos9_decon.c             | 1765 +++++++
>  drivers/gpu/drm/exynos/exynos_dpp.c                |   96 +
>  drivers/gpu/drm/exynos/exynos_dpp.h                |  278 ++
>  drivers/gpu/drm/exynos/exynos_dpu_dma.c            |  330 ++
>  drivers/gpu/drm/exynos/exynos_dpu_dma.h            |   16 +
>  drivers/gpu/drm/exynos/exynos_drm_dp.c             | 5038 ++++++++++++++=
++++++
>  drivers/gpu/drm/exynos/exynos_drm_dp.h             |  964 ++++
>  .../gpu/drm/exynos/exynos_drm_dp_link_training.c   |  586 +++
>  drivers/gpu/drm/exynos/exynos_drm_drv.c            |   11 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h            |    3 +
>  drivers/gpu/drm/exynos/regs-decon9.h               | 1244 +++++
>  drivers/phy/samsung/phy-exynos-dp-video.c          |    9 +-
>  include/dt-bindings/clock/samsung,exynosautov9.h   |    4 +
>  18 files changed, 10537 insertions(+), 2 deletions(-)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241002-auto9-961d6a19be50
>
> Best regards,
> --
> Kwanghoon Son <k.son@samsung.com>
>
>
