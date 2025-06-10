Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB028002E
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 08:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543837; cv=none; b=Z1UwORlmNvUHqGwdxsyOYQZBehYlVJQObjHcJyy16DqTD2Ibr62Du4BuSUW3ts8jlB0BJx0nYZfakK80QNriRIH5WmTAQp1/ztzmizPZVQTgKL6NTVG+3GufV3wf73/6BNca5ISMH66gwnSzsmgpZDHlhprAxUCPv3PSllCQIec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543837; c=relaxed/simple;
	bh=e9oAcL+CeR+1HIUcEmYkknHTxdEGJkaFAv1VpnSfaS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cKboBoDyWGpDAw8GJ3KS3eTX2smHJxQkjRsBCImAWoa4ctroMlxz4/yFs79YS9AsKZAnepQaFzZWkupR8EvUGIppst/SERbUnEj89D2WxDifM4xw8Z7Yadk4K/0trsXzQ/tYsySO/FdBmsIEJKtcd6EHLpPpmjZesdgjzFv490w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uKOm1U0B; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uKOm1U0B"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f7865b22so820603f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543833; x=1750148633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBxAXQ4og37PvO96w1vWDExmrp8j/q8vrTsgZLWvYOs=;
        b=uKOm1U0BWkslc8N/6Xqn/4N7/Codl0yzQT6P3p+Ms1hRTgnJ0s/FlGKj1OdtPOFJyg
         1Jc56yyGh350Wz7qkuDulN7TdbcMSU0DyebttwLuuvg/12br+LoTF1ZcMHV7idgC04xD
         5Zq5CLQwzv6Q1ex1KYaHYMOn6W7EMaJgGN5vBXUQzXB0PRfuCxlDBAihw9IxM/807Rpw
         G+il0BFaTA7nsp867EGcUDfwwcdCquOAypGIoeeL4Aocd4EqAES1/wf7UnFTJA4x5nJv
         7yQUtLVbBRxyP7E6LzuOmJ0AxFQqozsd6Oyqv6jiW7+k/tXN8ktk7AoD3IkSik3ebboW
         jUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543833; x=1750148633;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBxAXQ4og37PvO96w1vWDExmrp8j/q8vrTsgZLWvYOs=;
        b=Rwit7RmSEwPBaxFHwCI88W211jfmqPmetEX2RSTv3qTQd8LtcXYLdEYUhkZkj8qkV1
         E+YkGRutKbcfNUKtEanmAELBUNvSNS3t8MSfTLMrkEByIkRna15eUENLy+wZzpsLdg3o
         kP7b3jdffiFkTE/48lACobuAQLUDDKQ5oxoFEV9iFMcF2RDWh4N8gk4dasL6rIoIilHQ
         AbtAu5eoV4nIDOGdeYmEVoLHm2kedTbVTaOjXh8H/iMKetoVmqGbLRXSXY+85AYkYJh4
         mD2D3gxMNuaqNWlHua8u5OwgZD9EsJeIHtyuhbeYziLhBFTaKd1driDJpDkYcBw9i1xd
         s7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY8rBD/GK+CGmj2Yx5zuTGE7r1hIV+6bQx3Yk0vHbB5g8Lz4ibB/wI9J1+yyoUXvDZ+SLT5BT5R0XbUDnEKx3M1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEkoa077o0RE4oMGpWkWxqoxAmo0Gz3UeaqlAeyCovQEhaN1FH
	2kpji4ONi7aOoGpNsofseS55n7+4KWmcKBpEEDytO+MFt2mr/54JLZviyMPBd7brGXM=
X-Gm-Gg: ASbGncviWpLXakKEQb3E7fIKykeodq4GgoIswl8YDOJYNP+ljaHozdIVOabM74Agm+O
	7wxUtJM7zbE+i8DxpxzuYZKESJWEgCoMHWlkBLTOkvkvf0eIG+1UAVXZmSiR3ClEcaIYLYk2LpT
	g7i5FOVdBX6z20uySDqdELdhiX8pbTc0zYiXTxKX86a1UMHsCTOEdHcjiNQIGJvIZJKj7HmVjNR
	+z3D1WU05R1p05ywhOVzpXbnEIURjW+AEqim7FWUiURanLF89QHLRw3pAKYfzioiQ0JyEUhmwbA
	mqnz7ZX2damGUXgSlar0w50F7bFPNfq3bNkdlCUYmFVm7FIxPRXI2iOmO2zaxPX2/3slbXD3i9x
	j3bmXqw==
X-Google-Smtp-Source: AGHT+IFLwwa37CYbsr1MbKfJxcmnYwF2LSIesmoDBnoKTLnOhdfLiZoIbrImjdVOaLG8nyFXNzvzeA==
X-Received: by 2002:a05:6000:4020:b0:3a4:e0ad:9aa5 with SMTP id ffacd0b85a97d-3a5331930e0mr4884181f8f.11.1749543833624;
        Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
References: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
Subject: Re: [PATCH v2] firmware: exynos-acpm: fix timeouts on xfers
 handling
Message-Id: <174954383237.117835.15219836024392160650.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:52 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 06 Jun 2025 10:45:37 +0000, Tudor Ambarus wrote:
> The mailbox framework has a single inflight request at a time. If
> a request is sent while another is still active, it will be queued
> to the mailbox core ring buffer.
> 
> ACPM protocol did not serialize the calls to the mailbox subsystem so we
> could start the timeout ticks in parallel for multiple requests, while
> just one was being inflight.
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: fix timeouts on xfers handling
      https://git.kernel.org/krzk/linux/c/8d2c2fa2209e83d0eb10f7330d8a0bbdc1df32ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

