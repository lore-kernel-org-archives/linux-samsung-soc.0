Return-Path: <SRS0=JKgt=57=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE73C2BA19
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Apr 2020 12:14:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CB83206F9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Apr 2020 12:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Akp1fer9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368661AbgDOMOL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Apr 2020 08:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S368578AbgDOMLe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 08:11:34 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C006DC061A0F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Apr 2020 05:11:33 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id l25so16872109qkk.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Apr 2020 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ryUjonk9Bo6/VS6Kj71zUulwTQ80F/AKeChrr6mLo8=;
        b=Akp1fer9yVAmgP8VjIfq5WX5ZdO2GE+UmqSWAvAtSRdqeW6PqIPWPXGhYDIh8hxDLP
         nkizW0Y91VngW4SPn+pfoUBBWiiYK7oemLUWLAuQehOlWhNvJdlkH6T/s0m+y+JSH/hv
         BesmWX7IClKpXY2gGUaPB1SSjnx74qxx+mYI93bsB8oOH9lAO8ZdwRjCal9h7zgp1VyV
         kRikT3Hc1uDyDVlXFr3RePkgJVApmpSQrqGYBWT9HT4hAoMVTkAFaBu125jqgo72FtIG
         tqorH+l3Dmp9/K4hshwiOvh8ZFmy3ar7ZLhBkUpOjdl+zrzWHZ3wtgMVHNh45I/owmyH
         kC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ryUjonk9Bo6/VS6Kj71zUulwTQ80F/AKeChrr6mLo8=;
        b=LM9nRPmqoOhMI/lZd2PqVadgbaKJBgbRDnWaB1imC3BD+vDzYyJVsYhgvbt3RL5y2v
         6cVxlvVfPyq4B5Q31+XPB7BP1nvWoCGRVGEEB1Ngd/vxhntZXMxnPLQ/DMHuh42dbWqp
         XAA/piEmUvhimQKYBlQ4wOalavO8fq7PjkezYW8XPhKpuwhXn9TYsPjrSm4jk52UAq5D
         WWMnL3LPU5gX1wbNaNTeWtmlqhvY8I1uK1eE5ycB80tX4GGzq+QBhHWxkOuiQC3rRDVo
         7qEds1+axf0h4CdfrzuzcgF1hWNVUCOJ2i38rCdLRISs4OZQp/w5j2m0APaDrrz12XzD
         /n/Q==
X-Gm-Message-State: AGi0PuZFDIcTK/r/DxWHJXwCbZjtvPeySqcw6GxKkCEPhq+MzmCpVjyb
        U8NMAYzIdnGd7BEBEG3FTetErP+R0cQ9O4Ue/lGoZw==
X-Google-Smtp-Source: APiQypJgfPJKXTdaDjJRJr3ndqin0UUnaDjqE2AyDq5NBSSQzQDFNUc9CIsSNsRjndjy+phc70+GxTlLLKlmpciMDiA=
X-Received: by 2002:a05:620a:4f2:: with SMTP id b18mr25463065qkh.433.1586952692854;
 Wed, 15 Apr 2020 05:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586946605.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1586946605.git.mchehab+huawei@kernel.org>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Wed, 15 Apr 2020 14:11:21 +0200
Message-ID: <CA+M3ks4QE-eXgqwrG=_a_Esyyf5k1hGGm2_L3xGQ9hgu1HvmtQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Move CEC drivers and menu to be out of MEDIA_SUPPORT
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Kukjin Kim <kgene@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Benson Leung <bleung@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        "moderated list:ARM/S5P EXYNOS AR..." 
        <linux-samsung-soc@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-amlogic@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Le mer. 15 avr. 2020 =C3=A0 12:31, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> a =C3=A9crit :
