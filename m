Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3A1E32B7
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Mar 2025 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740852732; cv=none; b=DRqzwq/cINuIYdiEhe3LWm+Rg3ZL6GRoya3LU1JJ9mwum10E5Q/mB6eJezAAIMy4w/e2bpFjU2KnH1iW1Vio5iYGR6r9mnq+oysbvMoCSBj70RmAKSYRz88lADxxKMK04RZ7gZm/zlXTWJ3cNs5MYy8A8gyjvotmQj3uImXvwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740852732; c=relaxed/simple;
	bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ms26u0XwpIxQNOKbb21u1newNBXdXP2t9CPjziKrUKdKYmvjIWHMiNpvXFb7neCYKjr/t0EC3ftRFZfjYmg17SnNyopKeBFL9fArfuhrrdIIApU0peit+2Lqi19NKYfmUU5A9fBh9pGZUhIeKaZ6m2/U1hwcZc7I3ODbWNOkGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwNuzjJh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwNuzjJh"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bae572157so2121521fa.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Mar 2025 10:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852728; x=1741457528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=LwNuzjJhf8t9gZFJEzYdneEttpVvh1M5eiizXXvuG/Jto1lri+V+J2W0n55nuC7flH
         tPthnUkFlSHBwpcq4OkxyFDhQ6SdBsVOQiWRV26MVkT78mCpTH8MoMMw7Eg3OYrLLYyK
         cO83MtN0um/VtLfV41ho5z93VBU9jo6q/6fTz8iSy9MfI5b5T1lGFbCIYc5Xoq69WOcu
         YP2VZ+/AJkWZM1HsOC4x2/Yj/hiUNEA27MYiBBRHwRMPThB8l4rThWVf3PDk6DSal3KY
         vVgtDJBtNhcu6f3tGIljGTyJTDOoHkLO5eflGtRBkVewkcxs5LqDE8a04oGztKIrhGmf
         UM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852728; x=1741457528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eg0hFQaD8ycLhbpwZvT+7PAZXueZuxzeChkcp4728Mg=;
        b=VzcsWz/3aaj2HrW+XoZcwQEjef1dDjcFwLodVmz3vGSLT+z4cwXL9FrGCAerX4mCk2
         QGSfR0KxRB/XUhS95q8tNf0BPahRo8W0aPQMHVw44Nirk9Liimq0mMD4suqpb7/iR1BE
         PafxuUCv1HXPVmUOibj5gnpOg4p89UlsYSyKBcccBAWcw+WCPC67zCqxv7Mi7Xhme09Q
         p/TLStj3+w11rcJxXU0EovWJl5RqJC+Gypexd3QBxS8jOq5hxHvdFTZ5aiTJXW10OK2W
         j1MYHSXeGBCACl0tZ0zDI4No5bRcUEn1ingh6cTrH4iplnPZw+pVwP5g/PeT0mOccQ3C
         yK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqXpTwJ/tua4S4mu7cxnjRNtOaQOGIxJdSxESHhO7cXLTbZw2ep/EovEq9tt4o1ESZNrYL7gXRXP3DCGp74aaDmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxYe4tNqtqkKJAkxxsL/XfJeM5scXi3z/wwdvfPPneXaoxnaip
	L37oOdzpdlluNLYHwyZro4xG1aYYQ8yyBHnuXWeXVR07XeHUKOxcgocPLk0OhHl5+u4l7wZPtuG
	6QLbJ8usg7Q7nz0EXYoAGeksmuM27AkvdAvwE5g==
X-Gm-Gg: ASbGncuys78PAG9+Ehg4yCjAOSLoPLHTtn5KhqhFnK71vu/maPGnoReXSr+ayysxQPM
	M3ipFZnx+vsO6pk6O1KyNY5dXSQWBKgO0zaeoxYRMx0UpkRRnyVO9/vd99JaGEOnMZApwfnQSQS
	nUxBnC6/1NZ0hUoCDhxlI/U+PzFA==
X-Google-Smtp-Source: AGHT+IEH99Tq5urSrvxoc72GqejnsJAsNSDML6g3rnh8KP+Vmtk9gqB7j3gZFHmLs6QHmiQqUlP2gDlbwUBJuyx82iI=
X-Received: by 2002:a2e:8052:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-30b933037d4mr26808421fa.32.1740852727658; Sat, 01 Mar 2025
 10:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:11:56 +0100
X-Gm-Features: AQ5f1JrUCPCMLG1ATCrGher1b7FQk-JSwRhx_use4qjyzNuoMvAXn5iqo9KhAOA
Message-ID: <CACRpkdamF4B1y+zr-Y_XB8gAoSv2Q2U4VxuZd+ivZq7KV1Quyw@mail.gmail.com>
Subject: Re: [PATCH 10/18] rtc: pl030: drop needless struct pl030_rtc::rtc member
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 3:07=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:

> The memory pointed to by the ::rtc member is managed via devres, and
> no code in this driver uses it past _probe().
>
> We can drop it from the structure and just use a local temporary
> variable, reducing runtime memory consumption by a few bytes.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
