Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4F361670
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983552; cv=pass; b=fGRYW2eCRS9tDTrpE6FV9ZSxMIOuywD0ZdCtau0p6icWa2UZVy/e3Y4tDc+y5UaASmF5tqUVUmFT/8FzEfc/jcdmSRMZJCWlSVp5hUuBz3xn3QMROQi9OTxj08XWMkAEd+OjFVH5SXyCLkjQjAUTNm/1JIOtgRYCOz8EoWALm14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983552; c=relaxed/simple;
	bh=Vd54AXtbA+BVxVXTBmuGUtVDHo2JVpb2vqgbLrKQDoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fD4GejVnkbxfo6HzJs+dZVbrPzhoJW5ocgGmrFVk9x/+a+G3pCg16gtL2LiPw7pbeWyzuffmH8G9a1+Clzh1P3pc46cW2rMlg8M6my0gJ2A8Ls3ln+lBxtmH/YezRCs5ypd9Jjsp2k0CnOCt3qZQP0spgrsgdg/FdHDTRZ57Ask=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c000xhyj; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c000xhyj"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99easo10289507b3.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 12:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788983549; cv=none;
        d=google.com; s=arc-20260327;
        b=C5ivUYuVGP1e9hjGqVeqznQnzNrFWl+7ULrkzsSv8CX7hWyGqPN1gq6PemsfEUFMTO
         9oFHQOTaBsCVvaSn/xyYUVx3BFFHhSbLaQp3QvE6+2+c731GtClpa7K0MdZHGBJkllRX
         mk8VBF8XpBtKgVjt+cMP5T374aIh5xN0V2PLQFqEmk9q9J41DDRnD2J1WJS2Jv8PcJja
         hXE9sX6IZMlOcyKfKoJziMpjFac98GjI10NhkqpTVWgqhlgy0MpUc5WwErnwrJeEdiY4
         OiTqXRzlKzNGNzwFkHpn1cUOWWrZ1cxPjLvvCcb1AlDQeGAM7L5RqxNWosQGwNwliooR
         puxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JE506qyM+xSDVLQ18Cv32kLGdbyz+6FYOgoc9bYH4MI=;
        fh=O/1X6F3l7j0wbEtxuBVkNegmYBWHK9vA7EFfNmsOFXk=;
        b=HtuK5D5fFIpQJILTsUokHuhpeZRtNi3ohTfUA8NuJh5d7Z1H4DKpRI4aIgLyGFN9fJ
         pZsYmcxqrmoQnnPJtUOYhMmBxIeVugjwGqsqx3drUitYJNujiLlF5zKUG8FMPVZ/WIa0
         eEga6yMa4NlR5yy/IW6qHSUjXhC3/XlWDcc/VZ9R/Vxs9OnDUoWpsEicjAKkCQ04TuXs
         9e8wi7a/sZ/jEJXKCVFmRPg1eSPUuec3+6TC281wd6/GQ7pXgcnMgau3+l21k409qCF/
         xYT3YG/UFuY5tLKp5TpnBA/EN6Ma+6gquP7G3ncizPeb7UtxTyjkB1R7S7958VWTQCPy
         XOvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788983549; x=1789588349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JE506qyM+xSDVLQ18Cv32kLGdbyz+6FYOgoc9bYH4MI=;
        b=c000xhyjMnMMURzP1zlvDv/QBpEnhy4hqSKg2rIAUSK8QeWHKD/Tv8VCpxX36r8aqr
         U9hmHI0J46TrbulCzeJ3pNRzElJeANEAABuVFltaKd4+8++NCWaYmJV6gF+Hyv5dJ5NE
         CYaHANMTZoRU57K2o/hI0hU0pvtKPa4Ys0hjJL8tJ5GepQkahfBJUyVpC/lggCWwZDnY
         x6x6015mMxe0sk7VCA0pdeFFK/g9e6I+yYtj2EeGB+/dtPlRnlm+16juq47Eg0K24zn2
         c8GDm/CmQRpCXrxK4tCLlo9kAnTcjLRNEn1Ko854Q9sMhvebZ61AB8GCke7ALqtUv/tT
         r8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788983549; x=1789588349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JE506qyM+xSDVLQ18Cv32kLGdbyz+6FYOgoc9bYH4MI=;
        b=TUM1GJ6cavfBnxmrwLe1JKUpCt5OKKQojaUGS8zRVIslO+NRN99onNuEeN+G6tJFS8
         n4t27SXLy/rkTFvdw2hrutMzOIl2UeWd/0lmkiBYWfsX/jnXxXdPSVgmZ2k1Y6lTXHQ8
         s7jkv+Eb8xWnAnhrX8k9iXjxPTSA0rA1eI2jgtlcNTCk50ObljfE9KfLDKeDO7vlV1DP
         JLVLW7aN+tnjCsk0lxEFg1cXvmRBk8JMG77TJBT1xxID48/9AfiW84DBeZq+dKMQQMkC
         e1ymoSOl+spn5Qd38+J0lhq3gDTJP1tJwAVertOOC6FVhdFi6I2RZTxjlRwcEiD1PGAa
         w1JA==
