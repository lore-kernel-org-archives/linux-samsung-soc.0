Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9835657B3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536905; cv=none; b=M/jMnKberdByQgXL3WdNWrOL2rqcjN8y0INPM0MM9EkycA9CwEoG9Xd0squ4vln6VAc7CQ7ZD8IFOoPCWKmZ4X2m8/vskGcezULMEvPWcIfcfinKdpA/EcPxwQtiMAQi1o8i0RfEMX8VfLhQWdxgGX+VQswldYBN8TWqcZP3XT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536905; c=relaxed/simple;
	bh=X0W6Vdc4XGL8Mpvl/v2+8V8iaZ/DRH0HP9McF9MpY1o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X/pSu45rA5RrgCBdJ1lZAzeYjfr/jfr9vHvZFcZ7UcAj8mXGxleYo2Ulw8erbY+r8ARx18+0TH6uRXQVCWfcIzbe0dL2o9C65fO7XT7styWRP1eCaHm7fvHnpTiXmm3Fk+pUbGXcIv2Osd0jBaiFk1vuVKrMMDEvxuYBn6VuVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okPEExIF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okPEExIF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337d05b8942so2593732f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 06:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706536902; x=1707141702; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X0W6Vdc4XGL8Mpvl/v2+8V8iaZ/DRH0HP9McF9MpY1o=;
        b=okPEExIFeuauTjBZnzhCColCwXBk9wxhyB3E86hB6XPtF1WDANRFPr9a9uno+YfUvw
         WJCA5WHn0GHVzI2sir9LSzIKBUyuv8EQgsggFj1TPB46uXFqSNIqE1ZLGQ685I3ywWF+
         zXKRiK0C13XZ8eh+nEsjlfFKvi0pI5Bx9rt4N0YxDLivRWCdY3N5BI6z2trw4DdOM5xy
         rur05mfYS9r7bCpNFkYiBfDabUH7hcllMfCwsCn1QMTUrZKvMmkxuVgHgUB0FTS2De6z
         K1p3m27E4jGNDJwJzmy13YCQ/cA7Caz/JW4s1uKaM4jnnns1SyxgGBKPPJaW1eLhee2R
         q9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706536902; x=1707141702;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0W6Vdc4XGL8Mpvl/v2+8V8iaZ/DRH0HP9McF9MpY1o=;
        b=fCTaWcqvQyk/O9BsVRU/6VTno1PKu0/sRHF2djS+cGSG5W0XQFnz0PKE+Wd49cXpIQ
         XLa8JlnjWYGIlc5uQUxg8YD3ijMAwBf9v0oOqNP9lP7v0JyUftEH98Ok5VCCgYFn0Mvn
         nrCec0UaH4MnXFGHCxcOFRwYaE8n6F0xp/UerRJVUWA1CBwMBLdl/Mjd/xgDaRo7Mzjj
         6kws1ZBpL1/CNFyr+jkSLi0BRYtWPTEZRzmMq+uipOMRmNNR+YH2B2mNKdT+/STBleZ+
         WtidI7PIOyRDZf82FAZEmegTAtEJcGzRppaKrG2o3zzN2KzUXIVoNfoJoOE5EZFBZw/Q
         XwvQ==
X-Gm-Message-State: AOJu0Yzf3XEPV7wWAVYcz1N0dILfELcREueFjSdTBWQsnKCp+Wjhs8WI
	RcUjygm/LBKe+i9ImZiNSAXtYBom1O21Z2gqQRI7kCQ8X5xn5fJR+ObleKAQ02A=
X-Google-Smtp-Source: AGHT+IHwd8dICvXLoBYzRn3PDAeKNYTy4XOOjfsXrUdMQ4SFRmeoN09BYrGBQxGREV1nMzxqYquADQ==
X-Received: by 2002:adf:fe83:0:b0:33a:eb24:8383 with SMTP id l3-20020adffe83000000b0033aeb248383mr2513122wrr.13.1706536902158;
        Mon, 29 Jan 2024 06:01:42 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id r6-20020adfca86000000b0033aed7423e8sm2916734wrh.11.2024.01.29.06.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 06:01:41 -0800 (PST)
Message-ID: <26ba94b4febb605662913455618896ce4281645c.camel@linaro.org>
Subject: Re: [PATCH 3/5] arm64: dts: exynos: gs101: use correct clocks for
 usi8
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 tudor.ambarus@linaro.org,  willmcvicker@google.com,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com,  tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com,  sboyd@kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org
Date: Mon, 29 Jan 2024 14:01:40 +0000
In-Reply-To: <CAPLW+4m0137jfMROYE_Lv915U+y0CK7M4dieHULOG90Z8XctQQ@mail.gmail.com>
References: <20240127003607.501086-1-andre.draszik@linaro.org>
	 <20240127003607.501086-4-andre.draszik@linaro.org>
	 <CAPLW+4m0137jfMROYE_Lv915U+y0CK7M4dieHULOG90Z8XctQQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sam,

On Fri, 2024-01-26 at 21:22 -0600, Sam Protsenko wrote:
> From [1] it looks like DIV_CLK_PERIC0_USI8_USI is a common parrent for
> these two leaf gate clocks:
> =C2=A0 1. GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPCLKPORT_CLK
> =C2=A0 2. GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7
>=20
> So IIUC, you replace clock #1 with clock #2 in this patch? If so, I
> think that's a right move, because in my experience RSTNSYNC clocks

That is correct.

Cheers,
Andre'

