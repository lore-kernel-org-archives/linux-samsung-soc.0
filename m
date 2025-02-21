Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D86205E16
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Feb 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130920; cv=none; b=K5ygtMySD0MKL8BROcpBKI4MxRzCNLljGG28E+GinPt+YIF+mLQz8jlVahyjcHQz4LVU4aaGJkUZSiIzLcOVc89JGvM8hvzr1HZqSLn5rN8Q1sDV/Gb0WtXuPdYPCrjDmFVGS+CZgulYD7w9ixh8dspRYaJmo7b0XvjSdglwNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130920; c=relaxed/simple;
	bh=IKR/9VGhkFlJ1I5hTuDF78Fb+ATo1J45kT4X3heZ8gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FvxEHerqJqgzoQmtHd2mc+hB9FFvmvbRtir6Tx56ShLrAN82ZqFk9mEJfx5dkoMcZIZlPMExY0J9GzAE3J7omAOhW6JMkjKVLgYYCijA8iDxKERDzYZvwlNe060X6RuG2U9TJpSUed8hBk0hErgGDQcz11obabJxLrO7cOh25/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sktPy6l0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sktPy6l0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso325093a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Feb 2025 01:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740130916; x=1740735716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdXYR/I62+aZcxW37aH9KmdUU3jeSFhaY6J6vyoXK9Q=;
        b=sktPy6l0ghLaloebH3iJRPfolp5lpZWD7oWeG5/ZeYcIMJmoqwJpwQhyG2KLzNHw4f
         R9+U1pKHOhmXHb8g1okQ1UIwiq55Lfw53P2qHqflLhvcAq5KH3b+TmeBNg2HAHFUfHXe
         U+FtlolvhldLC2sMySbv0aZybiC/n/9nVIUn36yOnbHPWHLyZEvvuZI7jm1u2RC3oQcL
         m1BuuMOb/3Y8TPN8zj9Vb3K90lUqXgL6Gv0t9026M7pFPFEdBzd0freII3az3dWx1vc3
         7gudrR+8sJGlQk580BV3BsovdHc2Q8iTdBevhetclD8a0mT7ADmR2R3zHhVV3zhOXI/K
         HRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740130916; x=1740735716;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdXYR/I62+aZcxW37aH9KmdUU3jeSFhaY6J6vyoXK9Q=;
        b=TUer6ik3inE8ZUOY30wHoZtm/WmXIe6W5u0+U9HPDd0fpq5yYjMAn6RXZn2RqYrNhs
         bFAZ4qeoKVhDAomfUJRJRcfoReA9NDLpLE5q0FWWA34gAY6pKbXMXd5JnpauvnCwVlrP
         qOAo7B87SdOFisnhMaYZxmiJmGBdj9nZgTCkrZrF5n9QV2w9sQhdndJ+/vTjQ2906GSD
         +iL055W+G8F0/VBYSz1LCVctCXPyTjKBZ+KTaTEVBDag53kVtGnWaYD2Xa2v5pUimilZ
         Z9mg9/WuDmGBz1VgnCkuxS6grpbmij0sTovWS+3gmh3dr/n0kwy5QE37ktgazZlqulE1
         5E1w==
X-Forwarded-Encrypted: i=1; AJvYcCXsvU0qlrQ8/06YknsIMaFWZ/+npdnFVL3Tplp2alUGpKY/PFDXeUoGppJqDNqPDUAxkNDsYtumdcErtkIMAt7LXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/fQfI1Ktb3ip59pYNhJMv5YNvcCIdsoaCjMXLXiQo7wnogYSv
	USOil+pgiG2TF4fv1slukQos1vFmkJzaQPblvLEbH3ib9kVWlPGxhO5UbmzM7jM=
X-Gm-Gg: ASbGncsYbEAs6UYr6STegkH+tXq/VvzL77kw59fQlJRMC6YLZ1KlwxOenIqwnfMoCm7
	zRoqgkLkWmMcIkqjr2FIoEwrCN+/ZD6nVwuSfgzjQTiVHnuy1QoPnCzcEkGOLEh+mq26Exkgr/o
	esqn7bjLaMGdoYYsXD9RIKvAxU0a2q3DN9FVMfd6tkPJboQW7UlSwfKNgEj6+qzDH4if1gS7MKp
	sV8NFMeFuvqOO3vnRkzRbBsUYx8LlF8gLN9CHd8wl+f2T7FsRQFIkE6J5GmtiLiy4Oi8ihE1b51
	hZyU9wyLVeatH+4PgRqSbsYEnUcEX2ny1M7keykn0EyV8EJXKJuxPFA5Y0kCy1gVLiQ1/UDTcCm
	b
X-Google-Smtp-Source: AGHT+IFL/lM+F0ktUjddFj5OzpJ2DJG7fI8Z19V6vvQBBy7jA2Fb4GY7EiIh5I5iCTTx716z+h+jMQ==
X-Received: by 2002:a05:6402:34c6:b0:5e0:8275:e9dc with SMTP id 4fb4d7f45d1cf-5e0b70bc3c3mr703304a12.1.1740130915955;
        Fri, 21 Feb 2025 01:41:55 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5323226asm1617470366b.8.2025.02.21.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:41:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
 <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
Subject: Re: (subset) [PATCH v3 1/7] dt-bindings: hwinfo:
 samsung,exynos-chipid: add exynos7870-chipid compatible
Message-Id: <174013091442.25434.11831404613747395475.b4-ty@linaro.org>
Date: Fri, 21 Feb 2025 10:41:54 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 19 Feb 2025 00:33:11 +0530, Kaustabh Chakraborty wrote:
> Document the compatible string "samsung,exynos7870-chipid". The
> registers are entirely compatible with "samsung,exynos4210-chipid".
> 
> 

Applied, thanks!

[1/7] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
      https://git.kernel.org/krzk/linux/c/0a86ea5534a9e4ae988a2e174e741b102d8a8691

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

