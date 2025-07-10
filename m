Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A428936C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133218; cv=none; b=uA8rqF6dvylxijD5S4UWGmpJzH4hi0+ZKNu7a1gZ1CqFVp5wmlLs8cNOQxxVf0P3mb9e4iVIbHIe5/tMpidSyvxJe5+eht6mYm7YMpv74OrcQVVkTjtqOX3SLYgacGVkGQxLSSESUwAOxo4k+gSUvLrxOiy/5QaWllzrZ/Sd9QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133218; c=relaxed/simple;
	bh=bVSinIxBeazkKEKfcVYcVjaoUaV4wjv1lfQNu+0RDdc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g1UXP1VBU7xWzqvMeftPgUwcJi3A6/Rs22LIE7tOfeF7B7ngNtYxNu/0haWT2OQfspFVcUteFcWAA0Zn/sNa51qdCrgK0RAgCuONr9m8KTr3NtXjg9GsKPzLeGTKsM+/ooRP6ZI4K9xBFY0jFFFIa7KrQI761SDxCKFTf4RWKb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X71MCt1m; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X71MCt1m"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d54214adso4112145e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 00:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752133214; x=1752738014; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVSinIxBeazkKEKfcVYcVjaoUaV4wjv1lfQNu+0RDdc=;
        b=X71MCt1mpk6haB6Le5wYPXgVY5IuY62UveVgmBTg4Z1xUHkWVhqUxgVCAykNzH5sfv
         Qg9k9ds9qG9b891vVz59o5U4qS/Fm6xYrXwPQPAL2Lbv+VBVhtaWVLfIHG1MYAzpY6eU
         4qTxjJmgfw2QGXW6bKKOcY5pa6jcZnG6OGUtVSiG6Y7AYCsD9ysJ+mZlrtiZdK52R3Lq
         uPNk+bHsxZEVuN5IAENbdDMr/AnPo9/fFHa/lQ6BVwo7R8IVeu3BQ5U7cOHPOaojxuJA
         jZ4W3+sP/k6UTWnilVjpdV11zobnTM6Mdab0ruxgD5tA72K6yal1NXGqa17/lHKxLCiC
         bJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752133214; x=1752738014;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bVSinIxBeazkKEKfcVYcVjaoUaV4wjv1lfQNu+0RDdc=;
        b=Gu/N+SXY5DL/VKuualDfkye6+UUKBvCPLIDbiHJTX8DLNuGilLZISYkvAUcAG0ATL4
         KJ1VwlJB3LikyiIqgwe6c0LLUaUZeWOLAmmUdzCt3qvrT3MUDLwLvOA2+zEABN54bM4P
         cMkhhltJnmeareQuPfkPpGLcqpQ087HVSXcIo6BxkJ12IyE2OD2hJwB87mt5tQ3xZz08
         vxeQ7X3QZVeCaqiV0d/WLyU5pQ42t9SgogNjSCrMEHB+VLlE0fzuOFLyiAty5nZnt+xj
         doAfwRLo9Gx/cgr8pQWbUyQDJZiKf1MtjPS28C4fohgMTSygLGrw07Q+WjgCUqJKNlsv
         2NAw==
X-Forwarded-Encrypted: i=1; AJvYcCWMk26s/GthIIy6HFYZB/8as+dUzrAFA0/+hr5Mlnia8dRYY5z10KcjPdq9yR3XEbRPxv/6bt/iK4yCaj+A+YUCYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTsq2AsZCM1FSq2kVO4vDzjLAPoycq9XjFwPj7lp1YovNQ6cl
	JLxdProwuKCx41DI99eOwSInm3QBkDiSrtVPECqbrfVB6dFyAwueUoqpliHZ/VBmhc0=
X-Gm-Gg: ASbGncsBL0M8LTT2IB4/RdrAkZ6sdEblWuHLjavuahFO+alm/ni1cZa4E1qqdjE4ETX
	2MO4Xz5h1OdPBj19NSQQM0exi1ZjdHLE/EZsDuTPONNqUu7hFoJpqzNO9a2ZacdmmFBcQqsf483
	ghvzOXedMvoK9lT89oItotgf0vqWiujbnGQvfFpVvMiMuN71Da7lb9AfohZMsCPloIHPZcIJ81j
	MyDuDbeXKvHJ/7ZrbSXDK7nWUw1r4q9282ESljT6BfYPIW5rXJJ7AuWUswqcl8OJ5HgMFTapj82
	wntWRIlelyML5Z+XdcG8eMSFxlulSCaSQKgnef3mIH2xijfWdUeToG/fgtyibX5dBw==
X-Google-Smtp-Source: AGHT+IEw2BMJU0viDmTOvkyx/B/l0UKxFSMsiQvTqQWjzJquhhrpepUjy0pyReFZsMn1allOYgvtiw==
X-Received: by 2002:a05:600c:b85:b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-454d53a7430mr48773265e9.20.1752133214419;
        Thu, 10 Jul 2025 00:40:14 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd43915dsm11113575e9.7.2025.07.10.00.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:40:13 -0700 (PDT)
Message-ID: <965df42623d1a1c2bac49bd9420cfb5fad672048.camel@linaro.org>
Subject: Re: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC
 clean" maintainer profile
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Peter Griffin
	 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 10 Jul 2025 08:40:12 +0100
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-07-10 at 09:34 +0200, Krzysztof Kozlowski wrote:
> Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
> SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
> be fully DT bindings compliant (`dtbs_check W=3D1`).=C2=A0 Existing sourc=
es
> already are compliant, so just document that implicit rule by mentioning
> respective maintainer profile in their entries.
>=20
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> =C2=A0MAINTAINERS | 2 ++
> =C2=A01 file changed, 2 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
