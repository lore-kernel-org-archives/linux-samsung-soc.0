Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F96C42AA5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732872851; cv=none; b=ptXSjq0dw7wtA1AT8JiuIcy0rzF2tcIQLEasg7soszlJcay7eEit+sWvQYJxtWtYIlAunSBr+mryh7KGkQwUl1QAdSqJdDwHgP6cfMr772/VYMg6py7nUmFv+ggzgpf58zQzOYSiESSMMQSiC0mZv+tli7LUP247qrURc8XZNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732872851; c=relaxed/simple;
	bh=xNgvtRisS5u9cN6139hn+NK3qqVv5Yd3nHI/xvwV1jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xb6gssrQyA3X3fHPjjKadVn89u+QABVUEueqcHK2tZBVsH+Gjyhl4Spu5Bv1WeU2D74JNEQnRO2wxPX/xWQYyftgQappLh6APViCwSh8ms32f9z5ilaPPVLXhrFFkwqWb0v/DmMBbGyMm2K2Ede7SwGElEZYHzfRsbyX7NaDL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9QdjggC; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9QdjggC"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f1e573e65dso522487eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Nov 2024 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732872848; x=1733477648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNgvtRisS5u9cN6139hn+NK3qqVv5Yd3nHI/xvwV1jw=;
        b=x9QdjggCkY9tkTBHbFrTQZ0g/UuFmhmFYBJFo25ms2KwQ8SpqrVAzmC7Pmy1v4bEwD
         thyh4BuRRQQgzLxqKB1Qe0gVCvJhbWmxjtLJOi6xpMY4s/jotb+OMn7jtRuAudf71LuX
         bQlql1QfqXI8SKUEhu7vWfpBYZerp3Ahs1LUa6S3CI4ZmmBqk6nZZC4B/kWvWT7ctk/m
         DfoAePaFZo0GSg6lMrMs0SiE2VDXNZnJ9cjXTMraa8yrJFeQmSdw3RKxmamRO3z7VaDj
         hYdnh/e/ODVTdvapXsYY4SjLKqEH+S7W0Mf/2P7ToeQI7/hgh+9hbDFu3S/9QlS5rsmb
         WV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872848; x=1733477648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNgvtRisS5u9cN6139hn+NK3qqVv5Yd3nHI/xvwV1jw=;
        b=oWLb7HVxWcppdYMRKE5XM0cmYXp6KyeG3bPF02GWKsTQBnorsQvirx9bCNYaER2E9e
         rjNTR6DCeod3Ho0xnjOKEMMBAfgY0MOupb/EYyjDfeuykljNkH0Jas5JwDSPfApno0vL
         I3Ofb7ivv18OJnVmIBqjyfvDRJbuAPmaUu3PhC0fmx6kGfl5t742KhqDWMSsK1g0vZ+8
         AXy1GZ9lZ0UvKZD/7ggACwfgdXeqsidsR9Bumq9ZXzhk/bpcCoZzY13l8ufJaO3sfHDA
         oSEvVRfif/2JyF+S1Xa/7fXvB+bs/tAfDcY/MrTF5v84SER46JdBoPT2o4YrDpITWagn
         NJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWVLU5YZLAis0uUgtGms4SF35XirIJAqT5SAqDEC5kv4uWdhWw2f4LQorg+utf3EfYmqqwOcfRZuPp3F5E7Y4MtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym2P66V8937+UhjzwK7PlLbbbHv6T0OdXfXXyE+mC8PzcZv+LU
	UdN81Vl6pnldCFMKmcjn+sZJOWPzrhumovH7YGfjFtk+HgoDQGSPTkb2/gjC9DsSyrsbJ41r1Tv
	uh8BfZbeIRz1dq9Oc6yajKfdnhHkaknjZPFmO/g==
X-Gm-Gg: ASbGncvJ/sa+RAt+oIw4EtjekK496G6Ri3N5bEWiKJXAtcD2Id8onBU+BseoyQeIuop
	TJPfdg9AWFLtfdL2uYaoBmu1Yyf91BoaT
X-Google-Smtp-Source: AGHT+IHSSMxnaGOmFOSkOhhOzzx4jvQ52FptkRVrDxK4pnBkB3GqM5Uuf4cKswcMzu4vXxrMnL3Y6LE0/UTLwqBgt4s=
X-Received: by 2002:a05:6871:321c:b0:29d:c624:7cd3 with SMTP id
 586e51a60fabf-29dc6247fbdmr5795597fac.4.1732872848629; Fri, 29 Nov 2024
 01:34:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-6-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 29 Nov 2024 09:33:57 +0000
Message-ID: <CADrjBPpLDLoPkvAno5dqsUtZGAcxuTMf3X913syKmY68ndwggw@mail.gmail.com>
Subject: Re: [PATCH 6/9] phy: exynos5-usbdrd: gs101: ensure power is gated to
 SS phy in phy_exit()
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> We currently don't gate the power to the SS phy in phy_exit().
>
> Shuffle the code slightly to ensure the power is gated to the SS phy as
> well.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
