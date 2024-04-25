Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0AE86AC4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714040248; cv=none; b=Lvxd4WCHnIVKG4v8dY3/7fyM4dr6GIl+V9YUmKlFzCEUKJ3jbTyIfnzW3soIVo0X4hKGeZ42Ky3vHm4nd7O3yOhzQwpiFHb1xaDoA4t9V4Xd9lEVDW2Qkuek5bYUKI0+SfNR0x9vFrg80HcOfAfWmgFfjd9VygTm3oim6dQu/IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714040248; c=relaxed/simple;
	bh=BPeJNPgeuu5yEfnxBU92okYv01EBLJ2vMEzm8JSUpts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+3QtJvL6SfnrpFwXyeRfYoMhKWfAkr8L7qKKqb3XKXIl485hgaZox1VMKTBucLg/56qGu3KamPw86PL/pjDL564UCROhmOAuEYc6fn8gxnFMCsbl0DcMidKVfb3QHjI8AtapB28sP3DpwM0nd7Yn77vmXHHCyyk7Sq9Zm9t7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oy+eKMjh; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oy+eKMjh"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ad2a15374eso526488eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714040245; x=1714645045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fgWl3/LS6xcTJ1My1IOi3hltkpdLJpEDvFYJw1KZLA=;
        b=oy+eKMjhLlRSjIcb30pEN4R7ya29RGHbBagREnBGXUVYzonkCTxEuxPUGoOe1/jJ2I
         i3iHcMXnc1Uix8dpw7iXDkjMzJU6j1kKwqmx4nX5EwwPJwFzbED6ZngUAhAcOJgKaxL6
         Xqkr1n1HyjUuQfKiUh+aJHZFMOg+9ABtRRhqd9vH2HioBkShVE4wOHj8jqhgjnRHBTgT
         EZ0rJo76U1FLvctqif4uZwf4bxD7nendzevtMeHd3Xom8uP0rFLHjCAOijCKQCSKtaji
         oZ3iGQYPvBfggg40vffxa+NWj6IDnPnrws12CzaNdb0KQp1g75xQ9reJoskBEJE4we0Z
         UoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714040245; x=1714645045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fgWl3/LS6xcTJ1My1IOi3hltkpdLJpEDvFYJw1KZLA=;
        b=EPUkqHADQEwnrCn4GEN42eMALQRYQ0iP671T5H/UoSxN1pxy6OeqKt9FhZ7GlMnMwl
         fVvWdJnrtcd9GqUPHuhPpKHGV3f1U/d9fSnTbGDU8ZMgvUPGFY4KK+Fw2Fg5tQJQPv9F
         PeW374bLE4S1F/AUYaslGZNDsWAVm7pY2TyLK8IN2BxbhlaQgswbGkBnu9M1hlOMxZ+A
         /EjbhOfDVF1a6WEgu4j8O0nPeWCJcX3rs4mpN7uB6RYBatvWJq2C9/A0mgEaoBX75CGT
         Qtk/aSBatWNjPS8FShDWxGQX3GulNyaUNcH8qAlD9Q2BrJ+YxQUYXcEjYO+EqKaLaffn
         H8+A==
X-Forwarded-Encrypted: i=1; AJvYcCUzu+BR+lzlCloTxOg2clDbsn5onHTsGRWdhxiBQb5gb0d2aqz9D/9Loq5WabOP8Dxo9rIVtE6Uvd2s87ny5Bd733TxCICN57vbAuTYpBeLSlY=
X-Gm-Message-State: AOJu0YwkvTlRvBb8pKvdLS/kRTPU5wuVCX4RNDn4WBr5bXNf01nXEFA6
	p/k6m0QMAzMtd8X+KKD5T35abnn1VtBW8zmzG7RMTe6IwlMH+zLBhSICgCFRy65Gg03M738YQgU
	QsCHUp3+pnhSuOdYbhNiTSL4wqCT/i3VMCP2geQ==
X-Google-Smtp-Source: AGHT+IEtS55U01N1UHgWrnso9WLvSZJG6q6OApUI854HVfe3yLiduHtXnsLcr3c8YSqi3fNxiU17jRDnA4GPIckhyV0=
X-Received: by 2002:a4a:987:0:b0:5ac:9efc:3b02 with SMTP id
 129-20020a4a0987000000b005ac9efc3b02mr5567163ooa.8.1714040245481; Thu, 25 Apr
 2024 03:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org> <20240423-usb-dwc3-gs101-v1-2-2f331f88203f@linaro.org>
In-Reply-To: <20240423-usb-dwc3-gs101-v1-2-2f331f88203f@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Apr 2024 11:17:14 +0100
Message-ID: <CADrjBPoyY2p1pwpO-wgMD_o6o1YjEAt_nmAnaniASHNoimE2EQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: exynos: add support for Google Tensor gs101
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
> controller and can reuse the existing Exynos glue. Add the
> google,gs101-dwusb3 compatible and associated driver data. Four clocks
> are required for USB for this SoC:
>     * bus clock
>     * suspend clock
>     * Link interface AXI clock
>     * Link interface APB clock
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
