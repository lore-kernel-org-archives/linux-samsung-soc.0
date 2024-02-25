Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EF01AACE
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877462; cv=none; b=ZEjZxYJpZH+FHO6Lfnag1VM4/9Rm/DjZ3HpTzo405G/1i8G5UzPUR9GGXwk/k5I+Q2VqMiwN2QJHMNEka6AJ7Uci5ofYkP620LnKIdsXZPxXxu3F9vLTRQHWplt/Q11r1zjtt629cHODUen5KdpRzTgVmhtpG0xQo9TRBE89DxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877462; c=relaxed/simple;
	bh=QBa7Y3AGR9N0gR69nFXfx/CX8Gh6cMWpZsRsN/2yQSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oM/yy7g89GwIdO5oK+Yv0UBChEe3OBlLzvyxEMGbHwQuwH7KhMadV6aj5jYRgxb+igIn6g8tDwmmtIsM41nmAHjqI6uCO1mCGjZmDhfHVy5GH1rOJWAZBGbl5jpY6lLFinHIZXylnrHqcxRrqLe0UFuCOUrk/DQvbY+hweQLxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6cTyOrU; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6cTyOrU"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d2770e44d0so21193451fa.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877459; x=1709482259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5YyMqPimo9XUHgL83+xZtwboRxx5/IrUrU5gbAjYaw=;
        b=l6cTyOrUUtKpmUjEw35t90DPpeGc+HYmcYGXc+mLQ/tXaa1OYrN6P+oGrxZCtoHnlZ
         EziIyIob7WYEkTtYwMQPoZUy4JTaWwCWR6E9ix0lJPA0SHIg+tkzYqeFUaeB0eQF5wXI
         UfABURC08UnzC3JEyVYzMCEi4R2Ph62C6kOd/HlfM+Zj0s2oYLjKJIh2+94RzUYLquoo
         KdKXSpRIYFYuRyvzq962SMv5xd2ezuG95n5wEGs2OTKegPLj6589PcN3ro3Szo2H+KZr
         03NVng4iObqydVs1Q+WElQsr1skK54M34SfaTkzVi4b52LJji1ff+MHGxW04InVhmLvM
         tByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877459; x=1709482259;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5YyMqPimo9XUHgL83+xZtwboRxx5/IrUrU5gbAjYaw=;
        b=El80RGxESJcW7bpad285/qpg1Mh/5trbpsdll5p1ZKqeTyxnEeaSWkEx1knD0omYci
         1pfa5UJXuZHrj5a8q5BT4Zzv90+y5xsDMwTi4N6CvicSANms9Odim/JmkWihhb1TUPRs
         GJQqhb8m+PBTdD08WHHotGeR4Z4DSkh6CfKfGVNTB98/Iw5Z86qx9XFOZjo0vMvqZwVw
         PNuIuUCS77dHDGGInDTsbx/QDRxL7bIXav3vJEAl3rPGruaGvKDjhutl6GOoRnh7Dca1
         USgKbGsUVhrXByk7JkwZfcCC4RCRcYVa4ksMh8yfTKCTLr8prWTy1I0NDtPiHdQRnRcv
         pWCw==
X-Forwarded-Encrypted: i=1; AJvYcCWPZnAhS3H1n5ydwfkatr1E/9vSD541ZHceEtdY2qDFwTPrzAiqjcexUvrppiA9U0Mwf7zQIdJIh6a6ZjukFmtOL+82syMVu5QfL59oymDQCtE=
X-Gm-Message-State: AOJu0YxFR3cM61BoTUp8UJ+wW/HQJ8OY5WOpqopMaLpj0Dv2qVHUJ4sO
	VYx0XC42SinXxf7YU7GhHjGomR+FmpTHEn0xodiFQNpCcrO3IcVP8RJY0TtljGY=
X-Google-Smtp-Source: AGHT+IFLY64OJZ09kr5YonBW3qBy4LeKF5vqhWb20kSxzQsvNK4am8dCdGHvlpfqKNUziIRdPCfQ7w==
X-Received: by 2002:a2e:3213:0:b0:2d2:4054:2fab with SMTP id y19-20020a2e3213000000b002d240542fabmr2649973ljy.37.1708877459151;
        Sun, 25 Feb 2024 08:10:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:10:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-6-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-6-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 05/15] clk: samsung: Use single CPU clock
 notifier callback for all chips
Message-Id: <170887745713.215710.13782897214681477333.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:10:57 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:43 -0600, Sam Protsenko wrote:
> Reduce the code duplication by making all chips use a single version of
> exynos_cpuclk_notifier_cb() function. That will prevent the code bloat
> when adding new chips support too.
> 
> Also don't pass base address to pre/post rate change functions, as it
> can be easily derived from already passed cpuclk param.
> 
> [...]

Applied, thanks!

[05/15] clk: samsung: Use single CPU clock notifier callback for all chips
        https://git.kernel.org/krzk/linux/c/c9bc1f778625b0ae93641e6d14d83b62d16e549d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

