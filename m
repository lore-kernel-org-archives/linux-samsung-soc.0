Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FC380B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734877571; cv=none; b=of7yNLthLAsKeKxGgkNZaclIHIPqVsv2Elm4KR8eex6JYh0axpqOVkWqfvGBPldVUiKjP0xp5/cfkpH3TTy1K4pJWEv6neBypvzoUmh2IpGAdBjRTkeLgTMDzMzhXSZRX9cCQohwTNE+F78AuNAUP8UTBUvq3PrhIvzlpEBm2ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734877571; c=relaxed/simple;
	bh=nfREt+F6UPpxUaKDDrU1bIh3Hds8x0wN+gKl3MzzQOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ivgQW5+QUfiOU6h6+Yg8JHP1+8VTPVzVNBAnvh1fArBG7zPMfnzJONQfprH0rrJVXa7g6NAO5K3kNR6ZpMu5geLq1yfHs/CyCa2Sc68ROom0sjQEO0qbppFSJKc8P6Q+fZj+QP8dYgT8gfVkGUOP2GXT3GyrbIcn7wLy+EdW6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HUzFO46q; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HUzFO46q"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa659775dd5so55338666b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 06:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734877567; x=1735482367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fv2CUS7ZbxpkqmLJHrcp6kZwBl6Wt3zoIFWY+Ye6cE=;
        b=HUzFO46qOFheUT4pLb3ggtXjMCyXnSV4CspxqPuLTO66IhdwdSCKInDqDvVdy4IH0O
         QHLiT4LuwO9yPWLBr2hoVtZzWmYnPR/DuNATEzWDHWyyPTzgD+6XQY6oB5wPtlXpMAwY
         W+3rku1HpLJ2qFrxHrfaxwKxxhojl+AY/VYjdFaCdWleJRkowAkzA+qQ5klNvks5fokD
         4ubO2nG/DEVY69mhRqJpK/KandivR7iz6EECOppL45v1UZwMv51xlo19T+TRHV21AAeH
         uv11C3+APc75/kqtpbLtCVA5C3S0K4dwylHg3EGtjssI44EkCCbRY6FxNWeJUoKnDy3y
         rT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734877567; x=1735482367;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fv2CUS7ZbxpkqmLJHrcp6kZwBl6Wt3zoIFWY+Ye6cE=;
        b=LhSYS5F2k+zjxBAxL/PRN6m2EdOoRwS9UlI7U1SFCujkmz5orPEzY1uToHK0fo8y8V
         UW2G1WVRyl9cNoF+O/9lT/FY6GoQHbzH/c3wMboMKAGh09w1pjAuEnD56pADe3i2Vl53
         hRpDa3BAlfyhQNhpIc085M33gAjt4JZxE3xy3NIWFMY6STg5nJVapW2LuGToBpRf7DIW
         McGxPFwxTki+tFmNjYZR3tBcHR8A/jdE2SRHrlimycof5k2enmPmi2lHRfKhpeCWEjlf
         23PJsV2QrpAbnFI55HS2M6xcWyVweoau7z4umkzErtxEIGPQfODdq6YDs5wCUaTqBSQI
         Prvw==
X-Forwarded-Encrypted: i=1; AJvYcCUhPbzQEUNngh7JWGIx4zdGhAvJ+l6h3J7Tk8KooBwajoGM0IjL4iiCvF+qg7p0K2r1EgYLc/7+88ij+R5A9yk4NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXzdChL165HgU126YYwndirUmFXnGlDentzmi9+0UNvedraAH
	XNrF2fxGlFIvZGRUjVY9CEXteFEf20hZ38+YD6vRQzXkiMZjZOIinl2cclaX5Ek=
X-Gm-Gg: ASbGnctrHjUES8ySMpIuYZhz4/JJ5XJuzWtkhFXukY29TYj0rs+pJaXGAT3PfFpoFl9
	jKFXX0rVmENLE1XNE+LDrrnDaSPDOlIQ3u3g3J0sMhgJTWYtZb+2lKD8zuc6zlMe/q9qnrravo1
	y85eANWxNT0vxgQVysHgFzJ8L90bSSyHx9LXyEkemKyCMIpGLS6Am9/IK2Ha0ijhWZyjAZLqJRH
	NytVxMTk1BhDqnm0i3RLHGCm4ezeh0IiDVgWJE516XEbWzrd6+zqA+7OT1D1uHQxxtk7qR9kbD+
	3nClNV3ufcEIFKAvMNyeOSMn4cRGb5g=
X-Google-Smtp-Source: AGHT+IF6cnIbn11yHwZazziFYqCjkPi3z318Kw+gMS01o7Ckh/xs17Fg9qz8u39nDgfnBnEA00iHqQ==
X-Received: by 2002:a17:907:6d1f:b0:aa5:a60:ad6a with SMTP id a640c23a62f3a-aac2d4472c8mr325314866b.8.1734877567625;
        Sun, 22 Dec 2024 06:26:07 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f577sm392716066b.18.2024.12.22.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:26:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 igor.belwon@mentallysanemainliners.org
In-Reply-To: <20241214115855.49138-2-umer.uddin@mentallysanemainliners.org>
References: <20241214115855.49138-1-umer.uddin@mentallysanemainliners.org>
 <20241214115855.49138-2-umer.uddin@mentallysanemainliners.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: exynos990: Add a PMU node for the
 third cluster
Message-Id: <173487756559.3738.15589488923856918285.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 15:26:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 14 Dec 2024 11:58:55 +0000, Umer Uddin wrote:
> Since we have a PMU compatiable for Samsung's Mongoose cores now, drop
> the comment that explains the lack of it and define the node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos990: Add a PMU node for the third cluster
      https://git.kernel.org/krzk/linux/c/86c0d7f230fe71952cddac9905e4c090e09ecf3c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

