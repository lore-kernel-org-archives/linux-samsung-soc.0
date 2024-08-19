Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8C61DD38C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 19:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724097360; cv=none; b=PlyhTHgpS3YQOHDb40JK2fmadYaHLW/OF4DWKi5R5fMlnWbUm/wAgKGO0Qcx0ARxb9ZVBKdX1EdSGHyaeSIhNsAzZmE6Dzsh23+H1GLHy/YvsxlSi389dWYqMqREWI/P/3X37zVlyOCc6fbXNO4C1A0VDLijKCG68cu0WADFero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724097360; c=relaxed/simple;
	bh=AmRXrDR/HxM6jmmA+cr7cIoPh43KtDmyT6MSNG6+mwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lYIAiaswJ2lFrt2QUXfiZSPpMDb/ZaDcX9S3tDvehZvvFmHLGbtQ9WvxCRiBPrkRefeot3DQ2aK6q5h8VBMoA1I+hOddKBAD/8By95CodAdS8OOvSlizq8/rCUw49nlVGpQ9GaEaraC630haSYOPMkFoSCl2hwCKgp/HdjNSJ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SF3+Yduh; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SF3+Yduh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bec78c3f85so3894086a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 12:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724097357; x=1724702157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnwEO5HVv7yekbUAyCXdQ/0odSRP0dapd2jtXrCrXbM=;
        b=SF3+YduhSVUftGOWaMPPTtXunkPDMH2cwcIYZhMGTr5Z6OnDSOXkNogMrzYtNvFEag
         IRjLtcndskUpEKcNCo6vG18iQu7K7bv/kk/RMr4+Vs5Kfe9k9fOsDjOq281oon+7SOsw
         Ivyz/yLODt2/dq4zSTaAMOYtg6jEe62F5EUXy9O2hg4XV83FLugLUfs/y0SY7VUz2BRI
         JoNTuU9QsBnGBdrgbwGYxMM4MqL8I8QbzS48k0VE25IajDPR3uvOXypgiFjS7XTcOy8u
         jsQfplTW1pPKj+yFVpN4lWXgoeDDuwAwqs+ITBfyJi9TtfrxO2i4LUD0ecDu2BKqKTU5
         cixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724097357; x=1724702157;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnwEO5HVv7yekbUAyCXdQ/0odSRP0dapd2jtXrCrXbM=;
        b=jiRbFP1JFXUz0m996FVNgqE13HezWu29qj2p2jJKKuoLhXfjCJf3Onv7QuoXBIr3QH
         GL9u5WqW8B/CpxuPWfZ7/Hlmb1jNsLM8i7ZUdCOLczikqmaO9qUNItjIGX/H/TQCZfvM
         qvpV2lD+hTCp3YxE4fa1te74OOzWutNroKCAdvjjuHOoa9lPaF2rR9Wu+ruTVO9p7GTG
         A+Co9ZIoO+O5l23Kf4IHxWFvK5WoSNkrTGPfjXE7cgzTVAeEatDRI/Be2xpgrq9dPQop
         LUi7DtENJl7IS7PIcUBwR/YDQVG2I0Dd+NYX2HGeF3mQYnGcuXmpnEsQPxEMVA1YOiuQ
         bX9A==
X-Forwarded-Encrypted: i=1; AJvYcCU4NkqiUYIs1rWSf2tmypjOyo43KXt4z+jR/FmBI+UIOf4aUpu75/RF+6hQReIhHUldvtdIy0RnPWeNKHwHhcEDMtMm5eXwQ7WQ8cAzaW6tPCo=
X-Gm-Message-State: AOJu0YwE5xmH7u8JUOXuKjYqmATjk2xT/FfBJ9fYJtpCIWORD83SNRsk
	dcciJ/I/tXRj3JupAldz+ZsM4oxCGZMRS8fBSrFv1aMIk4AZ/NKI6wesychXHw4=
X-Google-Smtp-Source: AGHT+IF2q93t6/w0Cbv5nNdD+LA8BZh651DVDTR4MZjT/8fZwn26x4kf1TLOJr3NGHVQeKkf5iZ8vA==
X-Received: by 2002:a05:6402:5114:b0:5be:e1bc:2320 with SMTP id 4fb4d7f45d1cf-5bee1bc262emr5999067a12.4.1724097356642;
        Mon, 19 Aug 2024 12:55:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bf0b0cc99fsm172687a12.49.2024.08.19.12.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:55:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, linux@armlinux.org.uk, 
 Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240813105545.1180788-1-cuigaosheng1@huawei.com>
References: <20240813105545.1180788-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next 0/2] Remove unused declarations
Message-Id: <172409735564.112951.9318299065289725369.b4-ty@linaro.org>
Date: Mon, 19 Aug 2024 21:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Tue, 13 Aug 2024 18:55:43 +0800, Gaosheng Cui wrote:
> Remove unused declarations, thanks!
> 
> Gaosheng Cui (2):
>   ARM: s3c: remove unused declarations for s3c6400
>   ARM: s3c: remove unused s3c2410_cpu_suspend() declaration
> 
> arch/arm/mach-s3c/pm.h      |  2 --
>  arch/arm/mach-s3c/s3c64xx.h | 11 -----------
>  2 files changed, 13 deletions(-)
> 
> [...]

Applied, thanks!

[1/2] ARM: s3c: remove unused declarations for s3c6400
      https://git.kernel.org/krzk/linux/c/d248577a158393059fdcd2e41cdc422611765386
[2/2] ARM: s3c: remove unused s3c2410_cpu_suspend() declaration
      https://git.kernel.org/krzk/linux/c/3c8966403dae49d3402011441f3c813787a40b4e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

