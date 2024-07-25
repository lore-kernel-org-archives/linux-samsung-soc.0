Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C69916E887
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721891647; cv=none; b=VvAGzJUSLlmqIDWEBkViWa+KRr263L2ICIJbiwX1fVpfjD6vMqkzJRoOOx8xSH6Wc7VMj5Ei7QdxHN0YaPb4lrQsKYZQvqAFo4Rrk+J12NzWAaye/t0pC2PQ8ErBE5SzAOA3BW2TLnCsqYiZ1EhMRt0e9I55N5JioF+fXqUwJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721891647; c=relaxed/simple;
	bh=AH9MPnXwcjFIyYvI5beVZA3B4SXJAwhkWPJ0PBaM0K4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AslTUVgTxYzbO97GvQGCoHbIs8uAL7P3jQFSiE32OdfyatLT9wimAvd5vRA7ltu9l4bcaLJEA/uq8+KHlEsZUrgtQPgTM5rgTOehfGcRztTzaH9c8phIrn6AnE4HP+dZVnYq4b6adGj5Hne2Ge/spD5RoYgUki7JTfGj34vrLQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiggwWEX; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiggwWEX"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f0271b0ae9so6517091fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 00:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721891643; x=1722496443; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AH9MPnXwcjFIyYvI5beVZA3B4SXJAwhkWPJ0PBaM0K4=;
        b=XiggwWEXGABbJqgTw6xlI6t/azBmosXETnwYJFapYvytfTP3WI75O4nhnxdlHY3diT
         zfK4nAeoqT/O7q/PoODuIfWjoLZb24ioyeorHIGDi6v4pdzVoS+Vbfguy23SVigD+BdG
         pyo64sKNHpqY7m0j1Z4NntlG/n6PtP+iQZk6OXYe7MY6TBXm2XlcNnEAi17BKQcNQVY6
         x9vvzIu+E+M6JYmC3fDKz8NAfvT3KcqY/+b/+cnDWEdkJqsWIh2J25xQwS+6uQObvwJz
         583Lpp8FSl81WT8j3zz0vkgvbGII6E+d4H0VoLGepr57iioif0CM1lI8s2z0eU1O6NjA
         Erng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721891643; x=1722496443;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AH9MPnXwcjFIyYvI5beVZA3B4SXJAwhkWPJ0PBaM0K4=;
        b=wpdfShKEe7vzGOqOlfDUHQV69AM8g0l0z+sVY2QbcJ9GXP//vdtcMMFk578dhu/Lto
         h+wH5UeYYsLik5g35fWjG6FbWitizdcuXgW0vqCcvrnTBptm0OSJZXmyqiLh0wEfYvag
         gyBTnVB7IT5AqLDcLnIi6Aw+w7eKdlkUnrv3bNm9p5TVmwVh7SBerJpQUAUuVUD1LeDD
         23M4lHq/SHOWdQSaNlM1l+kxkBhnCWx0XwIq36QiDfQZiKodqWCLdSs1CtPAxSW6reMf
         D18bYTb+D6vZEbycss78P9BccPFL/dN/43LKzC8Xi4js1YJmBSayVbMFMfn7DSO2gf81
         JmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp/ywoG6e25VMpdZbTod/bfqRGfH04X1g2drh8jxfOUiuE5138aRcnJih6F55yq+hwGQhfgP2jjp6OBacGukLYa0ZYsCLT4LbCqPK28IVE2iQ=
X-Gm-Message-State: AOJu0YzoL+cnMT+BoA9XtjHRPM5b7Fd9ykF2zXeJ1325Vjs1q5T5bDKk
	UmnKIU2TompWutr49DxLArx8S+OPMl9TTozRPRRBKKtMlydkPTJyy77Xxjug95c=
X-Google-Smtp-Source: AGHT+IH3gUGG19nPRevQcZ3s8hd7aQYxqwF7qT+FALLS7KJHriJN0NLfu5I762+j+gSizAv6avdUMA==
X-Received: by 2002:a05:6512:1152:b0:52c:d7c9:fb14 with SMTP id 2adb3069b0e04-52fd3f33b4bmr1248062e87.34.1721891643296;
        Thu, 25 Jul 2024 00:14:03 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057a69c4sm19760575e9.33.2024.07.25.00.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 00:14:02 -0700 (PDT)
Message-ID: <90689f490cba6ea4b1bcd18c451630123a923f48.camel@linaro.org>
Subject: Re: [PATCH v4 1/2] clk: samsung: gs101: allow earlycon to work
 unconditionally
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter
 Griffin <peter.griffin@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 25 Jul 2024 08:14:02 +0100
In-Reply-To: <c2c2b51d30f551bf8a9c1fb6507301bb.sboyd@kernel.org>
References: 
	<20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org>
	 <20240712-gs101-non-essential-clocks-2-v4-1-310aee0de46e@linaro.org>
	 <c2c2b51d30f551bf8a9c1fb6507301bb.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Stephen,

On Thu, 2024-07-18 at 13:46 -0700, Stephen Boyd wrote:
> I don't see anything in here that's driver specific. Please move this to
> the clk framework, hook something like of_clk_add_provider() similar to
> how of_clk_set_defaults(), and have it look at the of_stdout node for
> 'clocks' to munge the clks in the core framework for the serial console.

That makes sense, I'll have a stab at that instead.

Cheers,
Andre'