X-Forwarded-Encrypted: i=1; AKwUvBygmzjauyvVL7aetIEyPhFdMVoh1GvZwra/MRzYoaApTLIGr7oCJPcLMtF8P8jXy2wB7xJaV4Pau35mGtv9AClJCQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n1WGIr8qRYgnFq9PpbeE5zfilD5SV6mA8yEVDi9LJIqZd8AGyd
	xEa72oZuiXEZOTsObIP6hnyGv4QDeizdFIgGe4RIW78lgTN/dKs+hxR3FmHcCOjfO5Hg6R/efQH
	pSMo2+AbPjQgPJM5jBQmA1nixdkTm2gRPzA6NPighXQ==
X-Gm-Gg: AYBFou1Q0/sOgVwW8Q/io2qaadAWXnxk0A9AwMAMAjh4TrBlwIiFwF5CcW64dIh16Xl
	Gvi7OY5by2kA8q27NtKiCzEMhhhQMtDuxYcwsj6dznz5Iq8QIWu8Pr6WTA/8cIMcDOVk4+B9BW7
	gRXzZnzcgJVo6KA7wzDWNDWAvrQUeqTOfwc6Co2dG7HYe17qXp+azObU/5nC6IRnWLxP4fF11dN
	CPxu4/i+X6QBqdds6PmOuZbTWBoXx6qScwzzqUpeuqA5sPUIKKtBf1NfH32c2qG+0Kna46wPvie
	UHAIa1Re+yuZLVpBkz9ULuCLo7KI7R1crBS5YM6lDsWsY6MwhMIs6iVWDEwOO+RXGf94YTFd7W+
	fN+LvrOoQ5rvS1A==
X-Received: by 2002:a05:690c:31a:b0:87c:a15f:b667 with SMTP id
 00721157ae682-88153e6779amr21225247b3.19.1788983549289; Wed, 09 Sep 2026
 12:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909194450.183693-1-tturner@lineageos.org> <20260909194450.183693-3-tturner@lineageos.org>
In-Reply-To: <20260909194450.183693-3-tturner@lineageos.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 9 Sep 2026 14:52:16 -0500
X-Gm-Features: AcwNN1XFLGvzp87hqDe4D94_SRB5dZ_z-E3RMUBPTQ90wJSi_XkiyxbHOQTg3Lw
Message-ID: <CAPLW+4=sHV_xOfhDkfZ-TXUaY+BcmHRn25x+YGcmz8Kar6d-gg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to Exynos850
To: Thomas Turner <tturner@lineageos.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas_turner@talktalk.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 2:45=E2=80=AFPM Thomas Turner <tturner@lineageos.org=
> wrote:
>
> Add nodes for GPU (Mali Bifrost) to Exynos850. Does not provide support
> for temperature throttling, DVFS, power domains, governor support,
> boosting and voltage control. Once PMIC is properly implemented, support
> will hopefully increase. However, the panfrost driver probes, the
> Mali-G52 GPU initializes and the core clock is set-up.
>
> Testing for this patch was done on a device not currently supported by
> linux, the Galaxy A21s. After enabling this node for that device
> locally, I was able to test and confirm basic GPU functionality. As of
> now, this patch has no users which have tested GPU capabilities and so
> the node has been set to "disabled".
>
> Here are some logs I pulled:
>
> panfrost 11500000.gpu: clock rate =3D 377000000
> panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,0000=
0400
> panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x=
00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> panfrost 11500000.gpu: shader_present=3D0x1 l2_present=3D0x1
> panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>
> OpenGL core profile vendor: Mesa
> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL core profile shading language version: 1.40
> OpenGL compatibility profile vendor: Mesa
> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
> OpenGL compatibility profile shading language version: 1.40
> OpenGL ES profile vendor: Mesa
> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
>
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> Changes in v4:
>   - Add Reviewed-and-tested-by tag
>

If adding the tags is the only change in v4 patch series, there was no
need to submit v4. When maintainers apply your patches they collect
all tags from the latest patch version themselves. So you only need to
collect the tags from the previous version review if you want to
submit the next version for some actual reasons (not just for merely
collecting the tags). Sorry if I forgot to explain it clearly.

> Changes in v3:
>   - Re-word commit message to be less ambiguous
>   - Provide some logs in the commit message
>   - Add a blank line before status property
>
> Changes in v2:
>   - Add a patch addressing the samsung,exynos850-mali compatible string
>
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 911643008b9f..721b2b2c4ffb 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -310,6 +310,19 @@ cmu_g3d: clock-controller@11400000 {
>                         clock-names =3D "oscclk", "dout_g3d_switch";
>                 };
>
> +               gpu: gpu@11500000 {
> +                       compatible =3D "samsung,exynos850-mali", "arm,mal=
i-bifrost";
> +                       reg =3D <0x11500000 0x5000>;
> +                       interrupts =3D <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "job", "mmu", "gpu";
> +                       clocks =3D <&cmu_g3d CLK_GOUT_G3D_GPU_CLK>;
> +                       clock-names =3D "core";
> +
> +                       status =3D "disabled";
> +               };
> +
>                 cmu_apm: clock-controller@11800000 {
>                         compatible =3D "samsung,exynos850-cmu-apm";
>                         reg =3D <0x11800000 0x8000>;
> --
> 2.47.3
>
