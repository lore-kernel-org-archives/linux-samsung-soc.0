Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E7026AABA;
	Fri, 27 Jun 2025 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018910; cv=none; b=CQEG5getZh7HdLP93dz3VLxjLKjFVvcl8ruw6kPb6Hr4e6W+fxhPMtw+wcLlXBkZ8tWPs2Lwk7Ny8S5HZc3rMoQClI3LbS5LxXPOdvO+boMNOBG9KrBk6aFqCy1UllCn/hhP94Loq1NP7UBVvlzG28jBzxBZxQ5Q7iBkR0y5rcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018910; c=relaxed/simple;
	bh=FIy0/y/zMlf/GXhAarxtRPGiPVqxkoRF0oTT6TLnBT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDUzxnhy4q1DCpc4L92as4ir78+J/l7D9bzcMCd7RMPCz+0w30XMJDj96rjBZGrSC9odZ09N6pvnMmD3iBTZdOwtJVQPWeXFqWP2Rm/fxmXIboeZA7CAYaj6Tyr17P9Gm3J3VrZGKY9e+wS2RGMoqkf+E8V3YHTTTsAWALu+mpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcuqosY8; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcuqosY8"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5316a5e4c6cso623630e0c.1;
        Fri, 27 Jun 2025 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751018906; x=1751623706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKqKeEQIi5rBs6NnW9qgvGwfpsv4wtOKoQMRdiWhtWU=;
        b=gcuqosY8EZcMopxo70Mxvh/OYMdsg8yZKMTjtnAIzY9LdWcJNpfcD7kwP0byMyn5cq
         /Tv60UWMvzzag/5eMqmKA/Obxf018213xJmyay5iQwDrLByI9bdIyGvdZij0U1UCXvVC
         otnvdlcAG6v5+EhilXUPUP6mJx9c9u/JVTSWVEM3c36DS9XxBMdjVEhZyZqau/faihlz
         XYAEEoZbVn5CDoZL45vBD5qdVaaJLVd2Cn86f77te0JMWal1wMxqpEbV55R6i/IYLCv4
         pEgH49i5oQT8RihyeNufvYAP62g5FrVTo+78d7koBnyjXpVoxvw/xtmEe8+hKcHTUHNY
         ea4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751018906; x=1751623706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKqKeEQIi5rBs6NnW9qgvGwfpsv4wtOKoQMRdiWhtWU=;
        b=qFiS0rHvVNL3C90ckYiEp2ZKcPLJmXx2WewQgUNEQaRYtkV4SSUD388MBK58Mb8Sur
         BMy7kUXR1W1Ze3oD40Mmkq6FMnr8JbIx1fDWH0yvEEvqt3IS+x62UuG+/k/a1nmP4OSa
         xXRUXbbAnzZQ7epoixAKT+TpiuE3YL4Z02OvTO3bAMdFjftsiqKQ+rFrTPpoiJOYFkQy
         JhlIVgrwYrUvg5eeoc8LR6d+qKy2WBTSxWODB7h/ienYN7dLf/5EgpFDEmJgHqahoZjE
         qgQKO0lPJybfezriF4MBU7I3z50HuVXEnQqPG8e6F2GzFjANk6ian1xme5NkgMN+mQL+
         prCA==
X-Forwarded-Encrypted: i=1; AJvYcCUU8E/1dGk7TK1931wq36dsHbA+DmanHiPOgx49N4O4K+JdJsFLKOrbF7V2sOxFF31dT4QfKppyQREAszx3@vger.kernel.org, AJvYcCUZKQP9A4xwYxBaF7Gh9Cjsft2YQlnr8bjboIcb1lT5n6NnbdDpsZtfCwg0mG6Cb6ZV9vgF83I9iTzl@vger.kernel.org, AJvYcCWQvhgGFA9XTU/JM+9v/yRWQWpvoXBV40+67vXH8kbL96YDHi4PW8aSqowAL7iuFcdlxW/KYC/ESLcCl3UQ9eCu0KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDs9Dv25UEhviPX0+8sRZTUbHEuWLuAl+O5qaPIQ7XrcjbBmm
	fexXkpNNr5aJijHcdH/Y8uS9dlPvc+Ex0P5Fi5CLYbp8VouBwX7+cN/e2ofCFn7EndJHc9pKUv1
	asmZGpgcOcgLKLRGGvG9pG5nitTY0HhQ=
X-Gm-Gg: ASbGncvGks4UXW7F+Vo1/9i90sw9cYmkCEuMLIM93r29hT7mFN5JpluGDf84fImcZK6
	vLP0hxUdeXKBBFSPahmAFhBqkj9NhtM0X71/vnqlw6XekRAt1ChZ23YirtAi/bizJF5F1BZC5bl
	o0RHlnTrpOVeH0cDumS94AKKFokCtqoCOojRkDA/RmwA==
X-Google-Smtp-Source: AGHT+IFJR1ekkTakx7iLzFg2MmwPx3iR2frkf7yCwLG0DMtrwqa0Ef2TsBzcDBBDhQMnhbqRc/4wjrzOgmYP5u2BEfo=
X-Received: by 2002:a05:6122:201d:b0:529:2644:8c with SMTP id
 71dfb90a1353d-5330c05f7e3mr1650742e0c.8.1751018906374; Fri, 27 Jun 2025
 03:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org> <20250627-exynos7870-dsim-v2-1-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-1-1433b67378d3@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 19:07:47 +0900
