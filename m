Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36669200BA0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732724654; cv=none; b=I9BZWiH13an7Pqolo2C1gtSEWaG8mdCsfPiffArsF1xm7xQ+LqUDY+K1gIYQNrmXboBuADIPUGjE8XQqZU/PWN6V0x2R0hSQSKYUuoNlRikktFoGeHxu+I4Vy0XXCzRAPLsAcE4qsFadcGkdBGGn7b+5JrC098+rg334qAl3xPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732724654; c=relaxed/simple;
	bh=rKda9Awu4irodPKAZZW8j0P3UYNrlv+gac9bpLX6Xnk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XWo7OhHbw/N8SzzyYmRCiGOpsRp9TaesU6SS2tfupqlWzCuAxJ/UJZYB2s9rZsUke1VrKCgaiSj+Qn54G8udGULrQybMY7+nVUh+dakbf44t9YeoaGDLy4VuHj9uTQJClVVw9/Iq6B6Yp0mplriSNlLhFch8neAojI3k/qWqgOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkTsPrSE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkTsPrSE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso15317655e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 08:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732724650; x=1733329450; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W3ci6YCIiDufTlH6QWOH+RcWY/SBARvhjUkFISOP+Eg=;
        b=wkTsPrSEQ20h6aP0HOoF/eQMNlrO/PBotYi55eoy0YzYFlPycEfeKlMiEhXrOiOw9H
         kFksT3vqU0zpUGQJXUB++m7fPwbmwclZ4DNSxdGP5eBoOzRDCsE1Vf8nArcrslNwA++/
         9NUXL0qtqmfYjlx6E8fbkbutqepwQfIyIsaWoQJSWdT+Nl1TxVeSbPfk4XBqlBgPJ/ep
         R+W5yBkF8kdrG5K3+uRA4nmtmOaEde8Q136HkBsLfs8+jKVOr3bcB3kgCfGIw00CldcK
         +XdxZUL/Ytk3WHNLPGVpz9wCGcP3ZLTFzDl07VmRtSADJI9Eok9agp5y08iEsSxEoxHk
         wbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724650; x=1733329450;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3ci6YCIiDufTlH6QWOH+RcWY/SBARvhjUkFISOP+Eg=;
        b=xPuut8xqHNYxz4WYFHj49wVOPzVWIHM4LIX6NvkeJYXFt+t7jOsr3YSKtqf5quWNiA
         opeJkbDlWsQ5p2LZIe4vkW2ujSd2guuEnsxs25+A1wlILkE47l+WjQcfDKpQrCSNShQi
         OLecLPvIKfGSL1Ygjp4tCquNpHmSWPgMV/gqyO/JW361N4f9awDPbzsmllKNUITbcYHt
         TtyxKP9JtBY8GnBhCG2cb9nF9VYZzivAHsea/ba/bgbuOhcLZq9lFtEfGxlGzUXnAumA
         7thvMT4VUaCOmMTBoh/13KDBeCHp69gZzZtXDB/RqmIwXVPker8Fa0pfjidJTLykQwEo
         T7iw==
X-Forwarded-Encrypted: i=1; AJvYcCWFXFZxs4X4J3bq4bouIXplLlR0reiQkfEni7fKV1TdhAtSVIk6yviTnFfvKeofkTcEFTbBoSazBGRRJ4vAO9yCxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/WfyfSHX8LjC9EtDk4qXDy3jFZSXOITCV1qQQmWhr9tUuQl0
	stM2PwNuhXxBT7EvgMIOS2eu/AN+RAzMGVlTvt5RZXqRLT2tg6MlBtn2ElWWzPA=
X-Gm-Gg: ASbGncuDDvdVkTYmfgaWmfp/zswWfGuARWVnem5obJi7Z6VpFhJFfVAUVPZP5ng/t2R
	re0ixbD8dNKEfwuEpOpS79Pv34bMuFfM8auvE0EV1FqbKLJgqnU3Jw0+R1KThiWNAC0zCdhuE/d
	SkYE7/swX4ACZlBxphYosQiWjOZ66WJoRZRl5fjkBedvlztzbN+0/Wl9LjaZHyi578sQ26divlr
	xJ29FRbRODSdkFPlCS0nYUexTqzqv55fj2jJiWCkr6ycMoUJFaJhg==
X-Google-Smtp-Source: AGHT+IGDZztPo405KuhE/5HQpdEcc6G4U1hi5a0UqN/AZl+cMPyQNrZOeFD27R5rS38JBrkH0dwofA==
X-Received: by 2002:a05:600c:354e:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-434a9dbbfc6mr34223735e9.4.1732724650556;
        Wed, 27 Nov 2024 08:24:10 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3defsm17311830f8f.70.2024.11.27.08.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 08:24:10 -0800 (PST)
Message-ID: <813713d8ac62be0782bcf36d1d23bec5f4a3c08e.camel@linaro.org>
Subject: Re: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
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
Date: Wed, 27 Nov 2024 16:24:08 +0000
In-Reply-To: <20241127-majorette-decorated-44dc1e7dd121@spud>
References: 
	<20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
	 <20241127-majorette-decorated-44dc1e7dd121@spud>
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

On Wed, 2024-11-27 at 16:00 +0000, Conor Dooley wrote:
> On Wed, Nov 27, 2024 at 10:58:13AM +0000, Andr=C3=A9 Draszik wrote:
> > The USB PHY on gs101 needs to be configured based on the orientation of
> > the connector. For that the DTS needs a link between the phy's port and
> > a TCPCi, and we'll need to inform the phy driver that it should handle
> > the orientation (register a handler).
> >=20
> > Update the schema to enforce that by requiring the orientation-switch
> > and port properties (on gs101 only).
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> What is your driver doing if these are not provided? New required
> properties are an ABI break after all and I don't see a mention of how
> you're handling it here.

This is hooked-in in patch 8 of this series in
exynos5_usbdrd_setup_notifiers(). The new behaviour is gated off

    if (device_property_present(phy_drd->dev, "orientation-switch")) {
        ...

Without that property (i.e. old DTS or !gs101), the driver will behave as
before (meaning for gs101 it will work in SS mode in one orientation only).

Does that address your concern?

Cheers,
Andre'

