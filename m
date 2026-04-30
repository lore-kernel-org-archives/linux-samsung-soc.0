Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D026ACC
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 May 2026 00:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593617; cv=none; b=MVD583mF6+hicezDoimN2A1mBodc+cncXM/DhPIEI5HRLJScgz3PTYxfseHUoARXQnhBke+glKx1KbaXpDnCIb2ojyhg8k6JnnGi+UClHNNhMHpMWxV3ESAHpTxop9VOc84XiqOaaj3LQLUYQuEBGcvtLxW65C06z6fBcCy5DPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593617; c=relaxed/simple;
	bh=AAia2qkIDmebyJmcu5PDgIuA9G3bwKwbRmrU6wAzc8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZndqJkMVjWx9wtx9TaJ9B8mLFsTV5RAL6yrbfKUg6kGl2JHlrVYSBlDNO4NHF0k1dpD7Js0jN5UAhNCdrrIeTFTQCnz5OXOqcRdeE09RmkHMU9ST0nx4DNwVOv+qPl/Pv40QsF0I80MQ6hZy5atpBoM56ZiHvaJ/2pCVn1d3jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H+swhhCK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H+swhhCK"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so1363866e87.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 17:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593614; x=1778198414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=H+swhhCKXUayLVSM8Ygp4idHIeZSRQ4cJVYza6HJlGHI/Jkdq3HzyuI4wQ/rbRzDY2
         IFWYee1sS8nfXVR7rnbps6+Jj356jlO1++DAUjTR8FsgMUh5DTHxo+yoMjBAqFF+O/7Y
         Ap/wL5Ub/Xpao6BsagCGkqft6mF0bCvAXj21U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593614; x=1778198414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=Mu5Lay1cjbZCHdf3+pCFABkq2eTlm7EfCIX0vPNp2dw5A9udONgugYOdHrObbbuI3M
         aIJu/JW/VgKsXPZq3qZGSlhCgthVz6j64+iNBSnkS0gsCw3kLOvOOLgLReNq2brtxUmB
         lMglraTlN/ohbDF1ZTkRai4rqT4zmA4kejmT9iQOvi1LhJnC3wlhlCruH4VCGBd4wFtX
         tzdDgHB/+nmxH27yACQKE6H7MlVuWIu5Adfu7wDwrhvkemn4kBJEUfnvSiqsYWJhOs8n
         lQ/tdkjz32CsplhaYOExj+Vc0LMeTQX2crC21zcMJkIiYPrqVJbEV5xE0SyOhufXn2+K
         BGMw==
X-Forwarded-Encrypted: i=1; AFNElJ+ckySNS8l93/pmposcBQ3xWFoArXpWPK6oJsqfZtQfpYSldzcvT2sMT1QbrGwKi+UxFwWn9yOJt5Dk3l/2J5EQHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq+rGd+TLr9i+ZtoDkp5w5N7V7s8GKgprbKzp+5taFv08ECu+1
	HOS7Ut8Cuu2jnQVupZBI+Jppog1D6KrQFVw3zJzxEZoj4IX+rOGxPMQCAZOJWJRbiuEvaqShDE7
	Z+eeoo8A6
X-Gm-Gg: AeBDievLPNOBueBM0d/pdw+2i1zet/9L+zA0jZHPM+2AZK8blTIEBt258zeT1jortuV
	mfR8KYYtPfBJOOZhA3UCl8pDXw/BoPfve083P5JtJIdmhXKxly7d4T8aMw315Q+CRlsCw2l0dee
	lC4dOeq1WPiNziPB0TTysZhzZLEe8LGT543PW4wJVMUzmkc9UQuVplD55fZrQkyButUPmp0JC5A
	vkOdP0LLTsfkjtcGK1Vq+d6cSYrg2AHbUphTVcxNZQeX+hbBbEK8Kj4WOmJy/+w+BOlWgsM/Kud
	+lDbGmGKmwX7t2i72s/ZnShnwWgKgGXkSb8uL5sBJ2BhauJNppZkjxxP6/zpk31gB4kSAlT/Zzs
	cVoZniUbjcTq+KkE7z/FSTGsypMBNgq1qnIyDyClEv7PVyyxnFnUdvxkaI8nPVryYO7MyEcIQ3P
	UT8Jzn8W1Ys39/xGwTwb5Q6aJXP2zW9Ygmm+tB24oUE8TFocoZ+7ICnFbXNFrrcPzo6sbiqjGuR
	lU2
X-Received: by 2002:a05:6512:39c8:b0:5a7:4699:d851 with SMTP id 2adb3069b0e04-5a85ae7d091mr200169e87.7.1777593613359;
        Thu, 30 Apr 2026 17:00:13 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c33c9d5sm7649e87.41.2026.04.30.17.00.13
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:00:13 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e12c67a6fso16836881fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 17:00:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//v7LHquD7lW9gf63XXAaIiTe6jx/4SvWq6PnpGEyqETva0HIAGZSq6/4/fZVvTDq1vUcuhh+ABYJ99OSHYRVYzw==@vger.kernel.org
X-Received: by 2002:a05:6000:2905:b0:43f:e16f:3cc3 with SMTP id
 ffacd0b85a97d-44a88058b32mr1086350f8f.22.1777593286514; Thu, 30 Apr 2026
 16:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-5-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-5-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
X-Gm-Features: AVHnY4IqCV1PxHRIY-OTvaBqqWEOfyPxbcpa8ZWBIyLwROAiOEZ_SsblLMHW3zY
Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
>  4 files changed, 20 insertions(+)

As per:

http://lore.kernel.org/r/afExm9HeB-FMmP4P@google.com

This patch shouldn't land.
