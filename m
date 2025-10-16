Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F872303A3D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603024; cv=none; b=p8whA5ZcWNrkRG2Jx1J6u0U7tICL1x6NEe4G4GnFKgn0R28+ARGm/Sh3i7TR0HHJ+cdrpomb/a3Kta9CNPJYKDt6rckmhZckJU4ZlCH8okWu9YpxHZnFA0jdVU49f1V3Gac9y8Z8CAqGZfJQzAQqiTMLh8SgJNi++chWf24PDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603024; c=relaxed/simple;
	bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=csXPhC3vP8d3JoSuOCzSQrDx9nHyWeb7PTEa0PgV6+7W6GT4SEhVsI9F1exvzxWMNVk4Xb1zClPbTBQtKh59Ew7B2Hiyv8jUBSEegdRaP4OBT2Ub0wm7wvaTZBdBWdhOUvxBqWDgHK1TTKQeICLVZa4Y7yG9UE5dWulunU8mMZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pUqcMiOp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pUqcMiOp"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so367711a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2025 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760603021; x=1761207821; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
        b=pUqcMiOpen1dP2tO/C1PaT5vDhHChyax9i750TmMzYSo6zLf5D3o4RvAdLhGXwcXwf
         vnp4AiFfpumaIyXxfEp2SNr0fD7MWKma8BU3EenDAz2h3FaYLIWBBprjiOGFJfZt3np9
         QEA5gUIvsrpdYyVfZX6fAzHtSeKhQXFD1gZWVZ9OgsGFNYu/qU2RP1QmzpeMKTdbVw2W
         nuWvtiPl4efZKHmHvF6vIFP1q/dogIMugjtqubsh6+xG8oU2rlGj8ZuXvVdV9yMtZ+Fz
         m3iyfs+Pl3Ynfo6BDizDs1RriVQiJ4ZzU6TGZatnZxRkfXgegBpZTJvTinxXtgrWAhbZ
         Mnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603021; x=1761207821;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbBU1GRxOkLD2pr5cIJcjpIKGOaE5sykVLD2xdcq+os=;
        b=alnVRYOVd5mcdDWY4ZxptS/tOVIhAkcrCYsagesHIYz8woppcBFA8tjn/GoG+S7WMv
         1qAzUyAf85nrVdfLtc7mpKt7Xn1ar6EPBrF7pxZho/GjIbrnKu0NlL1Dc/D7orQgZG6V
         lA5YN9vk0pVwS46RmzLC1orz8XoIV+AaTlo5DUT8YZImsZXUqYtuw0wCXQVNwHU9dgaA
         uSIS78GC3OFU3k+KpbPRla3U4VgTbqbxK/pL1FKaO2OOo3lisS8PGWeGcp0IkylaunDU
         j7SZ2XiyqnmWCOhEfzTnlk8cZw3fH5hQL/fKfjzsaUxuPqWEC0TNQzaSEzUEoGq1/hli
         i+7g==
X-Forwarded-Encrypted: i=1; AJvYcCWsPX+sF14Lcnf/MV68X6mBpZT9NfhNKaIW9H7Uai+IhsTRf3TBU5lUcoIK1UcqFHrPW9yJ91UuSwJkMVoP3RURxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMghiz8wb/4hdsbpkQCZre7Y/sMA3Ew5rLsmdO9vYQEZVy05Ke
	2YjojSGT+d7uCtp+jG/vApNWdUPeQglZlLcOs0At26GYJRZ6v1OXF6lp8pA+7+LK1hM=
X-Gm-Gg: ASbGncu62wS/Zu59MbAx4WlWYh2wl6mqa0VAmudWj6EJ6Kdbpeszq7McmEfRfb3KWsK
	YRNbkNwftpy7czwn8yXHh3vGnciFVVgxR4ox20l+BtiS3gU0QWMztA/kUkRWoYdpWEG83GE2K8W
	eM3lTL3E+FlnuMk1b6B7Pcvmz5NZXHu22ysxPN/CzO+Nd29o+37Ach60umQKtM0wPkvuD5sq/Ri
	AUXqsh8sjmLxkhGaPLu4EpF09Tpb90jJZePMIPoOfToxUQj6L3TK/9gd+wGmBH63tS48Y/heKpN
	k9P/hGrwr1/P3uqnVPqM3ez3OpRBNIRv7AdchVXvdRWxoRpKz8aMmsMY+VdWbwkCmw4uE3/Kf6i
	vfdCyM6UShlP7rypaSDkjcz/ybjX8abwtbHixg5p9NwR2jrvQ2qJj5jAyKYjkBi3Pwo3NCeNSYc
	I2SwFLjr8=
X-Google-Smtp-Source: AGHT+IHxUnUcoHUcFtyP0SeT8nrAVOhELQzl+mJmkJlg9L09uwKru3NwHd6GyQw68Ab0pvVWTAq0+w==
X-Received: by 2002:a05:6402:26d2:b0:63b:f909:df50 with SMTP id 4fb4d7f45d1cf-63bf909e210mr4148941a12.14.1760603020784;
        Thu, 16 Oct 2025 01:23:40 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b7144esm15099610a12.23.2025.10.16.01.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:23:40 -0700 (PDT)
Message-ID: <17643995510406a50157a808ee4191488f24f97f.camel@linaro.org>
Subject: Re: [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg
 property
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 09:23:39 +0100
In-Reply-To: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> Both the start address and size are incorrect for the apm_sysreg DT
> node. Update to match the TRM (rather than how it was defined downstream)=
.
>=20
> Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs10=
1 SoC support")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
