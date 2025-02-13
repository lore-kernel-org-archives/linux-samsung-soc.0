Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1052D207E05
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739429992; cv=none; b=nPBUFhk7ZQkYVwgrvIuKeYuvxIHaFJGb4kllZ9cxvTzlvrI40E7nY32X8PO9bcdpnNWOHxzcpvYTotvDai9N6T526zN013hhsfKEBi9o0IwfZhPmblBAaPWpzd3Xf6LwcbGLhOv5jV6AN/SL+LJ66wyOym3dFWhXivjAcQTPQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739429992; c=relaxed/simple;
	bh=L+lWu/Bg4y/1hXkYeBGzl87ktHtA28/BQP0FvLsbWBU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GfwG6lpmJSF4p3JmuWlYfvZZPG5+0NOXqrj7ry4tMqsv9Yxv/muYod4MWth0lNN7eXVxgdNw2D7EmJ42nPy6yymyb6v8WAP9ZUNu5lCpIm63vLWszHFa66alMpUa/40jUk9zYQd5Mzm3VrXmkpf0jCg83QeAxoY0krNlyKrqL/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nv2vRVlT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nv2vRVlT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso2659415e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 22:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739429988; x=1740034788; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L+lWu/Bg4y/1hXkYeBGzl87ktHtA28/BQP0FvLsbWBU=;
        b=nv2vRVlT60qu5gy4OzVc1C794oBvXfrksMC4mdRnFyRbGtw1Y/C1iKLUE4sqvb2g65
         pOHovNAlBEvS/lAihl9nqVtnCi2BeyffT7eIRTD/nscnvxtQ7Tl7iSxPT/TIk9jjZrgB
         p3rtuXtER2DjlhjhfZ3jJLFrAv0gKE83eREpfHP9UluMuPhwaVAzOajoMiUelMk/6MjD
         ytmnIH6qAQgdmU6ej2LAzrukmEBWK0m6Q3x31Up3yfLMAPf93rl+9+ZbCSMYmVPe0Pev
         iH8L/X1Uzsv4ox6XQGAgwYU/RXmD7frtOk0J50JFYNKRsCtwoBGAZDWOZzKnWRdV+iDx
         RrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739429988; x=1740034788;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+lWu/Bg4y/1hXkYeBGzl87ktHtA28/BQP0FvLsbWBU=;
        b=EuyUaSvR6jC49B8a1YE4WS1RG8KJWRzR0WZjxpl4KZp0/r0B96qE4YB9wcTARjc7Dp
         iZ4T8G2c05YTURh/H1HIPPztUxLz1cc74ZujQOFEfbu3GzbS3RRz2MoaFQsfnb73BOzL
         8YSbdB8JX5XeVDVvdm/xwbZazpuSnYae/ujtXYOImkdzGcNCz3zBOWoyI6mGz5VsXfUC
         JQuXoWNm0r/Drvrz+41Ewkhw/xL2XYXHOySWWhy7v3drLKJzkYHCxX/yHtx5d707b+aV
         jDb17ktssNShyEOBISRgMNxWygiEwPkshmQhxAYcFGlY4O7QV2ftn2lvhTSepT10h/ZE
         7Xzg==
X-Forwarded-Encrypted: i=1; AJvYcCWSGzJmJeiI6jJw5WDOo9BhUlAy4yV02ynBQbTeSLLEoL6PNUJY8CeEXRHMywyT8/XrKdfTUpkOlxHnDXcLMH9n4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLG6TCf60wtJzmqTwI7K8kJqaoiMrtAv5rf/R/KrAZz/cxbtH3
	UbIA+rW6jJoiZXqxFAqy5g/k72jmdTMFzJhJMf9bC5vDQflNd1IhD+jvvZQ+nEPKw0WwGjaukSn
	p
X-Gm-Gg: ASbGncsXavQZ2Z8FZu2BvO1i/qcQa3jFVu10ddMUKfP6FVczZ1o5698zoG2GCQyZDcu
	EoaR9WkzRaRG5uORYy2jeFT7pwWLs6PmBmJrlOUPjAlwvBngljJXc4UeeRVlu+oERdzejLgF70P
	SgY1zn2wib/cU5MEFAJLXK7fAN2HoISqLkIThVpC94zoI7SUGapLrX6K9iogO7bUyQbKUMBU38U
	r2uf2WU4vre+NRE2dnjMJk/UXJARecdb+GukHIv8HNiCPKMDVk4/nneSsTgXIv2J4VqOoWB+BYk
	ewAF+xQvlaZkN1aDVRc=
X-Google-Smtp-Source: AGHT+IEcIbIDDwYQdOV615CUjCJxgeMnQC+DGesANA1ClWsaF9ced93N0m+sAVSXmRf6DZmkMUCY+w==
X-Received: by 2002:a05:600c:214:b0:438:a313:cda9 with SMTP id 5b1f17b1804b1-43960c068d9mr13823075e9.10.1739429988348;
        Wed, 12 Feb 2025 22:59:48 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f85c2sm995229f8f.91.2025.02.12.22.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 22:59:47 -0800 (PST)
Message-ID: <f5f6194db4d3ab2e61ef8800531475af1b5680d9.camel@linaro.org>
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
Date: Thu, 13 Feb 2025 06:59:46 +0000
In-Reply-To: <75e01bf815e5f7692d4b7aa261054851a943fece.camel@linaro.org>
References: 
	<20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
	 <75e01bf815e5f7692d4b7aa261054851a943fece.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Vinod,

On Mon, 2025-01-06 at 14:26 +0000, Andr=C3=A9 Draszik wrote:
> Hi Vinod,
>=20
> On Fri, 2024-12-06 at 16:31 +0000, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > This series enables USB3 Type-C lane orientation detection and
> > configuration on platforms that support this (Google gs101), and it
> > also allows the DWC3 core to enter runtime suspend even when UDC is
> > active.
>=20
> Friendly ping on this series :-) Do you require anything else?

Ping again :-)

Cheers,
Andre'

