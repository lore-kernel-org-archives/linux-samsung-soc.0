Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C713959C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 May 2024 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714728611; cv=none; b=VZdgnvuDD3J4SRP/qI08UphCm1g79eka9tDalLMO1RV/YNh7c4/SB2vRfoj337g7LhSe8jb0Rtk+Qv3iDSXEwEh8d8e4G8CiNKUqc0k8y7MqV9m6Iw5uhushEsYmkGHzC8IYcgXx4SbkUOVrlxz9yiW17oELeSu6mkVl/qZIkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714728611; c=relaxed/simple;
	bh=ZNb2/oSuDvsekJbrUvzVBARQvr1M+l1FF1dsoV5we18=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KxnPSgGDTnOMgWb6OUmqarGkjCNS7Rf38qex5lMZf/j5OX/fs09b+ql7epioG6YQElMD08FQXTAcMwUcZX74RuwT+zVVZiqjTodcM5zN7fFZeEu06t0IX5SuzF7KZtg6Qgtib7yRsZRpeM4odeiO2V/o74ZOMowO1nCkTfCN2UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grBC8Hap; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grBC8Hap"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41bab13ca4eso47983515e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 May 2024 02:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714728608; x=1715333408; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KULRcTjxfat7nflWft5bz9NukEzEddiZ2lggi8GzZ0E=;
        b=grBC8HapctbhvTbub7vtfg58qy5UOfQxyjgAjDMr32V+DGEd/69rY110u70yzZlY6a
         YmTPKt6IV/MsENRwslhCcbDgSBGDe4k4WwzTlYIt+UO878ZX9DsXIkIBMxVOx1zoJcMY
         FgyP0o6IbUbVXaV/zQE9StkIZtrzmXk2HHCRqlXL4sUGRIgGwR6+/lv89I0zWRDMwEYT
         G/IBabHtyjy3TnI+0zk87noYm/ZWO0Zw3J2clS2bjmnsg/8KU+9cPmQN6GJ1G5t4k8al
         m5T7fR3TvFhtVSnfpYMK9+YV2RvBLszqst1ruyBDcymP28MMtXB2/tAKCpwzjRoyeK5+
         Xd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714728608; x=1715333408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KULRcTjxfat7nflWft5bz9NukEzEddiZ2lggi8GzZ0E=;
        b=wmVR7g1oUmlE+aRsPEgKkBi2mFvLdcV0fm+ZZ5WldDrD147MDBCh4mfO9kir167GvT
         dAJrmPUo77Mn51oCDOwTss6sX/FRUfP0quMizbqnO2xbVQ8P6FZkVFk8ws0XoeQf1ehk
         HYim2Io/SqIurW9wnPlJ0sqWVttKj3t1/4Bc1qmSBafgDCpQLYl8x4kbh4NJxFwjalCb
         2wahdXZiA0+X0aVy4CI5HC5MeQl1LlSHECnSDa9Dqa1JpLyHwIIP7KmFIgSoyUlOOVmj
         xjDJOZ/zXC1cCKsMDatbvW6CG22JGghN7l3nbPkawZPJUq8VVItdV9Idf+Fq1ln3m4Qd
         DJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCUOJkQJKB6U6pP8ycH5UOXgfb0NIxgBnjIeLM61vFkHMQnCLOqZK+n42gFOxsW7bRmzUJNbFtxGz5mE4IFa9XrMBIQPk86BpGSBc4bc6lsmo68=
X-Gm-Message-State: AOJu0YwvWDVqd0hGkEo3WeU69IrLMkVfVovY+oPdLvZoJFV9LFfYqOay
	cq0y+N+IwwnskPVjbdwkLl3OhBT0b5JaSX2espCrf7nKMZOMyg6b37iJXRgGfwA=
X-Google-Smtp-Source: AGHT+IFMjfL7kc5atSQVs5RqNDVKOWw0871oLlfuW3vxv/8yUSCVntr1NwQgjxnL3bhXh2tYDPwLzw==
X-Received: by 2002:a05:600c:a01:b0:41b:13a3:6183 with SMTP id z1-20020a05600c0a0100b0041b13a36183mr1736973wmp.24.1714728607700;
        Fri, 03 May 2024 02:30:07 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bi9-20020a05600c3d8900b00418db9e4228sm4988571wmb.29.2024.05.03.02.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 02:30:07 -0700 (PDT)
Message-ID: <0106b6f58ce19752c2c685d128e5a480103ee91c.camel@linaro.org>
Subject: Re: [PATCH v3 2/2] pinctrl: samsung: support a bus clock
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Sam Protsenko
	 <semen.protsenko@linaro.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 03 May 2024 10:30:06 +0100
In-Reply-To: <c39eab66-4e78-4f24-bcaf-003161b38ed0@kernel.org>
References: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
	 <20240426-samsung-pinctrl-busclock-v3-2-adb8664b8a7e@linaro.org>
	 <ea6f17d7-49bf-4a1e-ba3b-757e29221590@linaro.org>
	 <9a960401-f41f-4902-bcbd-8f30f318ba98@kernel.org>
	 <c4c73732595b067369a6c8d71508d54358962552.camel@linaro.org>
	 <c39eab66-4e78-4f24-bcaf-003161b38ed0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Fri, 2024-05-03 at 11:13 +0200, Krzysztof Kozlowski wrote:
> On 02/05/2024 12:41, Andr=C3=A9 Draszik wrote:
> > I was initially thinking the same, but the clock seems to be required f=
or
> > register access only, interrupts are still being received and triggered
> > with pclk turned off as per my testing.
>=20
> Probably we could simplify this all and keep the clock enabled always,
> when device is not suspended. Toggling clock on/off for every pin change
> is also an overhead. Anyway, I merged the patches for now, because it
> addresses real problem and seems like one of reasonable solutions.

I had contemplated a global enable of the clock on driver instantiation
as well, but in the end for me the reasons why I chose the fine-grained
approach here instead were:

* Since the clock is only needed for register access, it seems only
  natural to enable it during register accesses only. (The same would
  happen if we had support for automatic clock gating in Linux).
* If we think about external GPIO interrupts, they are likely to occur
  very rarely (think button press by operator on some external keys or
  I2C interrupts), it seems a waste to have the clock running all the
  time.
* drivers/i2c/busses/i2c-exynos5.c and drivers/soc/samsung/exynos-usi.c
  also kinda do it this way. Bus clocks are only enabled when needed
  (e.g. during transfer) (granted, the IPs (IP clocks) are also fully
  enabled/disabled in those drivers when idle, and there is no such
  thing here)


Cheers,
Andre'