>
> The CEC_CORE doesn't depend on MEDIA_SUPPORT. So, it doesn't make
> much sense to keep it under its menu.
>
> This series move it to be just after RC support. As a side effect, now
> dependencies like PCI and USB are now selected, making easier to
> enable CEC drivers.
>
> - v2:
>   - move more CEC drivers from platform/
>   - rename kconfig options to be more coherent
>
> Mauro Carvalho Chehab (6):
>   media: cec: move the core to a separate directory
>   media: place CEC menu before MEDIA_SUPPORT
>   media: move CEC platform drivers to a separate directory
>   media: move CEC USB drivers to a separate directory
>   media: cec: rename CEC platform drivers config options
>   media: cec: rename USB config options
>
>  arch/arm/configs/exynos_defconfig             |   2 +-
>  arch/arm/configs/multi_v7_defconfig           |   2 +-
>  drivers/media/Kconfig                         |  30 +----
>  drivers/media/cec/Kconfig                     |  25 ++++
>  drivers/media/cec/Makefile                    |  16 +--
>  drivers/media/cec/core/Makefile               |  16 +++
>  drivers/media/cec/{ =3D> core}/cec-adap.c       |   0
>  drivers/media/cec/{ =3D> core}/cec-api.c        |   0
>  drivers/media/cec/{ =3D> core}/cec-core.c       |   0
>  drivers/media/cec/{ =3D> core}/cec-notifier.c   |   0
>  .../media/cec/{ =3D> core}/cec-pin-error-inj.c  |   0
>  drivers/media/cec/{ =3D> core}/cec-pin-priv.h   |   0
>  drivers/media/cec/{ =3D> core}/cec-pin.c        |   0
>  drivers/media/cec/{ =3D> core}/cec-priv.h       |   0
>  drivers/media/cec/platform/Kconfig            | 121 +++++++++++++++++
>  drivers/media/cec/platform/Makefile           |  14 ++
>  .../{ =3D> cec}/platform/cec-gpio/Makefile      |   0
>  .../{ =3D> cec}/platform/cec-gpio/cec-gpio.c    |   0
>  drivers/media/cec/platform/cros-ec/Makefile   |   2 +
>  .../platform/cros-ec}/cros-ec-cec.c           |   0
>  drivers/media/cec/platform/meson/Makefile     |   3 +
>  .../{ =3D> cec}/platform/meson/ao-cec-g12a.c    |   0
>  .../media/{ =3D> cec}/platform/meson/ao-cec.c   |   0
>  .../s5p-cec =3D> cec/platform/s5p}/Makefile     |   2 +-
>  .../platform/s5p}/exynos_hdmi_cec.h           |   0
>  .../platform/s5p}/exynos_hdmi_cecctrl.c       |   0
>  .../s5p-cec =3D> cec/platform/s5p}/regs-cec.h   |   0
>  .../s5p-cec =3D> cec/platform/s5p}/s5p_cec.c    |   0
>  .../s5p-cec =3D> cec/platform/s5p}/s5p_cec.h    |   0
>  drivers/media/cec/platform/seco/Makefile      |   2 +
>  .../seco-cec =3D> cec/platform/seco}/seco-cec.c |   2 +-
>  .../seco-cec =3D> cec/platform/seco}/seco-cec.h |   0
>  drivers/media/cec/platform/sti/Makefile       |   2 +
>  .../sti/cec =3D> cec/platform/sti}/stih-cec.c   |   0
>  drivers/media/cec/platform/stm32/Makefile     |   2 +
>  .../{ =3D> cec}/platform/stm32/stm32-cec.c      |   0
>  drivers/media/cec/platform/tegra/Makefile     |   2 +
>  .../platform/tegra}/tegra_cec.c               |   0
>  .../platform/tegra}/tegra_cec.h               |   0
>  drivers/media/cec/usb/Kconfig                 |   6 +
>  drivers/media/cec/usb/Makefile                |   6 +
>  .../pulse8-cec =3D> cec/usb/pulse8}/Kconfig     |   5 +-
>  drivers/media/cec/usb/pulse8/Makefile         |   2 +
>  .../usb/pulse8}/pulse8-cec.c                  |   0
>  .../usb/rainshadow}/Kconfig                   |   5 +-
>  drivers/media/cec/usb/rainshadow/Makefile     |   2 +
>  .../usb/rainshadow}/rainshadow-cec.c          |   0
>  drivers/media/platform/Kconfig                | 125 ------------------
>  drivers/media/platform/Makefile               |  12 --
>  drivers/media/platform/cros-ec-cec/Makefile   |   2 -
>  drivers/media/platform/meson/Makefile         |   3 -
>  drivers/media/platform/seco-cec/Makefile      |   2 -
>  drivers/media/platform/sti/cec/Makefile       |   2 -
>  drivers/media/platform/stm32/Makefile         |   1 -
>  drivers/media/platform/tegra-cec/Makefile     |   2 -
>  drivers/media/usb/Kconfig                     |   6 -
>  drivers/media/usb/Makefile                    |   2 -
>  drivers/media/usb/pulse8-cec/Makefile         |   2 -
>  drivers/media/usb/rainshadow-cec/Makefile     |   2 -
>  59 files changed, 218 insertions(+), 212 deletions(-)
>  create mode 100644 drivers/media/cec/core/Makefile
>  rename drivers/media/cec/{ =3D> core}/cec-adap.c (100%)
>  rename drivers/media/cec/{ =3D> core}/cec-api.c (100%)
>  rename drivers/media/cec/{ =3D> core}/cec-core.c (100%)
>  rename drivers/media/cec/{ =3D> core}/cec-notifier.c (100%)
>  rename drivers/media/cec/{ =3D> core}/cec-pin-error-inj.c (100%)
>  rename drivers/media/cec/{ =3D> core}/cec-pin-priv.h (100%)
>  rename drivers/media/cec/{ =3D> core}/cec-pin.c (100%)
>  rename drivers/media/cec/{ =3D> core}/cec-priv.h (100%)
>  create mode 100644 drivers/media/cec/platform/Kconfig
>  create mode 100644 drivers/media/cec/platform/Makefile
>  rename drivers/media/{ =3D> cec}/platform/cec-gpio/Makefile (100%)
>  rename drivers/media/{ =3D> cec}/platform/cec-gpio/cec-gpio.c (100%)
>  create mode 100644 drivers/media/cec/platform/cros-ec/Makefile
>  rename drivers/media/{platform/cros-ec-cec =3D> cec/platform/cros-ec}/cr=
os-ec-cec.c (100%)
>  create mode 100644 drivers/media/cec/platform/meson/Makefile
>  rename drivers/media/{ =3D> cec}/platform/meson/ao-cec-g12a.c (100%)
>  rename drivers/media/{ =3D> cec}/platform/meson/ao-cec.c (100%)
>  rename drivers/media/{platform/s5p-cec =3D> cec/platform/s5p}/Makefile (=
63%)
>  rename drivers/media/{platform/s5p-cec =3D> cec/platform/s5p}/exynos_hdm=
i_cec.h (100%)
>  rename drivers/media/{platform/s5p-cec =3D> cec/platform/s5p}/exynos_hdm=
i_cecctrl.c (100%)
>  rename drivers/media/{platform/s5p-cec =3D> cec/platform/s5p}/regs-cec.h=
 (100%)
