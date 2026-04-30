Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277F3D9DAA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 23:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593263; cv=none; b=c5pwlIanSBltqsO87mRBt/mEJa2TowjLgeBm3Yx5bqD128jHR5oZCeJGmIiWhdn3zuzlXhvoxhMKZYKZF7f970pOLuKOPvcURXH6Mdmn1f5UcnDMDYLABBKMvOSm3vLhhmnjhsP1FbSXnohT0feJYLkEl8Bgg5WMplJ3HNdEOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593263; c=relaxed/simple;
	bh=K6HjmbNrmRNPQFoeUy4vXzHlo/g/A/oFQFErhjwT8ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/v9E++XMVdSh4LrwoLeqt2uEA/rYCy32ScXOOk6eTY2ZMRMWCRrGga35ysvrvKOGhOyRXINSR8LfbpKEuRXa8nX2w6F6glUG3osUXNKS+U/Q5P09cM4h3keoMD5MCs33aAYIo/Hmf3zKP/gFzfBzXfXeDOw50fqzj094DNkEsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g39IG0c3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g39IG0c3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c01854477so216435466b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593258; x=1778198058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=g39IG0c3b4HNdNd2LQujpdI/isndI+5p+mSOpa7Ic6h+xZGHgO8D1dLYpznp+9DgkZ
         vCws4jH+YOfctulo5MPtRiCoMcktq56cv8ROMV7ifEif7SHRi6o+RwGAOivq2xzJfMmF
         wPrfisJfF9EiAIkEJN0pJHMQzY2MD74uFGBkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593258; x=1778198058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=tWOE2u/O2rZm+s8dbD3YagoWvjfpl9hI/pY8HWwCz1w27z6MkOHkF9w2/wLam3Gmdp
         RUVcy+HG2YEo/73FdsZitTbELvD6ITU8TZk7y94x0wcx5yRW8qG+OICwdyNfG7Xi78GK
         o4727n/ek7FVSWcHFTU35RlviUrDYngfgTScST3M2I+iPNrpi/IaX1AJaBmZRWHw1zpX
         Y8fM3l8txocy51CMcF9iCww97U9wOvljUne76s28UEVxW4CZXIDMs8+KlgahSIenyi3k
         trntoUOi811q3VV8L/jPTITc2quvrWMPAAFb44UGamtdiGXiJ5NTKvkaDXGzSo3Jahhy
         3sYg==
X-Forwarded-Encrypted: i=1; AFNElJ+wxWp1pwVRAduxCWjdOGHxKAkAjoM4Ij+67H7s1fJpy4PWWAo2/euXMUJ04KAEpU7S9ORNqrNVEWqJJ2u0ZMAEPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0fZi7MO7gJVQzL2UTfUUc4bXyj6VhakivOv9rdxFn7ga+mQz
	2Nq/C+c3QjElvO/afjfHR3j7/0cdwHGDg3pBpW/7BckVA3ukC3n+gxADD8BQ3S/Id+dgpuCE7Vn
	nn5HxMw==
X-Gm-Gg: AeBDiesaJkBm/wU4dLtINP1XWADivq4cuSB7SJB4tknAV+j3ERDd/z/EfziwwV52tRi
	DCQbBY/c8LsjXbcdfMNJ663jb7jlqQ0DY0PwNMOBzM0FD4MVU2zDjx01QVQw9zdIYZFFWNa3mOd
	RSe8fZRtbJGfpFCabdZs8ysp8EVMYnuPo/mty0PblgCN6hF0Ab6e8BYp2IqXiysxR2E8XKRlKSr
	PSPAUH66pL+CKr12q2gI9cCJLxVT3+rQ7dzWch5mPbmQERbzm+pY0IsjdT2X9HwvUEJFR50nEpc
	cUVSfKLoxtdNyMxSQUpy5Qw/H6Tj6F9DDqgU9ThyURTg6Hv1BzCy9MpHSIVuVZ1I5bCvBpbGD14
	j4+WaIS5TJvRGhWrjntivdq9TLi7blJ7YARmf8kM7dK5s1p3cpaXelgcoHTZ4EfkiEKoF+vePw3
	esZY+OK+G0MfTgxsIjD4F4Uy11BrvpamrMrzxH8MnRn3JgFwEu36ufllIlsuxBvkZYu+0WfNx7
X-Received: by 2002:a17:906:d54d:b0:bae:7277:1272 with SMTP id a640c23a62f3a-bbb6b5a7b0cmr249050266b.36.1777593258287;
        Thu, 30 Apr 2026 16:54:18 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6aa5865csm47524066b.27.2026.04.30.16.54.16
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:16 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfd832155so928313f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/lbQWjaD6qQ/CqzyCbjxoQH8+2yRqI8HEm4QtjI1U7ioV2OuWCCZUK+EUwu93SE4MSAr1RXJa+7XFMK8KClYMawQ==@vger.kernel.org
X-Received: by 2002:a05:6000:40e0:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-4493cc3fdadmr8678277f8f.11.1777593256152; Thu, 30 Apr 2026
 16:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
X-Gm-Features: AVHnY4ITNUkQNF1rYH2AzAfyi5kerkzeuZiwFrCYx_qZbGHsYv-60K7BAEKUu9M
Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
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
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
