Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B83090CF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631647; cv=none; b=pZikoItv4K6akmMqb+C5+scZolAKh/9QaZd7J2VNc6tQSBm8WTWg9VvNb45Oob0ZjbKvoX+YyETJnlr5ChViJOr/SFTnamIuYx9HirVmirLi99dHkSQcFqa2YNUvRcoXRd4ZeT0jx4rr0HeCmaJt2nXhtwm+nhYs3oalAAQiZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631647; c=relaxed/simple;
	bh=ERyjgMpetsSV7HmNF4hsqF0bdrmrio7r57PRd234Lqw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U5cmfN10JTNT32KB1zyKmy3d8PSMfx7m9c/Kjlf6w15vI83M4jCourR5rTSlOhJz1MUx+0yyAU9wNMmIthIkTUdz4Sx7dXn42d5XW6QDHAmEpxn8INuvEMbHO0TSb5xGDrA+COhnXU8fig1OeLvDxRj62iGGi8wnvfjPHatDtJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXQSiz1I; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXQSiz1I"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b79e7112398so22386566b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767631644; x=1768236444; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ERyjgMpetsSV7HmNF4hsqF0bdrmrio7r57PRd234Lqw=;
        b=hXQSiz1IbgYsEUmS8z5i1yZH/6aox1AulKzNjsOIcwLeXzKFL8WYcNRDbje1eKtLu7
         d0M795RfyUcvz1hZnCS0HR1MK9lXhNgtrh08XBh8SEGeJtN6+zuhFu8FTKyV1Wn80YdI
         sbSjd7QtQIArli8keY6GmS+GgpUkT9EpqCuDU9jVVogmarmZk3YK4mM+rF6KDTuors55
         buWUKbbtnovQTnZ5lIVgSMW6ngZHVU/IMV9leuTQtU1y+MyWkh9KNFXKhG6PgTwTIlej
         uYg+FbrbY6v36jSRnQmouRcitZZB4wJjYA/oI1h6YgR2NPPHcJ30HIYx3h75eSJpQ4z+
         oVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631644; x=1768236444;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERyjgMpetsSV7HmNF4hsqF0bdrmrio7r57PRd234Lqw=;
        b=FgIVPiuLR8y5YpxfeaVlYxGqbHCOxEAWlZVC3t7uuYcTF5Wc+qIV8A0WJedKtP86Oa
         SOcxJu/PMuBJ2cgogEyaj+i1CPY4hZVLm3/vGBH+bWsiLSo5NpHkwFZD8RvmK43hbxwj
         4dIim0MAt9NFjIz2y7TBs026bOOMjXmElJ06o08MJjCuxbP9CyHA06u4i9lvbM0ekZ6W
         wEkRg8fvCsHr1zyuKZQlg2dpG/APaZ6XfiUh1fJspg17qlzg6OLet3NZz6mxLb0C8H5I
         GVMjSOJRdTVzBOfstKnElZoNSF4YOCCb17CKXrDoCjEkoj7QKKC5DyL7lqwteY9k0HPE
         zQww==
X-Forwarded-Encrypted: i=1; AJvYcCW9Fn0NpdhfoX4iZmkId7cPANllkTOeVxKAMZHw3zs9bbMD6gODUWyqsw1+1FN8M3BxuiEdDuL8XjH2blzk8oTqzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySQ4H5Io/KGdxYLuqHbrb1JB8KtNs8BEFNNN2qxksS/z+7zO7u
	jlFoeC+aReRMyx3oBta09eU2Y1C6d5cmx9rkqD9X1tPZ336xfg5e7UJEdM7wfAQKDus=
X-Gm-Gg: AY/fxX7RF7PvocOdcv9wToyS2i9XZUfr2Sq9FHkZE+++rqDJBEDsFG2R4gP0C4wAFoF
	IBMQYTouioBsq5PK9YjHyFH9cYvK363NfNllQOUNNTGGWzjF2TpeRJaNzzX6zO/tNnt5WvjVwCr
	UNm5gEEfEHchQWLdu7wvvmX3L3oqASCWMx7ioTbWTVlRYFnLkO1WLe2KVoDsxHkYNUWQBSROkDY
	iuUijaCbKllfyujf7FiO9ljUfd7+hMG/gYpucf5/OXrh9oV75IoeY/uXOZSyzqjddg5JLpMoHMV
	Xi96RzMjNxVRumFWOP3Udn75ibDcieAp2xgc1kGBdqtsyr4TUKARso/krQ74SCDvNBQYSzjyO7p
	1c61l0zi4sm02+IeXBFSNbjtsVFcbA5FZpgYLarleOsNa2ioYzVHNihsvXUO7vcGLzhkOvwq77a
	/491jgB6Gw0ft4xCknBw==
X-Google-Smtp-Source: AGHT+IH8PrChGbBe3ifcPMF0XNauYBYKXVAb42mE0WG2Oe4GF884wrbNFmqGeNp3hqqHYpAdiAIsJg==
X-Received: by 2002:a17:907:706:b0:b77:f4a:ca1b with SMTP id a640c23a62f3a-b8426a6c79amr36443666b.16.1767631643937;
        Mon, 05 Jan 2026 08:47:23 -0800 (PST)
Received: from draszik.lan ([212.129.74.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507618cc59sm255498a12.28.2026.01.05.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:47:23 -0800 (PST)
Message-ID: <da028427208fc4d515060375fc95f1cc0f64e2ca.camel@linaro.org>
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, RD
 Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Date: Mon, 05 Jan 2026 16:47:58 +0000
In-Reply-To: <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
	 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-12-27 at 00:04 +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> TCPCI maxim driver directly writes to the charger's register space to
> set charger mode depending on the power role. As MAX77759 chg driver
> exists, this WAR is not required.
>=20
> Instead, use a regulator interface to source vbus when typec is in
> source power mode. In other power modes, this regulator will be turned
> off if active.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 +
> =C2=A0drivers/usb/typec/tcpm/tcpci_maxim_core.c | 54 +++++++++++++++++++-=
-----------
> =C2=A02 files changed, 34 insertions(+), 21 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
