Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F07F7F2
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320307; cv=none; b=TXwevjfJVAFKouNc7lCM331WmyAvCHL/f1pk5sTwMB2gWutYIifGHAwekGInAyhFpx0PYDU2OJEnd1NH80fOUm3K6YYAHrjpzqyCV84DPslLtwtAzC9QJmoHxyUzfRJKlJhJVRoCtXa3aB7O+ZSGhrSBAe+UjIeZH14s2UwG1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320307; c=relaxed/simple;
	bh=uaYFQN4x2d0dS6E0RV+NuawfX0XwIBEoLZ21J3eRmug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGjLVD65pmRB3m+bEzzhF/HP4dLAAwDaeryr3wPiMDhuwBg/SVHkhZpkNsxAicPsrm2wimW24GTl8aJiLkHrvHYxQlpDJcQv9K82EV+TGi8sj2q9sJa/gvrvj34nuMnkwcmuVX5F5YKx1SpnOvhUWdAcYp8NCbtcWUzDNOaPkBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BW8zHQ6W; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BW8zHQ6W"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fe3141e1cso7365595e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 07:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707320304; x=1707925104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDjsMcqSpQsZPZB4Exf8vmOcG2Ye2V1oKo0lA0OHRMI=;
        b=BW8zHQ6W7O/WFRB9keAIcbFxwtv230i6TnR1rs5lEG+d57wfz1dyJ/nDoNrmTdxT+Q
         FQqRhvDB6PUKHP3XNuhpS7KsxVaNZehUq/sS0Rsqc+Rysfzj1CG32BqzzWBbzPkoiozL
         sdUZQecp8JyP0la8czk4whhLBC2XOXw3lNn5laiLjlOePZzF9ISzTJS6R6Q9YHgl9hO6
         wnHRlaFlV9Dr4vN822RyroivMwyxR4zyX/tCOol1EIjwFAgZF7Zywaiv9fcIBlGIY4wm
         zUy7GgfnAlJmgGbHoulVhPY9Glgb0EVSwhcTpClrX1/eI9I/krLRTOJD4Ac0PjzE8kSI
         kzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320304; x=1707925104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDjsMcqSpQsZPZB4Exf8vmOcG2Ye2V1oKo0lA0OHRMI=;
        b=JqC86sMDtnwtd3kdr2TY1VZl6A0VECYS5QytuWflz3EyrBKn39Y1N+0JjbKjXmSH8o
         FTYzgqSrOCTeozMxgsUdhZWFNqnsvJRsmpEgZuh7vJ6j2AJ0Y8eJklqv9IUkDuMrthhI
         4dzuQlE6IIx3rOzNRs2+LYYGPQ7KdhRC8WvdfFQfIw079k9wKnSblZTE5xD9kVqoPS+c
         vV+FGkqsh0Wpc3Q22ECvotFrxfq3hYYvuVSdaJTE0GzOH3AL9XX2T0AsPJ13gGcwehKZ
         m28T2vEZyb1mNW1U0xqsYAJkFu0dWp0zA0eSsgrudB9SE8TWSizgL9kQmkCY/9T6rRa9
         3evw==
X-Gm-Message-State: AOJu0YwJ8canO25B/yhDG3B2s4MQIZJlhqCJESHjtr+sbIx3CGXSnuYg
	DdgfUZICRyJFfiY71pSWDXWc5nGjxD2rLMnkeX9cQsn8qPbKy3np27lGdE20UZI=
X-Google-Smtp-Source: AGHT+IFp7mUWX7J8/Q5E0nNJmbtqdwVyY0u1IBQTaDqezlgIgjRbSpSmVZYuxJ3LrLRHDhuqZ4u3wA==
X-Received: by 2002:a05:600c:5491:b0:40e:5933:e2c2 with SMTP id iv17-20020a05600c549100b0040e5933e2c2mr4451498wmb.19.1707320304337;
        Wed, 07 Feb 2024 07:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyqYpOlG99mVLrTmOfquMBnghMZhkWGTTd/PzUAjJI1Big2PEASG6BaUgzPXrPwRRczMmRKoZvcNYv/yNReNmJbCPXMkrlcXUffCZ1axeu5KbVuPcB192UOZ7lTF8Wp3CPJkrQ1HdfcSYWHgqAZ0A7I3J6ldTIe0NRjIfvpLlxYFD0fdzYs9m+5XNewky3WJFDYEjDN9Zu8OK7Y85LDGfl78+hfmdjBOizbCE/ABLFaH0pMVzhEP+b+bf2acOkDE50UTQVn3H38Xg3fIxdzC3OyLOdMyy4bermZtABQnvYfpTxjAfnOVfBEzbnm9hZxmrYmx/zkFUDtY8q1tpxzKv+v2Rv3ljgDCjTuLLAnZO6V7FuY6HG1jxuljtpCqf1bkYI//V70VbX1QQsCHwLt9HreaqK1R3SXcXvki7pv2XTiJpX+Qukaq6+1BbNg6747YypNf0iK2Joqz8xhAzsTXgkkVlxfBRcndHxJ4OgYrGu9r7cgUHd/Wie9PSLW7iaY7ABQLFecXNc5Fe05fL8R7ePYc23BIbTurVIj0bVF5tfWFukMN44wGAUPtIw087YsrhAiGATTBVFlnTG9hRKcWQMCV50vU7QG66ODtpWH7irMKlUi06/0IedP9nEohXEhAuUkT0YdrqxONXg/J94lUO6nDUUEA3u2gPHub/px6TG3EcPoPiXnNrRbR0mzqguda/ENw==
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c024700b0040ef0e26132sm1307678wmj.0.2024.02.07.07.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 07:38:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 2/7] dt-bindings: clock: google,gs101-clock: add PERIC1 clock management unit
Date: Wed,  7 Feb 2024 16:38:14 +0100
Message-Id: <170732026217.120770.4845846715003793085.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201161258.1013664-3-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org> <20240201161258.1013664-3-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Feb 2024 16:11:38 +0000, André Draszik wrote:
> Add dt-schema documentation and clock IDs for the Connectivity
> Peripheral 1 (PERIC1) clock management unit.
> 
> 

Applied, thanks!

[2/7] dt-bindings: clock: google,gs101-clock: add PERIC1 clock management unit
      https://git.kernel.org/krzk/linux/c/455061eb32434d5db11836a4de72ea2f4bdf61c8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
