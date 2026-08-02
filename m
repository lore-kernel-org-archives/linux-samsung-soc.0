Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B770830
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Aug 2026 06:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785653844; cv=pass; b=TgJkOP2wLk/kUdbwya58ss3+anph6k7cScflBju+xHVQY8hyFnghNRIhqtA1ujEdvQxl30SI/bPk+zzZhVbCH4DvRYFKL6LsMA5P4BHri+cStCX5GdJOAPAb0dIMG+Q49d2z6Tsm6Y4YAWFaih1Ky89q7867JpAQAdXgrzBcVEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785653844; c=relaxed/simple;
	bh=Tnb4ib5l0D5f0acEP9lzARoYg6v9JiJ6oxqowW81wmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XS3PJWpb+cjigM6ibGnH9zlFl0lHLkZc+cwikthL2WGUNG1TVtPUIalWyCTVFAOVvkxdfFzrBNjYzX6cl/6L1md6KYoX8f8psSBaikL/YL5frGLxfr/tcBa901txtBrHwQtTIfKr29QbedLPUJdRTNvBl6qU9X0WMcXZnNzKPFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRnNU64i; arc=pass smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRnNU64i"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-74ac3ea9c60so603348137.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 23:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785653841; cv=none;
        d=google.com; s=arc-20260327;
        b=ORM/eDfsf5wmYwrKOw95MSoYNOVi3bntni9WiIVS+Cs6DVODHBN6XSL7OBRmlLX1rU
         reUcOe9sAUl8SW3xZxSRBVVbomr/QpdCshkFB+XVxsS5fhWITdM/za0T/NEHdblEJrQF
         W1yq+wSDJxm7QzwGM54BJghK34clVJFqzwUZD/mK/A8zDAKyLcHC6wkjdNg5j9yT7Odj
         ixQCTdCNsPpxrleZXY/JpR9rGY/JGJ3h7GOR3vhgUgKId3sx4IB0h7KG8c7WpqgK6xNe
         XWViTihhODdCT/PZp7tCyD5TGIYiyijhNXO3QZmkNnkVebQcEZ9fUa6Qjib/rXgE4jpt
         3HQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wtkW0R9L1WzRthBVOFdrAk5MXzpeymlEQ3IDXCT5EV4=;
        fh=PNDFby2dju4YARcDj3pcYULgtZJXxezYtHyjFlXpOio=;
        b=hLLbMNEbElP9WpVg6wFSFtBKbEEfCyDT0Ssx8ru+Cw0VSflKD0HB5gtGCl1gA7Dqpl
         CziYanvS93gogDZtT9GcQxuNu27BfsiemARiNVM3mMEGrBbkmRtaxjC2G7ENotuC/7yt
         OUrSZjYhSjQCgpU/J7s7Bzx9fugM5X81KsmbNL+Ewd9XjiJXWFYsA6TOCfTAVVIbqNSb
         52b6WlY5PzjtEbh3xvSy/O+aa+2uMRXUJZjqgLzZhMLgcWyLRb/xeP3xPex9KgPaBVEZ
         hp19uAyLO/thMZt6R5x5WnlAX+QKjHe/dfoj4f1tSF3p+VEPyIj23VLn9m2K4nlWNfyq
         cK+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785653841; x=1786258641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wtkW0R9L1WzRthBVOFdrAk5MXzpeymlEQ3IDXCT5EV4=;
        b=QRnNU64iqQoohA88qAqXwftqoydMBISJHV5CWBsk7qkZbK33eJqSu1mLsNPIU/dIB3
         uvxOQvuubZ3qQp7sAbsC354FQNx0M1Xu4rK8Lqb4U4FQOpepgpCkuZxYfeN04gEWXfeu
         nEtWboZ1d6SNVGq1n4LyoVVx9t/Wt2Jjiqrtwng85vi6AshSua3E3HBTAHaYdFu1HCiH
         MVrv9qf1LLno/Zjv5+5NU+ooFV2mNEMpgelrpoWOkqiw7VlVIo0v8tOWHlSsGTkI2CDM
         jhv2n0iY3KbY6tkbJYebv5fyEQAldBYueHbDe60/KD0Yx3zsxV+PLcutr4R2WrOg/CjP
         9dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785653841; x=1786258641;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtkW0R9L1WzRthBVOFdrAk5MXzpeymlEQ3IDXCT5EV4=;
        b=HR/UxoHBY4SxQolpnnLAdXN1CJtjeDw9F7ESMnUJklul87jkTuxGel2j6fInUPYRx1
         KXUECjMxik7xPsDp2yXNRxG5rD2BtinH12w4ZDy38QXw+jahW4AKMqupT9mnLxGowEcp
         BfX9nvxwaSNXqMmw4B+ACaWuQ08FhCqkaWUrxFmWpAk9BAfbX2kA6JGuGyyeLluu+TKI
         BfqGNksOtaKBqrIbyfuHWyUWqQ5WC9lD+LFXqNSsvTPxslxMFBtR8HoXhz8rk5D0g7Cq
         7+DGDA2UsWVNZo0R5tRooSUL0UhmV4KFsV8KlmXrs20CbzmEGdNOCzYKXAOOiqdZtzc3
         WzIw==
