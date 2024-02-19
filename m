Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2348208C0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Feb 2024 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708329039; cv=none; b=fpH1FZytBZ1FyfM0sv6D0WYBhbx6xlrP/oCAl2L3YoJoY0Vx4wg4inQvgPdh4+ue6EhuCA0yw4vSsx1tprUn63/omPhTlY7uyzMMoqYQDS33MYubJV7w7eFbQbxBOouZkjWK53FxmX+nT/UEpfnKZO93fl6KDkQKEtPT45dx92U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708329039; c=relaxed/simple;
	bh=XYK3Z9xoGMtcf0C5iGt1D1Oqbnjpo2Cc67mUekbFkFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FYNTD2S9YpmxJSdOn4sOGargEA+RX4zUIsMkgCdlKdj92pLfTNaBhegix7LATg87ZyVfqglZjDOhlj/iZWRlPx0VkKl9sSgvrHcBPFa9T3EDdRV0vFMrAnhvXRqQPxTHLOpqO3Cwyd/UadjYB04FgM47Rd8YRQUn+yX0PsymrB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ThE5gfU6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ThE5gfU6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41262e0475bso6686795e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Feb 2024 23:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708329034; x=1708933834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5f3tdyEIwEW48zRkpDDy4bMS+MsHmiVrbPEL6SbhvsY=;
        b=ThE5gfU6lMMBevqY5buUgBs/kFGosxQGZq8Ly5nlM0Na26Zom/UcbCSTO0El3WSujK
         neG0gyGzbqaFKOGc22XGxdyLVXb/W2Hs5lHDNpEvr3ba0PEZmfX1afSO0GvGFiHAMcYL
         EB6+JuICcozTXd5nBXhIcMuTl/Np29RawKvB5K4cP7KWQskWo+omQ6o3M2WNP3PGirUy
         FceFDOMMgX+FHIwiiYW0N0FQiznOc6MsRa3HGQmKRWXwLIAAVygZ962CId0eZxmnAh1v
         2BL1aYGv1GWsp2E2tIwJQoqm5DfyBO+Fi0b05ZBO6vJULy4JuR1VVIXrN2xVf8OGJw1M
         yl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708329034; x=1708933834;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5f3tdyEIwEW48zRkpDDy4bMS+MsHmiVrbPEL6SbhvsY=;
        b=JY0S2PB9eLahjMayy4hpl0FLchvnSD+o2R1kGzfoulGFUbdzMRMn9RFpImxWxWLXm3
         nryY0gKg/beqB9WvJCZF1B1F7k8dz/aY5hYvvZzKSaX1UUwsmuMShs/HhbP0fu21IIaJ
         N3uk+Qqhccy/YvRQDnOWIP+KRknPkqYNLAK5jFWzkqB14TqtSg0F7ER8Cei9P74krP4M
         ypvwvXDQ8hZ1PPbChjbuZ0BpXcxmBvTszfkzwLXlBgyGuDTAvR28HZ0W9673JAonEzoE
         qfn6hHSLi4ZZiCTw7GPNWLbxyMHAMFkqkCvXVhZRbxvk2919Dv/3XGM1q6xuLmSkXDFu
         7S2w==
X-Forwarded-Encrypted: i=1; AJvYcCX0+oPgQX03kXlMLj84estzCw4484AfjOtI0uN8Gpp5Vfvo8G8KJfu39OCf3nmB3IEXBV654kxfeg8r/N6HRXkaZTQWJNOwdadkDlc6Zxr67vM=
X-Gm-Message-State: AOJu0YysdyNmw1EsLl3f0MbkjoWDSh6GftCB/7eQ5mBSRr8QBXNZ68Af
	t0UJkBcWq84/ktfkMFSZbyx6kWFveQkYvvC9bLW3JYccSASp6/kqf6nWNrJ2inM=
X-Google-Smtp-Source: AGHT+IGZOVx2qBIyU9vquadjGw6B2HZLR53t2tGSxJZZrcQQTEg3oV0tVaAyPwkw/lyC4dItgO0ITA==
X-Received: by 2002:a05:600c:a385:b0:40e:c06a:3ed5 with SMTP id hn5-20020a05600ca38500b0040ec06a3ed5mr10672872wmb.2.1708329034420;
        Sun, 18 Feb 2024 23:50:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id p18-20020a7bcc92000000b00411a0477755sm10414024wma.9.2024.02.18.23.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 23:50:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: Henrik Grimler <henrik@grimler.se>, 
 =?utf-8?q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>, 
 Jack Knightly <J__A__K@hotmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, replicant@osuosl.org
In-Reply-To: <20240217-exynos4-memsize-fix-v1-1-7858e9c5f844@gmail.com>
References: <20240217-exynos4-memsize-fix-v1-1-7858e9c5f844@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-*: decrease memory to account for
 unusable region
Message-Id: <170832903316.9472.8907322109403267852.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 08:50:33 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 17 Feb 2024 19:22:40 +0100, Artur Weber wrote:
> The last 4 MiB of RAM on those devices is likely used by trustzone
> firmware, and is unusable under Linux. Change the device tree memory
> node accordingly.
> 
> The proprietary bootloader (S-BOOT) passes these memory ranges through
> ATAG_MEM; this change allows us to have the correct memory ranges
> without relying on ATAG_MEM.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: exynos4412-*: decrease memory to account for unusable region
      https://git.kernel.org/krzk/linux/c/5fb1252944fc3bba4a1026adaa9d150cfe8a3e16

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

