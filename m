Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFE31BC062
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739963798; cv=none; b=XKWEYN0TaYTIbJQks8Y+EwvU60lxfFfYMHxbgW9Gan7vHoQnozAqT71wStf3Zi2jLIPQWhIwD/q7Q6zO22hcDVXavmQ3PqXfl1q9qFTas3F5ypKV2onzw2O/goG0FqPZYZseP1aKpxpIhZOFCa1MWa9k9WlY1+D2lLpnne+zpeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739963798; c=relaxed/simple;
	bh=uWOktcaedUBDqKd4C1NzqImpFID0KSF/Je2o+kES7iI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rn6j43xr2y0er3PcuqOob85Yh8mbgvKy4f3d2c8PSyHFkELVlw8chmxmaik97Is86xnKBfPVjyMiYuF6pBTcqzp/JE1W40Xb/Z85QTirdfqDVV15B8PWYLRM77lrJ0K0Uj5YUtSbed7WwCZ6s0RmWb+qkPISUstcfJDghjgXZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z2581nYo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z2581nYo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso41431385e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2025 03:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739963795; x=1740568595; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWOktcaedUBDqKd4C1NzqImpFID0KSF/Je2o+kES7iI=;
        b=Z2581nYoZUdJioFE5Qe/WCZqp1jMbVtJxdc85r9YGhmkDG9ZDO/YX9XW4+YbcNqXk7
         wPSGSB13j+VdtOCCANTniQcKOGgpXGQ0/0U0adRjifpr9iCMve7vFgBy/viWcyUZuIPc
         9ztSo+N/b6XqBh8HX2SanjwS4p/ebg7SLRaeVqbWbEu1uekLQ0SAHTDruFBv0FKj6mhU
         AZ7+6H/1TqQaer23ovbdYRngBNMODTIArItoTxgtZjD5EIz2CcpFbEs3YllrIhSF3yFI
         1ZxpFGbk9HVDofkDVgTNZpxNrFmW6letGneRlByL2XS29ruV26OjCiKD4d49xDZyjHpp
         KnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963795; x=1740568595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWOktcaedUBDqKd4C1NzqImpFID0KSF/Je2o+kES7iI=;
        b=u2E/CrAXPo8FwVPzI602Le6nY4+Wwpyt1vZEhNzBOCcLecNxSte/zGeT0Cx71mn6M8
         tWzv+GEJj468430pqkglyYVqO+rH8OdbIE5yFDWVrMCAfYqiezqGA5y5+B9rQxDKtq2u
         u99c/lMg8hJ5f+GHgVaoxoxjPwDG66AB1SWKibi9f/lxBZfWeas/YJCs0x7nzvjKezSX
         pQgVC5TujQq9di68UdPEdoGoFbX67YcSfDtrof19IUEMnmUGIA0cloVXf0tn4cSlcfWZ
         EHSW3vQHuO1MX4gGgLVOcS1IaRbej7sIriQVwJV2T3f4hn4mU10EAEUKrg2Zr2ye28MR
         w6vA==
X-Forwarded-Encrypted: i=1; AJvYcCUhR4VvkrgXQ9mJQGlzx2GMg7dAeJFs4N98w4AipNgFJo3l1r+jEcTvVubx5en88qVMrdHUmZuYNGohi0N4YRcSMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64ew3anrggMShHfFw6dE5EIt7wT8F4nJFS8aYvfpUleDu0Mn2
	ZwGlC8yQOx/IisQbUMMmC0is/NFtGWcA/vx2qpGOtU2b+bmhBpxHnPRU8AYpeF4=
X-Gm-Gg: ASbGnctXG/PlNbJ0fedwur9D1KWWAiHcVshHJpTxevSTzJyUuNCORkpmRmR946RylJu
	Ba2UXfSfihkczEhsOkWi+UVSv+AChXWKo3yzQVVjaMSvE6tmy16uUesr6lAGcIgYI0EyW10WnCt
	0m38zjkro0ZvY9XCWKsyT18++hNyoRq9FrM/LXGTsQNzgkRDnj3SVWPbmI73uI3Q7JAcXaTtc1L
	llhJQNpRXui1RfZsq+tdzMNoaBMMChHrGYb5KNuRfWGmCorQ2fABWTIroXaJpvyEqSWJQ5x6Mf3
	VknNWjt28y8TWXi9jVtR
X-Google-Smtp-Source: AGHT+IEmDDRkG1uSwNL1pvVknqup0gDz43+E3qOgrQNfjOcr23dfo95v/reLZTyiBdBUjlLYYhhYOQ==
X-Received: by 2002:adf:f205:0:b0:38f:2726:bc0e with SMTP id ffacd0b85a97d-38f3406cd88mr15712193f8f.44.1739963795144;
        Wed, 19 Feb 2025 03:16:35 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccdabsm17536949f8f.28.2025.02.19.03.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:16:34 -0800 (PST)
Message-ID: <b60fe253fdf581399c11cb7e23db0e9883c81255.camel@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to
 lower-case
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-fsd@tesla.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 19 Feb 2025 11:16:33 +0000
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-02-19 at 09:57 +0100, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.=C2=A0 No functional impa=
ct.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

