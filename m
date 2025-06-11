Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3BF1B0F19;
	Wed, 11 Jun 2025 20:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674656; cv=none; b=IkU7TT5fONgXrq8vsRrvrTEeLj5929E687JNw8EAbpQbidVAGpIe2PMmoq4vyK+CX86YrFSQcBfRsb5e4oFku6sP8IwuddeidRmE3ItKqE6hxZ32z+p7MqtyUP/q8NlzowbWIUlRvEe04e98XXAlFTfh7YNP/DS9L0M4O0uQiNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674656; c=relaxed/simple;
	bh=2E4OMvVWDSvMaRHePgIwEIvwdRedavzpaSpWlcrLJNE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZM4KpF7DSvHPsP2PbuLN5pAztuL2QcLb1G9GY11/bSMdip/hubCnl+ds4m4H0H6k0oCtGrcnQbDZxeTp36DRzGXfBi0DSFeeTZsx29plpsRTTpAva3qK7hddr3kVekukrrkZaMwJdOf1BPyvO0NsV98TRi2ofQ3vPAR2CVTvqwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Umtd39Hy; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Umtd39Hy"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso438248a12.0;
        Wed, 11 Jun 2025 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749674652; x=1750279452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLYo9g0XZU6Jy7Q+OYukaklPi9cQZWEMlGfi3iuIv10=;
        b=Umtd39Hy8qlVbEbR/M9b+lOi/ENzGRhOGU71vaCtnqvA6TCLH2thsDrnOfDaRhBgzp
         s1HT+Yti39k9hz20oCnqyUyWw9uWOqNbxCdFiEVQ7ION9AGVXlrCwe4vmVeoUuNAKxPI
         6vA1T8fnT1RB7HJSNG9S+oEndfYUdihF/rJCuIu2abKa96BghkEAI1nKJejFMJOQ2p2S
         bgfyZfFwm6MdlPj294WGb8Y6cFNWmD+xLXF+teud4xlD3sl+YTvAK5nEJoi+FRMU39GE
         0mWz3EmvoLrYQce8YJk8lRBZRbCrbbaAF7vJj73rD977PUoNiHY1uaSQfg8X21ybCWcW
         cuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674652; x=1750279452;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLYo9g0XZU6Jy7Q+OYukaklPi9cQZWEMlGfi3iuIv10=;
        b=GPCMBJSpXnCFXBE8DpEmuj4HvhcWpsCJcYWQduyNOGtYWj/VYqy8DQTw5UBhsDoqTM
         a2mnZBOSWvkidagjmWWd3NfBVYwVFnkR9eznWqQIoyMdU6HhQQNPx2tLiYEULOiSsJUm
         i3ojoF66mYS0SmyfzubboT3Hraf3Z6qwMAHU789hqolFqi36K4vZVt1Dno189HmhR6eC
         9Cb5CEtmx1Ku4qSZiibnWFbK+1dg1ZH5eZNMwKeGiCBOeuOa7FUYCHuAFMjGE/K1zlaY
         vEq2CuwAftsF33EHcMl4hdOOOgm+robzDwUinD4EYDQmRLBWZMcyqUWJzVKuu7bQ4A24
         bhQA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1RRxiMys2TdU9SNdeYzufptIZM0pZL951FojSjQm3kMbhmHJFnA48PzOeumlKskWfYzrcR/aGABA@vger.kernel.org, AJvYcCXVEiVcbJCcJmRmCMf5dTPSllEXXCmLQALtDfH0B40Bfu/PjNes2RnS/XUyZpf2Iaw2hCXLxjaP035pZsmH@vger.kernel.org
X-Gm-Message-State: AOJu0YyownKrFSxKX29Fh5NTVYT0XGIx6tgu7vCueJ3d/xsFnJliqN06
	zuk8ExWqT77HNaN04LQ16gmc49ntT1u35ZEX0Juw5ctFkKiFt51To7lO
