Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9386ACC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714040423; cv=none; b=ekspYILUPb7nZhCsWfaAnAYwh/aHOK1R2VjwlkjL/PBx3LD8tT21n2mGPHl87B2LIcoivmpInmJaWS3n3Vf5LuB/1drIEbweXWPGvQzDhOOp9LAIoQh088o6a/y9kG5x8ufqZxuzJmILRtq7wQmM4nPS/zLG2+fE7GGIvEP3I9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714040423; c=relaxed/simple;
	bh=coFlk6vpPoKDKE/eIhdn/SGcytlX8UEWgALPdd7bzSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpORfmTzRtAR94hXZ7QiQkwMEObvJ2X8qa1ifeBkZpCsCW5csFTiLtK1rrv8oz43blsIHTl+muKKgpYl6kp4qbjuxrglE4TRjOFnluUNtlgT4zVOXMhDV7moAwkLT1PlbIRwi/ziNYgNHFT1Q3IqSs0RU0/T7/USQH/xsH7mkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ox8ZjBmf; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ox8ZjBmf"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5aa28cde736so492705eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 03:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714040420; x=1714645220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRSofvBWjZnGCZ5wbNW26krjGAh8HH8TfOlAU+v/yzI=;
        b=ox8ZjBmfO9AOovTLTWvrjxlwhgBGPybbXZNvExFbbjE+a375pKjhEViUTzvodj0WMA
         H2lDOAQyGJQIRi68ZlOONtnGVVFaiZm2/T+0er1Vf2YGkS+C2AP4wSWRYYgzB/+8hTOQ
         LsXwyG8gn5a7PrXC1k6OXjdUXcZlV89cqEsz8wM/d/Jiqgdw8z2eFVrLF8P9cBJoSOFu
         334DsL+H5moQo5MU32uxpGI2wgWrGKSBnWB9ryC2UgSpoWl6qYwUiBuhbL4UA2zqjeWg
         Zhbz2W3K5sC0q+DqF/0iVW+G1aqFQtXpVeJ2WHFtsWoilsOBIQx+GTRh6DXhC7GJJWIF
         mY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714040420; x=1714645220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRSofvBWjZnGCZ5wbNW26krjGAh8HH8TfOlAU+v/yzI=;
        b=sjxjxYSDdVp8+x8+y7VjyrLrmqWf6LXmcPQ0CQkfMo9EOwAqku8GBJNhTFpAGMUEVN
         oSfP2ChnIgOOo1Ohgv1Wr3I3adZdVg4QB5FtTYVXJpf1AmUo7Jyk7UEoIPWwEMcRrYQ8
         BPPsZpPjk15w64izNNZw8tBnKoXj5HEXdcNhxbwvRyqqt02ZKNIkuuvbK/SryjrQS/a6
         zS76XAtLYEVPWk2tMhNlqlwTIS7+nRtlryGQHbL+vMoZ81N1v+fq9yROkvW/E7OBqzpQ
         FRI90a609wbLKbl4asyV529Ysz5/PncXG2XXE4vpCBUyRe5wDcTSkskJPGVyEwURRtar
         p8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUTWQtAaa1ysUV1EUfqIww7ikOMZvCYv4m/lOkxrRduLWh3YmE4V5bmayc1qf2df7bgyGvEcB+PN/hXej+UaFusq6fJoXS4CroZYHBSa6JX2w4=
X-Gm-Message-State: AOJu0Yz3D6b+iGAHVYT05LPWwI2E1+hfoEH236yIejwePeVXgOx1697f
	lGW36gwqY8RCufOoMMaAIK0e5JhZ37w7G7XOuDaUpVJ5D0d/OwWu//tEtV3Aauvhbkl4gxwuFzK
	XhmdHfEHaLAf/zLrPPflV6EpEYZh8DiX/mHIApw==
X-Google-Smtp-Source: AGHT+IGzXdN9jQkTN93JYhF62J2Q05oiVeNPbJR1v4bCLwPIyAnVTqlzGOk52nsCy6ZOkF0HDDyk+nkA/ctDRVoz/ms=
X-Received: by 2002:a4a:98c9:0:b0:5a4:aea7:8066 with SMTP id
 b9-20020a4a98c9000000b005a4aea78066mr6630741ooj.5.1714040420650; Thu, 25 Apr
 2024 03:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org> <20240423-usb-dwc3-gs101-v1-1-2f331f88203f@linaro.org>
In-Reply-To: <20240423-usb-dwc3-gs101-v1-1-2f331f88203f@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Apr 2024 11:20:06 +0100
Message-ID: <CADrjBPofpRiYc9hqOmBWXRKC7G7LYpLZfdDC4PRw9hmgV3in2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: samsung,exynos-dwc3: add gs101 compatible
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Apr 2024 at 21:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The Exynos-based Google Tensor gs101 SoC has a DWC3 compatible USB
> controller and can reuse the existing Exynos glue. Update the dt schema
> to include the google,gs101-dwusb3 compatible for it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
