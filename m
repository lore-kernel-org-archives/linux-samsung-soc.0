Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7453B2FFF
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872031; cv=none; b=R6r0E7Rmb1duSHBP2StIkefH5kE+PXWY/d9etsnY0xyb7kj0bMUf5vPuaVPtq+gDKr5MxzfFhBCoSIHpA8JyVHQTin+2mYCQk2uQcvWBQDVr4+MdEvYiIJkryrT4M8LjDmmQa1iAE6QtmRfbItM/dJrMO3AOiSCCwl3AEGUk93o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872031; c=relaxed/simple;
	bh=aE5fBq1X2SeEG/ena5ka2Z2L55xuyoJKeRtJR2hXII8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ewhhyvi+e7HlLFx2KIPZNmuFwiQ/zsdCPBHgYGhNciNxuJXENdaNgygWOS1xsWqU+GSsJWy3PRyBHZL2BEyoI1+B1sldRkTcdP4uVS8ort4Zik4GznmTdU2l6Zxk+PBNUA41zjL/7q5EN/DgIkDWlax5bT3c2rh7OPkMP8uLytE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5GGPtpH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5GGPtpH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b982d56dac4so751203766b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774872028; x=1775476828; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aE5fBq1X2SeEG/ena5ka2Z2L55xuyoJKeRtJR2hXII8=;
        b=w5GGPtpHSdwnxozu8+c4bsaFRBUHVnEx1FcrX/UR2OdBLU9KnBc440eD4o25gFtDNt
         ahd1LiFNZiQ7V6YxzWHixVRkuburAAAF4f+9QzmfoiNIheAdg8T+r6aghyYjwRF6XYOU
         a1QNQhed3hx7/LeZZHNcQyyyz1O6QVGdbr/jn6MCw7uKlrbowyha04jQSz6THiJ7es7h
         e/GOMJSxxXyDDy3uod8aKGjsE0tjBV5fRHswwnWHKchSmUoomkoTQiqZJkXL85u+qnkw
         GpztXd9x576SremoXYd2J4+xOUo656xJOevZ3FZybUaeOE+x5ljHUxEOMli1GNUHBE3A
         VwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872028; x=1775476828;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aE5fBq1X2SeEG/ena5ka2Z2L55xuyoJKeRtJR2hXII8=;
        b=PXZNwryLKCP+FwbPuZbNT0FrmWVk1M7Rj8VBg8OO36oo7HxTaWLDuH22Iy1Y/+CYiV
         QMANdMtwd8L0oIctRqHcTtO6Z+58ICJ6geFRH9Jk2zg0zZCy0nLMBNGq0EBSMwgE6ERU
         DEquwxvb9D/k4DeIhBRTSk56lpXMilb1w/f3Eg18IuI4hBKuVQcPD1Uw31NziAjBTrb4
         WmKS8i0EyruTxGymLq40zL6UmUJzAUQ//OehusrWg1E/kJxqL41+04nxwcPCTEM+iCsT
         YHZbCUkcKkWHXj7vB7TKPaIOk5SaupcilCl2ApaEdOrclnvIRGKz4LAPECeAitnVnzLw
         QFag==
X-Forwarded-Encrypted: i=1; AJvYcCVffjNoNxvKnVCoyeEpcPyFNGnqXFzlP5np/twHXx5wNGKW4JF6jNZx5YLR27yDXrJ9VcTfvBGtZYJugaHY5inlWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbMNGZVgddfzSXvK7DhvInCtd+db689WpLqwVCoa9V+m9ksFEO
	7C5pK++1gkEASIAklzTnTqgB2svm0bLHx29UUxPeG0qxWZzbkfymtC/AU6TAF4fBPPw=
X-Gm-Gg: ATEYQzwka/ZtZU+FHDHLHRHlp3OS1UNoEuz0mh8HqALj6IRWHlZTR9GzDtO2tz1lXF0
	RaX2eNxJpFU0xvBOKQM9cF4T2xecYyruGB0AOAYJ9GbTonSQqmDDhHMyk4C+2mlcMWJRy8ydLlm
	gRIf40cewZpgHQFOmrgin+kUn8y/aDyjhRejSjmAnNDb5yTW0UE8uAUanv5WSz+Kwtro3zU3LTT
	aD2Bw/rwkdt9ng6ABENy/Qms/83WH/tLCubFMtaPVzLK8F3Dc+1CwiRMH+64VesMrIPIMnJ3oT3
	IocmNlFVZFcrPsqW+i9s9KEmMOmA4CeGeGh2aiCCuqdTwEUWLompSB8L5p+vDSTEmk8Yz94q5pc
	7DhS9pK9PlN9IeY4cgPejYJz1DMbWACuz6G5RZeZcxAsGZGmNntzx+aDnzV6qsp69CB4FY/+qBk
	UKzIae9kV81b6SuoDybsLh8/Kyc2elVKdBHM4ECpI=
X-Received: by 2002:a17:906:209c:b0:b98:4156:878e with SMTP id a640c23a62f3a-b9b50946c27mr682254866b.47.1774872028096;
        Mon, 30 Mar 2026 05:00:28 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e4395sm273916766b.44.2026.03.30.05.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:00:27 -0700 (PDT)
Message-ID: <dcf2c447d9bbe16e800a4dd7e74ecc26d3ade3db.camel@linaro.org>
Subject: Re: [PATCH v8 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Mon, 30 Mar 2026 13:00:22 +0100
In-Reply-To: <355b2f8f-0a3e-4209-8b1e-10600c2b3df9@kernel.org>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-4-241523460b10@linaro.org>
	 <355b2f8f-0a3e-4209-8b1e-10600c2b3df9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-21 at 20:14 +0100, Krzysztof Kozlowski wrote:
>=20
> This causes warnings, so I dropped the patches.

I assume warnings are because I didn't make it clear enough that patch
2 is actually required?

> I really do not
> understand how this is organized. This is not a dependency for pm
> domains driver but it is included here.

The binding is being updated, and the driver follows suit.=C2=A0
I particular, the driver needs to be aware that pd is (can be) a child
of pmu.

Yes, the driver does not depend on this binding update, but it shows what
the driver must support. I believe this is what we have done in the past:
binding and driver updates in same series.

I could move patches 3 and 4 from this series together with a DTS
update patch into a separate series, if that would be deemed a better
approach?

> It is a soft dependency for DTS,
> but that is nowhere to be found.

I was waiting for review of all binding changes before posting DTS.

Cheers,
Andre'
