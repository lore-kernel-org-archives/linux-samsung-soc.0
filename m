Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F591FA165
	for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275334; cv=none; b=R8zJ0pIJUTwgfUmldoEXimKeRfJq69+17I2AzQpI9vMI+zVR54xL9biQDZuye2kFACjUiINGXaXlv8R7kDIMf8UF0PTAgrjO2qu76U1DgIj6O/NdLeUnjEUZcDqw7TqsutsUAORFDnEsOpMZ7JmYzlctUYjYSsVvgem2bIkRXE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275334; c=relaxed/simple;
	bh=7d1Icmn2h5Xxh5nmwHTuvBMLWdYe0yLTSL1YV7Y8f1c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QDYmFCVX4qD/ODV9Oaugj1uWiw5nlGG4Q6niJTmr8/PlFJDHo+8O1aO6ZaWgp8IytG5HdblUg7bxgCFPl6HAFP0gdLhhVizpxj+xc5vIZYgxVrngfDG4MPX97j8ok1boVJlqO8D4Vxv7TouHBVSXP8MZs0fdC/jYoUHUd/Ec1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mpFkwPJ7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mpFkwPJ7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso17515735e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Feb 2025 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739275331; x=1739880131; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7d1Icmn2h5Xxh5nmwHTuvBMLWdYe0yLTSL1YV7Y8f1c=;
        b=mpFkwPJ7y20a6lPApLn6SzITArBSsaH5pBArRBOEefk8y0P5Wv9W7mmGjJ06nyXYA8
         J1Y1plBk1jexaaMiexzfKrUsVEUbKCRPMPtlWS3wsn6hoieZQ57VR5TccuEzL9AT/kH0
         BGjG4CfnzPyS/FV9l0ZZ4e8RBvHYqS1UwnXu+IC8ufmR2LIe614KLHNeJqYjTK8PGs79
         Rvx29Rg/Tmm3SA6D8QAt1Yiq5O04BpiSz57DPxghJv396rdzdq+V1l2hoxJT2H8pvA2n
         /ntCbxtHyBw5MuU6OZDgrBLQubYUUMLPQZ24gs+v796uKYvduWwDtjZSB98lR6vfBHeX
         gT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275331; x=1739880131;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7d1Icmn2h5Xxh5nmwHTuvBMLWdYe0yLTSL1YV7Y8f1c=;
        b=Aj09Fez/JQ4Jmd+ieQ4arazfL3uDPS3HwryxZ4Op0dJDn6URenXnPhrE+Z8n9oAHDI
         IXOWJnC8plwmUhfalCdihU5OrWQfqNrbWtti5vt9fD/6NqOmF6oxiGb3rkGqFao6ybK6
         +4StVyB1Q8ip6tTXjdzQK/z1+Vz1tbM5mEJaTpe3ByKG/ebE6vlRHhSHvW+Ij0D29BXG
         f7wVv/b2aTyAljNHOP672DISuEor4uax8wM64cEHMPy3d6EfGw2fEdQH0zg8o9+ewDMp
         PJ7vmL4O7s7jaKgp3VTjFhOWBvC3PHJrYC7ThO6Yk6IvyyN0sz+tJ7NB1nZhEUbeMl0P
         v6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIG7KOq8kb5+vekE8CiMDmTvw3uFQNR01m81fkhmvpQRcxZG6rv7Enyk2z99+qZ2DFfXiEfKq9sp/gKoEygb8P7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOescScipc7XhDn+8MRFbfz1pYaXjtEKpiJyuBjw43bwpi8+0
	6mydXgu67dWJkFax9SWEvqNJ+CMf+dyyRAOapiMthoNpI5TL5JAj8Ml1BWszbtA=
X-Gm-Gg: ASbGncvIz2niQ7DaPBM8yC6c5iUVvpBKhzqlXpQuDPDl8v8dK2CK5CD3uvHcQ2Ms0u4
	OOp9JAtqPSvCEmSGPe5/2DVhfmLTUpquK3xjtskG699YHYOYvbVvY7VeSJ/X+8sKnOpMa/Y/MtC
	qTAe7Ls+lJLOy2z5968bfeGQ+vEiUAKafj6cgSwfnG5ijWqgExabczrjjj1qgTkecsKD0dR+Ens
	JbUBKo/iOP31E7IeSGIUHJupKSZcIPzw/uxqZKrReRoOvqo1yQmW5GqM+B9mlJWq4do53HTEfeA
	Tc7ZtsooTcT16eTjjy0=
X-Google-Smtp-Source: AGHT+IEpNALrmIL66un9ZFpaSjUj/Foh/XSYreR+C2qRnL/fyZnSvShvXFiOPXFezhCRGB+4CDDdQA==
X-Received: by 2002:a7b:c7d8:0:b0:437:c453:ff19 with SMTP id 5b1f17b1804b1-4394cf0825fmr25778995e9.14.1739275330727;
        Tue, 11 Feb 2025 04:02:10 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcf35b15bsm11149599f8f.64.2025.02.11.04.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:02:10 -0800 (PST)
Message-ID: <a740a0211c82aaaa55940e2f07e1d1b53c23ddd8.camel@linaro.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Diederik de Haas
 <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Jassi
 Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org,
  daniel.lezcano@linaro.org, vincent.guittot@linaro.org,
 ulf.hansson@linaro.org,  arnd@arndb.de, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Feb 2025 12:02:08 +0000
In-Reply-To: <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
	 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
	 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
	 <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tudor,

On Tue, 2025-02-11 at 11:57 +0000, Tudor Ambarus wrote:
> And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
> everywhere as "GPL" indicates [GNU Public License v2 or later].

No, please don't, see Documentation/process/license-rules.rst.

Cheers,
Andre'

