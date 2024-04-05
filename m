Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913C374F5
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Apr 2024 07:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302407; cv=none; b=kM91b5Z6J89L972lF72cNhRj7aOeodwvJWJcGZ4M3gIdkNCm82imIs+Kdeexo0IGmuQrW1ztlJuJVl6mw2AJlYHtZEjDSaLjPhxWQDmsc3gL5T35qtdOne4SRvmQZ+tX8bz7RIdq2yp4C5ECndeB2DsnLZb7VIPz4krV5ps7WEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302407; c=relaxed/simple;
	bh=BUGMRCvz83jiXivIrS9EOBSbeWYOBA5HEJF91ADZrAA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JGMJsdwBkUEewj+SwvO46QgrwI246Bu1I1zZodUzGSPEHKQGXeyEVGY1PgVfXgiKWK9jNSGT7lGEgJtTSHbFP6pgAlCA023CJXh/Zidto523mot3TvHOhofIE66zon5CwFVK9uVKZO+PrCKpJeC/jZgMBMrQT/FHNsn2GLA6NkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZReNa9YX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZReNa9YX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4162f7ea50cso2469705e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2024 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712302402; x=1712907202; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B8/hEIuRB1LDRqXgcrFwyhIe4/Hv1tlerPiYLnPY8pA=;
        b=ZReNa9YXS8ZMfOWeqpFpP4tq58pukI0QowpdIpckGF2mcLvUzbzAzMBoCeyUTVB9BP
         oYGEJIddMB5GJTWPbYk9T4X5zKxaHwCRK0I7eI4zWUcSkxRFWqzZvraZ491yF6soDDUF
         9sxa2XlImdBFLL9Ni6ZSsBpyoi9EXFZkskDI08l5AnRGZONRqn1HgdtzNfp2dY6At/g6
         xTOG5PYbD0BMnEAM9EvmWMcpG0to9L/5Lp5zW02GOpRnS4IEqUYBCiJR9ahGujW8fnV4
         pznDLDytm8r/GicMTSTPRgjCO+f0kyWKeQK5LD9pa2EpK5AuM/jHVCf6sU6K2kh5sBif
         HzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302402; x=1712907202;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8/hEIuRB1LDRqXgcrFwyhIe4/Hv1tlerPiYLnPY8pA=;
        b=D45RdK9LsD12oLf8Z//6oLAZkst0jJ7DUWBmwK9tgqhdvhQjW0j7DZFUM3hrYQvNhe
         f36qjZSL6dvZvn5PUPEliphBtHLvDih+C3LGcapFOG9jGjg/eSgIp3ZnbdkQYbQLwRAU
         FVgPns249SSu1KiPvAXiNR+jtB9FUfQbM32deJnteKMK8old8LauLJ+s/SGuo8/8SM+Q
         dBdyhDyM1SNghGqNjzkrqNUL6Q6B+5t6h33Mt6M8cvG09FxGfzddMuHnW4/AfQCjybMQ
         HDfSCb9xL5BPONck7I9kwPxGq0mR5dbqGuBFPIEO/33Y4yyJFD/7ATEf9dptbz6JvGOo
         Ngig==
X-Forwarded-Encrypted: i=1; AJvYcCXhylIiSNzVI8IcN4utuPIrW1z5BB7mECB3ko4rQ45KlhbLmlS/CvlBFbv5PBuS3SirzIPUBnIZ8Q0Gk0GVn+553Yjjxhri0+QCa2OZjpnQ6VM=
X-Gm-Message-State: AOJu0YxdEOkxG9v5h3Z4v644NaVtt5qC9k7gFcA4xr7RePZGmLRplnXE
	mibWEb7oH7BWMt+NfDDtWkrgT8GlnOdLr5f79EGu0zgHQ57UiXTFUWC2RE3OVkw=
X-Google-Smtp-Source: AGHT+IFauYr0ttYbvunq4xdpMe1oQLsmvrROpymwVJP8xmztwIB4iqaH0gjqAwcT0IX2HxafV4aRTQ==
X-Received: by 2002:a05:600c:1d25:b0:414:7e73:1f5b with SMTP id l37-20020a05600c1d2500b004147e731f5bmr543430wms.4.1712302402435;
        Fri, 05 Apr 2024 00:33:22 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c471300b004157ff88ad7sm1903275wmo.7.2024.04.05.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:33:22 -0700 (PDT)
Message-ID: <560e9a5b236728f62be4bfd8df187071c4bffb23.camel@linaro.org>
Subject: Re: [PATCH 06/17] arm64: dts: exynos: gs101: Add the hsi2 sysreg
 node
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:33:20 +0100
In-Reply-To: <20240404122559.898930-7-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Pete,

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> This has some configuration bits such as sharability that
> are required by UFS.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 38ac4fb1397e..608369cec47b 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1265,6 +1265,12 @@ cmu_hsi2: clock-controller@14400000 {
> =C2=A0			clock-names =3D "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
> =C2=A0		};
> =C2=A0
> +		sysreg_hsi2: syscon@14420000 {
> +			compatible =3D "google,gs101-hsi2-sysreg", "syscon";
> +			reg =3D <0x14420000 0x1000>;

Should the length not be 0x10000?

Cheers,
Andre'

