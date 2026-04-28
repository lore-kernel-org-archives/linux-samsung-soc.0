Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07003793B1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363710; cv=none; b=MJ+h9RT3mc5Bo7nwC9/sY2QYyUvlkykLKJ9ogrgHRI7MXrV+pHE60Ry26UcCaewV89AoXOQIMlAS7886tIhfWRL4rAdsEFkXXTGyOhBzdrBi0Zqp15bBqJy1ORsENZHBJz5ZoSwPPvk+aElJz8lIhuRnNogasBDRdDaCFaJ2DXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363710; c=relaxed/simple;
	bh=wQ7+PJSmEwuKa5Wm9vVOQl441ts5aBzLQ2j+pt+YQsM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZVX+M/UQ9UwVpIGW7cPEkcp5y0e4G7r1fDMTwThPQh+sfOrLmvYl0o9AKXyrft5ZAMLAsqHE/G+LWyBdtbdtiDihRee34XVnLNWhHLaZs1Dh1PLPRw2fNF3zZYS9zbuXKzmzvK8R7FJs2DKc2ytj+mMi2iz3BxZwyVjd4ODeX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYMONDpP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYMONDpP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173A7C2BCC7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363710;
	bh=wQ7+PJSmEwuKa5Wm9vVOQl441ts5aBzLQ2j+pt+YQsM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kYMONDpPMl064k9Bnk/LCuTXAdtBo1J4GX1HgwnWrg+YqA0iM8lMAMv0sKz3T0wHM
	 7P2iZMkfhuco+XKS4MB4tEZhUPmLuvlWquFLryXRuqOXB8RXZ7VlEveKC2ufMCHfO/
	 CEMcvAzegBXZfB/ownWI/xabOqCvhVBVSjNPCYOTbORmbBR3q9H/nOP6Nbef5x/6EO
	 BQGJy09lDdcp6txWaI70T9BunnDcN0YK/ZvapZZX3/e/KGqeCVJb1Bv8ZKqgN3+Ve/
	 4UKMRoqkHu7AWpQeItp8uqyoO0K/AdGy/h3pQMl1fXm+zBr9XWccGKRAnXEtEku1zu
	 JVD4SCkesh3AA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so11081954e87.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 01:08:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+xPvemLTe7eTooC/uJXVG5NYgWrL7vr4caRctOmqJVAGj/i42AAxoAZZ0YPcqHkQnJcukGZcBIAxUiIpOmrSOOBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwglHyhHVicatZ9fBAAbtQ+ZN6izt3aWhX11Tec5VZ42ATr+XlB
	MhrELoSGYBIR0fycF5RIKeVyItssZUUnRiTD7ShcQzNFI8WEJOtVZI0ZUZ8SZdsoad+ylbST9fl
	/f5eMas2VrjVYk7Y1qDvZkc46w8fmZ93jUlsWaexVSw==
X-Received: by 2002:a05:6512:2247:b0:5a2:d239:cb9c with SMTP id
 2adb3069b0e04-5a746626970mr854062e87.28.1777363708792; Tue, 28 Apr 2026
 01:08:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:27 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:27 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <1441dc76-764b-4490-8d7a-85dc3b01edac@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427143546.3098519-1-arnd@kernel.org> <1441dc76-764b-4490-8d7a-85dc3b01edac@app.fastmail.com>
Date: Tue, 28 Apr 2026 01:08:27 -0700
X-Gmail-Original-Message-ID: <CAMRc=MegU6W8pQm+CQEZ4eOESX1HykaXLaA6k62CY-PL7e92NA@mail.gmail.com>
X-Gm-Features: AVHnY4Kzvp3OPVMuci59w2HJynq7CNcwzE5dgFc8-UQ4n_fxMJn7lfLy70-B3RY
Message-ID: <CAMRc=MegU6W8pQm+CQEZ4eOESX1HykaXLaA6k62CY-PL7e92NA@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 16:38:42 +0200, Arnd Bergmann <arnd@arndb.de> said:
> On Mon, Apr 27, 2026, at 16:35, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Sorry, I accidentally sent this without a changelog text, this should
> have contained
>
> "The crag6410 board is one of the last users of the gpio-led driver
> with plain gpio numbers. The driver has several ways to pass this
> information without using gpio numbers, using a lookup table is
> the easiest way."
>
>       Arnd
>

Ah, here it is. You probably need to resend it.

With that:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bart
