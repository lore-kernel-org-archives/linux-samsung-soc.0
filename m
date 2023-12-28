Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A85107BA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Dec 2023 21:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZezu0yz"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bbd6e37af4so454227b6e.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Dec 2023 13:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703798036; x=1704402836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czhsa2PHtfkuxcfNIhOkDR+827hn+j9Ys9y4lrIdX/4=;
        b=WZezu0yzdzfsVIhDeyxNp/eOG6+3fME/oRfRUCPRMaTnq9XYfCDF4fKutmmEpdlXD6
         XXf66lWqRAq8S4D+26OpiT4ol+TCH9I+/Vx09LULk2/N2tqKxHl7FXqJED7s9hLYtNyd
         +STRlR3feLkoACCs6Q8cAh2OTVGkvQV/QvSxPoJ07EPpsEqbdzQZa7zBt0eYs+RguCUg
         F3/2iLwJmgLAuGyMknuLlQhSAuK0dOr9Wm98VBtjlFYjLQAd+4pff6pkPhKdc00N0X6t
         +Bn+4px+8sHQV7K0pXv4kgJTWnQmWYWhieYTYZjC0iclEpg0Yaa8ASaaKfH9GW5ob/Hm
         ij0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703798036; x=1704402836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czhsa2PHtfkuxcfNIhOkDR+827hn+j9Ys9y4lrIdX/4=;
        b=dQOVHL2uyDyy5YFgVkr4cuYUyLku3t5PW7Lxyz+6CxLXLfLZwi2wmEZfhZSTtQDA7b
         Wnfba34f/MXJJWyv3HhylbEDQmS8SVCpY2lnqjOxQTshqv2kU1CenDrEsIL1PenfGIH7
         eO0/qWoKGn/Ff+7Lm3zwWfQJwUnliEWYDGWqr9DpZ7/LAqlBARtjZ7O2I3US+08N1rHa
         zOLcMpSvRWRZSJwRg2VUz6M9we4dZN14Ymtm6LMOJF+iEgj4CJRGqFX9Fzh8l2iXwa7i
         hN3MZQOxmrBRAX6CBK3As9F4gRUShx2951Cvb8jOfqdxpKyUyZF5uREIChDwm5ZzQnlU
         kGiQ==
X-Gm-Message-State: AOJu0YxnP+B7ofYhWG8aMqyLyWW0KruCPgxDX+Xlq+nKgCX0xJLofPi2
	oMvoS4Y1wz4bq1fQbC5V+Xf3h4CCj2A4RxwLTUzeMBiujSjD5A==
X-Google-Smtp-Source: AGHT+IGhGxQZFVZva3i10AqQa2qaqpnC00VcT536EnKvXKC1dSs/lbXwahDBxWu/93U+EBq0+D2IhazW92FAKgWIV8o=
X-Received: by 2002:a05:6808:1803:b0:3bb:c95b:935f with SMTP id
 bh3-20020a056808180300b003bbc95b935fmr3000674oib.1.1703798036845; Thu, 28 Dec
 2023 13:13:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Dec 2023 22:13:45 +0100
Message-ID: <CACRpkdah=gsOuE8JVeG4ab2772ebgQ-0Vm8gRmPZbCZJWq4f2g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: constify iomem pointers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2023 at 8:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Constify few pointers to iomem, where the destination memory is not
> modified, for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
