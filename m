Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21F1DF977
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Aug 2025 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902071; cv=none; b=pUl2gV5F0NIICxk2UUYD4LqHBXEC6qaBX3Xgbyd5xSJOuKP6Sm0Gl8hAa+GOFbXasumo1BwoWcDS2fhjlNVqe6Tima9/LHzsROW5CRowIKIcI4DjFizp3TlmNCuj2q1f8N1lNl7Qti16gZZKrfxCON4ox3zgfxkIXNNkEdMpOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902071; c=relaxed/simple;
	bh=SSPG/29HLPpTquYEWU6PYBjygo8k+R9iRTUXFr14dhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5s1l22BO8zJlJQkxHJDtRu9+I8J2wZZjuE+Vb7YhQ6rBoxcalGVVl2PXmTYcQBb0698hGpZHvsR3Aqdx2YMBgKzcTJVohmbWg45LBg5afiz5KJMb9ANLYzvCYO8oLc30zhEHSQbb+cMJzY+rRgOL13sIWQVWmV/RYvvkm+pYMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=osG2UEHS; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="osG2UEHS"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32f1df5b089so39444941fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Aug 2025 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754902068; x=1755506868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSPG/29HLPpTquYEWU6PYBjygo8k+R9iRTUXFr14dhg=;
        b=osG2UEHSvby1bINCMZ6JGoyBRcHzJKpsnqu/bsn95suZ/vLwzHemIpuknXCrHSZ7NX
         iqJH4FVZWqhz559eEtdBH0CKl2cYBq1VkrdOPt+beOxX4pbrhKFbFMnBnyBrFYyGIgVO
         tVM/GHtlqEA4dLJDdCdHbf+I0xnwWXPJ0xkGqPXPyJBD6N5Q9MPzvmhCUy1v3pk75sOJ
         hl0Dz5hv7l73hHtKfm0YiSL7TfycgGbxT6uhB25/xeUyliPPFR55yq7LBumzolKYyFYt
         +3fKMn26rG3k6R/xqoHAH/aMBr/FAqu6ezPFUYHxtr8mhWCNBryzzPkTK4UIwI87ioHr
         5ctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902068; x=1755506868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSPG/29HLPpTquYEWU6PYBjygo8k+R9iRTUXFr14dhg=;
        b=GOryyfixYLy0AQmJJ6w4IlB3Yq0AQvL3GD1dHvrKKRBX7juBWGfVH7zeoa9lO27hfo
         ImCvY3DNa7oW3W/eSeki++oTZs076Vp2Z1dPkYxQ+rpB4UI9/I9aindI6qU6wRZ6zofi
         QckbTlXTk87ZLOi9FhA8JrXA/dj5sQ3Ec9QV+Ybl4bqU2p9wjujKpGSAcWP0rlqa6J54
         rbvF3Zqd/hSF1tyCo4dsDXXW+ylCbb6bIqBwr0LbJ79dXKDGu8QHcHs5qj7W10IAGTBk
         mEQC+plJqGHN6bMPByB9jaHF+fn4+Oxjzju3emes4s7TATBDJMTNaTu2pkH09YfuECB3
         LF5w==
X-Forwarded-Encrypted: i=1; AJvYcCU/DEZzlMBv4GUYiviiTd3iM91cenhhAA7E31kQLgQm19q5piKviG8b/DxkJByhl/8kuBUGXfjYG7Bm+eFTyKaPiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLCmoruT/v4hzb+1rZOfFBojBiC9wJ6JgS9lhsr9ap/04+umX
	/Ez+KAjSy2MiwwvbcvR1KVi1WXTdde+X1I92BcX+IkCQn25xzxGhrqHMSvnhwOtiPvP8DEgla7I
	HUgVgKQfSQkiHnrlm+pwnsBTl32snsZ2sUIVtJLkRMA==
X-Gm-Gg: ASbGnct77pW/5Du2pdRrApaG/jCvhSFIHUGhzNGCCxnVKf9d9BmEzgEHih10Lchu0nz
	1+0n+OOJa2Cp+QVurcM+uNmn3YVyyN0XfK+FFC4xtPRRCRGjM5fm224TVOeK7AfVPWQeau7sCZB
	OKnBOd3JD/URIjRZzxukSarz05SYaHX43q++DjyVvukz2wzjImz/1gdoStQoJK2xAkFJ8w9nJS7
	nmKNICK45NbD2FxQQZtUzMPLgfaP/k2jGQp8wk=
X-Google-Smtp-Source: AGHT+IHQZ+Li30LXuVPBZfJzPpG13D46HKjbN25jcZH83z5JqqyWQ0KsRoIqrZmp1XcJkfaY59nLPEzi39QNSDtz0OE=
X-Received: by 2002:a2e:a581:0:b0:332:612b:6f49 with SMTP id
 38308e7fff4ca-333a221c4dfmr38476321fa.29.1754902068345; Mon, 11 Aug 2025
 01:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730071443.8758-1-brgl@bgdev.pl> <7ff48289-f738-420e-ac69-de544833725b@kernel.org>
In-Reply-To: <7ff48289-f738-420e-ac69-de544833725b@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 10:47:37 +0200
X-Gm-Features: Ac12FXyVM43pAwwdhH2UZx7AIEJGJLKbhJiBmr-EDd8zuJ-4n2CsNR4nFxP1rYs
Message-ID: <CAMRc=MfYdHa_3=2Vv8Memv9_GUKTD7Z9U-aYGHqk4z=3eVoh3g@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c/gpio: complete the conversion to new GPIO value setters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 10:46=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 30/07/2025 09:14, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Commit fb52f3226cab ("ARM: s3c/gpio: use new line value setter
> > callbacks") correctly changed the assignment of the callback but missed
> > the check one liner higher. Change it now too to using the recommended
> > callback as the legacy one is going away soon.
> >
> > Fixes: fb52f3226cab ("ARM: s3c/gpio: use new line value setter callback=
s")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Autobuilders pointed out only now that I missed the other line that
> > needs changing in my previous patch. I'd like to still queue this for
> > v6.17. Either through the SoC tree if it's not too late or through the
> > GPIO tree together with my second PR for this merge window. Please
> > kindly ack it.
>
> This does not apply for current RC, so on top of v6.17-rc1.
>
> Best regards,
> Krzysztof

This is no longer needed with v6.17-rc1. The callbacks have been
renamed back globally to the original names.

Bart
