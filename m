Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD6136E2B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227640; cv=none; b=pLFoIw4GllRgCUu9wZl7F+CSn7As0UTgzzPxzJPD+iJYZmTjatadK37NKM7I3i6taxbPybPyXfiklW4ftP5dLq7ERZEuXrlPQBTEMfp66IvZ15+TyiXURfzCOQqd9uzhCkN8hXD2dPc0sW7lK1PuIz5bL+x9GILPB3ka23qMzp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227640; c=relaxed/simple;
	bh=meeWBmILHEqJWzac8umjaOJa8I4Ncz20EGfL7OzEJwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BB2xijRDaLrawOUtCTn/JhRlLdiCqiJSpBrL+5czeM0+BxvVrWZUs6qDLLc6QyIVzoViXBlJLR7/onLynkzs37vwDk5hAFPVQXzKnqrTHK4sh7Zkp4siqDN1HC3+M4hp6GwMn0bzT2w5+yAMFhS1D/hnAf2SYaVfUJpx3csE3NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8oNNWxG; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8oNNWxG"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5bfb24e338bso1670594eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719227638; x=1719832438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEzwQY70dS5/4zaR7wFnTP3jHuIxxfgJgjvsBN94sGk=;
        b=n8oNNWxGWwHxlRPICp3Lbhcrqp48MuLJ+XqpwHPRlQhtDrWO1ymAwipoBvp/kZBo1E
         YoqlJEguO7P2Br1oe6Ky/QkbZIp8dG0Rb3l3MUIY5uTlmqgQ79wayKMl96hlVClOGFwb
         P2bL1oV5ZN+SouYXL1wpkKLxlb6CNBD/V2XKZPnoLrFSoKpakyIknf7xEZYgs2DHew3N
         zfejOkheZ8SZmO/9LgqKjATU+rqmyjMjJCRJSTITy4OpYyJWhSJHkYK9YhN6d1dIlqqH
         pE7vrU568dRXPFINhVbfmphfTBFqwQLzG1pkpkab0h8oC0nFJtpy3skBNWorQgfqmyRD
         WjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227638; x=1719832438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEzwQY70dS5/4zaR7wFnTP3jHuIxxfgJgjvsBN94sGk=;
        b=ti3rgObqkhTkoynLeRd1VLDvFN7eXDI6mpeKv/Z6iOHBWO8pi2CtBMMdylO42zy5+j
         2obu30UOCX6VLX+eQGV5oFsXD02tMxwWrphV4ep0IOMXo96vKhf6BPRIsw/PFzuXpykS
         0nVpQX+pa/twoGCqklQl9c7xfqqgBVA+0gPpXnxdNWZ1RyTxJjp+YzpG0Qz52oNALwWK
         EWeXzuQOKl8Ve9Juskqafnmwsl+5LEqD+wRDfX9nWRc2+yFuIPSnPcJlYTZRsJTTMHQv
         AiyK8xzl1+HP3WZu+DHAhwqqQdxDUkWq+l2SL8+3qQ7HY9kBC1oiQ71zFLPTH6C1opUJ
         /s2A==
X-Forwarded-Encrypted: i=1; AJvYcCWSRKVt4syJYPrh9QIt2xCyPtyhXzehepsXq92VS5bT0FzsMLNeKY4i8k7nyrgJ0INqYW4dxGBIaQuFW5RA+lJ8VlQ4moZ/O0VNpiaJAlApMGg=
X-Gm-Message-State: AOJu0Yytet7yrXL3XJPW+TokHERtN2G/OEdYyJjng7UkCkhoBawC6WYo
	HkFSg3v4Wt8OUWe9XEI0nJTrTIsxgudZ2k6l3uRuJ2Z/v/XYwbKEKeOr6bX57RkK5riSMr3lAEz
	LxKJqArLSyee5E94yvDdE9ILgoZAHubfpANZNTw==
X-Google-Smtp-Source: AGHT+IHmVjPOuYszhXpUs8aOYTWZZ40BicRqOgwhbWDxIhWPU3UqwLQsR384Gfu6pdKECYYPVPugv6s8L7YYKqqAGTM=
X-Received: by 2002:a4a:240b:0:b0:5c1:e8e4:57a6 with SMTP id
 006d021491bc7-5c20ec4e865mr59179eaf.4.1719227638018; Mon, 24 Jun 2024
 04:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org> <20240617-usb-phy-gs101-v3-1-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-1-b66de9ae7424@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Jun 2024 12:13:46 +0100
Message-ID: <CADrjBPqLgvot6oG_Kx06okwOkzn=Kozjj5Upem3w4OhN-Z3hNA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add gs101 compatible
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, 17 Jun 2024 at 17:45, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Add a dedicated google,gs101-usb31drd-phy compatible for Google Tensor
> gs101 SoC.
>
> It needs additional clocks enabled for register access, and additional
> memory regions (PCS & PMA) are required for successful configuration.
>
> It also requires various power supplies (regulators) for the internal
> circuitry to work. The required voltages are:
> * pll-supply: 0.85V
> * dvdd-usb20-supply: 0.85V (+10%, -7%)
> * vddh-usb20-supply: 1.8V (+10%, -7%)
> * vdd33-usb20-supply: 3.3V (+10%, -7%)
> * vdda-usbdp-supply: 0.85V
> * vddh-usbdp-supply: 1.8V
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

[..]
