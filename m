Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621963DA5A7
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 23:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593307; cv=none; b=iY+vlFG/mIucW0A0L2nVNUNuh81JKq+IHNa/gzsf4jzBlbG0fnpuE5cRzyZoEHczNH5w4r6wiBXqu5Z5Fx/+8Ak6LoTG95Z9NAseruJZP20EMwi/hVNYxzKf1NhJlwS1+yfTPoY2uVAs+72ZgjHOiZr0ibUL+VG7nx9mPFR+1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593307; c=relaxed/simple;
	bh=sQxuhOfm4oyjjyHRHwYJHnDekKF9G661/WNU4U8f4VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evxHmK+DqVAS2vCsihutQV+5dY+JWzTnHV4ymrB9ubLRvnL8VWyD+m4fthzqXDoG2+24K/NfxdUNDBYhnIg7WCkpzu1UpmiiAOK0Sg5pV9/q21oXBkKxnIJTTXTT/1SiyvFsO7fVt/S6lMcBpG+Xl+2S4zkaEziVHRLlc/vrnkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MhbpPeMV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MhbpPeMV"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-baebe98afa0so207940566b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593301; x=1778198101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=MhbpPeMVFslCh3grgpvHva2pRt7BZmX6zRhcGG8ITYnTYAhvWLlO1Ym8eoLMAiOeKv
         pU129vMY/SAk3GGZ3WRoRKDFbnT5D70lDieMEQzROMhmstz8JymR+2+fK00oOmldbcGW
         MgRBhlQlh4IUFCS2Z4fJB4hTwNepeEoXA1FsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593301; x=1778198101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=g//ZSRfN6hrdlrlFGRxqqPXsvF7w1uzro7twQMZ6e6C4A/J5+N9tCyCnJBNKbfZ8g2
         EdwJv4Y6lc4zhQU1I+O6yyAsADuwBrAb4rzYLlfFeuilVuWwj8GmUSufeOLBVeyGT/SB
         UuE7wBGLco5NHbhnnasusMtJDnjA5LQZrtK5JKjxWGyLVQ9rDwK0GrdZZN3SMoQUnsi9
         o+ftkEvbrkpcyHfvBWCJbWalDT624KodQbMB2wenLzNWmOjRQYwVY1D1mL5bQnGEpejg
         +FjmNjw5KPnDG8HSBrhVJYgKp/SIt8r9ZZLyYGKD9tXbVEnkxIrggVcTCUAvLr+2yB9k
         fG3w==
X-Forwarded-Encrypted: i=1; AFNElJ9RnHMGdyX9Fuzg8gCMnGmiY8Mfmq2vqJiYjXKRRzKdwYNXbsHnOAf5zSTpf7wARUFwDDwzkhAYcZVoIRWykC+peA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxcEdtcQB9OUc1MekhdT5PVyXEAVkdTJSXyWagFI8v/kpgFprp
	iyNGrnDYzFqaDmYBKhx6p38vqQ4yeJNu5GXY2Z5zJg4PwOYH75Bkw8/QVWBVrLB3RzAyCGHtyQi
	CdfPKwA==
X-Gm-Gg: AeBDieuD819RlsDkGMiww196X/GWv0oLYWzgxTJj3PLWfuuETSMea1y2e09TzZqo9vR
	S2vKdgFvL98aFBI2vOoW5LRcCAK7Hun7Uhg3dPU3DR447qPqHEPUsToFlMclIHuZs6lRxvMN/H7
	xQv+jcuMQT4ZMeoDoOo6k+WJbtzW62dRk9uoSJqFkfsPNMMK+A6Dd1uLvK9I/NuN5NnMJecVt7z
	rSjTsTeZuL+agadlUkx9t87KytR+O+qeYQTFAvjv9JWBhz3ywV2xyiGJ/iRxe1xHRMP2W35KgI9
	W4nPeU+LpwqkOTH4T0+kH9VRHcvcfZhIvmOuqSE8m0WU0xIj8KkNTmJ81ylL7/hUtDLfr+C7six
	6G0L+6AM4a/URyfv97oz3OQiAkBKx5rvOAA8Axyb2Wz7FU0uHIyXl0fK2pc8hh5xFkFe8WdNKat
	cOiIUEF9ERwKSI+xAf8Y9QfW1iqxW0p1tJomvmA5rhxyI/ter7YIwtGSqab+i0eXCNj1Puf23J
X-Received: by 2002:a17:907:2679:b0:ba5:60e1:2ef2 with SMTP id a640c23a62f3a-bbac7799fd2mr256993466b.22.1777593300787;
        Thu, 30 Apr 2026 16:55:00 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6db6f18csm47931466b.57.2026.04.30.16.54.54
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:59 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488d2079582so16024495e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:54:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+NTl4QI0vnQdNXY96TohOk9j9IVWN9hDhAAJSP0QFGQPbQqgKOiRCUB42f9icgtGTaCBnzUSO7YrGzvCSa09ZK3g==@vger.kernel.org
X-Received: by 2002:a05:6000:26cb:b0:43d:6fb7:fedb with SMTP id
 ffacd0b85a97d-4493ec61e55mr8612204f8f.36.1777593293572; Thu, 30 Apr 2026
 16:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
X-Gm-Features: AVHnY4KLFGb62k1dRvCKyy7EF6W0tPNO3zKHC2HCyssJ_nJGpMzpFc_-TEUNEXc
Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
>  6 files changed, 30 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
