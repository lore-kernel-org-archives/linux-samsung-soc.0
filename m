Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AC73C3C0F
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944916; cv=pass; b=S/Hhd70N9H/Qte7RBwOZe99uvooWyvdDFqTD3RJ4ikvSCkkrXEleX5zwlO4VpT4PvvVQ4TBANIkvYXHjJMo/CffP5dAjwzIucJNBWe9SK6GtZWygfXI80sDsP6ye8Qanc5rxo7/fwdmAL2FYwlz0HjxVXri3QEICTxpPkqLqaPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944916; c=relaxed/simple;
	bh=ReEVztyiOkfCn3qjc+8FH6TucXrc4+FPvzJFCPedxsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsV/doWT1vc3xxfnE9/v/R2yp0/36V55JRUpE73uFMNDFH5OVocmHJ08P95eWwGmwcpv2RWWEaH1GO94sGIFjlhixvkixQ6Cfc7++9PicYK4uj7jV6e0gQk/Km14so6nr3BFJrV7gxEI2BgLCr9+uD3G4un//ZU9E6M/n/hdEGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjlpyWRk; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjlpyWRk"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae7aa02cb6so2784264a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Oct 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790944913; cv=none;
        d=google.com; s=arc-20260327;
        b=BPJPKSVp4fLlA9KZmrSZegUcPQGeQQ6aWwW4dq3SU4DvbX9SDYyu7gpVOf2ndwgrSJ
         RY962HO6UkDGyN11RsjODG1L1NvVRlWZ8NqgsdUEk/7dHeO6p5Cl/6tNrCRVobMAQWlM
         RzkmPlhMyp2pGt49EiK4fmFE1+2xQW95Qyah0l6VTMBYLIXBhb6bIFkbXazRudpXLKYQ
         dVUaFoT+8CFJjZ+ne8mNaW3paLB+9HN0VsIZU6M6meUeZaETpvUxAW+1S8aPFqVAN3fD
         5YcbIzohv3y9S6t2L8raU9M5b+kIr1NrD6RFz+Z9+XME8vW+qNR/bAuLg02dmEtmzgNC
         iCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        fh=RCaI4+9/VRYFLv+Cm1E2eLHx04tz9fC8Mt5uILlkv+M=;
        b=cp9dyxaWHD2iaF87uhiwDpbzTTIE4OKZgFvBEioYMOO+5f1mINdxjnY1h1/URiuqTq
         Ew2cdgIhGECiL2wBvMtfk501lNF4Qer71H9I8UiXbaXdxrcpCVnjCwGT6sNZIeIuY2fZ
         pcOihuK8ThTJ4sRfcHYi1gpcuz3ibp4hzGxnQlxxy8/41p+N1vuereuHvFy3YLbnW6gc
         f89Z+mntljl5JUGAWJWVooU63gL+qDfGA32X5kwi9fQnZDEBnjMRTMIyJUxtJ5H5xBav
         Uvwj7VEv+wP5SMdEiWXcxURMc/n9A6rbiy+h3TB5Lt+BL+r5FhJZMazo0CHkC3nyiMGT
         7rgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790944913; x=1791549713; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=vjlpyWRkZCPBNxjAqMUuYusyAC6TId2L+XvQXhfT2MkCFw+e9pyd0tamIyAax8t7xX
         C4MUcG728fTJmuEagPY+cGH1qKOHh0ZFd4JApdus+7cJOPwQbuzhLy0A8m9e1JFX6ngw
         URErfVHA5TP1nPDVE8QLTrl0HhAiVRwnYedXrmgBifNxUPD7D1/0Lrth4PyIzRwSu6Vy
         Ft6lU+oKpzugzc0Rx6rFXXPt9spBPjRl59pTSWc8uJGszWFHGrtou/g3rBYVd4Pzn2QV
         bN5E6NDbVnNF2h6DNbSwgEq/mNHJHx22OO59/09F26+B2E3dovzXKMoVALH7Ds3bJyEG
         dBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944913; x=1791549713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=Rhu5iGndPNHm6FoJohfg2eTR5WVWj3EOjlgQceCo/8HUOu0vg+p7np56xUVs4fSlob
         iOXxd58/dAgOEe2vH4Rx3dO6vMoAGbGelsHHPxmneL+G0piW0qlPZbVjXKehE/6YNLVN
         EYNrlur70knzPYn7O23as9U9nKt8y4+gxjm0Tj3hVG5SmJoHD+vtqzWwLV/ogtbV3VBk
         fEMyB49NbYeIxfdg6CsXfpglu2Z2P91FkjjHSoC+gZoOkpLImCJkEIEnatPGzcus2Ek7
         8i3/slqFtGKxLX4LLFXKolsJa+GA/+f82k+ozrpIj0Yy8lFW3rKRnBIcKULYbQxoatSG
         w/bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhvZ7j6HUOTg1h7sZg5AzFMzfbQAHVrR/tjRdnNxfdoqI64eIdMvWAGc+OnMGbPsXO1CJe+GtVg970ZthCo5yR/w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1VuF2YdLTuBIOEEv2SGRv6l9rbrJaaxigPcfkKQ/hfpXm+lvZ
	NDs4o7VWgTlIWykfxODuTe3QdF5AeWBOa38qJZ5EpopyBe45zguC2C8wuxl5SPERI7dnivjISbt
	au3p90BZ0I0rRp2jjtjXJaY+lnDsk4fbg9PaBXqcTDQ==
