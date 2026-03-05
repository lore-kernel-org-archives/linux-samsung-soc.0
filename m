Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6F296BBA
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696738; cv=none; b=Yw9d2kELBkH4LcnYbz2bjELuN/24w20FJGf5tyXvN3RctKd776Qln24rhO0d7Uio7ibWYYW502sQ+6lPMLhMam8Dajm612v44FY9Xkraojl0t/e5/M4twQs8sfmF04HU9odkXhUIPGziqa2mPfozA6LtOoGIUXMGUPVlu7ySGtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696738; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OX94XmptZoSnuM1oDnLJNQAFLiwUu4vgCO7tX+8P4sSSa/etfxj3pV4IG+1ZzvKkuOyYu1Kd9R1c3qNAQhE9V4F1t1gA7FWyy+R2gof3Oz503j6AiWc9e2QxGc9Eo+e/YUyCH7OfFPGoOrVAIn1hNbTy3gwiX+GHsO8ygzw/TJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so2287341241.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 23:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772696736; x=1773301536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=ETu7ujeIdg1Ej41NWQfr0xldCLPckNJMjREJI4S+CaMR+JHkIw72NFtYg2d2BVv0SQ
         NUMhwtk3D4xRg3DDdrydsuI9M+w1x1R1zYYrWg8uNvRlGduT/olDYPZZVr7zj9fXuPMd
         0Bdq8fK06pqlbaYQcCBqt205+qGnbESbQg/yMfo2+kdPbtDn802Si39uLU/G2ZzrfjeW
         Y7+LwfLTjurLn1zhHSMTDEWRGETbjLGiI53LUZ+LEQQPCI4DBwZCF/ZYUmeSyVi3avhK
         KuMN4P3l5/yMsd0FQutrJ632/956h16nQN03KV6lBymlCNa3NFlc5/kydG4xJ5ksazla
         FIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHr4BWM24A7tGw6UU1ydYBjd6XE4NKak3x54qMoxK/AXRLcpPDoBEGVGoHHD3OpSB7O2zAgoyDM9Nv4jecNKASAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeJdAGEdeGv2od0ikPeC8Ipv4wbBj5RgJk4a+LYQ2qKho6zi9s
	fyXc2Wv892f+qJliHxG8WewUgL/VoXdz7+w54MFtuyH3/mzJSnp5dxvkrnejTkgc
X-Gm-Gg: ATEYQzwwXrbhO38Dnq+ITWcrhqjHCV5NG58tb4SYYxLiwxHNMS9ebNXZOG0GxTTOcXY
	2wzc49504F6uGXDdz6+xyWQqyu56O/fyoV0eNrdpXrCvpkmrvR4x8KgNI+xBfeQ+Vq/mkOlNf/Y
	9NH085u5YlC+Wwkv/ikuDkyF3ZVJOw4Nk8/4DLThRTi7cUpeantE5MVVK2NwLZaOLpK4Q+cFqMn
	5NFY5e9fSfIpTl7hDcFshdkR0XaAmJGMaEbb0ANYhNl2HZEas03vBbqEyqdCCD8I/dghHBtCQ3Y
	X8OAlNxtgAVgMABaXwG4l/L08YD9KPg7FdzTA9qJokUSYWGQBBz8MWL6SxZisrfj2y+RHBe4gzu
	z0gz4Swxnt3YrO7OF6mMzy3PRkqCQOGzL7NOEUyzUHmTiPEm9b00u1EOrkfrjMeW+ayQqoOeYUO
	Z8EcwJbmIxptx6Zs4yb8vpPjbneI3CEEiCmgfay3MzxhZE5wpdlqlyZKrH4xa6VEQakLbd0hw=
X-Received: by 2002:a05:6102:3e8f:b0:5f5:402b:7ee3 with SMTP id ada2fe7eead31-5ffaac72b32mr2069025137.14.1772696736097;
        Wed, 04 Mar 2026 23:45:36 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df65c4951sm20229356241.14.2026.03.04.23.45.34
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:45:35 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffa0b23a1aso801710137.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 23:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJc4aCqVi0z5kfyNZxG+rucorvW/+KJU7wakdO3HLez+MBsmiyQz4gMiwJXTzi1B2F+xtfvjN9o3jxQVR3DKhafg==@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