X-Forwarded-Encrypted: i=1; AHgh+RrAsxXcD2K0N+2YT9uDyiVAh6xp446+Gx2dxqQ/Z6/vqE1rFC7f0oHZE2rgn10wtnCP60praOOqDJbN/ROEPi4IzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8tqLo+lhoVnPe0aXuR2NOsCzfeifzfnr0EFICUzobk/TWBkAv
	6HWmZOCuP2Rd8kd2CnQN0kEuz1AO1iCK8u37WnAdn5F9OY+1Y6b9QTotY8Njb1Fx1RN6XgeT+Vp
	If0gfZjAL5P8O43NFwW4b2AF2isgUZLo=
X-Gm-Gg: AR+sD10D2pEMr6T74qrOUjJ63zL7ogp5xURiq57OV2WBB1/KuqRiThUH31PhiIUApDP
	K5RQr4fk0/6SMp8kKcfvFOOfttt2qIwufT8WLzsJB5Z4IzEcN3CHe1SwQH2YAt8jQ/+dtVmAX14
	CR4O/31QAUbVfwa5kK8CK8GSI1YFnfODd1MYSyEDgT1GgPjUyrJHtpdLxNt83rZegydb3ZQDbT7
	KEN80atyBLTfRTRqHYMCQTTTt4FrnTgDEfqJST8csAnip0JkZoP1NcfqGfCGqcc/CPDWM1/seXr
	sKJzbr/KDUWk67pmAVrm2+zG5kmfH7zQcmGWBHFHTBGhwNC8UQ7QkpUU7+QQTyvexIlF6e+fMTU
	=
X-Received: by 2002:a05:6102:3ec1:b0:740:177:f357 with SMTP id
 ada2fe7eead31-75b21b5cddamr4703145137.6.1785653840583; Sat, 01 Aug 2026
 23:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org> <20260723-exynos-dsim-fixes-v3-2-0c31ae1dbecc@disroot.org>
In-Reply-To: <20260723-exynos-dsim-fixes-v3-2-0c31ae1dbecc@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Sun, 2 Aug 2026 15:56:43 +0900
X-Gm-Features: AUfX_mw50HwgZ9Tzu4pmNQbb3I4THHxFrSfTGd-5rpmu4ySRW8DCN5G-vjpsyfk
Message-ID: <CAAQKjZMP+iQAZUGG0LtbXJWivOjVXCLB=uaqmYkenvmNK=S_vQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: samsung-dsim: use DSIM interrupt to
 wait for PLL stability
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI,

