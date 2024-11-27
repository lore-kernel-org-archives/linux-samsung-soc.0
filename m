Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75B2581
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732724834; cv=none; b=tULYDQRp9YrGZzOWCj3mOhbIWvQYTY15/JQLev4xoCpKxevd0HThyy68ehgRnvGaZtW7TxjPxZ4X6SkVQXEoar5VjZTw6r7lPg7fCz07X012SQYdR5u3EAB0RyQRIwkRX0mCXnvhJmfi4ZphO9KsQEhF6VBRKP4kK+daiHkDGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732724834; c=relaxed/simple;
	bh=mOKMr2rmARyVxmtacbasnCb3Rp24G0x2C/kgLo5QtYQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ieui3xMR2xV0uK61m3symzmP9ZNMzZ4sPoPu+IS3nK5gY1A0rPoZOehUsRqRaeupQ0ABqx7igZbaNbFPuIjVp5GsHyuUipWWqHCGLihf0uyF+a3MIqa6OXIb1ctdNePcss/aQnclJLVmfvF9M72h59Vf88GK/AHSaA7d3SNazNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PjAcdS7C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PjAcdS7C"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349e1467fbso31459375e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 08:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732724831; x=1733329631; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mOKMr2rmARyVxmtacbasnCb3Rp24G0x2C/kgLo5QtYQ=;
        b=PjAcdS7C7NuSfXE/iwem1j770tASQvdfBcXVXqdbEZsRrj84yX1/70KP5ofldrowCe
         ZpLnvOQUFxQlWBlGQ+kShhuv+F3kHDlSvDb77nFbjDNyxVodq5z95xzir3oEeEqxcMaO
         8z/oMk9vaasXfHSelCn7Gmnzio4B5fsBvs3qTZ0Q55j939Z1RxTIDVbhq0//A/GNC2KM
         CUL5A37+VQm3As+VgDmhj1yI/0SG+djhaqe0hz77f0i6d18XuU5wOfw7Konr1juxOTwK
         gQ81CfvZpCbuaIZcvBUnYXq+mwE8UeU+7YQsvlOSXsejECK6GR5OEi9/qrkeRqbFhhJB
         JAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724831; x=1733329631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOKMr2rmARyVxmtacbasnCb3Rp24G0x2C/kgLo5QtYQ=;
        b=Pa9YgvdPJoklsalfEYxXV5Uphtp2KFAopn8czuDInOI9W0o2kpL9fC22I0X16F6WKB
         XVh/4ypsmIksaSIoyJXYUQhnItl174+vQQAiwRAtPkJ2QdSnOA88PCbuR+71USkErSha
         ydCM/sNBn/G2YYd016o3IgmOZ3vXMBhG0Bo2LA6O4qJ7KCdXDoMHV3C0OfyombyNE6Tx
         4bb5j6Fij484ps9jdKrrTGaEqjH/PrRASgXC7o9D3to0xWyyStZ/H2l7LjjyTyZMq2h0
         8XzMdhbGu4SOhnLtNKB829eZNE8Q1m2gs2BAtJSzDTjRIGEjYYJi+p5RSkaIfkWc+6kG
         eSjg==
X-Forwarded-Encrypted: i=1; AJvYcCWMkL54YKcj3wm4BuRfJWzqnpf98Sy6DcRYvRD3N7w7RfnckvKGo8ZgHvEcW1X2bd6VCWrx6TzaKfJMaNz0z5kO4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvl4sEbSCEdv+G3ZW7dQUYU9hJoU8k58/O8lGfYV0oww8db0yn
	hqhXgz8U52+3T7Xdfg+djZgturoTjyLNiXQJ0jKBKlM4By7J7LRIoFZlnmZH5u8=
X-Gm-Gg: ASbGncsluBIjSkRbo0Aj9OVo0EfdqcySDJYaVjChSdAq4WV6cEhLX0uiAG/OuFWU+ks
	VgKgJcZaA/4RovsBqUzpSLbNcIQio+AtPucX8y7h0I/BkoVLzGThJCPM6QhXERFbFP8IAv8kVdX
	dsM1WsHz9lOSVqHjiqgDFkDtC7JnQqWK/RWxaaiYPfQzvk8cPUd3HpVRErgDi5RUXMLz2q/EppB
	6lQc9SeGbhuK5MtmC0Jo12IN1hG42+QnjPOSsPsNgPsD2lRTM7TKg==
X-Google-Smtp-Source: AGHT+IHUXF8Dlt2R0M0tUhRjJZfzXWTd2QVl3Kj7qIQfuLN+iAXj3NQBYlBwZKmabbvWQBuy4HyzAQ==
X-Received: by 2002:a05:600c:474c:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-434a9dc824dmr37930625e9.16.1732724830938;
        Wed, 27 Nov 2024 08:27:10 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74efbesm25624895e9.7.2024.11.27.08.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 08:27:10 -0800 (PST)
Message-ID: <fba9c9df33dc2e060238a9bb3466a2fea020efde.camel@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 optional orientation-switch
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Sam
 Protsenko <semen.protsenko@linaro.org>, Will McVicker
 <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Date: Wed, 27 Nov 2024 16:27:09 +0000
In-Reply-To: <20241127-pushing-baboon-4afafcf8322f@spud>
References: 
	<20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-phy-v1-2-1b7fce24960b@linaro.org>
	 <20241127-unturned-powdered-d9d1b695732d@spud>
	 <20241127-pushing-baboon-4afafcf8322f@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Conor,

Thanks for your review.

On Wed, 2024-11-27 at 16:02 +0000, Conor Dooley wrote:
> On Wed, Nov 27, 2024 at 04:00:59PM +0000, Conor Dooley wrote:
> > On Wed, Nov 27, 2024 at 10:58:12AM +0000, Andr=C3=A9 Draszik wrote:
> > > orientation-switch is the standard declaration to inform the Type-C
> > > mux
> > > layer that a remote-endpoint is capable of processing orientation
> > > change messages.
> > >=20
> > > Add as an optional since not all versions of this phy currently
> > > support
> > > or even need the orientation-switch.
> > >=20
> > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Actually, this patch unconditionally adds the property to the binding.
> Is it valid for !gs101?

Good point. I've only made it required for gs101 in the next patch, but as-
is, somebody could still add it (in error) in !gs101 cases.

I guess it's best to squash patches 3 and 4 in that case, and update it to
disallow for !gs101.

Thanks,
Andre'