>  rename drivers/media/{platform/s5p-cec =3D> cec/platform/s5p}/s5p_cec.c =
(100%)
>  rename drivers/media/{platform/s5p-cec =3D> cec/platform/s5p}/s5p_cec.h =
(100%)
>  create mode 100644 drivers/media/cec/platform/seco/Makefile
>  rename drivers/media/{platform/seco-cec =3D> cec/platform/seco}/seco-cec=
.c (99%)
>  rename drivers/media/{platform/seco-cec =3D> cec/platform/seco}/seco-cec=
.h (100%)
>  create mode 100644 drivers/media/cec/platform/sti/Makefile
>  rename drivers/media/{platform/sti/cec =3D> cec/platform/sti}/stih-cec.c=
 (100%)
>  create mode 100644 drivers/media/cec/platform/stm32/Makefile
>  rename drivers/media/{ =3D> cec}/platform/stm32/stm32-cec.c (100%)
>  create mode 100644 drivers/media/cec/platform/tegra/Makefile
>  rename drivers/media/{platform/tegra-cec =3D> cec/platform/tegra}/tegra_=
cec.c (100%)
>  rename drivers/media/{platform/tegra-cec =3D> cec/platform/tegra}/tegra_=
cec.h (100%)
>  create mode 100644 drivers/media/cec/usb/Kconfig
>  create mode 100644 drivers/media/cec/usb/Makefile
>  rename drivers/media/{usb/pulse8-cec =3D> cec/usb/pulse8}/Kconfig (86%)
>  create mode 100644 drivers/media/cec/usb/pulse8/Makefile
>  rename drivers/media/{usb/pulse8-cec =3D> cec/usb/pulse8}/pulse8-cec.c (=
100%)
>  rename drivers/media/{usb/rainshadow-cec =3D> cec/usb/rainshadow}/Kconfi=
g (85%)
>  create mode 100644 drivers/media/cec/usb/rainshadow/Makefile
>  rename drivers/media/{usb/rainshadow-cec =3D> cec/usb/rainshadow}/rainsh=
adow-cec.c (100%)
>  delete mode 100644 drivers/media/platform/cros-ec-cec/Makefile
>  delete mode 100644 drivers/media/platform/meson/Makefile
>  delete mode 100644 drivers/media/platform/seco-cec/Makefile
>  delete mode 100644 drivers/media/platform/sti/cec/Makefile
>  delete mode 100644 drivers/media/platform/tegra-cec/Makefile
>  delete mode 100644 drivers/media/usb/pulse8-cec/Makefile
>  delete mode 100644 drivers/media/usb/rainshadow-cec/Makefile
>

For sti and stm32 CEC drivers:
Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>

> --
> 2.25.2
>
>
