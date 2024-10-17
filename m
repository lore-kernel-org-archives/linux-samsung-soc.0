Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C7B1DA632
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729152214; cv=none; b=ND7og5d7rFeGxvTs+UY2BDSOATZdtQdn+vWZ01Wb5heTDcD+rBMozqnMVdUWqQ3CE1gLIpbZwwmLXheV40Ntfan2ncraS2zSLoqhvZg9RYBHSIDweAbvsaFlp9Xl0Z6wv5k5IjwwOiZM+SmG1ZpxL4fx8xkwMB3DbaCKbwZyKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729152214; c=relaxed/simple;
	bh=83Dd0h1px/j5ajoCG4zVpqu1+In9jyu17dpSI+y3J5k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WKrNkeccEln40rVzpwHf4CMAl9UE0iwGHbX0MhMK3K1oquSWXoAyL6uYe6rh0N82iRdq6n6TOKxRKsm0tRyCY0aUtcsoK6GsumKMxrs9/8eJI+fjOs8tZ+hSXw4YESpIblkVEIs7Iw13cRKWuuBVCWPOmG5/TlufWVWZtXxxU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TY+IwGkP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TY+IwGkP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43054ddfd52so1097775e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729152210; x=1729757010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXsd7OwDazZFDqhWrK2bvttfQ59ruGxGdVAPrWSzcns=;
        b=TY+IwGkPAKVf6gSp04CMoJyk/S2f1TYIAmGRkgxDHbinSstGfgD/i8D+K5gxrpylmP
         hjrtVkWApzu6243hS2zr/HSJl1f4AVyWHvAzaqO3xT42h/QXVIHBtaDThu9KoK01HBxZ
         9CMF1mRAR+FVcLn2ivvdRX5Tb5nehOXHrzBYNK4l6pLJwYbT6F9ITFmtIHM8AEMfi/PF
         NgUKhB0XVzvB2ERF9uqNrct3Fj0OK3+e/YObLJAssB/EATyf0h3LQQuP5SqDoZMAugHW
         JEgtHFDFpBl5XEka/L2ycpSyHl6MN5So+olD4Zmg5atSdGkNWYLHCGgD+pqkQU5vVhfq
         nrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729152210; x=1729757010;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXsd7OwDazZFDqhWrK2bvttfQ59ruGxGdVAPrWSzcns=;
        b=vmrcrAsZePyf60MDmq6Sle++TYRFeN/lAiT5xPxfwZdJaa4B/YvdYjB2ZpyYtaeh3f
         Dl99KUTFcP7RaoJ6D4Xo9h8AvrIxiZufO3s6ae+NF2lFj31xgYCJ/ENRqsPKRqTNbdRW
         Ehp82QeQnoOR5Q1RLt8nHZ6DmBghTTlPsc9stgpTwM9vgz6gHyvmND82kazlTiVKpiZP
         U4FcGsXSJ5NApubzg7WKfyylJmK3oUknVEoDJ3lwPTVumEavZoW1pXVm5nkoS0LFGVra
         zDM8phx2STme3/lb4SJwKgVfhwQahiOpxst6kKLAg+gTrhrarNNpHskm7F3135xV6gD/
         vwzw==
X-Forwarded-Encrypted: i=1; AJvYcCWG+nOnQON9DE9Mw0v53XfVoS3ZKgsKQl/yX4mLtSH5WDoq8PEJpvgRobrrDeCVN9bHvdjNR+L3Abm1cDN4lykavg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyEFZFvDw/f7Jc7dKdOFq+EwoyJveS/mzTNgcy6VTefRt91XjG
	DekKerFhatlhw+iACpjHCWkKjlgUgobBsRHpnEnRWJDgRno/ooYulBRUXRpDtCY=
X-Google-Smtp-Source: AGHT+IHr1OcjFahO9alclfAwT/WY6QFt68A+u/zlKpWaJcX2JRHqW5bckWKzwqLpuoosFBGXYQ1Bbg==
X-Received: by 2002:a05:600c:4f10:b0:431:558c:d9e9 with SMTP id 5b1f17b1804b1-431585e4aa1mr7672805e9.5.1729152209621;
        Thu, 17 Oct 2024 01:03:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c61aedsm17631915e9.43.2024.10.17.01.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:03:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241016154747.64343-3-igor.belwon@mentallysanemainliners.org>
References: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
 <20241016154747.64343-3-igor.belwon@mentallysanemainliners.org>
Subject: Re: (subset) [PATCH v3 2/6] dt-bindings: hwinfo: exynos-chipid:
 Add compatible for Exynos 990 chipid
Message-Id: <172915220833.18392.17035280597662284700.b4-ty@linaro.org>
Date: Thu, 17 Oct 2024 10:03:28 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 16 Oct 2024 17:47:43 +0200, Igor Belwon wrote:
> Add a compatible for the exynos990-chipid node, used by
> Exynos 990 platforms.
> 
> 

Applied, thanks!

[2/6] dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990 chipid
      https://git.kernel.org/krzk/linux/c/c6dac8443dabe7a9215f00025f78a9c55a0651e6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

