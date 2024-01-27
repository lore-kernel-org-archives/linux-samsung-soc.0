Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05613BA3F
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 03:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706324520; cv=none; b=jo7XXHG8pUoQAzsYpfGf3oirJ0k2+Wi9OOxb27/Q+e52IiI6VHNwHfjf6Z3e54s7Rwt/Y+3/HbftVyiX0Z1gHDJfbI7Hrr2TUWC7AnBYxFVLh3P5ZKvoRSuqqX5Np1g+YPwISMeOJyH7x0OIxt5taYJxRK2JNhtMQN9W2eV4e1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706324520; c=relaxed/simple;
	bh=dpCL270UQPI5eSppcdrsOlocVyO13KcXBRgxFoQDaO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnCcgMwrLuEBws2SG/rp/tGabsVNJR9bTzrhZk5th6xCn8gO5c3eoD4/Py8rgPj/MjfT6Ew0LSxIbA6Yp6EW/1SGbVaRbhSXoAFZiDewkvsC76C8M21wIZUvk0USLtt+4x2AxYmVc0mcTK4L/wIkFWJpLj5wbbFLzN/xAqmTkdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QCx9qNXA; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QCx9qNXA"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-683cabd96ceso6627346d6.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 19:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706324518; x=1706929318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmcMqTe74whx9rEKa8Rswz2LGLtHny0L7TpbU7oKD6Q=;
        b=QCx9qNXANqe731od4L38foRK7cROElujdSNFMkLjImuR7ZqyotI9VxZw3lkwi30FTT
         oSm0nb74P9XNioiaVbOmXuUA/v0cIN7PK840W0ExL89sJxpxufxnnh24IHlkqZ9M8IWF
         mCnQypVvqsETmo+VX3/70ATm0irb9+FxNV67dMigbo2lpaXryIp70CevzUPp+tG4AJml
         uEbK03W/j5wfPOc0h+L3xgrOXQKy4jb8cFH2BgzntstW+k8CoPbqUTVWi2hpIk+s2kdW
         bl9970qK6FnLkpev6ERmzVvS4s4CRvya5etuwwAcgC/mV+DPoBIeNZAMLiwXrT4ntC9S
         F7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324518; x=1706929318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmcMqTe74whx9rEKa8Rswz2LGLtHny0L7TpbU7oKD6Q=;
        b=V9d1xYz91e5Tp5OqNGoTTxfL7z0Bo0rELAhsCmvEVWjxhzdiVYOXGMA00A7nxGKJG6
         5bTIYUR8qNhraSDCSJDykrkh7MyrtsuUMR91x16g0sXV32P6PfLmX8X22wizrFrWOG5O
         ZiOgXUAiYIDNG3/1Hs0yzYEG2E05fBXzJGJ5tmqN4YG2r5e7Q4s0V62ufefgAHaOdU3l
         N/z7puQwNJHmzZeJFhqit1bUzE2eeB/e3nhDrzsqjJVfgyLFeuSdlJeuwi8ZNYveVKy4
         i6BbOgaS6YkKkgS5sDKW7hfuqENYJdkLOv6/EtEtONYdKGd1TKqDEQm4rXQbWs3HzSd3
         uNfw==
X-Gm-Message-State: AOJu0YxdOG6p0Gp3uU77k5STI9FymQjcLRoO2BI81BzCyuTIH+gQ4YIp
	E5/ayW0dqxaSmfd6L/nZzTCcYTeXXN1/934qtQm0A0q8Pg4x4eBMwjjip/lITs6shH6mCXxCUeX
	DcoXBYO/uuhe00/9Z0cqptAGhwSVwusj0YWvofw==
X-Google-Smtp-Source: AGHT+IFl0pTq8D+qlRGElaXOH+Jp+6F2IhaN1xuPOVWBs/rLWvnBMzTHzpUbTXgaCK5ievjh3HGeFhyktkjJY70TJoU=
X-Received: by 2002:ad4:4ee8:0:b0:686:aafb:2696 with SMTP id
 dv8-20020ad44ee8000000b00686aafb2696mr1130335qvb.29.1706324518010; Fri, 26
 Jan 2024 19:01:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-1-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 21:01:46 -0600
Message-ID: <CAPLW+4mLuisoxQqOagFjjQ3n9yRYEDQTbGYz21_kO0zDMoRYkA@mail.gmail.com>
Subject: Re: gs101 oriole: peripheral block 0 (peric0) fixes
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:37=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi,
>
> While working on peric1, I've noticed a few issues in the peric0 area
> and these patches are the result. They should all be pretty
> self-explanatory.
>

Looks like "PATCH [00/xx]" is missing in the title.

> Cheers,
> Andre'
>
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++----
>  drivers/clk/samsung/clk-gs101.c              | 8 +++-----
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