2026=EB=85=84 7=EC=9B=94 23=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 4:04, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Stabilizing PLL needs to be waited for. This is done using a loop,
> checking the PLL_STABLE bit in the status register.
>
> DSIM fires an interrupt when the PLL is stabilized. Rely on this
> functionality for stabilization wait, getting rid of the implicit loop.
>
> This has been tested on a Galaxy J6 (Exynos 7870). Unfortunately, since
> testing on all supported devices is less feasible, introduce a stop-gap
> measure where the timeout has a gracious lower bound of 100
> microseconds. This will (hopefully) prevent regressions due to timeout
> on other devices.
>
> Suggested-by: Inki Dae <inki.dae@samsung.com>
> Link: https://lore.kernel.org/r/CAAQKjZMLMbwDVZRb5+Xb_5yz3AEP4uuzFJMuuZy9=
NFDu13VU5w@mail.gmail.com
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 41 +++++++++++++++++++++++------=
------
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index da753ff6eed4..866cff205e71 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -17,6 +17,7 @@
>  #include <linux/export.h>
>  #include <linux/irq.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/minmax.h>
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> @@ -788,7 +789,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>  {
>         const struct samsung_dsim_driver_data *driver_data =3D dsi->drive=
r_data;
>         unsigned long fin, fout;
> -       int timeout;
> +       unsigned int timeout;

The value assigned to `timeout` below, `reg_values[PLL_TIMER] / fin`,
is an `unsigned long`. It compiles thanks to `__careful_cmp()` in
`max()`, but the result is silently narrowed to `unsigned int`. Please
make this `unsigned long timeout` instead.

>         u8 p, s;
>         u16 m;
>         u32 reg;
> @@ -849,19 +850,26 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
>         if (dsi->swap_dn_dp_data)
>                 reg |=3D DSIM_PLL_DPDNSWAP_DAT;
>
> +       /*
> +        * The PLL_TIMER value is the product of the timeout delay and th=
e APB
> +        * bus clock rate. Calcutate the timeout delay on-the-fly here.

Typo: "Calcutate" -> "Calculate".

> +        * It is assumed that the bus clock is the first clock in the pro=
vided
> +        * bulk clock data.
> +        */
> +       timeout =3D 100;
> +       fin =3D clk_get_rate(dsi->driver_data->clk_data[0].clk) / HZ_PER_=
MHZ;

`fin` is used earlier in this function as the PLL reference clock in
Hz, and is printed by dev_dbg(). Overwriting it here with a completely
unrelated value -  the APB bus clock in MHz - is confusing when
debugging. Please use a separate variable:

unsigned long bus_clk_mhz;
...
bus_clk_mhz =3D clk_get_rate(driver_data->clk_data[0].clk) / HZ_PER_MHZ;


> +       if (fin)
> +               timeout =3D max(dsi->driver_data->reg_values[PLL_TIMER] /=
 fin,
> +                             timeout);

Also, there is already a `driver_data` local at the top of the
function which the rest of the function uses. Only the newly added
code dereferences `dsi->driver_data->` directly, which is
inconsistent.

> +
> +       reinit_completion(&dsi->pll_stabilized);
>         samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
>
> -       timeout =3D 3000;
> -       do {
> -               if (timeout-- =3D=3D 0) {
> -                       dev_err(dsi->dev, "PLL failed to stabilize\n");
> -                       return 0;
> -               }
> -               if (driver_data->has_legacy_status_reg)
> -                       reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> -               else
> -                       reg =3D samsung_dsim_read(dsi, DSIM_LINK_STATUS_R=
EG);
> -       } while ((reg & BIT(driver_data->pll_stable_bit)) =3D=3D 0);
> +       if (wait_for_completion_timeout(&dsi->pll_stabilized,
> +                                       usecs_to_jiffies(timeout))) {
> +               dev_err(dsi->dev, "PLL failed to stabilize\n");
> +               return 0;
> +       }

This is the main problem: the condition is inverted.

ait_for_completion_timeout() returns 0 on timeout, and the number of
remaining jiffies (> 0) on completion. As written, this reports an
error and returns 0 exactly when the PLL *did* stabilize, and silently
succeeds when it timed out.

Since samsung_dsim_set_pll() returning 0 makes its caller
samsung_dsim_enable_clock() bail out with -EFAULT, the display would
fail to come up entirely the moment a PLL_STABLE interrupt actually
arrives.

    if (!wait_for_completion_timeout(&dsi->pll_stabilized,
                                   usecs_to_jiffies(timeout))) {

The reason this still passed testing is the second issue below: the
PLL_STABLE interrupt never fires in the first place. The two bugs are
masking each other.

One more thing - this removes the only user of
driver_data->pll_stable_bit. The field declaration in the header and
all seven driver_data initialisers are now dead. Please drop them in
the same series. (has_legacy_status_reg is still used by
samsung_dsim_init_link(), so that one should stay.)

>
>         dsi->hs_clock =3D fout;
>
> @@ -1596,8 +1604,12 @@ static irqreturn_t samsung_dsim_irq(int irq, void =
*dev_id)
>                 return IRQ_HANDLED;
>         }
>
> -       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
> -                       DSIM_INT_PLL_STABLE)))
> +       if (status & DSIM_INT_PLL_STABLE) {
> +               complete(&dsi->pll_stabilized);
> +               return IRQ_HANDLED;
> +       }
> +
> +       if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
>                 return IRQ_HANDLED;

