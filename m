Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9402313DBBE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922822; cv=none; b=CUycQPjS09TfRTeNn2hqaThYe3pYL6h3kwShptwKC3LCQuE5W9RynGMRGrm1yFoRESnG9vgjOpPqE28TFUW+Fplu8G5mXFqP8rd8i/Eqk70YEB3+JTsmIsX3dZsOXtVWFDa74J0ZmPDScF5NhUHzYfvKIabHjxvf0Cdh28VB9sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922822; c=relaxed/simple;
	bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PhTwX49rwr94piOualtVGSNPTvdy1VOaknWbn/dhPyLo8d97VI4wCyHzmDRO49vDizO1fEVadeiLIo+pLmNdE0bo21Z5fiiy+dlmF1gFj9ua3sSl6/qoyHs5KJI+y7e4H68SXZq0nLb9Zut1/NMdpvIQiiEuUy0u81hzhCHZLPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZV+TU7NO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZV+TU7NO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38242abf421so738602f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 01:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731922819; x=1732527619; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
        b=ZV+TU7NOJI40iDDH+7QIyyvyzwmDPk5q5oVOAM2vME0PtVYf6q8aGB9Ylnw2COb2a/
         xz1yfCBiDQAFlDH9kPdVkuZ2/Wg6Jfgis8a7VHWrB4qHTzVzrD7qpeJORBuO8SJDtx1i
         1pRCUsZhsu25gs7nwvqaiAn2Z3G2J3HijK3cT+5TUZKz5Q1IVna1M8lx0rbYf/suuZF4
         FHFX6a+j5s3mLUItgNapuMxE6r0+OroRTSHWHvOIo2XyeRqf/C9N2nejc3ttesjywWE0
         5FjNU1wp9qHzRNv3OrqMyHqZO1apq4bG3/hg59/DDZSbIdX1pazYGmMGKZdhoFikbk7A
         J7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731922819; x=1732527619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCgDf9HmfpnPuFGw6HgxCSG4fFokGM5DQWc7VQ0OyAY=;
        b=W83dNwJD/stNOsz3qxX//UwWmGrPhcz3DXsIRU7iYIFTv5YppPS5jFcwup6/kE046g
         bIzRPKKc6IMR6zSJM9YVqYZwkuM4xLbn7ivlF64K4SkH8+cKelcazHnFRabBq54b1Naf
         gRGZLDIM6q0FJLDsEbjikoJr+/8qsNhGxz7Eavk4VeY3tBLY/UnQTPQ1taOrHX4APkCB
         4psS+J9FEaMO+W+AtEXcuY1PMrpQCd/OoSCv5LKU6QqPvAe1+g1DFjo35ZligPhx5Nkn
         0xR7K8imbNzyxH86Lf7G4SkWR666hiA3dOzDrENL06nPfTiKMKuldyM1jaaPVnndQO+B
         l5nA==
X-Forwarded-Encrypted: i=1; AJvYcCUxDsmd6bZzCqc2cpsd825e/X7Kmsb7XMzuWl2C2yxp5Llc8QX5con9/57W4q8LwQPiomTWRLsiD9Yf6Hj4x3xStA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw03aUNzsXhLuzIByL4+Jt111XYYiZXeGIyo1IUmAhTNfzRh7iO
	Og0PlAuV+BxULy47YYJBGqr10Bq4RVVhgZV1TUHu3ksWH+diflW592bXEaHvDqI=
X-Google-Smtp-Source: AGHT+IGHa7gc48NoS0q6ZGoDNAksIkFsU8teJxL7tX5AMyhsKg2Sq4IjQbIZKZWs65VOlUxgPKn/cw==
X-Received: by 2002:a05:6000:2c6:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-38225aa8607mr8472740f8f.41.1731922818924;
        Mon, 18 Nov 2024 01:40:18 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382456ba017sm3220899f8f.97.2024.11.18.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 01:40:18 -0800 (PST)
Message-ID: <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Mon, 18 Nov 2024 09:40:17 +0000
In-Reply-To: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
References: 
	<f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2024-11-17 at 13:03 +0100, Christophe JAILLET wrote:
> chained_irq_enter(() should be paired with a corresponding
> chained_irq_exit().
>=20
> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
> is not called.
>=20
> Add a new label and a goto for fix it.
>=20
> Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>=20
> Review with care, irq handling is sometimes tricky...

Well spotted, thanks.

It looks like there is a similar problem in exynos_irq_request_resources()
in same file. It should likely call gpiochip_unlock_as_irq() if clk_enable(=
)
failed.

Care to fix that as well?

That said,

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


Cheers,
Andre'

