Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD02D1A3172
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Apr 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018501; cv=none; b=SGK/jjattLQuT1CFAUkqdvYvKcEf/Q2cIg6QOc6d98hmOELo+96/pmezLTatSNooWqkyPK6vAv4c14Fm5xZsO63+5Hyg68gRtkbc0h20f3AVXSL+ZdEDxBQcq0Os1pteskn05J8xGvb0cyBAf9g0F558CZFDLDLFzPxcYbidiZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018501; c=relaxed/simple;
	bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E452JpbAwIOEYgXNVUNK3s+Dd9pvEfA/CHMbVzRCdacdU6kK3DGTOffQlDMqoy8mCdfvlpE+9C5TFonMMcC9q26vxODXNccVWhANQsWP0deCKVS/0onDHYUb5+iH35vNP8+zGJpgI2jUOHDEs+E5wYzU9V2P8orNTP+p5Rb7uLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTZvzowo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTZvzowo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-391342fc0b5so3240253f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744018497; x=1744623297; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=uTZvzowoocuBhurdncvrklh8cm6VOJJcEIQSRLbT+JGtoypeC6dMvlfj0mc8wZU7I5
         GyrRjkKf2AE/n8NApqIRK5yf5sUDv6SkkdUQk5Y1v3JAdo4/vUs0MpVkdQOaBEbrCvno
         9xwcYUmjMDtS3xRbrMK3s6cOK03cLKKW5aK+EpFFk/Ds5xsPLUCQc98cH9poXIQMrzz5
         BZFhHInzrACnCEhR68cMq5z8Jf8kDYV333FTnQUjigevbuBS3JARVdAfD2WSx+2AF+89
         Vid59EjqbCNvhYtEByIRuyLU9p/dim9hoQjOWRXYIjifXG19IKdXNvRHa4+t4k7QRloZ
         Apdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018497; x=1744623297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=wXJQLdqJNChso392zjO5/PkaMDJj2nygCSpOvku1NAAjkSG2Xys4pLwBfnnHKHbkYy
         91fgVMkdHaNtIswbUYEYByrhtcn8T+7hAuq2mNoXz9RUjOC8G0i/97CczepjmSDS3bPK
         rr5UOEBSLGCcxlBVG0UgxJx4Ut08NW/pJd1J7JWkyfN4foQF6WSHiWF5Gh4hHWyuSwoK
         P0jjA8JfjEcYV/qD1VlxFTbzuiU78ENXX6+PuTpoWNs7G4ejWHk2yc/7GRl/FPH3HYL1
         UBXQy8rxcglrclT4KXDSGH6C3lEiixkMt2Bt6DEXWjbfsI+8Q4x2sQjikqcl0jTXk/wa
         KrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkhZH25kwgV1WuMAvzmCwUnVsDBpNA8Gkztc5b11teAZx2ecNNo09ehhbayx3JM5BMCjp6HX7o4mkszo0E3nyvSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjoF3NbP7Z9zU+iazfuF9NkMxHSa7bnlVfn21RYN4ZZUh3aQ5d
	5gq1zlt6OZCe9DYoZ9AJaDYCFWkVkoaE6ZUPAdkoZc1X3RQuWva9ERpy3IKa4n0=
X-Gm-Gg: ASbGnctdYekW9Vs0uYGLdQWwpKcKHLrf+yltCtMW1fQjVfhJLvwlKJwURG7+/DvHq55
	DDjReLx32hrQ5ru1Y9QoREh+H/rOPeAII7jpC82pRqostxsTnLxf1/Tt+rX3Z0kNB4I52ivhUAD
	vCOe0IQ7VSBpX+bsrn5i1bV+eoAXPk7URTQ0walJqFefj9fwtWDdLjI0AwaBK652mu5sA6AB2AG
	WkGu4U0O5wOFx99RQvVzbIMud/CGH/JOuPVVEVJJj28IXm5mOmVErhhSbPs4HBIR2xwjsM1XrS5
	gTr6MW62b49NQYHsBivHUUYTGykFr/jQEiJK3L7lJZ8KSot3
X-Google-Smtp-Source: AGHT+IEK2ylsj8A3zv5KP41r85GTG06Mj0FN2K9Pnsar54qT+bII0+ur9gb54xnBI0cqR8Dv4CuOpw==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr9835262f8f.29.1744018497031;
        Mon, 07 Apr 2025 02:34:57 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eda4662a0sm85615765e9.36.2025.04.07.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:34:56 -0700 (PDT)
Message-ID: <305582d4a9c0fc8f34f997a697081409dd2df273.camel@linaro.org>
Subject: Re: [PATCH v3 27/32] rtc: s5m: add support for S2MPG10 RTC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 10:34:51 +0100
In-Reply-To: <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-27-b542b3505e68@linaro.org>
	 <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-04-06 at 20:33 +0200, Krzysztof Kozlowski wrote:
> You just sorted the MFD headers in other patch, but here you break the
> sorting.
>=20
> For me patches resorting the addresses (as a separate patch) is churn,
> but sure. If you do this however, it means you really believe that it is
> worth to sort them, so you must keep that standard for all your further
> patches in that series.

Definitely. Not sure how that happened :-(

>=20
> Rest is fine, so with this fixed:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof!

Cheers,
Andre'

