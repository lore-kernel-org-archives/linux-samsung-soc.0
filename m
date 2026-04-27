Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D617237105D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321835; cv=none; b=ExOpi8AZED+qU84joPPr7GlBMv9ytteZkkjZ6WHsHcOuTM2SZ2w9jl999dfgZL42HFcsjLKObNFFR6Llbqzk56SVcZHrOMCz9E/ZVXWJ8IURv3obg0ZHWDJ3vG+cLlQeGswz5pWLs8CE6wzNaUB9lsu03lQbwIRfmy5cri9OwXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321835; c=relaxed/simple;
	bh=TQEQTKF6Ane8FSjdQ4dArHvWB3kPyNAdQv5Hh4WVCxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYF2G+lzke4IOdwXTGLypFYOdfm2xM5nkVV2BExsBOnW7tindNJkZZBQng3+MAPD7PzAuDMu3TXcXnnJP7P5JncdQfiSs5zUl4iyQLLDEu5HhxCP0Xc6x1ODrv87l3dNxNITPXyT6A4ZpALSKS9i+T5aRNk/AH3iuYIY0IERiLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpYow58O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpYow58O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA4CC2BCF4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321835;
	bh=TQEQTKF6Ane8FSjdQ4dArHvWB3kPyNAdQv5Hh4WVCxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JpYow58Oh6UmQ6oQIR9k6FnDXQMeAn4UNotWUB8IhSKo6sdD5WOk4vTxxxnRYIi9G
	 g/kqJAe15f8MNyijU4NkF7suJb84IkjaTVXhFMIp9pvT2Mo7vWvjEcwrQ4lSEkXjhh
	 vVAXNN2L4tEDc05hXYVrsOPZGoa+NX2ZABfq+7ZnNr5UvfJCizQ2DNzp7OMH6fIloK
	 dYdiWYl2SUZV+cbeWcTxaNpIg3oRv0NYyGqv/u879pz6cl63GIOK1SLsIgyXHAZUGS
	 EkVRnse68NQ3u4s6b0+odC5EnxEf83QDGPteAEzrMEfJcbS5xQsLDHK8L9Ga6iJ0pR
	 vkDjUOn+Md0sQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so105369701fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 13:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+joWXzuOfc4TX2d3Ic2BTHoTfEDoRMA7ks124LmUc15Pf2LPgX6i4t/06Gb8QwbQaIUNVEe03mxJUvexAwvbSEnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5R2gPnkiW1IeNY3st4DdAl68MZQHg4WWfTXwTJo8A0zposEGq
	ZTLINlzjGg2pkBeeSQ21JSt/YW9BCcOdwYhFruBaaKDb038pjCe8KXBjlMzjrsktD9ifkqNckZU
	aE5/L5oLcpolB+kH9WotArn9qg2CSfE4=
X-Received: by 2002:a05:6512:128c:b0:5a2:7b74:3c60 with SMTP id
 2adb3069b0e04-5a7466143cemr122787e87.33.1777321834378; Mon, 27 Apr 2026
 13:30:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427143546.3098519-1-arnd@kernel.org>
In-Reply-To: <20260427143546.3098519-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:30:22 +0200
X-Gmail-Original-Message-ID: <CAD++jLnFimSnV+KhRq4kL0ADXPy1sNd_1vBViG6=kADOF4Sz0w@mail.gmail.com>
X-Gm-Features: AVHnY4IDAqphHkFYWq0uMk0MOZiHZ4MXXrvG-QLMzzb07r9LDEqh7dgnp_Ijt9o
Message-ID: <CAD++jLnFimSnV+KhRq4kL0ADXPy1sNd_1vBViG6=kADOF4Sz0w@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, patches@opensource.cirrus.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 4:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With comitt message added:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
