Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F23009C8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142018; cv=none; b=iorW9EdvL4SjZMeKqoYU6C+EUfJTYC267KtIb9qSFmnuPY2147frBzp+GHSVFg0rCNJthUFrzMyhflMNLvhYGFEJb5hy5B8qLVGKPeyKsUUcAcY11RATbOilD3AYd0kEpCNhAhxhBVOJMHjphADEXjvn1kbfnjDEbU1IS4iSLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142018; c=relaxed/simple;
	bh=s6x/oEPLhMgTTeO4Ahkv1T1HFAlTv9cJwpa6J77w+kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ae7Da8wpCvBsSqLpeZvQWLF9ign8BCVFIv7gmmNNrX6dEKdwvYhHpYdEvBi71R16ZvTKgOoYjx3RV02x2DjFKrDoiyl0CL/afHapO0YtAwyb41vvdJvsaF1MAzonfIDhGIkki74Slpz6lz6YunmIB+V3NBQlS3sH1oJ13c6I5t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3RCQUie; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3RCQUie"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37cef3ccb82so11675721fa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Dec 2025 03:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766142014; x=1766746814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s6x/oEPLhMgTTeO4Ahkv1T1HFAlTv9cJwpa6J77w+kw=;
        b=E3RCQUietxOXP7mwrpVkirkAmZyYB5jGkDn+okDIuobdu/3I/+kv/BHrC84UdaD6fX
         jnWLVxeK6bHPUL9HH2Zzjhao5cFZDe3sxqJ3ss+Qiaa1SM/me0Xk86lcIpc/sJtnS6lO
         h5iB5tLJ5d4XfJbb4+YDd5dEewhapAmT2GKHQFY0mJnA1XHe1hT3rQa8j+C6A+bSy2i5
         go5zcmBHO+f221QHYG6tuAVhU/uWDkYLZOf0dsWn9Ob2K5txcMXMkvYwJoWQPCjahJcD
         GgohEK6aAoVXC9FMJ5648+A31Ail3IITdrrEiN1HM0NBgrl/BRaVEmtEF4qf7MRWnqcu
         o9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766142014; x=1766746814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6x/oEPLhMgTTeO4Ahkv1T1HFAlTv9cJwpa6J77w+kw=;
        b=o0xn0KWPtEPQ63v0zaoa98EDGVdB3vkWkGteB24akq+qqeXxytRd4n+lXjcuTcY/5w
         mNmmXg82mvdp+KQGLSb0jB4SynxlEESadDv0JBSDpUv35Q+Yq1KyHOpqnTNLb3lc7RYd
         GOdd7QVPJRVlxyFUv6p4KiyYD2uW/NmoUn3lUWRQpPENoT4dZOMcvnY0plFTmPnmG0D+
         oCNnD5VDGA+mgM1xZgftuT8vsig0k2S4fGy1/sgWtmulfQBfc851uCTlY1pjlrv6HN7z
         2fF9EYU4XU4wYteCQjBqzjK9EpssinYILYK1IEppkE96Zfc2vHgs+2I0/xyRz5gOuAS2
         46Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUN3OfIkfhu5Ivbdn8XfYLSsyFf8GDUgAaNwri3t06zt+M9HVL+68WW+jXWGjNgHUmnzJJbr0sXb9bWww/xwlD1xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypkF5uWfTQlsF7C4GwQ936wlyJ9hQVpVhQwAm0/5Xbj3p8sR6q
	s66B4i9+agPtwa8HecyDgnCzD6CpjjqbaTfu7SV5n8Gf9edBxi4WJbi4xuYstiBM7DwDvQ9PY9J
	fjr8XcrT69rNv+V4ixmhCumtwyCQy3mdmJr2oqXZ2ew==
X-Gm-Gg: AY/fxX6zq5qPqiKPKAX81Bibp6EZGOhyFDK8anSrE7MNbBulQ+YUifiyuAzv7+fiQv2
	Ie0iW2PDh/mwqGOxcQh7yfDV8Ve/zteB+xH6T+uI/r5XXImVCKM6BO08KAD7SUcAllhvCeTcW0f
	Wdfh9rbPOOTJdI7MMkuKGPNcKbHFr5FXl7HRFquedvof60SXI225UyVv1JxsZsSg5w7rUNs/KmR
	AhqN0BGMyZLnt5XuZjXro4rKAP212v+qHiHa6PwZEb7IoRDrfGm+xQkDMjJoP8NzC7XnZPr
X-Google-Smtp-Source: AGHT+IEttooMjctn9PTkIuV8f3vwHQovTQjSbQYqje1s67e6BNM0jsY/HxweNA+t464KEMm/FbSoYdRYmcWx72TwOXs=
X-Received: by 2002:a05:651c:211f:b0:380:c72:d495 with SMTP id
 38308e7fff4ca-381216e11c8mr8642701fa.32.1766142013519; Fri, 19 Dec 2025
 03:00:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1765885807-186577-1-git-send-email-shawn.lin@rock-chips.com>
 <CGME20251218182343eucas1p2d8e8c97da2f3abdecd0a2f54b06c10cf@eucas1p2.samsung.com>
 <1765885807-186577-13-git-send-email-shawn.lin@rock-chips.com> <75e28c6b-c62c-4c84-9b88-6bc8902b8c5b@samsung.com>
In-Reply-To: <75e28c6b-c62c-4c84-9b88-6bc8902b8c5b@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 19 Dec 2025 11:59:37 +0100
X-Gm-Features: AQt7F2oURQ4eEyNd-d-X-XErN-cMe4gNff2U9XSWa8nAnD2DQAQhIueK-BGrKpk
Message-ID: <CAPDyKFpfU5Qxutx9WTz=4H0mbsvfsScWvTDi1KqP1Ab5_iaAjA@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] mmc: dw_mmc: Remove struct dw_mci_slot
To: Shawn Lin <shawn.lin@rock-chips.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mmc@vger.kernel.org, Jaehoon Chung <jh80.chung@samsung.com>, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Dec 2025 at 19:23, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 16.12.2025 12:50, Shawn Lin wrote:
> > This patch sets struct dw_mci as mmc_host's private data by
> > copying struct dw_mci passing to dw_mci_probe() in order to
> > achieve with mminimal changes. Then we remove slot everywhere.
> >
> > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> This patch landed in today's linux-next as commit 926311cf3361 ("mmc:
> dw_mmc: Remove struct dw_mci_slot"). In my tests I found that it breaks
> DW-MMC driver operation on Hardkernel's Odroid-HC1 board. This is a bit
> strange, as it works fine on other, similar, Exynos5422 based Odroid
> boards. On Odroid-HC1 no MMC card is detected at all after this patch. I
> briefly checked the code and I don't see anything suspicious besides
> this host vs. local_host structure copying... Reverting $subject patch
> on top of linux-next fixes this issue.

Indeed that copying looks suspicious. In principle we end up with two
different data structures for the struct dw_mci host, as the callers
of dw_mci_probe() have already allocated one that they may operate
upon too.

Instead of doing it like $subject patch implements, the allocation
should be done only once, upfront by the callers of dw_mci_probe().

That said, I am dropping the $subject patch for now from my next branch.

Shawn, please re-work the code according to the above. Even if that
doesn't fix the problem, it's still the right thing to do.

[...]

Kind regards
Uffe
