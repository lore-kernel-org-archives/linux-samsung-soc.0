Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B4200B99
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739391460; cv=none; b=nSReQonv0HBoEH7nZKWZ7IQ2H07c70tXpHe2XUVlsug7AJb+pI6uZVK9X0raxsAQd9rDiCNocN2WsHHJYtoH63eTzCE0TVRU8NlVIsq/Ewm1dfGhkm7iOSqIVtOAxd3X4t7IChZ5OM6a5vZo992EPvEwuzKOQ+4cGxLjp7/IMaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739391460; c=relaxed/simple;
	bh=5UoI9R/vnHMC/e5ewh7O59UF8eSXn33Jwv18AA32wMo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q1T7eHQDRXO732sI82n0DgSayXsyVZ8XWm/Sie+S8ERCFF5RgKOcLD4SfC76tLYBFYI7BpnY0bskz9AGwcqJW6CxDggzh4eVfKPYNIVnSJlT9JvMndQxBAogA+7xOSlCwgwY0JlvdlDovw07dMZ3MW9Ju3brHQf3EenGZek9Pq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXUfPL4W; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXUfPL4W"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dc9fc48fdso14378f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 12:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739391456; x=1739996256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbCZq/KdfJ+rz1uUl+K724BtkWwa151wsTK5+/vxmtI=;
        b=yXUfPL4WImdCKVd1sHNMY2dY3MDlgeG+hEfGI+q9GW3hrf32Yn6xSt+cqF+sfRPtOu
         xvqS+9SQB8vfSuMfmAsbdJvcLq3zHsZISLpad2WnxCzvjeVQhM3CoJJW+SOK+YrDkLBE
         yCa0xGDQe6OJRDtI8DKjPBZuwQsE319eG+a3Tn674BIYMyx/J/Cexsx8K56p4bixe8Ck
         H7aPoWgBkKtrFUZ3lk9fvHNck0lV84R6RCqmicjwLGXDrWIV7eu+EokWy7IqhYVrHOY+
         HqCk+EZ6V/wEGaHsX5wJWIoVCNK+UxCLfwQuoFowGkAL26anvLaR7CeyVZUkZhtR9lY7
         wXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391456; x=1739996256;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbCZq/KdfJ+rz1uUl+K724BtkWwa151wsTK5+/vxmtI=;
        b=Yx/C4NNx/WfziPv7/PhbxK9uf3/t9gLCnH7IrWkrZ+VpA5+27F6WU0fjLNja9NBPK7
         MPVMjn+77GzmTeqwBFi4wHi4z7GE1x/0BS2lJWkXXfA+Z97ckqM4d7qFcgzIEn5/Az3R
         Og1XDgrGjEfwF7fldtEUswotRY8hU6RPfqalGyILY8YYamgvqsAXhvtfSJdYbhMP245o
         5qhm+W+cgP1j1s2oCcGCFGN7JMniZ3jbhhTDTNi/iINzsirBsQQUxDJR/ovLm/ivRu2/
         otmAValovupefFX2wGsY+Jvm5FmA/bAdbZRtZYmlqOT2XXRiAFdK4McvJAC5ABS8KJ6I
         MXDg==
X-Forwarded-Encrypted: i=1; AJvYcCUVYwCnXTGxgJWV/VIWNhul96B6KYjhj6cuuObx/6ZBRKFWzw5dS7xhp0mxDD8vv7SMtKTR0iMSuOpj9h7ESw/aVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpJUnB7stuKNm7Ajr8WmgbsGcXW3RKeNXMsfGYaRaW0EUyoEg
	x6kyNPMJoEFb/bih+n9p2oWz8XSSN7+b/xNmJwC13z880K/VsWbzUlvWwGMKx94=
X-Gm-Gg: ASbGncvj7N41EC9MS+Q3oWZ+X7dCbuDUnZ63PzPOQCo2OjZQ4DGhlbZ1Rk4BP47Zrwe
	PfPxVzaC+1v5CCkJ9iS7gX2Er2dm9uyFBkXqWLU4Oew7AhyEgiZBrRtepInQrOJ1+7Ixij7eLn5
	U+bTxuascpDGKJo8V0CXhXVP/3mJFfztCcfT+9CCIrUMewpghbw1rlKK3AqxSAWZyrf4ulcN9tl
	uN60em/2eWedb76OCVLhzDkgCgw4lhhT0vAl+mbKtyVroZ3VZHkyzL+dWmMXj7No50WehtKROZn
	/EGnpxDDotXpoB/VqIdqWgwb+m9W1qA=
X-Google-Smtp-Source: AGHT+IHEzgbSwZhcHl5Unf6X40IETyxliC9eFPUo1deP0nfYqwIuq7PnG2+W9zZlMsgMg2uyJ/GJjg==
X-Received: by 2002:a05:6000:4184:b0:38d:eb4b:f9aa with SMTP id ffacd0b85a97d-38deb4bfccemr1276223f8f.5.1739391455757;
        Wed, 12 Feb 2025 12:17:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38e6ccc8c1dsm2386845f8f.101.2025.02.12.12.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:17:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
References: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos8895: Rename PMU nodes to fixup
 sorting
Message-Id: <173939145421.15132.11778260219053817821.b4-ty@linaro.org>
Date: Wed, 12 Feb 2025 21:17:34 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 22 Dec 2024 15:52:57 +0100, Krzysztof Kozlowski wrote:
> Nodes should be sorted by name but it is also nice to have same class of
> devices together, so rename both PMU nodes (A53 and M2) to use "pmu"
> prefix, instead of suffix.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
      https://git.kernel.org/krzk/linux/c/ee24a95b891a215b5fbd2f6814754301070653c0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

