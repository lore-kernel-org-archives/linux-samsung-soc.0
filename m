Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7C1D5AD1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424495; cv=none; b=UBhhqE5hIsfz9bm4oayM0os2sIPcAPZmNpdiARC2zMi5A5kFecmgO4dPrHduqwewmf5ZSM/iMUpzIRuze71hryHTFx+uWj3laxnxU/0eKYLf3VSkEMNeQ/B+Zy2Yh8Zs7jj+y+zLVvG1Ih/88dVhwuQ14qjE/Nh/oXJEFn0tgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424495; c=relaxed/simple;
	bh=nQBFudkH/U9XRrwJjvmyIWyAmq7wglEjIEj8Zz4oFpA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KxxitrSGLi3lsejqPYApK0dTh+CRO08JMJanHnMU6MjjY3fI35R1hY7dnyWeoc3DxpNi0OcA8SMUTbS6UQ5QTfy2CyG6tAnbw6Bv8HcMqB5ARoyRXN3tEFK7JrbzCVLigQlN+538tpdy3sg74UAgjQz1Hmy0XeXdxtXYstRekOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rn+0iSs6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rn+0iSs6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-432d86a3085so33012225e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734424492; x=1735029292; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nQBFudkH/U9XRrwJjvmyIWyAmq7wglEjIEj8Zz4oFpA=;
        b=Rn+0iSs6bfDaKRyDmnZoNW7d4Xq1WJ96vMymXn2X/KoFcSnxMNsHrbTENlGyCFYc9t
         0Rs2VextUzWCMjFER/UcldP/tmcOcZhTan9WfQkwkf+fwFE1PO6OEp2fNMTNDsdd7H2F
         kjMSb4JYzdIwT8eo3CusZ4db97eCjg9wVVBhPM4rH5wQNrqTkjYcsOBHeSOwx5u9mRTj
         CbEesRFOKAdWEG5hescaqPUzUqm4NaDujNiDKLCI6/OpQa/SfFio2fs4zHeKl52hwZzg
         MgFQjpJfH3DSAyQGm4ErQufCTl4wJx6/UJkwzigWXWX4V/wwzz5mTf4MdRk3kiZXJs40
         IH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424492; x=1735029292;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQBFudkH/U9XRrwJjvmyIWyAmq7wglEjIEj8Zz4oFpA=;
        b=go41yCWJPqK5WfNraIXdlgDoKgTWhP4cL+RmFZwGZjm4UbQIKcO5/K9tGvWurghXq8
         kLy0YjiNQ2Skfx4q3q6Q/qFYHhJxVrGzr+T03uPek7MuAISxuAxXvPbGqNHKFISeKoLO
         v0wVm6ihnoW+siRNvjHsYTNQHUMNNaTWg4alhg/YMo+sObet0UdcucujU3yxhxRqKafU
         Sc3z0DHT6PrlGJe7nW5FGuvTiGahtwkg/TMgrQCBwEXQC6+ZKg0w/zF90kS/IzInQpOa
         UZdHWlMEUj1tete+wA+QCsES0Trb2nnc7in1JUZvLUaScgHj/qEufIeRBA0jWuL3z9Y+
         imLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxVkINzrbML9qxHm5CVnug8fZJpp546nty0UimNqu0spwvO3QGyCv+K5DfYJBQ7JvEAedKBkfHbdrlAAhC+aZFcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgDNf5d8cPWPvnUVdc95YKr8PM9EuB/m06pru5bKJSZBw2sxnO
	m2CbkM4UeVNrYr+1N2hPrjtwP++H1+o/uHkMm7BF33CDi1eEYwOdFJL0a1b16BU=
X-Gm-Gg: ASbGncuSm3dxSJY08oVDXXIgAjJa+4lKEnEwshgBIjx66wayeO/f7CKsHLSOydiEeCR
	I4cJ6sKkvwjWlGyHipr86oYwQhNQIEObB8sAMIf0LERIcKkTthb/IosHKmi6+VhKr1buoFsweXz
	igYDiQQVg/4EiTdj1TF8xyWkscd5sKYa8Ip0WGdw3pP0mThFVPR8O2SXSlnlbDi5C1IP5kaBF7+
	GLA5wv0XeHotNml1g9GqD6x0tWXaugyk+rLmgAY/ux625v/8f2PQZCyM5Pk
X-Google-Smtp-Source: AGHT+IGdkDRjPGq5YThJvtr0Dph2unG1voX84f7v6HaIyi5sRuOIUK1Mi3kKYmBQJuMvyL2RKZOlJg==
X-Received: by 2002:a05:600c:3151:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-4362aa3ffcdmr145552925e9.18.1734424492159;
        Tue, 17 Dec 2024 00:34:52 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625716e5csm163118975e9.36.2024.12.17.00.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:34:51 -0800 (PST)
Message-ID: <6e22585f8d374f8e26a2a51153680041ad8b1bea.camel@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: exynos: gs101-oriole: move common
 Pixel6 & 6Pro parts into a .dtsi
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>,
 kernel-team@android.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
Date: Tue, 17 Dec 2024 08:34:50 +0000
In-Reply-To: <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
	 <20241216-gs101-simplefb-v1-3-8ccad1830281@linaro.org>
	 <fw2a6taf4kd3sggmyppeym2uxkuyotxy7ugj3bh73vetnra4m6@jllekadordju>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-12-17 at 08:38 +0100, Krzysztof Kozlowski wrote:
> On Mon, Dec 16, 2024 at 01:06:28PM +0000, Andr=C3=A9 Draszik wrote:
> > In order to support Pixel 6 (Oriole) and Pixel 6 Pro (Raven) properly,
> > we have to be able to distinguish them properly as we add support for
> > more features.
> >=20
> > For example, Raven has a larger display. There are other differences,
> > like battery design capacity, etc.
> >=20
> > Move all the parts that are common for now into a gs101-raviole.dtsi,
> > and just leave the display related things in gs101-oriole.dts.
> >=20
> > Raviole was chosen as the name because Google uses that when referring
> > to the combination of Oriole & Raven, keeping the familiar terminology.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Note: MAINTAINERS doesn't need updating, it covers this whole directory
> > ---
> > =C2=A0arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 290 +-------=
------------
> > =C2=A0.../boot/dts/exynos/google/gs101-raviole.dtsi=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 297 +++++++++++++++++++++
> > =C2=A02 files changed, 305 insertions(+), 282 deletions(-)
> >=20
>=20
> This looks like move of the code, so -M/-B/-C format patch arguments
> would create better diff.

Ah, yes, forgot about those when I switched to using b4 instead of
custom scripts...

Cheers,
Andre
