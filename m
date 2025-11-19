Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FD43164A0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551011; cv=none; b=EcOh+XJ52+EG0v16iv6OVEeg4b50wtQ6yVzIO9JaoZEYGH2G30e7rcfl7LP87voc+d71Odm4sRKwopaHXeC7f9LJN0+9icbVGm15Trii8Ovt2KmIkmiahAeuG4cEGm9HNiIbYAKJyDnd7RtER3YE6o/PjRnKZm7n2bxdR/oLZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551011; c=relaxed/simple;
	bh=Jfm1+IV0dmKR6UvATXbNPaNXa4YJ4/UDhZCRc24a46A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ckTFYAdnmCrHzxQZeQ8ecF/SreGT9OfwNj4+30Fw8N3Ou8VRYlbSSMKK36N2wx3s2+UV3RofW59Lna13pIIAJba/6vklLpV7SrTA8QairabnfQv6im+I4O8aUyA03ahvPeKdXF1Zeg37AvlBcKWsyEVPenazVyshze0jTce0BgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZA77XtmL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZA77XtmL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477770019e4so68912475e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763551008; x=1764155808; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jfm1+IV0dmKR6UvATXbNPaNXa4YJ4/UDhZCRc24a46A=;
        b=ZA77XtmLwwkJObTivXPBfyDyqMyutSIkl8y3xw6NyX0zWizyH8GREDJ8Xy9KQ1VUAc
         v5aB2YnBhltBiL/ocqMmMZ0V7/PojY60D8WCO95lJBzqcdeq2kjXf232ERL4UhrFV8Fi
         8RNkFjsXsPlWa8u0VNf6DaGo8BS5DQffGZRDhz42ii51Kh9cu9eHLM1bShF5OSkvmdp9
         RMUpOr+vQq8XanN+5hh+h8ZFvd6e64ByWTb8TJakk6t74FH9ptwJYwPcFfmUYGluba6+
         bGDtqYexC3beYqQ+hfBHFRoQkvzcSJOMyV0HzoAma3X1OK5HmN9tQ+Ln4AfDes8E+6xu
         zR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551008; x=1764155808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jfm1+IV0dmKR6UvATXbNPaNXa4YJ4/UDhZCRc24a46A=;
        b=C1Oe/EoY4+eD0VIPI/Z8x88cgxHAe6TjvzGUysRK7/FgtBjvjz21Eu+MHFg8AcVYaP
         v90B2+dQM0r8JlsSFO9kTYmOMYFEZEiULOVD0+0EotaSY6dwXe/gZVla75BF9TdYLscr
         jU5G1Rydw7xMtqMEo1SaxBjXUP9ghXhf1CYs3IUZVCz+p89G8NPcrBm+0owkeB8gji1q
         ojojPa6+MlBE2DfwJGki2Xya171IXx7JxlvehkiPinLAwBz8GdCEDN/GNusHGItQSow5
         n5h49JfGWLNALETcn6ZXEOf8RaUxL8KMZGDAlwDQMLI+7O47IRiqvB+lzolK832x+/Jx
         pIRA==
X-Forwarded-Encrypted: i=1; AJvYcCWEYjkt1EnoQHAi7lZktoGDjCuj3XpACKvEWboT6aP9LMrdSFfpy+P3YXNM8eqOhotOeTJiTQj7vGD1OEBDx38Qqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu/CfxZMnoOnfHaSJvG495MJzS3s1EYWf1cz8ehtEQzaOxUn2U
	HMGoj8R4txIym2VCCEEadVlC/s6DEjMxZFCtgNLnEZE65RK6FLj3f22TeCRY4mL05IE=
X-Gm-Gg: ASbGncsBaTvHG8e5QZ3Zx2kD0T/Yp4GPDVouNxC8BLCKZPUokxUBzlf2rjexolyEa8F
	a3Ja5PmFuOhO6Iy9QSqbeuQ2nfuzT1dzwQuuAgcl+xPu23eBveusRRDkmlbmgs/6Bfg/yFC6eL+
	1sHz/wCItT/VtTQDv14ljgyEB4JboFm+wN2yxhi7BZUJja/8o/AlohYLckfhIXAVlOxryGVreJ6
	Q00/Mi8s5721ZlHfkXOoNNKsZWkP+/ajpFGQzQ3moU51Ims+Cl90xvpUMMyPDdI0T2mK7qL0Y91
	wxw5jVu/xQe2zSFqHSoJOBvX5VMRQL/wWfyrWie2+xTUnzhy9bFMwLrddbGnBw2aX606MQpZ8KN
	/3y9g87nZqP+MMjSRqPmCKAfyE3xfZHA5ajSD/PgaG9WJPyFAhFSw3xMFIJrZ8/pALYaC8NdouR
	oK8Hx6ygmb+HI8LdgagQ==
X-Google-Smtp-Source: AGHT+IHxUjgdNCXTiwpOfnXS2oC4TBNMEII+w8M+hOGIH0Djg1ZSLLta8lC5CXkAR753ngvyVq70XA==
X-Received: by 2002:a05:600c:3542:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4778fe7d0ecmr189079235e9.26.1763551007791;
        Wed, 19 Nov 2025 03:16:47 -0800 (PST)
Received: from [10.1.1.13] ([212.129.77.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1013edcsm42553585e9.4.2025.11.19.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:16:47 -0800 (PST)
Message-ID: <643a5776c383a501b129cd0f867395c0ccf80566.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Kishon Vijay Abraham
 I	 <kishon@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>
Date: Wed, 19 Nov 2025 11:16:46 +0000
In-Reply-To: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
References: 
	<20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-10-06 at 09:07 +0100, Andr=C3=A9 Draszik wrote:
> Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
> with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
> inverse of clk_bulk_prepare_enable() while it should have of course
> used clk_bulk_disable_unprepare(). This means incorrect reference
> counts to the CMU driver remain.
>=20
> Update the code accordingly.
>=20
> Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend wit=
h UDC bound (E850+)")
> CC: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping.
