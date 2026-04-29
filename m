Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19C36074F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436244; cv=pass; b=R3x7FCzVpw38GnaFTRlaaA8LWm6rbFPeNADZEfyTwTfu3PFB5fhx8RIdPlmKpWNkHp7u4lBpculPbq6N/LLcznoqNcqfESddUooHTM2tmqiwgN9yXikYBHJYH7j/wXMlaoAKaC26PoqaijDAhwEsdvCV6WnTSIsKQZh5HyoiMos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436244; c=relaxed/simple;
	bh=ucY3TNrWMvRb0oHVhltYdiDBL03lh8F0+Cv3NgZ1q9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EId41DTECxVnjng3AqYPdMYsa00dd3phJL/SxnMpZ7q2LRQQSoEoveaFk5NxPBmV+HsV1z6Vtaz9nmCFtX1o5xPKot6C2+lGvYmbX4GOLZXIuWpN0OolN1G/0GoFmFMvouB7rTm2/NHzYMVd5Md99jPnrqyPtauzvHSmxn8F6DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dvDACpim; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dvDACpim"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so11859951e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 21:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436241; cv=none;
        d=google.com; s=arc-20240605;
        b=eQeGt0jV9vw4yY7zTxz/sUSIaiGy2Pwi1DpQUzm/qV2IovO17bGb3COHFjHwzZqsHf
         MK2L4Jcj5sM3YLhKudLO2iqVPA+d7kG2u6RX7M6dcBXCKcDoFkHn1oZV79wJqQR8kdHg
         pM/5M+TDYOsEoOgufGS30XaYWO22S4/saRuAEJFVA32U46N2aV8P4iIXRPKsqLGQB2Fy
         db/Wdagn7lm6h3/76MkjFD46ndLS5V0to5WxoTUUQB4eiuH0qY1VtOENCrJtIlzxO7rt
         O6urnFppJLiogHnrsA86tXThBwlW/qspH1pxb3WSgMb8TJVzKhkPfc9hKo7FT3Hjz3GL
         KbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        fh=kXtMVXbR3rwiS0mFoFlfrFK0h7V+MfKuWd/XG7QBJHQ=;
        b=JHl6FzZhiFDSMi0rB72WRjD5sXgInLb3RFAmxdBoYf5EtlPF/0X349Er1sBfROvft5
         qujDHp15nWCsw3Zvdzq4E02tXioqygQmdhgpU0Nc29EZ1Np+q91/M1MjfUkI9Ics4PWZ
         y3ArLYA/pQu6T1J4XaCoZpf0urOo2oIBYb05FEKQos7mm+68oFD9aeBzdTxrOZ/9vg4/
         ShkwidhJlezq/o8wrEDHu7VY185tBE6oHKhDG7HNIghqRj+CFFyUBhSxPAhcRu5N1A/X
         lv3rGWviyI3S85BXHAK5Aec97d88sbcfjiiqyzC2GXlFbyB+oQ527HzLCrBpHqzBBmeT
         XHYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436241; x=1778041041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=dvDACpimEfz+lkjDu+p4DjT+fvQBqaJ38nt13vAj6O5Zjc3j5SRV7RVEUyAsHY5zDy
         k7SDY3R2RpdAJvuxg2G9SneYMEVqCzmGkqLfRFIYzTR0vB68T5h0PdGzttJYBLPSjwwp
         zysiSnFZUrxLZPQ4xUk/g5MimDPy32mTPkyA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436241; x=1778041041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=LIspwu/5JtuwjmuKNxQQbSbileCuBO4gmfEjIA1OCgD+oHJ+FCKtptCJSVcVDOQGuo
         exW7yinyCv4RwCwJASWJKA1ck6yNuM11Ds3zndgS8s9ONtXT2l88hq2seDj4u7/l0hKA
         H/xU53cQ1GbIOHLn4jGDK7XryegMd6+bwBqKdrbL+uOVRdkBZH9udJ98iRBCLImxI+wM
         JHHoiG8FEHzfKNxuHOvPlR6FTuLHEa+Q8dkJGpE+NcyAcilopq2Y3YWL0N0WviJbA20s
         Fl7TbZn2rQyoHhQllxOEa0dX6HUOOQme+zSmFez9RxnA9Nl/mQzB+CWCvVZz8TCmHF/4
         3inw==
X-Forwarded-Encrypted: i=1; AFNElJ8UfbMkaIT5Ir0P8+24Naslc2ELptyjbYtKmD+ask6gdLKO/Hc3S3I/58D8XgKbwdMtbPY7F0EnSvB9ShsvoA+yfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLx8XtVdhpwJo44pgBvFxkAR8F9XxclJk3svGrVtZiGh5tndc+
	MGHQZ9k58kr0xCkixiPySZ7yh9efhCJ/Xi3GS/hJJHzUguzX8S53RtOArCF9CY9SY6woNp3mKmN
	hytRrBcK7KB4tTgh+57AA5j9NqJGNVh/78lvaszSd
X-Gm-Gg: AeBDievY2SgVt1+hfdc2XZ8f9OYbCpf9cQa0GTtqkcTozonpc1AlX3N5hjNqV1OTqe5
	ftPFnXQEVjg6T2/pEBxVUZlLNJcCulvGOOut6o7gLd7fjMDMLaemo7qZNQJU7G0Mvx3/ahEEGxn
	6ec9pKOmSAimQmdYpItqLpj6ohq1A7D7n6z+qdkdzACIFAMq8u0rmfltTN93ym8vq+VSmE6ALaQ
	mpoKYm4j/a7T0ljqXwqMtleq/0Ho+Y6mcqZG7gmt+EaIMb60c7TWKPD02vvGTIwoTWf7roylw+v
	Bou5+gt0w4PSzoFdWA==
X-Received: by 2002:a05:6512:3983:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a746623733mr2096698e87.20.1777436240634; Tue, 28 Apr 2026
 21:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:09 +0900
X-Gm-Features: AVHnY4JUF2jGqzImUjvVT0R20VSVC4ANB99NMBVznnvWckelDQ9DcqAgZCUM5q8
Message-ID: <CAGXv+5FZ0kTqrqWEu8AX_1cxtEQD0urr=FJO=Van20h75_Z1Xw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
