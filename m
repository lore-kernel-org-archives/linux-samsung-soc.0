Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AED91D5142
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739963323; cv=none; b=b6Jbh0dDCHu9as7KDbzArknHp8z1uJ4msPbrL73koYcmwtYjfxcOq2ophqGKbEb6MIOajlr7rF8i6MR97ZxmYPqVCN1OcWz9UM4KF0p/lniOvzuUUnRjENue/kO5GXxtlkjg06FUfJDwf4iqlddHMlPOGbEcktxj/7zR12GzbbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739963323; c=relaxed/simple;
	bh=d3hwHJnXhEL3U4lpXF9O3OIISXIqjdYjDDjV0op+bOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U4AIm2cQ7EOLrMNmylcVXfTq2CtWHOprFuJdpESoJDJwVpj3ctkuLwqAN9aezH129yvnyoN981zffDesXDh/O9D3p7DsZz1rs4lxr09ZVKp36YCXLdD7KxDHiw37sezdu1kdWJpkb5VKJGMi3hRT2VMlx5M/LeEMlwg1DItVJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LdfkQV3I; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdfkQV3I"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dc050e6a9dso1390080a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739963320; x=1740568120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WCJJBquXtU0xuWId0qAETv4tq4g6KwlnFXnMWiiOMA=;
        b=LdfkQV3I9uFlaiHeZYjrm+4Wz9+psWWBUln9N+WPNAZVWJl1kO0akRrXF9pkH3xaKz
         OSZbh63rO0PJUedgkL1UPmzYVzfxhS/ske8ofY5paug09iduLdNg65X9AKeGMuzzUrR/
         S3YiOda4SUfD0Etj0C3IG0baJQTCz0Nd5QgwKH8ZB8BPbn6DhSVCCQMHkoqIaakEJ6r5
         P+luwxzvp3q0LZZvZgkcMB15MI58CiT4bdxBeyrOH/RikWZ4nTdOzC9qdyI0vjsd2TlT
         4nwtSaXZCH+CCb8ErAoWU/o7hMAzROzZ/v8CzSBe50go2Pt+PinqzTfDp0PYJ3VXY0v4
         BHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963320; x=1740568120;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WCJJBquXtU0xuWId0qAETv4tq4g6KwlnFXnMWiiOMA=;
        b=QE13xEGKmaAU1KSjuqtHU/hNjljwiNc9IfvN/83TkFiE7wtLfAQqptbj4eNhqGPr/G
         woh5HPS+pinM7Ra2ZntXeBXmIlck+3jgnfYOvHzGdXjfx7MXIuv6ty4u4Pc52f1Ozah9
         e9i2Eqoz4PBuLyB52oghAqtXuIgq08fij0zoK3KPd58A/oru4FZrbh0PXlcePt9GQsAc
         hcJEHYT/7/t/BrUUTq2n0XhBBNbuwiOSHwHs5xMy/ZU3gGQY7AWQAU65Hw8dG6yV57IW
         fHTovjw3YeF6C1WnMy1nNvuLvv/FAUQmppsGGLK8fCrzqTcVSlWdwPRysWIHQjYH/mL9
         noqQ==
X-Gm-Message-State: AOJu0YwSonbgncS843YeKXCtrbn8ThnXoIOWHCCvjWcEQd0aGDaXdl5p
	f8AtXVMxN6jXQ6hv6Dgrpyfnl7/5F4J6wd/EUiAYoxTTR5nZP6GjR9gfTHoqzwQ=
X-Gm-Gg: ASbGncuAfFY7Sl2csW4DweoWLOj8Q3OtYyDZBhjBcFlXriYUmFPkWEgc2cfotfmQnYG
	bBfoQ/YxKryWyArIFAcxOscvcHOo6VblfFuHfxX6x1dzJBuBizG/OjtwyFsHqRRZBNovDub4lmc
	vT7JM6xY6J1Yc+DyJyKrxYcQZ55OgjQ/fMH3mHcCEwphoqL1QW6cdOyKM4o11diJiix4eFYbqru
	zRJ0wXFrBawG4MRMzY5PrD540C1qCnRyrf9i3vkv/CHsJbadcsuVCEzFBlCXiuHCbELGwfy213F
	km7gK/3u+wor035wWUk0+gNjLSeLok8=
X-Google-Smtp-Source: AGHT+IEfgYfUdIbS9nfRVc6N/GSxlxs4zzk9e7TbLbd8Y1WZWb4NpfyhDpkjxjKwSOnEvxlwN1WD4Q==
X-Received: by 2002:a05:6402:2356:b0:5dc:d9c7:a61f with SMTP id 4fb4d7f45d1cf-5e036169cbfmr6699580a12.7.1739963319786;
        Wed, 19 Feb 2025 03:08:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e8dsm10158156a12.14.2025.02.19.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:08:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/4] dt-bindings: soc: samsung: sysreg, pmu, chipid
 for 2200
Message-Id: <173996331626.137285.15610592693231757243.b4-ty@linaro.org>
Date: Wed, 19 Feb 2025 12:08:36 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 15 Feb 2025 13:27:12 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds support for chipid of Exynos 2200, as well as
> documents sysreg, pmu and chipid compatibles for that SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos2200
      https://git.kernel.org/krzk/linux/c/cd6381a6ed69747fbe1f8ddb926b00786027894a
[2/4] dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
      https://git.kernel.org/krzk/linux/c/801a116bb82431446cedf942842561348a2c67e6
[3/4] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
      https://git.kernel.org/krzk/linux/c/28e113a133b5033b47ffaadfc3e96994e6c5e132
[4/4] soc: samsung: exynos-chipid: add exynos2200 SoC support
      https://git.kernel.org/krzk/linux/c/c86e967e6ba73ec6ac2a189073e0f7b0f1313788

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

