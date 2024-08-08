Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA0187850
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723110518; cv=none; b=ht4fblacQcWT0bhpmp1UNqObUfrvAJ1mWIwuoK0Ow0b0CRjYCVuDd6sPeUQyS08arESfUNySgovFG7i2LN6GZA4V7gVbL+9qMAIkEH1z2CPsV5GNbZvB8lAtNl6C0TK1i+ymiYggy3NEXaTOFNiX3Ta3Hg6oKIJD6SLQ8ZMcUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723110518; c=relaxed/simple;
	bh=Oz/4FlxMMsehe7Ce7PmjbmGoqd8fGJ0XyCfS5Cq97YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5vGFAZszejSdCUT55wju4s1l8ACbHP2wuLSpMG/4unbc9HNs8NzEycTQXr03oyfhR6780DGAXKG8V/jJQP+pWuiXRc+KgZZtBnyFM7nP0YiEKTynWPxO3jN5WnVP1v115AKkHdNjd7FIWr7UzaMm2692ZxPrnfSGhsDZUL58PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skKLWAmh; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skKLWAmh"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7ab76558a9so113233866b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723110514; x=1723715314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD4Fbo0bLU0vBdFevb+9sQ5UqHYLrq4vOipE19dCblo=;
        b=skKLWAmhLk5POTtwZQ7hRsw9SNTCYJ2yZ5NpfEhxgTcw1mWeT7OK72VwIhGYbGSk7V
         KU18HBq8WppB5iKxZD0ZCnRWu2sqR38NJbf5L9LthiDZzHaNBWcRgB8PVvQ6bvPPMA7/
         iJjJxAmbmwtqpa/ur0f8mXZ6rELcQE3b1AdbzUy8Klqvur3+AqaVPzPS+JD5UgGWfxfL
         cAxm1unZJOJgMsi5DDuYR9dujC2TklzY1C9pAWm+2aHo73ZDkGINBfUzFmbnUr4ouQ3F
         2bBszitgZXcgaS9WG0Brt1GR75Rw8v4eDkEe66wiqwqP5J/In2BaC6gbcJSMvjuKPRCL
         HN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723110514; x=1723715314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fD4Fbo0bLU0vBdFevb+9sQ5UqHYLrq4vOipE19dCblo=;
        b=XY++HgbDbooga/yJnVwChlPXa1f1oS12E5cf0KnFsrxGtqLdF6G3NeRKcUYMcUqJDZ
         pXqyr3+VpTJoZjTDjliy8Vn5kq1YZeofvsIhUi7qkPhw+1TuL/erJ6mWU8Mntp8zDSmc
         fSFB4mk2CGbMJvn9SVQ2DOHiUebnCnKMLdy+k3uSKDQDh6uWGNIVgXDs7wfbqcbXIf3U
         f9TUOWFfuJ8tByKkjeNHOxJY1f4Hf67XE7Q3FAD4xFVOJS1NDXGgGzpn7sFyYOb0jQhH
         0wrlUOOy/6ImOE7YNzh+kfmWSpnWpis2WhlKEXhkEuIRGVuGvkYsOZXncQ8zwJMBNC7E
         s8oA==
X-Forwarded-Encrypted: i=1; AJvYcCXs3ALuGTQK+tvy+i4+eee3KEpb6LFMMtK0NTMzeyBR9p1GzQol3JGA+F9xautD+zgP8C1iQlQL51PDE+Zqs4G3u0rj2w0uFJ+UZ5ibfCrcgYw=
X-Gm-Message-State: AOJu0Yz0KNJUlf1LxxIwGcJdihhNtmDKX42UiM+UjdzkNm00HlHm3uDX
	5hWWU5HOgZasRHOZeel1oM6Lu1qN8latloIejpC7EL3s8JYSNgKU/MQlRqWM2Uo=
X-Google-Smtp-Source: AGHT+IFJgY0IwRIPW1jKkuP1Rul52UIi5cW5qomgars0dlYdYtx6uT0furoQPy4Yo+tQkmj7tqJo2Q==
X-Received: by 2002:a17:907:3da3:b0:a73:9037:fdf5 with SMTP id a640c23a62f3a-a8091ed1fecmr91422366b.6.1723110514125;
        Thu, 08 Aug 2024 02:48:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e849a0sm719911966b.186.2024.08.08.02.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:48:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Virag <virag.david003@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/7] dt-bindings: clock: exynos7885: Fix duplicated binding
Date: Thu,  8 Aug 2024 11:48:25 +0200
Message-ID: <172311048730.12963.13971450848126539088.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806121157.479212-2-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com> <20240806121157.479212-2-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 Aug 2024 14:11:44 +0200, David Virag wrote:
> The numbering in Exynos7885's FSYS CMU bindings has 4 duplicated by
> accident, with the rest of the bindings continuing with 5.
> 
> Fix this by moving CLK_MOUT_FSYS_USB30DRD_USER to the end as 11.
> 
> Since CLK_MOUT_FSYS_USB30DRD_USER is not used in any device tree as of
> now, and there are no other clocks affected (maybe apart from
> CLK_MOUT_FSYS_MMC_SDIO_USER which the number was shared with, also not
> used in a device tree), this is the least impactful way to solve this
> problem.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: clock: exynos7885: Fix duplicated binding
      https://git.kernel.org/krzk/linux/c/abf3a3ea9acb5c886c8729191a670744ecd42024

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
