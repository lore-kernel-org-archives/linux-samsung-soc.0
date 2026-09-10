Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8874718CE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076339; cv=none; b=bZk2mCSFnMuwLNuDBSpS32FFY/z6yff8PT/UcCHLErT47PedYQ5Z4W3myZkNot+5zB39ebeZTXVkoVXlFykpbWsJhzcAjzTxyfRmtLhmzkxDsMZYVqMoDbCYx7Sk4s2wlnpdAV6b4CFlxzeXpeV9gIuZUQ14CDWjG/rRARW98hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076339; c=relaxed/simple;
	bh=IhoXtIPy27R9nmeBtoMiaiTsuzKkKC2i/cZ0nUhc11o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=olUxRRUl18/avadFHroGVwGiHyu5dZVr2OXdtrTkvlLdgT6rI/UDT4W33jvtYGTtWinr5mP++wH1Ygk4tHc54HqDCfDdIkP3OoUY7nZgNx4T+easq/DhOrTxiEW8m8vLMOA3jZruJDAZzzQw4/sxac44qei/6Dr67WgsP9bGEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pqm5a8R0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pqm5a8R0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso2713095e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Sep 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789076336; x=1789681136; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=Pqm5a8R0mXbgsDDL/O2/yW2btDZvs0/DjC75To+H/bi1ZD9Y2sdE212B0dvDbj2H+L
         L9eJV2i7ByR1aMWxud2SJnCkbUChCZzAdR72vxUFoHx5Wt+vvbd3d2aqAthw7nysFL9r
         4V24TvlahaaGRM8NrCPUuQTHipOOlJz8UflPAY4kdmcszc6rKeRy+UDZ9JUlAfU5TpSn
         8YD0sFf0uepyqOL4dDU4kEW/t5DRGJ3JzWu7sVYi+ar6w+APWvOqmPvtqUGhHJ1cMYD4
         +4/vi7qgC+GiPZuqygcxp9ePvpjpUJYuUgYSs0E+hXV4VGa/m/4dsAPbzXFax3t9V+N3
         gK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076336; x=1789681136;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=o3TA6GXhpzoTISFtsRYPeYshwSrf0uN5wiyxVY3LC3uX3MWRrtT3TRjdWNyvspmF0Z
         6smO8ljRpe2w8BFw56VNZP34cDVf2gnHKYS9TReHMHalMqNBnSvWQZ4L70BUaBj5mera
         1WenxfB25K9PDthd2NtQdvz3o5im3kAKDcafU/+H4JiNQnEeIGGuecAjgspukzi37RtY
         twTIqdsBGW9jjnB9uc0f8BmlvRd4qNoOjqVEjH/K4rsXaH7DLaSBEZO8ow+LF6IJz6GQ
         +uvr7OBWeHTq+sQg5IMmm5qC9HzK0a11ffDIKXEew0nzSiLFsNBqawEmbn5qf9D0Jwyb
         qfXA==
X-Forwarded-Encrypted: i=1; AKwUvBzDwBemtHYvfk/U2izpVSKIMfCQ3oUbZdz39OoU4Rk49oeBv/kGeNo9UbwIPfIJEzLeAcEnEjDkQjcSaE2XPYw4ew==@vger.kernel.org
X-Gm-Message-State: AFuF++mTdJ+BbNo16+MB2r/VzUmZ1bJMi5J+3nNC9+meIdFo77ahEL4r
	HXMohI5uQ3Je7K376VncQzKdkb7tmsCmqzcj22zbSI4w1JuhFigU8MzGYtX7M2YBWzo=
X-Gm-Gg: AYBFou1nxE1g16p3p840fGTXaYCLeKgAVFPc4oELajSf2FKN3SNY+nTkdRj0rQsXkfl
	P8v18MN2ZAtQuPknYat3xkdZwU6h9SVBgEzNDBaFwW2KUdVHJJf09+nKIDMGtgXrKhk7mxKhhgj
	Ewq9fr0o34xBlfQakDTNxFsL/U4YcoJL4Ypx8O/9cPIUQRMWbLbF7BJnnEC4ddh5T9vi3IRJl8Y
	bc+ggpiaOYfCjLMd9jAVNQUJKIRAzREhw7gt4blOAr2l/MCkwzuUqE6BXCGFqj96CtIOG9VZsD3
	upQrssr0kGiyV+bh0Z7INBIOifVVcKEiBDUJ0Kfu8eS8YAWpkXhc/wfcxN8ABKfkktUxz2lR7gG
	WL30BTiY33m76akdrsaodri9cpB3AX8tB4kpa21bIssiqpoe1AGMprQpcaz5dDOJ7fD6TvLJ0Dc
	+QrABeXiIhzLoe9/h22KWEL1aCJARJJuvcua+ZigUl4jksRf8l/On61bvpgFqN3K5G/yLsFqmVd
	N3raRtkmfJkxPv8OG7i3Q+rneWIEFV8rhpjZmBweI14tErWlAW6XDBMHoSy
X-Received: by 2002:a05:600c:1385:b0:49e:2a61:a17b with SMTP id 5b1f17b1804b1-49e619a0905mr8799185e9.5.1789076335948;
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62227071sm4434585e9.3.2026.09.10.14.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 22:38:53 +0100
Message-Id: <DLBYMPDTOM7N.3I07C9Q0IJJ19@linaro.org>
Subject: Re: [PATCH v3 0/2] Exynos850 ACPM SRAM devicetree node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: "Peter Griffin" <peter.griffin@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>

Hi all,

On Mon Jul 27, 2026 at 2:23 PM BST, Alexey Klimov wrote:
> Hi all,
>
> this is a small series that adds sram node required for ACPM communicatio=
n.
> Bindings update adds new compatible "samsung,exynos850-acpm-sram" there a=
nd
> excludes it from having child nodes and not required properties.

Gentle ping.

What is missing here? Should it be split into two separate coomits?
There are no comments for at least a month.

[..]

> Alexey Klimov (2):
>       dt-bindings: sram: Document samsung,exynos850-acpm-sram
>       arm64: dts: exynos850: Add acpm SRAM node
>
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
>  2 files changed, 7 insertions(+)
> ---

Thanks,
Alexey
