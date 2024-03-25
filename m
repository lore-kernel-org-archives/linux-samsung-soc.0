Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F0154C15
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711364264; cv=none; b=T0RZ2bMD+Ju79hNopMQ61mtmOz2ZoS9vT2eSp2LL9zwAHfIlbAWxfBdsEJb9feeJMq0hHG2NAYVSj20i71ZYvObzDCG0Knjj4HfZ72N7FIpCcpuhomSHXQ78o4VZ1AMt/ncz1bbiOrf7ft5SQyJbtSgw2zEaBgkjVWJ9pAqRXaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711364264; c=relaxed/simple;
	bh=aUNv3OeOJulW7HjCmCxEUuggib7O+wj7HO00r4boY1Y=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q+TxnEcC8v6fZ4tUGwCLYYr0wXPEKzYdHOMZPSXFgrtPZZspKEW4vbLnzqmkALyx8Fa0ub86JgZgHeu0KFj6gn7B6xOvkWJgahWBLk6qfytD3fjfgh40Z5PtNxBFrllzPbR/gYWrMCpS3t6+jj1tw97zmIrSZ6jc6DyWynf+Xpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lu6/fIHa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lu6/fIHa"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso522701366b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711364261; x=1711969061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rBY+ZtgTThSfYH8TveS+n2X3mT42fwW+fusHRaeCz0=;
        b=Lu6/fIHamNXviwvHPbUxBN8amDGOOoElLMJXRTOIxidzo57lxF4SdALMWBacNEQbGH
         fXWTf82xjrfP3T9Ux0+XSGo4P1ot+YxMS0cIFuftW0h++QR9m1jYU9sg6s5qH01QKahx
         qomOvuYTbFcnTBxRtcA0FWGgDc028q1Kqz7fqLgBj3hvsUWRSZWaTgT82xivCcGVk4HS
         DolNeMP7se0ZDICemEdYP9hKFtf5nRgBg7Uj1DcGaM7ejZU7aZjfSAH53qqTEpz8wvS5
         6z8/zm0BU56l2p5PEbw62IKwf3yNzL3K5JSZPpnKoOpHP25qiu0UvNE99E1ahjnSjcQD
         yyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711364261; x=1711969061;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rBY+ZtgTThSfYH8TveS+n2X3mT42fwW+fusHRaeCz0=;
        b=FaEhUhtqIfZWhvgDp8hvptF9XvmskdN+jnGO+pBvJtHkJijAbr3m8NZBpWCVtMpmgW
         EPzR/ourDcMatZCg9fa6O+lH+2GdAx1K1iwKw03Ck25cmnJSeBW8aTW3b9GfR+K6CD03
         fY+OzD5j4W57Eh4t1gfbP4p1a9/kPVuunfrq+EbwFO6z18IJALElENtwUvsKkYF8AgjS
         neddCanGklUEIH46KiQ9Dk9qASpulXOy5e2V791YLQon370ZbSlv7gtq6RJc+2kaLDfr
         z6waFF1Lo9t1OyRyBqf9VQ4ldxKwOi2k4mwE2k+ujFpiPtvxV/6QKDhVO7++52CVzvHf
         JciQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1rP30orHjf2MGKDPyCDZYfstgF+xHCp1U6Yzzs31pnq+tPC3qg74BXUc+aY2ypXJe7pipYxkB2+1fYHM8G/mWne6c1KGYB4Xg1auCQ1KgojY=
X-Gm-Message-State: AOJu0YxyO4+Oy3giRVFmz5N/F7ZJEEmF2pSvz8QLZdUxlhJwY0zsJVh9
	2D292j7r1XMqEujyXZE5CcmXfMAW/6SlIBR2Dbi+Z5Pm83opOwRif+CDQMZkhmk=
X-Google-Smtp-Source: AGHT+IFOdFMAv/TvuONST61JGK36DDt/76G+ofjqWazIMNco/I15j6i+NV4Y90Z4Ah54tJDj2etb5g==
X-Received: by 2002:a17:906:474d:b0:a46:69f2:5219 with SMTP id j13-20020a170906474d00b00a4669f25219mr4114184ejs.65.1711364261290;
        Mon, 25 Mar 2024 03:57:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id c19-20020a1709060fd300b00a45ff5a30cesm2940522ejk.183.2024.03.25.03.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:57:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240313191148.21792-1-krzysztof.kozlowski@linaro.org>
References: <20240313191148.21792-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: samsung: s5pv210: align onenand node
 name with bindings
Message-Id: <171136425952.35431.17492812389315210011.b4-ty@linaro.org>
Date: Mon, 25 Mar 2024 11:57:39 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 13 Mar 2024 20:11:47 +0100, Krzysztof Kozlowski wrote:
> Bindings expect NAND controllers to match certain pattern:
> 
>   s5pv210-fascinate4g.dtb: onenand@b0600000: $nodename:0: 'onenand@b0600000' does not match '^nand-controller(@.*)?'
> 
> 

Applied, thanks!

[1/2] ARM: dts: samsung: s5pv210: align onenand node name with bindings
      https://git.kernel.org/krzk/linux/c/e8b41d201f82127b05bee204db92e7f97c65cf8e
[2/2] ARM: dts: samsung: s5pv210: correct onenand size-cells
      https://git.kernel.org/krzk/linux/c/3a64e95e1a64a2d4c63c4df28b61cd3cbb63cd92

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