X-Gm-Gg: AYBFou2u2hb7nuo2ggy2G3A5z+BPiTMmkOt1Pcb82WPG3ylqpnVtVgrzmQZZONfuk1K
	Z8TfQBBstAkuDEOjP+dR22r99OyL8ZvDml0GNeXXuvQ+L9O2Bplhk0HNdu9yX7QH3qRfWTUm585
	Mwz3zcSDTWQ+J5BHthlDZ2BakBL8KZ8TXJXS8bC7mbE+UiB8QapBODaAwnASNGCoXLfuixDmtT/
	gI0KzeBlALYspyFr0QAbXQ8a9mzK/bTnWqLx/sn0pnGIJ5CkiWV/OBg+K+62OoLZjPVVd1VbPc2
	5sJsg/8Ss7vIcp5j6209xVfZExnTknoZjkXDrJ2bskEt1XS1h1yX0R8sar4k4o760ZqoLlB3AGt
	TpZsZ18A4S0htng==
X-Received: by 2002:a05:6402:5113:b0:6aa:f1d2:ddbf with SMTP id
 4fb4d7f45d1cf-6af9e335ebemr1728168a12.35.1790944912779; Fri, 02 Oct 2026
 05:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org> <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 13:41:41 +0100
X-Gm-Features: AclHuK_QyQlit6GQkvv90porbL6_8NAwZ9GwGxUXMwJD_qPCIZbSMtNOl5zyftM
Message-ID: <CADrjBPrm0o5scen0vk2ZiCzGW6kdTWsciPvA9K7JW_yb+Mp8PA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler <henrik@grimler.se>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 30 Sept 2026 at 01:13, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..803fc127d895 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
>                 pmu_system_controller: system-controller@11860000 {
>                         compatible = "samsung,exynos850-pmu", "syscon";
>                         reg = <0x11860000 0x10000>;
> +                       google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
>
>                         poweroff: syscon-poweroff {
>                                 compatible = "syscon-poweroff";
> @@ -248,6 +249,11 @@ reboot: syscon-reboot {
>                         };
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };
> +

Since you are now creating your own custom regmap in exynos-pmu you
should drop the syscon compatible here. That should avoid syscon.c
ever creating an MMIO regmap (with the wrong spinlock). I've copied
some of the commit text from my commit
a21d38b5e209c60e73f81e467cc53ad57b5d4080 below for the rationale
behind this.

   arm64: dts: exynos: gs101: remove syscon compatible from pmu node

    Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
    "syscon" compatible") it is possible to register a regmap without the
    syscon compatible in the node.

    As mentioned in that commit, it's not correct to claim we are compatible
    with syscon, as a MMIO regmap created by syscon won't work. Removing the
    syscon compatible means syscon driver won't ever create a mmio regmap.

    Note this isn't usually an issue today as exynos-pmu runs at an early
    initcall so the custom regmap will have been registered first. However
    changes proposed in [1] will bring -EPROBE_DEFER support to syscon allowing
    this mechanism to be more robust, especially in highly modularized systems.

    Technically this is a ABI break but no other platforms are
    affected. Additionally (with the benefit of hindsight) a MMIO syscon has
    never worked for PMU register writes, thus the ABI break is justified.

    Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]

Thanks,

Peter
