Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE91DE3AE
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173582; cv=none; b=M2LUhSuJHZtf6k/z/QtC7ai9O/3XKGaficQZAUNqvr+htIBXsDJScsj2wHK61j2x5tLlorcre0+oIfC/NpVeDLXFE6I4MUC49wxxX8lBUPtESc5vjm9iO0yfG4hA9l1Gi7bfRAUfmC5KNBst4TfVaMzx791R9ZV3pGYMvV3qjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173582; c=relaxed/simple;
	bh=dUKOALEI9aeR5s2n5lA7OidVcoOap78G2cp261c2lTU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LCX0EtcrFGW4N39112L66jG466XIQ5mT2UH9uA01aL/nvLnaQHvk3aJLr9tLIneANlNZ2VaIGJC7wvlEr+ywSRcvSSj7iw2Gv5JUyzR/dr2JAb9h4+ZLgpnK9amBq9zeM5mphVFvoOUsx6A1sXYZ/rq9QPUSGc4+hurltYHDtkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3j5Qurm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3j5Qurm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436281c8a38so103360955e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 06:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173577; x=1736778377; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUKOALEI9aeR5s2n5lA7OidVcoOap78G2cp261c2lTU=;
        b=W3j5Qurm/RjkD7lz9ZaD4IyMrSPBk8DzpX333d8YZ2e/CBHpKriUJqkchtSbIlgjfZ
         Hzvn+Q03vUljBVoEN5kPz0X6yIB3ShXUXwOrnH4AI2pNLpEyi6Kem0eJ0z6SdE8TvYkd
         Xs8lczQ0DxC0seGAia4tGAbx8ptcm0gLGnDKG9SedgKaHPTh3XBhHFRkg4p9CFs2vpwg
         CFvLTksmRUuaHKsXLtjkLMYWmvDLMwsOwQdlns7Uo9OhsqRrqwvPtq0OVZFziRsgmPMJ
         BdMFb4OQMN6DZBFjmDUcaggPx8e8EEpTQASRXQONGglYwep2R9JOLv2dkhuOGTN4Tce1
         K8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173577; x=1736778377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUKOALEI9aeR5s2n5lA7OidVcoOap78G2cp261c2lTU=;
        b=Sd+4CoUHyzlLOegl/KVTh8WR8/qLGVhaBHdziIgvhbNLQXtqltrFc/uZAwxSPa5MUQ
         4EK1q/RCUJDtdzoW8H++rrg5FIpm4US59HOO19CfdaDaJYbAjdSpwOsrZONObjqntiP+
         w0x4fz+EPTMcj0XQbT7xsOXF6zrCtU2oGiKu6t6TCBoCGQLrVXxeQxjx2lVkiicnv1z4
         /uYRofxInNG9+EtN15fztq/weqCpaniJ9PcUdxbBMonR+zxTFJHGBnniCfg21S57jsmQ
         kI4yr98GmugVnOAmGrKYC5+Gcp0GyT1ejXdTQhXRsZGdUXkXLJxuTFFhegjrzy9tVgUf
         qYUA==
X-Forwarded-Encrypted: i=1; AJvYcCUSRgP37hpijVhzxAmnW7G5ovyz0Z3PqS+W+ijvjn0nuSyfXRo9sB7u7vZ2AxurY4ovr788oCqF91tYS3MdbxmjjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZQjP20mE04BLLvLZiiMHs197UcDpECg6rweJV3fGzKdOwA67
	qSpXx0gfjQ8CIe+AeCzr5NPkgDUqjIVGi9THVnpA9AGn1vM0uVbh0zJWFiKKudw=
X-Gm-Gg: ASbGnct58CxCZKsTwCiDcvVeIl2oruWWwJ4RFrUJtK7BEeuL3Paj3/ggTqZ6ObVlnn+
	MOv3k8dMex1LIA6Y5h5uWuW1t+VnvQe/NHw71Y0noHQQ7tnk9Wk6WKENJYG6cB7afHOmtWixZ7p
	1Lsm53vizy+ZqYCjGhu/hHb/ShrE46I9ObUjzcCcID9g/Eg/oFakNVfEcxFmKsYikMnY9UdzCZ7
	PzzNGwvJhVnrln+u6520MLWjYsiEOYSM1Tx+nMbXJcUgvKSxJ+d0kPD4O/edw==
X-Google-Smtp-Source: AGHT+IHOkoMdmjm0GLPL83pp6L949p18auYRHzM3lpKZr0E0SW/vsqJg73EGdk1dd+rSaqR5yz1Q7g==
X-Received: by 2002:a05:600c:1d03:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-43668642e70mr462080235e9.8.1736173577487;
        Mon, 06 Jan 2025 06:26:17 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm576014055e9.7.2025.01.06.06.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:26:17 -0800 (PST)
Message-ID: <75e01bf815e5f7692d4b7aa261054851a943fece.camel@linaro.org>
Subject: Re: [PATCH v4 0/7] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 14:26:15 +0000
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
References: 
	<20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Vinod,

On Fri, 2024-12-06 at 16:31 +0000, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables USB3 Type-C lane orientation detection and
> configuration on platforms that support this (Google gs101), and it
> also allows the DWC3 core to enter runtime suspend even when UDC is
> active.

Friendly ping on this series :-) Do you require anything else?

Cheers,
Andre'

