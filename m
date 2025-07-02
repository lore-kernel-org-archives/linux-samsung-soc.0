Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320E23956E
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460475; cv=none; b=d/Cn9jD5lSA/N8CBkKTNPOYZzQUz0VPJJCheZJQCfBs0+v5J7UpBzDXduB1mcF+NaX1daqUZAJN8Hoz1EKlMFIkHLOHhn2T1/HXUFkKrSBqQOJ/DFevX6y2WbGnEytLCs7f6piQnIDN5aZIm0Rkgmy84EOzyu9ns/Aj4XBneDwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460475; c=relaxed/simple;
	bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=urJ4oZ3+wjP3jK9I+VzdQugwdCWkYV0KwrnyqtPW7dkC/rGeCrCvvEwMgfzL+8jzkFzkx7AEW6VBvqRh0F2FcoyzRuIFroJrsgDljOcFLENvre3d2166b8k1vQi7Uho1FDxX3U9LYfrB211g49yMvBsjoKZsFFfkD72J+xD1xXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4ygA4S7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4ygA4S7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso3455399f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jul 2025 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751460471; x=1752065271; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
        b=f4ygA4S7O3BHzHJbk+jkI4/OYzynoFH2b0ZjGyzLQHrIWgslFfvMS3gkAt+7dI602q
         gu6eSIZx8L2kXzwNeJuVNdXxijq2B0q3m+dy2LR/tMWbYepxAROBeq+kyipJHas3eWZC
         Hq606tXIWfU61HRjIxQ9ReFQC7ZVm3d/Qe0cRM3g+BRGAw/cYl6ZaSUEh4CiJ+y0kWFj
         I7V88Y8S6QTVFSfDFdF0sY+SULUsjseDoXegj86kSduNf59BLBQvYVA9kzkrGqWqzrIH
         F7BeROKIj1ihofOlOk1zML1zgiRxmSA72td+a2StTpQh5ujX9Vscz/ngUOXncEaoe9C6
         r7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460471; x=1752065271;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
        b=qpaDknXYhYQKgHu2bFdKBsFopfYRaYhRW3OKIiTfTR3xMgu9vGsWS2nTP51+kF7v4e
         Z9QVi3hn4cxRneD0qLuPINmKe4PauozefawhAxE0GHEFVivqXs5McDjsY2iYeZFjikcJ
         1iw29Lm88fRAaiElZVTd4HYdALZFEN/Nsqz6aTXR36/tpqtpwY+u8qd7tkecgDrSTXI0
         mrnleW7HLcpCPKd7yVupGELJsg5Mk26AI5PMos9P1VEuZjP20sulSXfBbht4FofAosmV
         lyxqvc0rh91HOwdcJJq90lN5K7RZ5oOVhMT1B/havMn1r4qn0VhNLTZbhJOvVvWDbXiq
         +AnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvpvx/t5Q856f3+GCfWhzr6EbA/sTz2ctTFvGH91zwlYu9FQriYpztfyLwDbNUhRgLwLDuyNkjMk95Zsx3pCh/QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO1rvvFXFeLiboH9zD0AjcqPT9F0r8bkVnypy16M/QW0tbpOXJ
	DqbDWEIPZnSay1By9h5E3D0zC9nIVhTKyDxuPOvpsmHqymTLDwcp8x9c0hqa5FgHrww=
X-Gm-Gg: ASbGncthIzxnwiIwvnhi/qjEbKuLgnR/+D5/gw7gmBn/lOytcfWpykQJr0sWGWzEBSV
	dEdYHW8o5hzPv+KKBxdMupCkff2kV46dUHuh3GZQzZ+AbbcC0AsHkjYWlekliyOiPBg/gMwjslc
	i3jIDJ5WeqR5XaEksSOT0SVBcJxpoIKy/kx36NCXmovORsMPSg0QDjnntuMJZ+QTG8eSWDBmEGl
	HPyugQY5Nr08T/OJ5g6IOb2TS1H280vW1eO1BqegPqznHivqXbNdI1wRVYZ1A7dh/MH5+kjVDPH
	rB2uFpjZpkPgn9EFkytO+R1bcjPcaexn3UsXPVrcbU6V0owpG0chViaOSvF0TfsFTA==
X-Google-Smtp-Source: AGHT+IGPeeUccLmCtgYtyYD+ZS1Aj6ZgB09U8/1PLF8w5rZHkBfzkakwgdj2Tll4vbsez2P7mMwNwA==
X-Received: by 2002:a05:6000:402a:b0:3a5:51a3:2ef5 with SMTP id ffacd0b85a97d-3b2015e22c7mr2056080f8f.58.1751460471460;
        Wed, 02 Jul 2025 05:47:51 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b913esm223450335e9.33.2025.07.02.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:47:51 -0700 (PDT)
Message-ID: <c601dad05c9b8da4779af9c3ec852767e87dc9bc.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 02 Jul 2025 13:47:50 +0100
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-02 at 13:15 +0100, Peter Griffin wrote:
> When adding the dedicated gs101_wkup_irq_chip struct to support the eint
> wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. T=
he
> result is that irqs on gs101 for the buttons etc are broken.
>=20
> Reported-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Fixes: 2642f55d44ce ("pinctrl: samsung: add support for gs101 wakeup mask=
 programming")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Note: no Closes tag as issue was reported on private chat. Permission has
> been obtained for using the Reported-by tag.

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
