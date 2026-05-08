Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D63364943
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272685; cv=pass; b=sfDHHKNQ4JIcdgVOCu+daRcxA0+Ff088HNhfpsyeSIBaKRzQ+dUF0p4daj8VHYbLhNkYQ20s5VI1uEBZ/EIMsurakSluxX4bMr7a7+iXAAkgR9Ky0TKLkf3+tjGBppKeQCo7N4eQZZbtZSLvsaxB8vx5LYQNmwqNB1i1Ej3o/DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272685; c=relaxed/simple;
	bh=cUE6Ho7BCp/ai9M8zfJzJ+ri+o108+0vxPcFWhm8icw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atI6S8NdJe2DOeQDrwYf+rb1UlDWCNDivS+s0/55o8020DgnqfBMUbnfzMAdXoqWnzRP/XcVv7XWZ68/7e/RR8g68KULvO4MV0ZgXrQ7nxauzWH8cA4/DFPonf7GOuXmBqVTuSb4+JmFpFHxKBThO+gvEU/e8uKp1WHl4K6oqtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYs/xvNw; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYs/xvNw"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so2201297a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 13:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778272682; cv=none;
        d=google.com; s=arc-20240605;
        b=a1j3PNWUZ1SBWuNvv7LPTWGM8mbMfgeOzwxIWty0qyGEnvhe15uzZ8LL0Y+70oWiwE
         BmnUZ90Z0+Q37klFvX1ujxcS1eFh28HRX3r0xrf7CXZaj/FN2fBS/Ra+3Vg/IzyZ0BcC
         7SF8XQ9uPQxW1KiWed83HdshuqxXmn1fq+GorIi9xnuWWKE0XK3MTktxl8geUfkAW0zS
         MXggD65l+MjLeGlDxuGHRb5lIrzdwa8FKOjVDYTT2wSHeBCqnum0ZO/k6q2RhYRQhFl4
         B1Z6Mllvla8ZNQiwzxe9xYNIi1As+widBCAT1hpsJoA3kgdJ6dDGfW/QdpvcR15HfFC5
         c4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        fh=MGIrmRCKOrTbp9GpsrLO7EeY5XMKmnoL8xf4Elh6Qac=;
        b=Fe9B77VxyV8kR1RDeRUTaZxePHhPhZjrCySovFHOWhbA+h4aKow9HhP9rDeZX44PM1
         Bh4x8BjDFHIP1E7+JP14H4LdgXXOUn+l6QAjFWuGZf5a6JFA53q1+i/X6hD80GZpolJ7
         eJsVRECwUoDRXCK6lhBmkRmYz1FRu+PlVkwoAKBM97cxkeOIR0axGvPEdk1sqXwKuM2S
         8iqrsOEEjNsgF9i+AGC0sNxIWbSfe01ZUvv5cs86as+Hr9ODtQQ61y+xsyEO8RMRvNE2
         pcTxV08E2uXgGLm3VKa0BbyFQvCGiP64iUzvAJft5R2+4An7uj8yC9k4WPY4NEx4SSrO
         OPSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778272682; x=1778877482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        b=LYs/xvNwuIe+GagZNHMzBiSRkER6czAlzWNts2o3fzD58I9FulA+qVrShrJKBTMp4I
         Spzrm1hY1w0JyoiQScrvKmHQVew6YHUIfX86X5/rNQ2uOykDRDB+BAu8gLbZCfSsep0d
         SstG5L/ZEvsd+AkfUV1H/H9FLNO/jcfWd/LrC+C8XBgPqDgFweiwcT8xvzqkv8RPd3lP
         hXy/DeGYfB8Ug/Z8tnIpw8qCVAeHuGfqvngK7iRxHfI9WXJaKQfLvJo1hm/iqcrLuqb5
         7wztpvFdxlxJo7l8+r8MiXchu2WDDjTeTgoAXXDw2DMLDe4r7gkHVwhP2CiaW3IEqYB8
         WlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778272682; x=1778877482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        b=LTSn2+yq2QLgL/X0/kd7SLBrjkMIHYNaqjp64lEIWkXOFCGN7pNaGvtcO7yEg6mraj
         sS1p1tfLcUQp/ya3Qy9iv8TZ5tts+94XmKTvm8M1MctN/sgJb6v0edr7k2pm2XbeO5zc
         fx2xlQg5m7/1Ju4qm7sgVp9Uud5+iBdskPn5OR3kQe7KfNVNAqMZZY1QmSlVRccc6RtA
         +2f5iqy32qseiJ1dMSZXDV9HWGE4tL/nno/7vgpn1HODCYl6C2/maM8AYt4fxdiMntZ1
         SPfjaQiP7TE2VURhtnGH5H2nhlYVhZH2hHrYbG0X4yoNhI6uK53mqcsAgF3VfZ2Q1wWE
         NAPw==
X-Forwarded-Encrypted: i=1; AFNElJ+Eh46QjJaxH8C06qDm5bfd76O1RAJwASgXFgbzyLJKisdxu5ycp/ycdDerlSayN9ai1LCwXWBVYRvKhHKU3N1IHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywga/g5I3YOomOYH1fPSr0D5rbhdAJ2ljMAEMfBI4zNffFSOTy7
	V1i2DdJExMqo4ULgdbkqZVCyULYNAfN6sD/xxvrjKAK0RV5c+oi4LgxjWnao2+b7rV61ZbssVlz
	3F6A7X5WsYmHs10tPr/EsdwfZXXyFlHQLonHRoRustA==
X-Gm-Gg: Acq92OEjQGWq8LtNwHOk839TXuF9gnB7aWE1Ia5ajSLnkcr2p1rueXxTetFxEFwMH78
	e3wO021zN5kVbGBcHhCVpE8bpKZRoWA7wUZ6d1QwJUhcthLO1XAH2tWKW7E4BCxQDchAjq8Cz7/
	gxaZt/cgzniB0mQ09MUyLy44tKPTcFqQ65HQ8lq1GLMXzAuk+eWW8zdUyhd/exy1JIXkYyfVwwz
	oQ37pTF9U7lklum2LMk/jykmWizbAJ4jm3n5UL47Vc4lJ222djvtuabr6KHmMUbQ1eDvwbbl66r
	Y96Rv2TpyxxK/I+6hnQIxGQ/BfdoC4vGek5TX3mTizaH5RP97Yj6
X-Received: by 2002:a17:906:5192:20b0:bc6:2fdb:b5d6 with SMTP id
 a640c23a62f3a-bc62fdbb6fbmr610270866b.10.1778272682030; Fri, 08 May 2026
 13:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org> <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 21:37:49 +0100
X-Gm-Features: AVHnY4IOn6XfXMt1GfjKeoDZAEYNpjk2OjuDq_6-_V8r9mPRx0-T11Fc560W84U
Message-ID: <CADrjBPozLTq6mZhszWz33wMgj9ppE8GDYBC26gkGJOftzqq_Ng@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 02:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 3881f573ec08..04662b1c5458 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
>                 pmu_system_controller: system-controller@11860000 {
>                         compatible = "samsung,exynos850-pmu", "syscon";
>                         reg = <0x11860000 0x10000>;
> +                       google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
>
>                         poweroff: syscon-poweroff {
>                                 compatible = "syscon-poweroff";
> @@ -231,6 +232,11 @@ reboot: syscon-reboot {
>                         };
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };
> +
>                 watchdog_cl0: watchdog@10050000 {
>                         compatible = "samsung,exynos850-wdt";
>                         reg = <0x10050000 0x100>;
>
> --
> 2.51.0
>
