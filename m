Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4742F6560
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081398; cv=none; b=du1jxnOjs1b3qWJL2N5jcBvvAsov4zmBhHwjhfYJcI1hDordnzewsiCMvzkIRZFB9Zuc3uTxaeqFwF3piqdAW8ey2U8X0ieOH9Rf59ut5Gz/GHVnY7hBnZJjIzqJagQBC7OdflIQit/sF4n93mBOE9KJSmkCkXH/fZWrMGKwSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081398; c=relaxed/simple;
	bh=rM1VH7DXY3SQ5CU5JoXtOdVhg6Lj0cix+4FvL7D4Z3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lbOQBNYbjHb8aEPf490Kw5w8f5XoxwA1sZ4T3ucqnd0J6I4UFo/PnAbRnndY8L2dRKSckzwTQzvZqGDusG+RAbGw/AC+oBFtxvR8FecUs0avK2CcGJpNIOhyDWsQuBI4E3mrVTicCQ5SZ81zVPbZMW8xekzNKctzaT4ptKMh7Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XqLUgWhl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XqLUgWhl"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af940717334so85190366b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755081394; x=1755686194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZSse5z3Xz3M0O4BGbTx+nqu/znB14s8R4egSwB9b9M=;
        b=XqLUgWhl4cK8s3pED+YdqFOezhbepyC3P/7XsRA3c1rgqdPL2ghVGjcnxSi7Sad6Dt
         cnAjZIG1COXaQd8ku1vDXl+bSJRT/1F9MB/rMIuipBm+P/4tvhBXBd7jGFH6y8pP/D3v
         LkX6y+v7R4llOGaEIKOmj12dI6FwRKu/inR6qnquq2ISt41GsMzQZboJ4iWYuIKxCLbG
         GCcGL19JeuFYgQRE8PJh89n3Ky9enSIH+LNKEeEzdT1hvohncvU5rwNWAgHyWY1mSRu+
         5d5XoVF3RHm3K11p4xOavVxkdgBzNfDdhqUVzy+bQblLiznvoTAW9Jc+4D/OQKAb6ecX
         a45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081394; x=1755686194;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZSse5z3Xz3M0O4BGbTx+nqu/znB14s8R4egSwB9b9M=;
        b=ElkfowuFyDURzXJjI25OFUzgAiWb1EJAYW4KeWXty4z7dnSYzDzHQn6x18bl0f6XQq
         Y5/CCG4eTf2utWyU+AAtvNJLxQ/hUwN7iOu29UV8ZUyHgkRCmD/L+m6XrKjoZQesklxU
         sgyZSzNvdsQ5a0Cvp4Il+Lpgys/edFrwJgJoibpV7gr+k/mZxoZYPgSm/V0TcGZ46B8E
         iQVyjxNILsgTrPWXrly8bI0RMyQ3XSdSTDwLEbEOoPGx23nTDPmznDYR3cD5gfNyIDLv
         L/ns5nHRvOV2MHWjc5JwmOiR+dB7Noz3hkWRwGoxIzYYWav4J5e+Wb8k6uAMlO75CabK
         pZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg95iGP1Hmky2bUhI12piUQeN7W3iPLBUGsKmJuiAaM4Ud2o4+5aYSQg6XRCkVwsLowyq1BYpdq3Rh4/oCUu0yBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJ2QpeByH3MrFAHXOXsO2Ij8uVPidCvJ9wZHSTgdxvBK/q4g1
	GcFfM6zidN23hvQnK0xEIk9mMg4OHHC0eRDghUq9tLdE5ex/sZ+EasNMsd0aJgHW3Q2TgcwnW8k
	BtIXd
X-Gm-Gg: ASbGnct4tercF63Xbz2NpFStKbv1o7jns10FtqfbpOJovROztiNNTKs/UOaCTNutoCI
	ect5nH7DftrqSHSg8m7Qf890pHT5Oy8k97G4V4Rspsh8Tu8eNvlD3OI6v8qBowxgkQY5XQlTIAp
	rw+2K/iPg+cn236GfH56JfzSr/aFTIj8GgcqDi4FziVDHTfWjw8yTOk/kOgvA0XBRATqxkqZ/JF
	jX7cYs3VmFIWW2pKg1P42j/k3r+1TJlzvEQGwPqHEwVorBaVOpr4amcolFjldz8/53lrYyd1kVW
	xsTjOGyKzJ+5HAjzCfacjdYtV5KyDc9HACukNfLkb0dCmVFC6yWjxfQJTg7eqCvN38G2i4pugES
	UgkqcTOdGYrEzuMV4y+iILeZyG+wiu2w6vUNeN5DwLfgc1Vbwqg==
X-Google-Smtp-Source: AGHT+IFIGBvJE51ImLFwJEf+HWdvDhMI/ga9sn6qqV6XG49qX/4+cl2bNcAjFXq4HMH1UQxepumpXQ==
X-Received: by 2002:a17:906:4794:b0:af9:7e88:e174 with SMTP id a640c23a62f3a-afca4e6e6b9mr94000266b.12.1755081394358;
        Wed, 13 Aug 2025 03:36:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c08csm2392328866b.118.2025.08.13.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:36:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250731234532.12903-1-semen.protsenko@linaro.org>
References: <20250731234532.12903-1-semen.protsenko@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: Add Ethernet node for E850-96
 board
Message-Id: <175508139304.40388.17997940621075080202.b4-ty@linaro.org>
Date: Wed, 13 Aug 2025 12:36:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 31 Jul 2025 18:45:32 -0500, Sam Protsenko wrote:
> The E850-96 board has a hard-wired LAN9514 chip which acts as a USB hub
> and Ethernet bridge. It's being discovered dynamically when the USB bus
> gets enumerated, but the corresponding Ethernet device tree node is
> still needed for the bootloader to pass the MAC address through. Add
> LAN9514 nodes as described in [1]. 'local-mac-address' property (in the
> 'ethernet' node) is used for MAC address handover from the bootloader to
> Linux.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: Add Ethernet node for E850-96 board
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