X-Gm-Features: Ac12FXwuq4aPAVgwoZvhR-bhfqA6nFAJEthK_CWI5Sw-XpWQOZJfdg9HyifhjZA
Message-ID: <CAAQKjZOHUGg8WEZxfhVxrUPS3O68BQJ6=cDnUSk6BomYjuY62Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] drm/bridge: samsung-dsim: separate LINK and DPHY
 status registers
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:42, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Exynos7870's DSIM has separate registers for LINK and DPHY status. This
> is in contrast to other devices in the driver which use a single
> register for both.
>
> Add their respective entries in the register list. Devices having a
> single status register have been assigned the same offset for both
> entries.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index f2f666b27d2d5ec016d7a7f47c87fcdf1377d41a..7fd4c34cdc3170d363942f98f=
eec048097da3c06 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -30,7 +30,7 @@
>  /* returns true iff both arguments logically differs */
>  #define NEQV(a, b) (!(a) ^ !(b))
>
> -/* DSIM_STATUS */
> +/* DSIM_DPHY_STATUS */
>  #define DSIM_STOP_STATE_DAT(x)         (((x) & 0xf) << 0)
>  #define DSIM_STOP_STATE_CLK            BIT(8)
>  #define DSIM_TX_READY_HS_CLK           BIT(10)
> @@ -239,7 +239,8 @@ enum samsung_dsim_transfer_type {
>  };
>
>  enum reg_idx {
> -       DSIM_STATUS_REG,        /* Status register */

According to the datasheets I have, both Exynos5422 and Exynos7420 use
DSIM_STATUS, while Exynos8890 splits this into DSIM_LINK_STATUS and
DSIM_PHY_STATUS. It appears that Exynos7870 follows the same approach
as Exynos8890.

The current modification removes the legacy DSIM_STATUS_REG and adds
new DSIM_LINK_STATUS_REG and DSIM_DPHY_STATUS_REG. However, this
change causes the register names used for older SoC versions to differ
from those in the datasheets, so I think it is better to keep the
legacy name for backward compatibility.

How about modifying it as follows?
enum reg_idx {
    DSIM_STATUS_REG,          /* Status register (legacy) */
    DSIM_LINK_STATUS_REG,     /* Link status register (Exynos7870, ...) */
    DSIM_PHY_STATUS_REG,      /* PHY status register (Exynos7870, ...) */
    ...
};

static const unsigned int exynos7870_reg_ofs[] =3D {
    [DSIM_STATUS_REG] =3D 0x00,        /* Legacy compatibility - use
LINK_STATUS */
    [DSIM_LINK_STATUS_REG] =3D 0x04,   /* Link status register */
    [DSIM_PHY_STATUS_REG] =3D 0x08,    /* PHY status register */
    ...
};

Additionally, by configuring the hw_type field in the
samsung_dsim_plat_data structure like you did with the patch[1], you
can use the appropriate register name for each SoC as shown below:
if (dsi->plat_data->hw_type =3D=3D DSIM_TYPE_EXYNOS7870)
    reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
else
    reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);


[1] [PATCH v2 12/13] drm/bridge: samsung-dsim: add driver support for
exynos7870 DSIM bridge

Thanks,
Inki Dae


> +       DSIM_LINK_STATUS_REG,   /* Link status register */
> +       DSIM_DPHY_STATUS_REG,   /* D-PHY status register */
>         DSIM_SWRST_REG,         /* Software reset register */
>         DSIM_CLKCTRL_REG,       /* Clock control register */
>         DSIM_TIMEOUT_REG,       /* Time out register */
> @@ -264,7 +265,8 @@ enum reg_idx {
>  };
>
>  static const unsigned int exynos_reg_ofs[] =3D {
> -       [DSIM_STATUS_REG] =3D  0x00,
> +       [DSIM_LINK_STATUS_REG] =3D  0x00,
> +       [DSIM_DPHY_STATUS_REG] =3D  0x00,
>         [DSIM_SWRST_REG] =3D  0x04,
>         [DSIM_CLKCTRL_REG] =3D  0x08,
>         [DSIM_TIMEOUT_REG] =3D  0x0c,
> @@ -288,7 +290,8 @@ static const unsigned int exynos_reg_ofs[] =3D {
>  };
>
>  static const unsigned int exynos5433_reg_ofs[] =3D {
> -       [DSIM_STATUS_REG] =3D 0x04,
> +       [DSIM_LINK_STATUS_REG] =3D 0x04,
> +       [DSIM_DPHY_STATUS_REG] =3D 0x04,
>         [DSIM_SWRST_REG] =3D 0x0C,
>         [DSIM_CLKCTRL_REG] =3D 0x10,
>         [DSIM_TIMEOUT_REG] =3D 0x14,
> @@ -690,7 +693,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>                         dev_err(dsi->dev, "PLL failed to stabilize\n");
>                         return 0;
>                 }
> -               reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> +               reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
>         } while ((reg & DSIM_PLL_STABLE) =3D=3D 0);
>
>         dsi->hs_clock =3D fout;
> @@ -966,7 +969,7 @@ static int samsung_dsim_init_link(struct samsung_dsim=
 *dsi)
>                         return -EFAULT;
>                 }
>
> -               reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> +               reg =3D samsung_dsim_read(dsi, DSIM_DPHY_STATUS_REG);
>                 if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
>                     !=3D DSIM_STOP_STATE_DAT(lanes_mask))
>                         continue;
>
> --
> 2.49.0
>
>