X-Gm-Gg: ASbGncta2/KLae0gaRUXtOrHA4RZjvKLtDzVqs7eptqEjXyunGud35fSZXDN6IPtmLk
	g4f0gYcWnbSSTfKdCmkl0EzaM1GBXzrBgvg4VL7FMg62WHjkBJGvakX7RrawMV329OhffoxKLo7
	Aayk5AIQREAfv80QnRyAv/d+FHwUmmffawkwYulrdcVmi0BToMxvTFghjKnigdK9dyxBY2mC+b1
	h4NHKeeEToGl4GL0sJ9WJVXpK6jVPu2iPj8ncogkSJ1oXXN/FuBUTHQfHDrJskmGVerer5kTbux
	GwPKqaUTNP/fPu94HpJ4sD26LB8/EyQf7r+02b8k9OhG/25HetFlxDvhenBl8rCr3egknJTyPIV
	jorR5grZsyrZwW5h6cNNCWlDhocOA33QATa8lqPxB
X-Google-Smtp-Source: AGHT+IEbZO25GP0zLYvCQFUPinkwrl0QrXpMwqbq98Zv89FfgEO2JiAN4GPbac0XHqn5u+0zERsKZQ==
X-Received: by 2002:a05:6402:50cc:b0:607:d354:d87 with SMTP id 4fb4d7f45d1cf-6086661d00cmr840874a12.6.1749674652377;
        Wed, 11 Jun 2025 13:44:12 -0700 (PDT)
Received: from [192.168.1.102] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086b2223bcsm109668a12.53.2025.06.11.13.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:44:11 -0700 (PDT)
Message-ID: <b41446ab-12a0-4ae5-be2c-7a60315062fb@gmail.com>
Date: Wed, 11 Jun 2025 23:44:10 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 17:59, Ivaylo Ivanov wrote:
> Hey folks,
>
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
>
> [1] is a dependancy on the aforementioned series for the usb phy drivers
> and bindings.
>
> Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
> (r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
> including psci, pmu, chipid, architecture timer and mct, pinctrl,
> clocks and usb.
>
> The devices using this SoC suffer from an issue caused by the stock
> Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
> needed to hardcode the adequate frequency in the timer node,
> otherwise the kernel panics.
>
> Another issue is that cpu2 and cpu3 fail to come up consistently, which
> leads to a hang later in the boot process. As A510 cores are clustered
> by two, it makes sense for both of these cpus to fail if there is a
> power issue. Disable them until the problem is figured out.
>
> Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
> 2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
> 1080x2340 Dynamic AMOLED display.
>
> Further platform support will be added over time.
>
> Best regards,
> Ivaylo
>
> Changes in v4:
> - account for compatible changes in usb phy patches
> - use status fail instead of deleting cpu nodes
> - add a-b tag in the 1/4 patch
>
> Changes in v3:
> - account for the usbdrd changes in the exynos2200 soc dtsi
> - drop usbcon driver from the MAINTAINERS patch
>
> Changes in v2:
> - mention the board codename in the first patch's commit message
> - make all reg values hex in device trees
> - reorder usb_con above usb_dwc3
> - drop regulators for usb_con
> - remodel usb_con_phy to take usb_hsphy phandle
> - include MAINTAINERS patch in this patchset
>
> [1] https://lore.kernel.org/all/20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com/

@Krzysztof - all dependencies should be merged now (correct me if I'm wrong).

Best regards,
Ivo

>
> Ivaylo Ivanov (4):
>   dt-bindings: arm: samsung: document g0s board binding
>   arm64: dts: exynos: add initial support for exynos2200 SoC
>   arm64: dts: exynos: add initial support for Samsung Galaxy S22+
>   MAINTAINERS: add entry for Samsung Exynos2200 SoC
>
>  .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
>  MAINTAINERS                                   |   10 +
>  arch/arm64/boot/dts/exynos/Makefile           |    1 +
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  169 ++
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  561 ++++++
>  6 files changed, 2512 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi
>

