Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB03283FC3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699345; cv=none; b=YgFgMIljOBK97jTG3Ou/+jmUqKwny8mUChhXNb/l8fsBgnLaXybnmhVh0nI1mP7QFMvYnK8/VlA0FElmiz8ie+GAvmqtvl+UlEh9TpTWqWHQ4z9Y1JdSG1xtF9RT2eZRi/f3CbJlzdCAXu4WIjraIzPebJvn0UybvI9vlX+o8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699345; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEgCPqEFQmCofC3Phux+gZMZz8+6xsxk26DCUyo54VeAOKhV9ZBPGwMuhBgMMxZ0s75Kcz/SQJy9iAtDbA8iruhHd6gigo+QwbvztiJgDdWCIdtHPrG2r0Kx4eWlCO7LVnl5y79kACakja1xtDvRvONTRuxHk6ORGX54U0dpBbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56a8a20e6e6so3454988e0c.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699343; x=1773304143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=sId3Iko+a+YzekPJ8+QdFEoONVuQ2uC+zQ3XPBo5CjF04qfxZt8BFdHSFheeH+6ouf
         bMrE1INEbCM5ZQ+qN77HwuO/Oqmi1oWhCelSS5beGBOf0c1tyKLdlTPsgM1EG9cFIh8P
         JmMsiU47XV/r4aAu+sSiTx6BONcsI5aIdQLmGPWIFe7QFsagYO1lt4AbPzFVWu4XAENV
         RATMSdvs7V0AK1HwPEOKqB61rY11GMRmUfKSEQOk+wefuC107qg/mRyzP/JfSbymVoAh
         rrYRWGRjJy44XYxitCsK7mMcDR/KIhRRR7DMvj94SK71XWKVY/AY1cgrJ1k9PO2K2B3F
         oKiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe/wHR56wEqSEd726Fn36KQB2oTAZ95dAGkzQF+mZLQWWnvS/doR5sv/QjK4P/nHYTlyOwTXNUpbV+ovL3GNlZQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7RGEQFLNxoMJ0N2gB7osiO9tIMC++5OudrrZhoVyEpJXBOGNp
	/8F4zSwyXWeyJKIevls5ozz/n/mEYd2C6cZl+WpWq/nLJaPg3b6wB3IRs3Z12gFu
X-Gm-Gg: ATEYQzz4wYQUqcTgxg6HwW9J+APUGhRnafsgztad4yaBuCXziYdf63rnt5QFDvUZLMZ
	D7l1flf42y/tmZD4brILlNPCu+32ZXb1PZ5oQ9Yg/u25IpRIIX6qRTYY/K+59HMVgjYa8P1I0wT
	lvki+9qwZXqizkb7leUP70PenvIaWIVipzeyOLvW4I4ZHFpoSdhdBXX1ndk1J22qhS5aoIoHYqC
	SWWuMT55urWldr/AXrwQZ4l2UsjIWYo7bPF5yOsxS4s202FFC41v383/VVdpbelDcH/GWu2xG4z
	nqOe/8jDJGIXa3rMiEDpvB3k5Npl3uYoMNQeDhsq6lOznEjT3vomX7w0BN6FgXNr5HRNDn2+KXf
	PxKFLX7DjJyeCi+BGoGhVRvucci8QT9472BFn+AGl4QxCR6ISb1CUWGFJguE2UStL2/xVjT/EWM
	BSxfpPWfBma3CGmuwYnS+Zg7sH/GMQi9Np32BLNRSfIy5XWllCkeyRgVaIM8xz
X-Received: by 2002:a05:6102:3a0b:b0:5ee:a0e6:a9fa with SMTP id ada2fe7eead31-5ffaae9954amr1789021137.23.1772699342475;
        Thu, 05 Mar 2026 00:29:02 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e7af30asm22853402137.3.2026.03.05.00.29.01
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ffc1e25d6cso264283137.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNRnNaspX6YDEuge9MGv6Mmjh/BoAhhLVuRbwfskVW2P4bvPOk8SxKlXTJiZCStwOU7pyHHRIFqW51vrk+9QEB2Q==@vger.kernel.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
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
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
