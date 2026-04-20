Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C1C355F32
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Apr 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776697488; cv=none; b=gosoXGzc1+aiQr9ESguAs4j3Wfa2t70Jd1HDESV8fnOoiA/r+6Z76FQXGDBNsiWQ7Au4MSGtBiU4XkbPQ4UvZteEdXSFT24/RIhemQvxbwL+TWcbnIJKL4ZFZ7HD3FiCF7xBmEEtSMDWDtzxHzs9Vw4reE7kxxrzC8qUQ84kHIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776697488; c=relaxed/simple;
	bh=CGGUqvrC4Mx7H1pijC+v58+uUoJkY+676HFn916kDFg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i78mDRrkHHWMPuGhoN/UfKTKQD+tNbmbKq6pC104R3XbUozhJeSTq1sa1wxH0L//vmp6qESz3LyCwBDpMZzpA62Qz8wEvGMZ7teG0fkLYKuBYa4GI9tpBnovdw+Vkqh39MZVZH5sQ8iNQswUeCClnMmmA8tec2KlRi6GHjyiJ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JisXhC4l; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JisXhC4l"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8d7f22d405so556817566b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Apr 2026 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776697485; x=1777302285; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjF89OvCLnsrV+6lZbmIDeKZlvIagJqlQKDM+Fhbm8w=;
        b=JisXhC4lZ6ZSjAH+iEmxdlUhboxpUgSJZYo3bxEaOc4gUIa6i2hw36OMA5GDstpEUa
         3R9jrqCCV10kHjwLXMssP4um2jPj5XLzDBV8JuU3DXafgu9YRIa5ANfNMzQ5KS0xMUd5
         xhASGd8P4QcnI3ukBKSMc5oqrow6Fifnod9G3KvHlOAdsT0+vK4HADOhZN/8Jklc2kLZ
         HdrVpk5+Jc9s9upNkweMrcRA6Ot16UQhRlwfl9gkRk+5wUxHQwz1ThQdWsYX4wLw5ldJ
         xJYq4tTw4w8ac9ppJ+Na/EKcs9eH+c1s2Mf6QMcrF7AgvLIhJl1kBxukvMIOkZRTzJtZ
         Xvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776697485; x=1777302285;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjF89OvCLnsrV+6lZbmIDeKZlvIagJqlQKDM+Fhbm8w=;
        b=EvqHGmdQ5DcsOW8EMZAQ2HbP5QJjCPJXH/432evO6k4SKUJr/rM/wQjJqf5tKUeBGn
         1PjbCUZsnM3y4RvlWCRxNR1sL5CZCPGjWEYBFBz74gtvl16Kr5oBRFb1cbr+NbM/XX1A
         /9qajlpQdNilUxy/RENJlHGvHJceBQl5recS4CKv2gWLFw3JghwEYU80YsYZzMYuM5cT
         PgLVsZHf4qQL76cRhzIfCEinIughWcZN6wdBV1HSU4TaL9wHP+9jUxdib2Pbsj+UVJ+x
         mUuGtoBCxxSAFh8Gbq0NuYSUf7OLgxSjXImsjNZi6gwvwF5WN7ZHox3QNJtWEWwNnNFF
         8IxA==
X-Gm-Message-State: AOJu0YzOkRo+fQNYr8zbBbWKKmjhIGqInhQOIdQht1kEp/jWL8ra0NWi
	ftx4FL9FMmX1SPLzVzNBiTU/WCZkXfuV3vmAf5cMuJir3ndVS6GHXOUCQzrUSEvDJNDOscsoUsK
	TRlRe
X-Gm-Gg: AeBDieu9ZoW0Niw/iZzKj2clsLqG/GBo+yykivip/6cwkvEwC871gGlGCPDRitc+mZN
	Xwd0A/J0KGD4bKyBeGtXOGAoz3gode9bf1hGZJFp42+01qddpscTP6G7DDrKp/1z7it4MCbZS2A
	W1/GEY+ydY49E3QE+QuqZzPfbarzyH2cnvfqmFqGEGTFXFWDz6ei8flCKZMdRDN7mDj4U1sXdWL
	JJ+wu7Y0C0wlGaNcnkFVnTwThb5Emo77sBY976VNmOw9TZsOZcAkLBV0q8ymzttf0mGw/SuwL+C
	vk1ZqgEFxUIITPKgZxs5xbO3aM/wN/X+01iOVyu0+GbqjlLreQaiRA0wGmVQX3flLpCTen4JCX7
	C4VjZL/LZlTb8Wi8R2PUsbhvx5cgd50sxUPXLtaLJ52kAxi+wj+1UsdPkwi3cvK25M39Vn+JWjI
	ITAlRGoOD+Noin0ej9auY5USPhZzgvJVXafmKShuAaJjurzwpURiMwK6lGv402kivCPpMGqv+dg
	3E8lDtbPKRjjJiD+q2S8IjQ
X-Received: by 2002:a17:906:6a13:b0:ba7:9eae:18a9 with SMTP id a640c23a62f3a-ba79eae1ab8mr235029466b.17.1776697484784;
        Mon, 20 Apr 2026 08:04:44 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4550468d6sm358274166b.52.2026.04.20.08.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 08:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 16:04:43 +0100
Message-Id: <DHY2P02B6E6H.J79TDOADC4BS@linaro.org>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos850: Add syscon-poweroff node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>
In-Reply-To: <20260325-exynos850-poweroff-v1-1-34c19c06e74d@linaro.org>

On Wed Mar 25, 2026 at 12:26 AM GMT, Alexey Klimov wrote:
> Without poweroff node Exynos850-based board continue to draw current
> (around ~60 mA with my test setup) after poweroff. Kernel also reports
> different lockup problems and RCU stalls warnings continuosly after
> last kernel messages about hardware being switched off.
> Turns out we missed a write to PMU's PS_HOLD_CONTROL (PMU + 0x30c)
> register that actually switches the SoC off.
>
> Add poweroff node that implements this.
>
> With this change the current draw after power off is in range of few
> milliampers and lockup messages are no more.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 7 +++++++

Any feedback on this?

BR,
Alexey

