Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45817446BE8
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 23:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764689; cv=none; b=JezY8t/eG/pcT5LPYxZAShWhucaEWk7j69OiBJV8FCzPh/egDRodYR8YrEW6dY8HFHM71IYiybC0niys+6bJ6/7hRT2c97dP1vNp2gJYOqm2V8Aye+kc+sPVDYp+e5Rzr7XNL6frNZ+g4XEHPqSqknEMvljMDZgugg8Bu2v5btA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764689; c=relaxed/simple;
	bh=35drW2DGwE6r9AD1bRPA9cvY3KZK2JVIMd9EV0LS8ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReA0Eh5KGYNwxk3bJbiejnnMqnB/oQfKsQjpn/XROr9MvPla6dPJkRL5xxLHW7/4XLhJjsxI/BJST3HYckc3avID77/FJ+A8j2rQCXTlCt6Jm84kcvuFFbUFi6WOlPp8EAHoTyAeSUP9IV4LiBIIfJDDcOzKo9JioHnJdwrUf+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fGn9lESZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fGn9lESZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacb8416a1so586795ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 16:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784764685; x=1785369485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvcmYZzoXJ2+AFhLmq8yWDeYXcFpMi5b7436MW8Ch78=;
        b=fGn9lESZxZ1dgvDiQX7LFBPYYyT96CDX8eZ+GajVybtvs8PqGfhlW91ggKfXXoZZpg
         m5eGpjvyHGGYUB8lN3LRbFAfd67GbegJIgqMRnl8n5fg8KlZSqPoRHCKSDQI2f7smhbd
         y4WAhELjfbYcAc7na1qcMv9LcU7V/NjOp/3r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784764685; x=1785369485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvcmYZzoXJ2+AFhLmq8yWDeYXcFpMi5b7436MW8Ch78=;
        b=J3tgvp1t5MlzY3fI3nmQo+rUS2LWqqS+YZ3OY+Qr0eK50lCIMubP6AvCgGP1LsZ8Gl
         EhOeiacUA7fgsac+bQmMQ3dEEySzduQsU3kVfuSfht75XAtYKKxGbe5+YhjtUy3XR3kV
         mF54JyJ1DaVkWSp47KOe7GhcWuLGmsydnxBqicumn/S/T2fWBDxIeGVDVXK+gMJVe0Rq
         xh0BLkXha4EtCwWS0VW7TTvgpBh8siXlLa16Af/9SIwn2bkT9LI7BEkjxzSJXiqsSXXP
         WyoXwMtdMLVelFh+9OOuD/aYPb+ud8KgEihYSuv04abjXOkio6cw2bxxS6zWuyHq6ynk
         HjoA==
X-Forwarded-Encrypted: i=1; AHgh+RonWHx84+kBmtBEwbOjQmFQ38rqkWvtvBoZ/aC/f3WEjnLEgjb9qtCP6M6OEi4vFF6WKBaTsiWLOGaV5Z8IOyBmTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3AuQJ2D7w15FMiGxo2jrlzMuy+mRzuGsegpTyU8R7KskwgAp
	DxM57z/lxczxjKl3QrXtIGAqWQcti7fe4nlMyc0wqobBOMIFVOdixVl9tOXBpKW5uw==
X-Gm-Gg: AR+sD11fTRt4D+ekPa26Rn0b6hlDpviERY7vCai9D+WQpmSaNrC2XaalDA9RvejcYTc
	46NmlLSPHcrN/muFjUHvi+53NZCCqktuWFilwI2+X68vHBYfgGAZv2U6IMWbvRfdzAAzV5y8I0x
	j8rfov4mTPy5ZYMH1uC+CpR26D0/7Q60t+Tdvl5FVEy/Ikv11pUU0xddJfKQIIxwtnMRGy+5/EV
	b0MUSxj9UBthv/0aBArBnayCoVIoKITmiCL4U+ubsxVOV8Sv+fQjUakboqLm+Veb2izuuepwjhI
	TkkzacspVVjKfBus0jzQ7YHxrRMyplbTW+B/pevbXcfaxnTVd3h6zGH8ZOAvudxDmugIA4TuKP7
	0UppNkPqY6D40VkcOnf1VgV4TK2mQSZlVm9zUaljh1SPwcK0MEcUPCADE+j47Mc6E2jM0cqMnD3
	LJM5CBrznHud85l59I46m2v8DVoN0HztZlGkFweNXk
X-Received: by 2002:a05:6a21:e8c:b0:3a2:7ef4:81df with SMTP id adf61e73a8af0-3c44affc928mr723987637.26.1784764685561;
        Wed, 22 Jul 2026 16:58:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:f3fd:a899:78ad:64d4])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3147df09a9dsm12945475eec.19.2026.07.22.16.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 16:58:04 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:58:02 -0700
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>,
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>,
	William McVicker <willmcvicker@google.com>, kernel-team@android.com
Subject: Re: [PATCH v2 0/5] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
Message-ID: <amFZCkt1EXtOjOYW@google.com>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>

On Wed, Jul 22, 2026 at 10:55:51AM +0100, Peter Griffin wrote:
> Hi folks,
> 
> This series adds initial basic support for Laguna (Tensor G5 SoC)
> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> 10 Pro XL) phones.

...

>       arm64: defconfig: enable Tensor G5 SoC family

I'm not able to apply this one cleanly in my tree, although resolving
the context conflict is trivial.

> 
>  Documentation/devicetree/bindings/arm/google.yaml  |  48 ++-
>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>  MAINTAINERS                                        |   1 +
>  arch/arm64/Kconfig.platforms                       |   8 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/google/Makefile                |   6 +
>  arch/arm64/boot/dts/google/lga-blazer.dts          |  15 +
>  arch/arm64/boot/dts/google/lga-frankel.dts         |  16 +
>  arch/arm64/boot/dts/google/lga-mustang.dts         |  15 +
>  arch/arm64/boot/dts/google/lga-pixel-common.dtsi   |  23 ++
>  arch/arm64/boot/dts/google/lga.dtsi                | 423 +++++++++++++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  12 files changed, 539 insertions(+), 19 deletions(-)
> ---
> base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90

I don't find this base commit in Linus's tree. I only found it in
linux-next after fetching this hash directly -- it's a linux-next tag
from 20260507? Seems like an odd old choice. Might be worth refreshing
your base.

Apart from that and a small note on patch 4, it works for me:

Tested-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks!

> change-id: 20260710-contrib-pg-pixel10-initial-dts-49f5ec657b66
> 
> Best regards,
> -- 
> Peter Griffin <peter.griffin@linaro.org>
> 
