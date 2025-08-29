Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8281DF256;
	Fri, 29 Aug 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464012; cv=none; b=HlPCZjvYMA9HRkplSo0WcdHf0BXfJd17U/foKRYTjP1IF/WsOXo3E9GMGKD4nX+9LBVjR2ehvfhjb1h8COlpWkiGacW9q7PEcvjC55yjLWPUu5F7FNigA2Q91ayefbP4ZFy7Lt07TCQ2bfEaSjDkx+xQypc1AK5df/JIxikjc3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464012; c=relaxed/simple;
	bh=IBT8NJmua99Bl7F9ZIpmFR9XFgOfeeeZG6Y421h59Hg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PYVv5nJaRkt07RuQh7wrE9sLkgpYarvgiOIjM98kS/onftSVJumUS6e/NpHLmhvP8GLDQUmrLHHtl8oG+yLc5atd/YnnAdUJ4aQPTgQBCGt06v/43S+s3m3CbJVkED9yuctQYDbNOHdGH2JPle1dBvYsoT8qoevBvAQlPnDOjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIMywUM9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIMywUM9"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afec5651966so348512866b.2;
        Fri, 29 Aug 2025 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756464008; x=1757068808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yl5p12U2uO9xfcN1YtAosyTJ9NoreSs1ECa/E0M81SM=;
        b=HIMywUM9KSLl0z+MeXTdvcHNL4R39HLPG0BI2Oga58LJwClpSEfp5XKO7dXY9XlGmY
         816wLexIFeGEd3GySDiUVadne7vq3I9ZH6Q2UWxPC7wqUtTbMGm2Y9AkAfMxwbesn0Kj
         F/mhedQECEGSlTtTGmM4y4Yk8zFcSW4naaIJNFtzxwJYEmSKB9YXRmVRQy7ZG2Msheis
         QABzzLhqg5wNCFAQc3v8GTAfIw2Ky1y0qjRyEVN4kKjiEnc0psvgJp4gjw0S4PR2uIUC
         a/uTmt3vZM5rYl4uxEts1qAoXFDVmJekYYahKxPkt3kGSzaDMmcIIC3o0khYzjrBCsao
         MWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464008; x=1757068808;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl5p12U2uO9xfcN1YtAosyTJ9NoreSs1ECa/E0M81SM=;
        b=itDZmrX6E4zTL+4TiqbXCTbPyfCuTjLa5UyfI7juZmKxCySUJki1MCMu1Wq6UoQf4x
         wLdDMNcRbQPBBkXz1k/BoqqnFGjgtJ9ZvGXzkcOeEgGrkHI0AbGvUAaqB0ztoxVtAULq
         hdnZHVPZto5ZnsmrJ5/UmhUk4OaLsP275syCrYksCTLVsXlo0ZxYE+60yburn/HHr/nN
         Om9GjeLf1OWX4+OgMeRvEGa11DQ9RqJMCusGtC29AR3zxXrjzlUOKpppHFeDIGJtSRSk
         aYwqh9538Wo5/FHS1Yc3b7/P8OnuRzVoDPBBsJFLXxh9kKtDkzd74gi1Dk5urXomLnmd
         2cOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9Dx/0BBBJ+6fwyLdm/CmkzEXt1A5GGSX8sD2/FZwDD/3ds0YTwlBETOfqG3o1cu+J87pYb5pJowSLzIaW@vger.kernel.org, AJvYcCXLLV4FZxg7gp7hlVZwmht3LHuPo9tewRokRHEiq6byfgZoPXPicOE5Bp7kqECv2BnPZf+ThArsA4Co@vger.kernel.org
X-Gm-Message-State: AOJu0YxhMKDWdgeXl4E8xy3brLaZE9pMkfVzoo4BJ5QlW0yOjvW2xKKM
	6MdNKOq3ejy5ZxsbpFIM36HdBfwFbACh1AYpZ62NZiPkkkm1h8BzLbN3
X-Gm-Gg: ASbGncv6GxHcxsE5MQ9QW7jZQbvFokkKVYaS0pH9Urg4RH6SGReetiHrrCC7SMKI6WI
	KqbLVZl3UlpvSJt64qpG7KT1q/elTe2fkOZESTfysuvQat4+tkzogYk6qZ1Jx9AD3iCFAXa1JZ5
	1sceieYbfuNS0LOn6TZqMskIyr4k/ScllDShsd3KFmLfbWMiib9CTuomTHQwHcNdbYa/yi35F95
	2yDc0Raz6R8XEWmeZo4N/7nbXBHTFtkEaIU7VVSz1WZI5/+SP2wuRkfDo9TKYVgjhpR+0vY+FjQ
	mL+sKN9UgkxP1K7KhHeowneZax+y//4D3uz0XJvV3yvHxU8WDMEXrj0wsGT387qhVpAqI4lDKZq
	X+E5Bl7Hz11OjEI5K4Yql2roK7+MFejTGtydyaqGB4qjJq4sFsIbL7y6S11ux
X-Google-Smtp-Source: AGHT+IGTd5VpriOznSSUF78PDJ+lBThAc5tfiaPYhgxFnl96GsT4FoZv2KEHpZmkv5khcyAgJC1N0Q==
X-Received: by 2002:a17:907:3f9a:b0:afe:d21f:7af0 with SMTP id a640c23a62f3a-afed21f7e3cmr716079066b.14.1756464008284;
        Fri, 29 Aug 2025 03:40:08 -0700 (PDT)
Received: from [10.82.207.1] (212-39-89-51.ip.btc-net.bg. [212.39.89.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefc7ee8d2sm172652866b.20.2025.08.29.03.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 03:40:07 -0700 (PDT)
Message-ID: <31435f98-5701-4ae0-b822-11a99d1b2eef@gmail.com>
Date: Fri, 29 Aug 2025 13:40:06 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/25 10:04, Ivaylo Ivanov wrote:
> Hey, folks!
>
> This patchset adds serial busses, implemented in usi, for exynos2200.
> It's missing spi, due to me having troubles with reads when testing.
> Serial_0/1 have not been included in the patchset, as it seems like
> they're encapsulated in usi blocks, but are the only implemented
> protocol and/or do not have a dedicated register for setting other
> protocols in a sysreg. That'd at least require patches in the usi
> driver and bindings to add support for.
>
> About the naming convention for usi nodes, I've chosen to keep the
> downstream one instead of relabelling all to avoid confusion when
> cross-referencing the vendor DT and to keep consistency with clock
> names. They're labelled the same in the bootloader too.

BUMP - when is this going to get merged? I had a few other things
I wanted to upstream before merge cycle.

Best regards,
Ivaylo

>
> Best regards,
> Ivaylo
>
> Changes in v3:
> - drop the serial_0/1 patch
> - add r-b tags from Sam
> - increase the size of all syscon to 0x10000 and not 0x3000
> - change description of last patch to be more meaningful regarding the
> usiN and usiN_i2c mess
> - s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention
>
> Changes in v2:
> - add a patch that switches address and size cells to 1 in /soc
> - adjust all new nodes to define reg props with 2 cells in total instead of 4
>
> Ivaylo Ivanov (4):
>   arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
>   arm64: dts: exynos2200: use 32-bit address space for /soc
>   arm64: dts: exynos2200: increase the size of all syscons
>   arm64: dts: exynos2200: define all usi nodes
>
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
>  2 files changed, 1398 insertions(+), 37 deletions(-)
>