Two problems here.

First, DSIM_INT_PLL_STABLE is masked in INTMSK, so this interrupt can
never be delivered. The only place that writes INTMSK is the
SW_RST_RELEASE path just above:

        unsigned long mask =3D ~(DSIM_INT_RX_DONE |
                               DSIM_INT_SFR_FIFO_EMPTY |
                               DSIM_INT_SFR_HDR_FIFO_EMPTY |
                               DSIM_INT_RX_ECC_ERR |
                               DSIM_INT_SW_RST_RELEASE);
        samsung_dsim_write(dsi, DSIM_INTMSK_REG, mask);

DSIM_INT_PLL_STABLE is not in that list, so it stays masked. And
Exynos 7870 has wait_for_reset =3D 1, so samsung_dsim_init() runs:

        samsung_dsim_wait_for_reset()   <- runs this handler, programs INTM=
SK
        samsung_dsim_enable_clock()     <- calls samsung_dsim_set_pll()

meaning PLL_STABLE is guaranteed to be masked by the time set_pll()
runs. As a result this patch performs no PLL stabilization wait at
all, and instead sleeps for the full timeout on every enable. Because
of usecs_to_jiffies() resolution, 100us rounds up to at least one
jiffy - 4ms at HZ=3D250, 10ms at HZ=3D100. That is a new latency
regression compared to the old polling loop.

Please add DSIM_INT_PLL_STABLE to the INTMSK list. It would also be
safer to program INTMSK explicitly right after reset, so that SoCs
with wait_for_reset =3D 0 (which never reach this handler path) are
covered too.

Second, the early return swallows concurrent events. `status` can have
several bits set at once, and everything has already been cleared
write-1-to-clear in INTSRC above. If PLL_STABLE and SFR_FIFO_EMPTY are
raised together, the samsung_dsim_transfer_finish() handling is lost
permanently and that transfer stalls until its own timeout. The
pre-patch code handled all three bits in one condition and fell
through, so it did not have this problem.

Please make the handling non-exclusive:

        if (status & DSIM_INT_PLL_STABLE)
                complete(&dsi->pll_stabilized);

        if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY)))
                return IRQ_HANDLED;

Thanks,
Inki Dae

>
>         if (samsung_dsim_transfer_finish(dsi))
> @@ -2148,6 +2160,7 @@ int samsung_dsim_probe(struct platform_device *pdev=
)
>                 return PTR_ERR(dsi);
>
>         init_completion(&dsi->completed);
> +       init_completion(&dsi->pll_stabilized);
>         spin_lock_init(&dsi->transfer_lock);
>         INIT_LIST_HEAD(&dsi->transfer_list);
>
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 03005e474704..e3433da21ad0 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -123,6 +123,7 @@ struct samsung_dsim {
>         int state;
>         struct drm_property *brightness;
>         struct completion completed;
> +       struct completion pll_stabilized;
>
>         spinlock_t transfer_lock; /* protects transfer_list */
>         struct list_head transfer_list;
>
> --
> 2.54.0
>
>
