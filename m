Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506BF5915B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706607086; cv=none; b=Q+/GN0BCy6uIGYHWP8VQh2GzK/DFoJPlRmwEtZQBAXckxkhdrlaAHG/k+Me4ov0nHumSD6q7TiKlr1LPtK2wFdVvLmXZwLVvzUs3jptRRSPS/y3lIvqWV8LM+vsnTEIp9iHVCrCWGzE+qdMihSWfvcM2TPqaAN5dxq1Mk57Z/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706607086; c=relaxed/simple;
	bh=XYx0s0X4N57mkCoKTn7uq1S0HzyLcLKx4l9yG2NJoTw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PFsWR2snIg6jgwzROQQ/KTtGhjxaGUUlaVFlIzj+GC4FCqy1t0/BsFqfUfjrbAwRr3V4Sp/DKEHfz0/8nDgHKq873lxO1et06R+iNrEDKK94sql+KuidtxyaFCqYuN2LILpY7KQ2ex+FZNZId9+8XlamcaTfxkXwnQch1T1Fri0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSNoKLvy; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSNoKLvy"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5100cb238bcso6674284e87.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706607083; x=1707211883; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XYx0s0X4N57mkCoKTn7uq1S0HzyLcLKx4l9yG2NJoTw=;
        b=FSNoKLvye6bBhZZNYpBh/KbwH7uMI5bx7ZbW0Mn/GclqE5dUexRET+cs0kHa5efLvS
         1C0EQIpnfAIAWAfyvLTy3k3u791A8woTVIGGZaRklDYlEmAWZ9xroApUcvdfGGDNG/Kx
         uqqS2h9w0dAoc1IDVwxw+0DOSJxxi1xebKNN3lhVEiv46jqi4WTwKDCorfJAiTX3xgMT
         Xpsq7NcY4/2NVaQ66KU0dwd/7ldVubWr0GJYzJXOkgfpspbq4YxRCNQeDftrDWS5Lovi
         MNalSZMtqkO28hrFqr9uV0E6RX2GP5AXT3HYK+r5ApxYbSN4v+0u54g6QD4xefIIzMB8
         3NDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607083; x=1707211883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYx0s0X4N57mkCoKTn7uq1S0HzyLcLKx4l9yG2NJoTw=;
        b=GNPDnZOf+qKFYFRdS++YQR7hrHRL80MgfmOVCatoDU0ei8dN3i+IGFGgYH4M1Px+hA
         mctzw7eHq9LJv75THlnY/Eo7o6/6/rbO/61PkJiwMNnZ54IWv/Xwqw2ReUwBeRuEYEhL
         RVq6df2x5Ps78ioYkcV9fWv/eLAmFjhs+bDFuxBG4lgRkjXVsOHuwV8xhuJ1k/ZEpQUl
         FthccLeWkSMVIVVZyCpZDVItw6b5toELQr3USx1JMAJbQjYeKIFEDprITSZS3p3gaqlX
         EliYnbnTjLX0TZGHMn+W1O2sb5fJIwRzxIkc9JJHu/jFjKDMfEthnZmb2vcWllDh0MYz
         PnPA==
X-Gm-Message-State: AOJu0Yyvd3SZn8qmT6VY8xKzwycYGu9McTE02qpDLNS/VQ6iE+ZhV0z1
	XE7QAZr9hDrvQm4RAdEBHnI0hmXFitvWx37q/iBYIZWCjaasVN9w/mMkKQ3NAtE=
X-Google-Smtp-Source: AGHT+IH73ECOedOmbLboh50bSkCcm9bWbbIIdQpZY7C2yF6U75+RErqJaRRYI5LoY3XIRMWTRBDv2A==
X-Received: by 2002:ac2:4208:0:b0:510:293e:83b with SMTP id y8-20020ac24208000000b00510293e083bmr4843330lfh.18.1706607083413;
        Tue, 30 Jan 2024 01:31:23 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c1d1600b0040ef95e1c78sm4452775wms.3.2024.01.30.01.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:31:23 -0800 (PST)
Message-ID: <bbaab3addf958bc1f484a20ee0bdb65af05cf5da.camel@linaro.org>
Subject: Re: [PATCH 5/5] clk: samsung: gs101: don't mark non-essential
 clocks as critical
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
Date: Tue, 30 Jan 2024 09:31:22 +0000
In-Reply-To: <CAPLW+4kSka+twSoZmQeMsh3RWermrGG-wyENrr14AmX3zZ2eqA@mail.gmail.com>
References: <20240127003607.501086-1-andre.draszik@linaro.org>
	 <20240127003607.501086-6-andre.draszik@linaro.org>
	 <CAPLW+4mL1gb_R8PhKaMhwOUTa0GDqat_9W=348ScYj+hBarQJg@mail.gmail.com>
	 <d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org>
	 <CAPLW+4kSka+twSoZmQeMsh3RWermrGG-wyENrr14AmX3zZ2eqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-01-29 at 13:16 -0600, Sam Protsenko wrote:
> That sounds reasonable. But I wonder if that bit (about making this
> clock CLK_IS_CRITICAL to make earlycon functional) can be documented
> somewhere. Perhaps in the serial driver (earlycon function), or
> somewhere in device tree bindings? Because otherwise it might remain
> an arcane knowledge and people won't be able to use earlycon later.
> Anyways, for this patch:
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>=20
> and if you think it makes sense to document the bit above, please do.

Will do on top of
https://lore.kernel.org/all/20240119104526.1221243-6-tudor.ambarus@linaro.o=
rg/
once that is in.

Cheers,
Andre'

