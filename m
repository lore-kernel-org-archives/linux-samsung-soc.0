Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF81FC7FA
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740314762; cv=none; b=lxnoG6SrCbkyGfrHpv/biWs+GpuV6DlDOPC0W0SO5Y5L9aap46xEZNuR9E+gr6N82a5w0CcBet3DXLB/gJcEvA5thL3gr2cG0BSzrzpAnQ23n1zdUd3WOeCFfw0C1qCP8B6fCHjEXtXeMluzBxwJLk9E3S5PcRMnvCx4bmjTCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740314762; c=relaxed/simple;
	bh=nIBKRUzzjXYm6l1jxa2y3dJvsdqoRKYeUA//1G94xVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H7nQKHi1O5m/bS4rWT4NE0NAl5BBtTdR/3CCsGNCXa6naxdFDchYtLA00i0KmXvz/9oOkKza38cSwUXA6BZUQG4gRNw1Oa4pLLjU5EGZ/Lh0zlY4yZ0jkUlf+vlansF7NovHxmJl2gv8shIvwatLJgXJek9xMfCdgy+sDAGf9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjkXXRUY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjkXXRUY"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abbb16a0565so46379266b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2025 04:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740314758; x=1740919558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxGLmwDwexFMvF+5G+z3vtNFg+fHiCX2FbyV66dEnmY=;
        b=bjkXXRUYF0BrSWWKQ9Nd2+DK1fvW7dpxbW84tpoQ6Euf1TCldHx+dbeKi8sDlAYzL/
         G99jD6vEwl61zG0033/WL8m3KjPEiftXxvdU64/SJIPYgf4TTgVmNWW4PAWZjMr5i1Tw
         3Vl23ls6R8b8vHJf7znCWhat0+B/ytq/rtmSmjwZexiWYkzDwdw1Tq4igYFEmpQjI3BK
         HyBKaFNRqMWxJeNCDaV7Y/BcKKp7WLkls5pb+ctdslHFGUK6w0L4ofWa9c4nOBxZiR6o
         vk/BDZLB6hsUMokhv4ctSI2hfLKDoNCw8cnNQB5NVxCX26zcSVfxXokjYI5wqiVHrvwB
         LDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740314758; x=1740919558;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxGLmwDwexFMvF+5G+z3vtNFg+fHiCX2FbyV66dEnmY=;
        b=NFrVGE3QgSLQrMz8x/Rz+KYu1442cB98aH7dtybopshKg/6vBcAJB0NKivxPhbo8/X
         gniBzMg9LR3HiNQW0eFra8btO98y9w2nFZGdX/e11JpC+E6MneFQfC8UVi9tBVwH9Gh8
         MRhTWfhtq66kjliMfNpysHJIKhxvv+kuo6aKbYefBAEPlS2zXKb20/eJ+CeaN8XbYbfW
         Pw58infEZYzVcCnGXgM0jqJ4PuFySdoLFtIin02a3rcDDJnbZ3N4CvnPXOVdq5KpD6ao
         K5+5UOG6L2XU6034KVZoH2k5yWYfmr3gnFqDCtic7fdqG4BNfcCGQk8+t2WGfIFqCGXl
         E7LA==
X-Forwarded-Encrypted: i=1; AJvYcCXjLizvn8crHL1F8zpsNSSsojiddp2fBMiZJdULrgFBnw/nPWvi74AwWJICgpjrXzyxtMWom1vi/hr1/OHAAVxhbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoR3svxBpzjHDv+i33ayaAwtIVL3HPV4WF6YnbmFPS8NPEHx1F
	pxDItNh12m7hQvNMQrE029XKqUgcz1JfeBuuT+Js3B+FuL+eFznZow7Pbj1tRHVrbz/sRVMsJy/
	NIbw=
X-Gm-Gg: ASbGnctOAHk0yV1ivXMuZPgPFnQdTLNEvdJK809V8b/Tm2kQ0y9DzJB8heTG78J7Epw
	K4txNLqQaRUCLwVNEF2qKYMO+inPBHYKVRbjTKS8E9CKw2kfJOwrwtzvZwZSqs8xhd6DXxG05hd
	gqTIbwKVY+Ea5ZrCfuJ8PEhktX5q4619ChsD1sS5wWWqh2ovQPxsjE5nX2kCVDOC4PvcUR+GskF
	7MTZetHtFx/uzV8Of1G74ePzF6//SpFXj6Kzvq7I1BmLFCLnvWCE6CHgXUNPwYm5i3/cOlmHPca
	a70hV9hKLWtBCpPhpwBTlelVTD+koMCNBJDrzoaC317gljCD+FvwS6uLEVuqWUz+YtG8J2rUhIX
	1
X-Google-Smtp-Source: AGHT+IFKCmAEZUKM6icp+w8U5a2oBjpzNrfLBOKKdYNrGEY1U63jOVDcOQc/BfZTE5gPTEiU2BqapQ==
X-Received: by 2002:a17:907:c2a:b0:abb:444b:8472 with SMTP id a640c23a62f3a-abc09bed469mr355018266b.8.1740314758257;
        Sun, 23 Feb 2025 04:45:58 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8209a2cbsm1555460566b.133.2025.02.23.04.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:45:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, 
 Sowon Na <sowon.na@samsung.com>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250219073731.853120-1-sowon.na@samsung.com>
References: <CGME20250219073733epcas2p1537d9cecdfad313077aa4cc4bff8a6f0@epcas2p1.samsung.com>
 <20250219073731.853120-1-sowon.na@samsung.com>
Subject: Re: [PATCH v5 1/1] arm64: dts: exynosautov920: add ufs phy for
 ExynosAutov920 SoC
Message-Id: <174031475590.40795.1242033938168164812.b4-ty@linaro.org>
Date: Sun, 23 Feb 2025 13:45:55 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 19 Feb 2025 16:37:28 +0900, Sowon Na wrote:
> Add UFS Phy for ExynosAutov920
> 
> Like ExynosAutov9, this also uses fixed-rate clock nodes until clock driver
> has been supported. The clock nodes are initialized on bootloader stage
> thus we don't need to control them so far.
> 
> Changes from v4:
> - Place entry in correct order instead of appending to the end.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC
      https://git.kernel.org/krzk/linux/c/5893f538e331609fbea244ed14732291edd6ab22

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

