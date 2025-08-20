Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96429222568
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Aug 2025 05:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755668088; cv=none; b=sT3fBoCZU3niy3Ghhubfhm8gJ0ysymTon8iHUsl98KWEI9zQVqvyPyomdZXoksHtNTFUsb6QtOlYSkbr7JyLhVuk5UF1wdBBvkj+az16/rYuEZ8Z33PTpfPqCAJ0IHdpM9Wau3NfQHOgjKh2zxx8Pv8Xm/t1PolWneMKwxvxG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755668088; c=relaxed/simple;
	bh=4lF2BPOuxlu62CFYhKGsyHeTVBRlSliSNiFjd1lyq/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s39lAAwyL+s5L+bWoGR/852QPjob7wdffHrXOHQfw506xj6Hp6c51Hmnq7dQoW74xBnwzsFdDOrM2fDb9LM6s0OeDVyj5Ycu/MglEF69x40586oaapnZkbOIFfrvtwRx2JP9KsUqiwk3dG0+8jT15teFFU/K1l6pbcUeZS2C+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KKRetTpz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KKRetTpz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9e411c820so3288280f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 22:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755668085; x=1756272885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eil33dYZ2kqEFHYeERb3SkCrv/7mpVOIyPnTh2fbPSE=;
        b=KKRetTpzW7kVOkDOFJqJ7XO8Xt/o2vTVN5XT9yq2wHB/oGKF7WMc0CUB7ozuzcv/bd
         d9Bkb1pjkthqd8bTmbximC8q0NVCXwm9gyBlo24ZK1H70iDENQ1WXcNDK7VYG40l5Yv/
         JV7qYn4k7IUO/ISaeVqi7gLTLtATfvWFrwNpdwY91a34n19Oo5HqtCG/WWCPv7uWcMjv
         wQR/O23n03NrLH6zz6sOil6Ra5koClydkHb5o2myIWV6opRqSBT0vilgDjYQ4mONowo5
         iR2tQa/oaTu3PrsyGVNKnp8M4os3lTW1hOBfolSrZaEM5awhqj7JTo9Yed7ikeAick5c
         38bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755668085; x=1756272885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eil33dYZ2kqEFHYeERb3SkCrv/7mpVOIyPnTh2fbPSE=;
        b=T45KZLQM+Ucy4M7NdoWubDCcJON49I0YVwbt+k8yDUaYmopytlxyNNM/3Z7wHk2EFg
         pNXk//ubEcmTCTfAU4uZdftkR280/beLf1up4vks2XndU1mvQR1/fdGaNc3eNYoacOFq
         QAno/5LvbzlcT3e597+M3dRQ5pIsD29eb+eOZoRThxu2GH1+goVkCQ0ivMRInOfWAICo
         y4w4cUGuSK1Hm8HWM+WNVI1Xd6TH8Akbj34BXyWw38AF+Ei7qwZGSaOvHPUO99aj85jC
         OL5iE6WH4Cf75o/fSxyebbJrACnzKy/oRsoGXHtgJuGF+ElPomDDLpA7pNQIoVn63FvG
         Csxg==
X-Gm-Message-State: AOJu0Ywnx8WOAe93QZ+nxmi2wUduC77nWFOeMb+wCLBiOGlNdnOpn4wz
	pGao2RhOQ51+ThkpX98/pU88rWz9Lu5V0uVYk+nK0kA/ppGV+BLAmrBK88OAifopMd7zXk2LCCW
	INSyFC4U=
X-Gm-Gg: ASbGncst8GNBuS7D5WZj/G5g+6GWv+hOWC0Ng19aVj6qHyX3sPA54eX38uywA9hOtXv
	Dyrt1q4B/pkQrNRsNjYneCRPLK7KtEhgXNc4EeQmZ7EqGVTHUgn+5GLIfZaVjCxMKy80WXf++ff
	zE9nbFnDimNHNvJFLYk3FPUuE7ruImIf2lxu8eWm/6+rkJJPEUxRRmg0vgd3uf4pJqwA73LdixP
	FFsVWqvgNmbJ2zBxOJ89PWHVTzK4qhspZhBgVUAf3xcDkDuGPx/ARBlubXVrHlxUvRJDwiIm0Ap
	VItlUWQ+nSu0mz0BtWSghBmdm00OABXRqbX78cohnSU5qL/ptT5bsSmOMQdarmt4shdwIkLdqEx
	zQLnrGDSSDapoJmiSS/7rYEDeUro1gA==
X-Google-Smtp-Source: AGHT+IFWjACp5DWGBY5B9uxqsY3tmY8UgIQcJsPet9ECXaI1irpOud50Gju5d9X1c0y9aS4zy+fv0A==
X-Received: by 2002:a05:6000:40cc:b0:3b8:d08c:cde5 with SMTP id ffacd0b85a97d-3c32e6fe6ebmr776353f8f.43.1755668084871;
        Tue, 19 Aug 2025 22:34:44 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47d096e6sm15117535e9.19.2025.08.19.22.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 22:34:44 -0700 (PDT)
Message-ID: <e0f7f062-dd12-4aba-a1af-5626746059f0@linaro.org>
Date: Wed, 20 Aug 2025 06:34:42 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: exynos: gs101: add cpufreq support
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Will Deacon <will@kernel.org>,
 kernel-team@android.com, Catalin Marinas <catalin.marinas@arm.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org,
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
 <175561687189.581847.11419028447160198230.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <175561687189.581847.11419028447160198230.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/19/25 4:22 PM, Rob Herring (Arm) wrote:
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org:
> 
> Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 Error: arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.32-33 syntax errorsyntax error

Thanks, Rob.

I should have been more explicit in the cover letter. It fails because it depends
on the clock definitions that are introduced with the bindings in:
https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/T/#me3cbe2a97485d19eaf505ad23202f20a21305dd8

I chose to have the bindings with the driver patches as the clock definitions
are needed in the clock driver as well.

Krzysztof, please let me know if there's a preference on how to deal with such
dependencies, I'll note it down and respin if needed.

Thanks,
ta
