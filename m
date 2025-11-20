Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA22DF701
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633067; cv=none; b=SwJRY1YYXI3HXBrnYw3H0jY1ja3txkvGWBW0zSPEWBZJ2pgkCgKwSMxPFhkuo6eq9aTZbTypN8BvzIr22TL/Q2RhVwzVhKW65aenVOKjOEUTL8k9Zn8wAcXU1WY2hIL4gtbIQ9+EwcnT2I2kCsFwuuPGKBvDFor2Kk6Ib7z5uKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633067; c=relaxed/simple;
	bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e2PliTr/lYFlLZw7UC0qiD61FubD7d2yHCudNe1YLOtymoaSauwoL1aB4LagDLBH871rBbu/m3cQfcFRZNA+HPgoKiw3FM4PXsKNZiAidXBNhmq8TKCPzYjNvTvZvm8cFusj+pLCtVSEQuzwyNUAXOoxwU1opbYuk4SFj10n7+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u0X9zxRS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0X9zxRS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47796a837c7so4313415e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 02:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763633063; x=1764237863; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
        b=u0X9zxRSdKh1kRo3A3pcE7mPQJMEv+zH9byMeGTExC2w1/ACpAvabi+UVISJBp9XST
         zADnpTjb30gDt/f/C5Rzi7PZNbndEFBN9QUiC4r2bZjfvoxlbRB7IESs6nDQ6KCGMUy+
         z6lQy3hgIaqzavOUqC0H8EplhqHCj9NAcO8NBkB3+NYFBfow8Ii6sRyHKCMHd1/8aAMo
         S3KwxgzTi8WbVWCEZw96zgFVgO3m373pWEAWN4gvtN5amFpreX5TOlNp8g93m0X4Lc64
         k11KhFXmFgjcVbONGo9lkClWRuz27bQ0lY9FII4VkKv5EVLnUp/I35KjCJmsIh24nx40
         zZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763633063; x=1764237863;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrOk2bm03bUPngyIHoBKhcf9gFSNhp+zCbFH+3YDqpg=;
        b=tQ54WpjqFzTl1sNtjSRReaGsYZCSc6awFc4p54TQ7C+CtXUNA8AKchkW2JiHwvvdyw
         5i7XfI4qto1AkgMX+RKHJ9EftqA3UgtxgGMEKbeCk27hcdBQ7ySxFoBJ2Jq1VkR6KTZk
         OOMDqG/KNa1svEdJp/QB0werS06d6L9ED53z4FxOjcJq0EhhWPBLzw7N8MwlEN0UFt6M
         3OzN/nzCJtWwg1ZnzIslrOjhRcFHeiGHcQklxdu2lRVmFfL+9C5iX6IXLfDB5NmTSWTO
         +ljGFFzGHe9sWuKj7qMYpuuPa0b9VXKTSDIm8emF53ifZX+U0HQXTl9PMAWEWSe9YNtT
         /crQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/wPoTaijYr/GuTImihAxqdfxWIvwu7tJcnqQ6JWcVZkTjf7NT/+TSIA5wHAfGETxaEDuAfcMHN7ehJKdtuTR+kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6Eb1RIVjjFqyTVfZV7P8z1O+CqXx4tNk+qk953qJe6T7jdjD
	GacdrvtoIQ7swZJ8bIoyL3WCB07IEbZbql1U0suz1afKNGVubvfMSCzkGJYN7rwYMvY=
X-Gm-Gg: ASbGncu1Di4rTL7dAT0ArN4nhg77xqjEolX11e4ibc1HyI/pKufaCFQ4S7gRUKvJZoY
	QxqGNOubAVFX6g0MVC3XGG7QKZFcNeP7rgKVuD50lixDn498d1geV0n/riA/f2N2t4mqo91UYdB
	+DQKw2BnwQok2Mv1JqSiHQYcGslYeZhwDFl0OPOOOr9Ir2Cxtunvw0JaCUcaOh/qNoxiQouakZW
	5aloudIxy2KT8QGOaHkNLZfBo4icp5epzMpm+AYh0Ydfhu1mrKqNU6Pwa/DzP/ATtR9U460axLl
	qWeLogt4hXQp2jnTeAKdpYRyvHbOE3VUEN7U7blvMSqzD9EXvfEQgpEn0aQIM6hGC67eOwny1Q2
	vg9K8W48UTpd/DyfXWBzRKqNE77fXtbvd3RJeFf25Z19TdcRcP6puMB6gVYcK+EcB8t5PNSzVPE
	D302Ck3IlH1cYInQg3
X-Google-Smtp-Source: AGHT+IHrm5EaKYpV2W1s8pc4aTiYKHHkbeiQA9rV3WdkFR1VnTT0ZyX40PvNC5BuFfhZRUT8Fz32TQ==
X-Received: by 2002:a05:600c:458e:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-477bac0cfb5mr16019325e9.16.1763633062818;
        Thu, 20 Nov 2025 02:04:22 -0800 (PST)
Received: from salami.lan ([212.129.72.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9739964sm63387065e9.1.2025.11.20.02.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 02:04:22 -0800 (PST)
Message-ID: <b9f4103d8de37574a116164c50ac7e1bd09be80d.camel@linaro.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
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
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
Date: Thu, 20 Nov 2025 10:04:20 +0000
In-Reply-To: <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
	 <20251114-automatic-clocks-v5-1-efb9202ffcd7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-11-14 at 14:16 +0000, Peter Griffin wrote:
> Each CMU (with the exception of cmu_top) has a corresponding sysreg bank
> that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
> The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
> bus components and MEMCLK gates the sram clock.
>=20
> Now the clock driver supports automatic clock mode, to fully enable dynam=
ic
> root clock gating it is required to configure these registers. Update the
> bindings documentation so that all CMUs (with the exception of
> gs101-cmu-top) have samsung,sysreg as a required property.
>=20
> Note this is NOT an ABI break, as if the property isn't specified the
> clock driver will fallback to the current behaviour of not initializing
> the registers. The system still boots, but bus components won't benefit
> from dynamic root clock gating and dynamic power will be higher (which ha=
s
> been the case until now anyway).
>=20
> Additionally update the DT example to included the correct CMU size as
> registers in that region are used for automatic clock mode.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v5:
> - Invert the test for google,gs101-cmu-top (Andre)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
