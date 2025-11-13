Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DBB29CE1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041023; cv=none; b=PtqUx2hN6QEBTMD4xzDL8fC9/MIQDfeBwuxAQCTs4PhmmidRC0XM1QLa5Qi6bvHRak392qVpStF+vOtuvdgR4LOUI6gnIwaW0+YA0HlNrnCDQZw35lTwcxgz1mwBok6X1E4WNdghMwFh0AQnu6KOAcB3+0CowmjuBG4uiIHnN2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041023; c=relaxed/simple;
	bh=bQ+P52mNlITuRTiW9s5XEFgomZzd9bFBs7jFB6ckx4s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gGqNQQvpXzaWAq1pUp1NbehvPnrek52nlPONHK9q4rV8pREFO9hURMlqZgPuWLY+NpKLEd+4auIrnJvCM67Qh4BZblPA9CwWhhvQdvPEMq5jVT8vLvC7nzCncCMXHcMuBtj3bPWk8MfEHcy0veYE52EZtelQqNhKR4bIKNMa9I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N8GpjPHj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8GpjPHj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-471191ac79dso9266745e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763041018; x=1763645818; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQ+P52mNlITuRTiW9s5XEFgomZzd9bFBs7jFB6ckx4s=;
        b=N8GpjPHjPV+MezPF3iWHG7PwPq0xv/G87Yk4awggJ9C7SsfsNmEADgJMPGwYoAAcq3
         YO/t6JxN4Yt9Z/CzOV4abzojq6rSlj4gOYspoLGbj8nHGAsfs5zG/Cjw9UyJFf6NEC69
         EDU6RQYhOs9dh4TjmX7dtKGqnV6srSGEWVBykpn592BTDym68BwgT5pWf0wA9mNgKOg1
         IF1ALuG1Oj0xdNNv+y3ICIBCK/CxzJ48sWuX0pIyXCD4BXrPoC8VswfO70H4ox5u9d6i
         DR9lGdQ4Aj7jW0f/hOFsxiKPokDQbYpDDZxpzPk/xYknvXdvXe5fUrPH2d7HqI+ebpgp
         pgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041018; x=1763645818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ+P52mNlITuRTiW9s5XEFgomZzd9bFBs7jFB6ckx4s=;
        b=L4pnjavinavmd0pQ3M22sCK4jgwWrejc7V5xJdhbFMIexb6mTXUXf1Lm6Ola9X9Cyn
         4UuJkP9zGSwdNcOFrTTWOhbC6EOdUbp4Q7jdfgc2NW/oC8AYfsGqTr97OdQQlSHH7XKu
         NSF7kmkSySEwX94kCA6eiz0nhGRYgR6Dh9lELM+cXNClUYrA8+Nl3XD6VksOl0hIPm7d
         +Wr92EG1nYIfIXbeooLoMw022/c1wIXf49WQ/7F6qJuFgeiurtvl7Z+414HkBzRUVX1c
         2b/U6eWPsPG2ke8wucMLQEHuzePaofAGrOhWbTP4UM4tMYUF7+Zzowha7h7UAcv0zgOx
         mYVA==
X-Forwarded-Encrypted: i=1; AJvYcCW5QxiaB7KsijVDrd9FYJ/KwQXSZqAWZjUyjulU1OnxJZQXDGOnByPqg5sTUi902JlIOW5fPTwSf4JEVPY4CT4eVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9Gj/u1NoXGyh+ewpTYgGsltxu0JJXcCzL76on8WH0c+wejZm
	DBS+wjfZmoS4Kgm/t8gcT4MNI9gvQ1FnY5nhuxLtnxfQvVnnkyaa+cu/DUOuPXgfdDw=
X-Gm-Gg: ASbGncse6cYOjOuAoBxpXZsTneo+JSk9SsArMIZoFYrCDu00qdyBgie8z0WdNGaz5rz
	EzWl0FCYnkyCEoJv1HTr5gdovbCkS9Dn3ONmAqW0Y43GviZla5xokNcySBByoy7rCQVcBc1XKfU
	B04hd40cXG2xCSfWVRNFM/IrHBdzG8UqWtUa+9+TCGe9qhgSWlsQ913+M9VY0RlIjfufhrgkffa
	JRnD0IVljSQaJoMo2KZTadYsGmCPgPEWdHs6aVL5Vm1K1CmJ8Uz9S8IzqEJTuXeeZEebegMkmYP
	251haT2E8u2K5GQ6UU0GN5tYrgvwcIyqt6wbyeFdPHZJe9yCuzZWSmfTvoULcP6zMVWCnoLnAfw
	4ZiZqZNcXlBhJda8CrKATSQS2rcj8Dy72TW8hSl5szxwdb6TAXZAVcpKlb5ZdfJ0IsxAww/aUJ7
	bLOP0t0pyBp4Syc54=
X-Google-Smtp-Source: AGHT+IEkKKvXAgOUI2Gp8aNFTSnGeJkVMys49MhyLUt2uRO+8qeq7VUrFz/uoy33AXxXBmgM6zvg9Q==
X-Received: by 2002:a05:600c:6305:b0:477:79cf:89d4 with SMTP id 5b1f17b1804b1-477870a6581mr59325775e9.31.1763041017943;
        Thu, 13 Nov 2025 05:36:57 -0800 (PST)
Received: from draszik.lan ([212.129.72.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e45677sm96382115e9.8.2025.11.13.05.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:36:57 -0800 (PST)
Message-ID: <5e58b99bc6d1ef9169a0600f6694c0ee34758389.camel@linaro.org>
Subject: Re: [PATCH v4 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Thu, 13 Nov 2025 13:36:53 +0000
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-11-10 at 19:28 +0000, Andr=C3=A9 Draszik wrote:
> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
>=20
> [...]
>=20
> A DT update for Oriole / Raven to enable these is required which I will
> send out separately.

https://lore.kernel.org/all/20251113-s2mpg1x-regulators-dts-v1-1-80a70ef42b=
e1@linaro.org/

Cheers,
Andre'
