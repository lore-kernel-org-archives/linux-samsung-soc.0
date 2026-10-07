Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221E472782
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369373; cv=none; b=Bdxc7OiQk9D+O4jvuNry1tOgFsG41iZS/NwARLLcLjjD91aO9WnN0bp+ZlvdB/L2CqKJdKzrj6KbS49BAS7Mj0Fdq3DDlQFE9hMsUsEESyI1oiNhfcMtvE/z2c3UBh01lZ6MWoFUpv50QCBQoyJACwr//eBRAzxMWdS07P8yhQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369373; c=relaxed/simple;
	bh=gbXw/P13odUIJOlP0mZOEYL/A5Hj204/xec9+qFdyQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCUy+GJ8yNM+jxRc9JeNI+VJKD7M2OBxhqCE8fY471QtzzgO/VfIoE6k6WejNe5A19KTTjy52cHNiBVU69d+xLKNOOfe+IQ8jlUx1ZbbmkHcdpim2KYkjb8ImzPtbdFxqTi18ptwtw+FUtpPoaCgPtZtfbA9/N7EjeP96z58vxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvoewflB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvoewflB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41961F0089C
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2026 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369345;
	bh=bx6mWRdOWgIb9ye+nLE/tkjNc3nUXMNF7mOKMpqxWAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZvoewflBJxOXYhrH6N9dMuZRVH4BqVoFArQ2EiVqBeQfEpriWJLYDn9eXA8aeKjrr
	 xHBMVyPdWWKjI8vDDaHGAebd+PH6Gh67PZhMHC2xlh9fbnNNuDdVB6XnbxnY6oiq/M
	 5pWTjixqER7QC/m+Cxtl3zHHvE1Bmfnwp2OeT3QoGcLgYV4jhUJu+k7ORjhqWyXMJQ
	 x/2M1My8oh1hvsv2fLcyZVg40XZUuFmeyrxSoDefsES1U+8YW00pN2k7OPWBBfV3VV
	 bZErqZj15Yj0xFn9/BWsw/tGRI2yuYXxOP2igQIFIlvZPhbZxghvE9bpctbdGvDofG
	 0v3eUTKq+qyAQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b8f5e2ce5eso1827316e87.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2026 03:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwr+Jwh1HuXLAf//Cv5tCSBWuuCgLXgcmhRCMFffQSbtBEKNbAZH11JSz+Pb9lDLteXl1bDyWsfS5DUsRQlgGyyZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIL4sx+cbnT+VCZ9UMBouV5BacyVqs0K2p8HEef19EKFhtdVDum
	R1pDByBYaKvbc9ejoHyN6md10bLxJ1nSnIUNdegMdVXvKQh9cwxYO2Oh+mZH9F4eL1BMK9UeHqk
	179Rc+A+qStaFQGIJiI3Xb/oYdmfU4b8=
X-Received: by 2002:a05:6512:250e:b0:5bc:b7f6:99af with SMTP id
 2adb3069b0e04-5bcd0639aefmr556834e87.1.1791369344545; Wed, 07 Oct 2026
 03:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-5-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-5-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:35:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0CrXLdaq=0XW=dkctKpJN7LNZkobo3fry7O6J8wuVzg@mail.gmail.com>
X-Gm-Features: AclHuK_GYh3LWvdqsu_xdCZ9-oDxmD2HZEJ8XaJYtg9uAMl6VGST9hL4DFl5ONo
Message-ID: <CAD++jL=0CrXLdaq=0XW=dkctKpJN7LNZkobo3fry7O6J8wuVzg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> samsung_dt_subnode_to_map() can reserve map storage before adding
> configuration entries.  The no-child path returns its error directly, and
> the child path frees mappings on failure.
>
> Use one error path that frees the accumulated map in both cases.  The
> caller ignores the output parameters when the mapping callback returns an
> error, so they do not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Peter will decide and merge this patch.

Yours,
Linus Walleij
