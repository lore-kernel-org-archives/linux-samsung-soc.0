Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FE71925A2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732791294; cv=none; b=KHexMVvzbfL0ClN4nt13yKWuaRZghJj+ybBrf+kHhmJe/XlvdF6hraHF83j8zfG6INtuUTxd+zj5wJLxZWDdNJL8YP25Hjrl6rkoXbLLpzD3rQLUpK9yo0ot2inL5xHEABfp+y5kb4FvaP8f6/wkCxWQLxAOJzFqLNqjNoGS86w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732791294; c=relaxed/simple;
	bh=6ehekiZACHQTnSExEqnoLJzOhJU4i7ihd93wvSZd3eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQxH1f4m6LvCGxtL3nWoI9MQKEDngMcDZIRkRRfQlSnmSuATdT1gmVtCDRpZKuPM3QNWq8OzyU1t4fvBR8kXCUXAZJybqh2zhIOy3bE1X6a8o7Zfo09H7kb+hJrLtEeeAzyQhM9nSzJiThF5QfXJ/pYf/bVqqVRFa3dIDlEtuKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Agrfig/C; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Agrfig/C"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5f1e560d973so378314eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Nov 2024 02:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732791292; x=1733396092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ehekiZACHQTnSExEqnoLJzOhJU4i7ihd93wvSZd3eI=;
        b=Agrfig/COAZKwKEpAzJ8A3kEYwB7jFHnyeZmd6CZWIQt3mhJNeuuuVJSH+dmEEzK75
         VScVeGWi7SJsqWVB05WVZorGxZiAta1cz0aEllVEGSsFvXvn91tn4EbrwGdBC+y1Tydd
         MGO8kBmuU1uX+1znlbJ+t3qA7Ejpsf7WSRjMqAfAnioZFk0HhwOOZdTqTpJU7uSmW3zj
         7dPVULrS2zlcUwclPhU6Kxagn0GpRu/PhlxTMKfKxOEJftlvCflBLaocbb7V3X/pMRF2
         K2O1Xk9llIFftNqa/w/TaZzBDwhDxfBmGLgxP/rFFVYY5w7s2dxSjDFNJh7WImuL7S0L
         /qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791292; x=1733396092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ehekiZACHQTnSExEqnoLJzOhJU4i7ihd93wvSZd3eI=;
        b=kwIugHvf8ccKeh8B8XqQ36ZO9F3mzwuBCFF8U/Kr0eLWT5BIEQ0V8pjQx4S2xxM9St
         xxuTUuDkmI23Gyg4AqmobYYzSSXRfpAw/byaN5FljDJSzFVSfs1mlidNDuNg9BhkzSTP
         AMhptrf3rnPIGFEbyYJTmkFi8kP8QE5eu0d3wRIeBVY74NXew4iUM1Ikugy18ZepNWCP
         0dqNJFN4CB1gTc4QHmhdg1a7LLIeNIxDG0uT/6xxEzeRzZ+WBZoIEoixSNJS3C/mPf7z
         zL7+ohbSedmB8HAlVhd/pud8AUclgKFttEcZ6sVFhReXiMEVapI0knhQKrAGmUr3parl
         plMw==
X-Forwarded-Encrypted: i=1; AJvYcCX6+N5HKXr/C49CytFOFnK5xJ3mWZfE4w+j/nVuc6oKUcKgofsttusICfasblVfwLKoUxUha1SoHcja6kZ+fb3EoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztPaqblv8kIgS3V1ZmG3zfEBy5PpN5tU3a3lYJWLuG+nh4L9Fs
	dA6IlVo1oiwZXXBIitUJL71B5zAOzDP8j46QV6Fm+Ea61TiEJ6LWrOGWzHpvtKOffnvPfZnrDNU
	KehBJlTBINvqWuvSS9bOfdfmpEpviSoZrRsaIJQ==
X-Gm-Gg: ASbGncvr0CB4KaJOOgm4A6FUaBgd1cB+orXyleRbrdpaxx/YFu1z511SN2GIjBeMJN5
	9VhfJVKWiVlIULmXT0zLPKWm5gwjnxk1X
X-Google-Smtp-Source: AGHT+IFRspzNKnz4//d6oD1niqAfNdEx+VyAphVEPqsddVm2R+EgqYzGwfP+qAkW+vpL9icCdahFMF+IE7WYtI+pC5c=
X-Received: by 2002:a05:6820:50e:b0:5f1:dc89:fa85 with SMTP id
 006d021491bc7-5f2179fa1eemr1438491eaf.3.1732791292366; Thu, 28 Nov 2024
 02:54:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:54:41 +0000
Message-ID: <CADrjBPqWh6z=1+9svYw8H=DZSpo+93rhO123LwFOAMOHMraLkA@mail.gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
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
> The USB PHY on gs101 needs to be configured based on the orientation of
> the connector. For that the DTS needs a link between the phy's port and
> a TCPCi, and we'll need to inform the phy driver that it should handle
> the orientation (register a handler).
>
> Update the schema to enforce that by requiring the orientation-switch
> and port properties (on gs101 only).
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
