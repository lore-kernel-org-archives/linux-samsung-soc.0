Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D471D1448E7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256275; cv=none; b=lRogT8d66FM/kXJrxbImYFRwpDBkGAAb+4i49LvmFq284D34+tv+Qvsz6h5p3jjOoDI2jTF46VotPpZ0BuEC3BTwYJDONhI5Bovr9xS5ix2Mp5gJOjxLMmzLXGOkT/s9PSRDQRpttrZeXSaPbARNoLcoZFWN8SKgny4KmgF1xBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256275; c=relaxed/simple;
	bh=DNhanqTWJd/OkgCTvbBYdOC5y5bwxHTguZCfFa1RUyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T5g6P1zJzS5DqcUe+hLHwyPamUIKzfDlKXH9IY5G/EvUZ87n+kpEDmh/HrwZI/wTvX7f8JtsIw04OWCxACym+tJkPWC/xnr/v+iCx44h7TmJAZz4JVTva4MU29yd43bajeKg1e0odq/Id+QlnLhYXjvF7z4pTxwoxCf6cPrERbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xx2+iyqK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xx2+iyqK"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f04c1e58eso4258591e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2024 05:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722256272; x=1722861072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7hmd3mWm1gQNax1rdnBwm9X3nvRpjYNFyOf3EAYVg8=;
        b=Xx2+iyqK2xILW5rbylj88DdGnDjEPkDH+GfKyPJl4dz359q+EUq4MihYUQQ14EkytO
         hVHNdZk4bPDRfMAeRccC1KWZu70IfX1gTaUDAtAI5/4krI4reRk2R52Eva/2R7hQz7RI
         QbfG9Y5XK0fqiaQu+U5eGXu7WJwBkmh8S1rVvxurWwOl2aWWuAZwVyw5rC3bTGap9hFP
         Q7LWHzxwjd/18vb9++74fFlNqm1swXhp8r7+io8UhyZXOgII3h0O31RNi8Bi8LHnM3YB
         K0yteUmWUUzWqD4zAttuaPkv8NguKKsLPkxQaL1NtQnI/cHhaZtc89T3l6ZK5ZRco/ui
         w00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722256272; x=1722861072;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7hmd3mWm1gQNax1rdnBwm9X3nvRpjYNFyOf3EAYVg8=;
        b=MQEa6wszqmzuwkQ6AoLHBe/YmVE5JZyLkN4xDC2orR4We5aQ8LjbA6ry5T66l/D7kr
         KmYydcTbh6G+BAHSy6bPRP4CLzTWP689LnJNI442wvzf/gg1xKp/gfq02m4Xjv1g7GV/
         yGjjnvL3KpUbr6LkdoMXiGTpFPIKqyZMxxCyCKMxV28j12qKEuJX6j92AL5SurX++DQ7
         RrW0vcBdvYk96XGZXLlc+xQwE+1GcqcAS8z3cqY8KRriDaAz9JluXKarRTMZFMf3+hAe
         0VXj8AXue6JbATk64uQPTR9Qo4s+mDV++qmhimWRBjrAorZMuJlkfIj17urVfWUYmKT4
         j7EA==
X-Forwarded-Encrypted: i=1; AJvYcCVWkcYK2jk9Jqw2aTyI9iKWXnF8BA3lIdG+uyVSzFAzoczEiAmioI/UFhFlqh9SHdwj3Qa7b5IPhV9eCGM8ul+EG58DzfCUc3FuGSlSxK+ddIE=
X-Gm-Message-State: AOJu0YyO/Fa0heATyZ8nfotoTzQNEkWbxO1IYFJvvkTmIhMRVFyVbmCi
	CAAnq+etAdTXi8i62P61DHHh9mVT4tKR0HcvYUyAQJQjSa/oEwLcUpSRVchy6h8=
X-Google-Smtp-Source: AGHT+IHmZcVRj+OQubC+Y9JLE+mJvdVS0zZVFUn2gdyL1G0hR405kWsdn6atd1FZXPPAZ9g+dW56PA==
X-Received: by 2002:ac2:4f07:0:b0:52c:df55:e110 with SMTP id 2adb3069b0e04-5309b26928bmr7668841e87.12.1722256271901;
        Mon, 29 Jul 2024 05:31:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab22ff1sm501973966b.35.2024.07.29.05.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:31:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Virag <virag.david003@gmail.com>
Cc: phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240713180607.147942-3-virag.david003@gmail.com>
References: <20240713180607.147942-3-virag.david003@gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM
 amount to 4GB
Message-Id: <172225627029.280610.17022654796794760064.b4-ty@linaro.org>
Date: Mon, 29 Jul 2024 14:31:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Sat, 13 Jul 2024 19:58:32 +0200, David Virag wrote:
> All known jackpotlte variants have 4GB of RAM, let's use it all.
> RAM was set to 3GB from a mistake in the vendor provided DTS file.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM amount to 4GB
      https://git.kernel.org/krzk/linux/c/d281814b8f7a710a75258da883fb0dfe1329c031

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

