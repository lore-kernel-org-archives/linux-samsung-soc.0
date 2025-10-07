Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A9E1A9FA4
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 20:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759868332; cv=none; b=JK7QuioBXeakfGHGXm9ojmNBw7EElEh9wor6ZJaL+Bmojqug2+w7W6GEvbIsPRVu0JlUS4IKV77muhGFhUh2zPMSmv+moV7FiaIXdxEKJ/puznOYLPmtk4yzNSUdNhvCXD9iofOQBmecD5AFPqMP1xRt0EAgAupoRsydzidCSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759868332; c=relaxed/simple;
	bh=t6o7XkzKv+u7CI1UFQteRyBrmLJdqDMJ8YxEK4sFqGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+MQZE6VQH2DNZ4Gn2yujrZ+SiSI+PKK+H4isnW41T3fH91YVj1t0kwf5H7GJAaIo+zFKDkzBAx6X3azebmJ0KHqSKAuz7mFBSu4sa1eT0zek7dRdGUz5T89tnY6ydTXI0PKGZ0bOVE7dU0o/6i53LFzJjELkE1tcafMJVc5BhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhVGKHs7; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhVGKHs7"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-643cd58c678so3778794eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868329; x=1760473129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6o7XkzKv+u7CI1UFQteRyBrmLJdqDMJ8YxEK4sFqGo=;
        b=rhVGKHs7oYTNAYvO3uyvddwiDnsLj1Apvj6uZxAf68G2GxTNh/nADowc85TrHZ0LIm
         /PNT4M4gDH44gt8PFQRRexTGntgKAwc4L1DtvDxDGRtPQu316KHpS2Ui9zKQVRAgcTXs
         7L/7W0ojPdKo7IagQ1HH9lx3fUq+ERvYwNdibuQDlYQRDAJxG3DlK2FiOdq23UJu8EJj
         Zt2i1N2CaOGUXtsADZkJMuGZadm6y/ukulFMnqFr+alfAc6NjOshH4khKASh75FYbCYi
         Dc0aTObxQbeZNnWgI5VZnWOiKk7ZMp7gdiqAOL6jU6aJC8SIYN/pFlnOzF/sdBgOImZF
         tRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868329; x=1760473129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6o7XkzKv+u7CI1UFQteRyBrmLJdqDMJ8YxEK4sFqGo=;
        b=FufcIivMPqifdCOjEJafFlecPZ7AhRS2HuZkIBD0g/RM+npbRFvpqSiEQ4IEayiWWZ
         8pTi6oT+bxRvNe4TVtc3voMHgsBpKz1/fmo0hW7IWpUzpiao7EykdkE1+CXJki/NpH3u
         Aw6wT+sD7h2QAk+G7IqWCLXOoYh2urC4cFgveCxiWGnKG9JFWjBtqjOvXcmxIwqJGzBu
         0imgiwPld4YPLoXlrSbH669EH/holBEWIeJDRUKnUVynGKa27rAi7ZGo3rGhjrV/WK0M
         3PK8lBk+UIu6GyLzADKek9c7B8hatojWmgDRD3E2QcKhZqwCMxwIE4c+UFjPv4QppdU2
         oB2A==
X-Forwarded-Encrypted: i=1; AJvYcCUd8DODEN/Bj3OdhG+WkbPc00Pf/ZdPhpg4wPyjVT34ZHQu0EhXk1bDAYvcSB0ZB+Fb6B1rKxFnwwgRo/e5XjcC9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD85xfoD17ntGLe9M6lgLqJmDEWx63K7KNGZOGWu8Z6+KiOFSL
	0/Yf/6WDKMg68x0pouwkJ/ZvMizLyjD9GVUzQpBxm2XKXYhc/dlrJo2f51wO2QkUv00q7TzA7JL
	HA5b6gw8I6/iqWulTaXP0Ffaxk+5c54j9WYHcS9Kk1Q==
X-Gm-Gg: ASbGnctA0EFQ4hf9aTTdpwC5iRvuyY8C2ZJftWVQ60DLwoj2SMh29KAgv9SmRNS0fIR
	nG4oX+1FY9KWiTakq5XVG+0UNnwqkowxjsb5NVN24F9mmSGeKKwMpL7GeOfuTpkwXqbI6SxKLn9
	8VbkIrrms/RnuiqyuOkHWvVFock54uzDBRaJ5sL+PGRpf9+tCNiCQoL3jKox1NM8a2qsue07EsT
	9tgZjUw/1nqc0hvFB1R2z5jWzw64333aLHBxw==
X-Google-Smtp-Source: AGHT+IEL4dmypG8WFgpOU1UIUsrODE8etCKEY8zyKzUkyzhaZJQ8flhaIQqg8X0wJtfFE1WkEjdwwHsi6B9jL21hYVk=
X-Received: by 2002:a05:6820:a10e:b0:63d:bc20:a63f with SMTP id
 006d021491bc7-64fffe6daadmr379683eaf.3.1759868329050; Tue, 07 Oct 2025
 13:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
In-Reply-To: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:18:36 +0100
X-Gm-Features: AS18NWAMBYtEWn2vhviwKZeJuPljrJcOS2KOQNcYCHTnuQAmZAXGTQe_GLqqgoE
Message-ID: <CADrjBPoZpTUN5N_Gh6E0LFmndJs4_nnSpQ0t=XORQHwFn2=BNA@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Oct 2025 at 09:07, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
> with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
> inverse of clk_bulk_prepare_enable() while it should have of course
> used clk_bulk_disable_unprepare(). This means incorrect reference
> counts to the CMU driver remain.
>
> Update the code accordingly.
>
> Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend wit=
h UDC bound (E850+)")
> CC: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
