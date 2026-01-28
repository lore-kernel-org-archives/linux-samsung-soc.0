Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304DE2D94A4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 21:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769635377; cv=pass; b=JcR72Ta1ynNNfzUVINDkQ+cgEd++7u/LGt3FJK0emD4IxGwB9oEwZunZPsqFMT2t7pTQiA4jB3hJ6c8f7onzytgKW23dmTRW4b9X5TiSatKeApxXdsWbBZqwN+u/zE3Qjaci+8rzM71qa79dkd7U74aFInIJ81kC0I8qtZT5Wow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769635377; c=relaxed/simple;
	bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jp3TlhHzK0vBK/cU/TPHPz5AA1VkQRsqxNEA096Oo3r29vLOduWDS0qNX7vqS5PYL5YwzQcnGacrPwc6vqXzQComhlY/U7Rhj5X4rcRdpxLCrYJ5KcJzIib/wadQdEtzfWzdiNhvCH1DveeSd6g2nZrYYkjREPAcN7V/hGO3oik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjD57iIj; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjD57iIj"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b720bb90d0so349214eec.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jan 2026 13:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769635375; cv=none;
        d=google.com; s=arc-20240605;
        b=eOXyRxyZ1RuBf2Oh3VjaNRs41BDiQwOR17vkulauKqi3zkhtqk2RNMkMjTnlJUgEUn
         HBiVxDmNB9QSi0Vr4R2Txp7tRCXA7IbHKJchZeR3qLQ+HmrciSU+gDgqwgEKEhOP+x7S
         Y6aXgi9nLotDVqPLutGO6kW1+cszVu5sSwXpDzxFU/ZiG9aW8Rz0e+DLg2WgwtKh332b
         D5IGwYlJZYI0T0pjeJYBsjtxuEm5riiht2D8eqQP3B6clfQmWcCFrOWUGm0pP1N+tl6Z
         AW+qvyWyieS1UmeGvHWY6G21QXh54AeQU6jJAi3vUDdkC29Gwv+vDR3+xpkyKZkmZ8Xn
         SZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=;
        fh=gCxTswyZ9jlpEfvCIfu0X0fu5a+6QAqvj+5rQd3JdUE=;
        b=cCoHoHTRJF71GR05KQZLBSdWNOpqJXxK06nOUP5mpOH/HL47EljPWpSr2+35QmfJl6
         04ohVTMM1dV4s+LhqsvUzRMg/jVus8UbwoQXcnOTlXpKHNQ6XzJHqtWM7Ehs1MSx0kJi
         vhWfLbug5L0ABFt3nW1z7bS6R8QmoSc2y0KOsZWnyOBJTnZEFSyTZ3ExJPQPQMTdifuB
         ntZrNnb3i5nEh9P8eKf1cyS1Tgj/byJgpFapkhbfEay5QJf5QxX48ob3sXD/BuBnq8xl
         rAV5JghVTCdJwgeXGc2zYb+p5Jojjjf83xJzWqfqgT3C5u+dKmt6Mcx33UovcNTtnDdR
         2SfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769635375; x=1770240175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=;
        b=NjD57iIjsH8S2LAJ4XyOQd5T4BNyWLpZ8OSlbdf+zDlsIlAwTwncGYPx0kLC37Q2ED
         4SEbrVtWUu841KluvqulH3fQy02TFlsNf5QZuMVX/kk1d4F0ZLAjzEp15emac04HRuvs
         4FatNmM/1pqzX7gL4phvbLt2bAA094Weh59O0RONLCPWoA05C8vY6jUsj8JrOSdr1fHy
         KB5zRJZKFwB+oSrJ1ex5/7lKOB3qiZfV7HC/pgGDPPbp77VySwO/aYYyibFU7rs6uQR7
         uwB3b13WbONDGantEQ8i6FIA+c5V0kx2So9xbEPv/n5orM1JN9Q6luazee00M5Fi1+Vo
         iMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635375; x=1770240175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=;
        b=X/q08U56zpo2Q6l5VTXJa+rPzGr2w1A9txBuyDdFiGG+1ThHWWbxvwOR5JZEZsswV8
         lFFrBlnEIBJU7nJKjrmJLGBaMMtJEhgljFxWBNbIOQCoI7e5nNF0PZvo5jtesJqpO0Vf
         6CNAkmJgUcFCN3yKUuJt7VUx3ML/rg+F9FATBxKZR03a3Q4tDSyRQSM8oyG4xv+kZxtI
         wzlF/OIewt2kMpG2epmwSglJ+/ebajNpvOrfIzUqbcC6F7KsUxJZ3KGgU6UtYdahKAVs
         1F+PNhnvu4p9bi8w742yjgs4r+0xEkyQNdJAG5gADUNaN62jgugnuTfyWmfUDV5tHke/
         q2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVG6p5nHxaulVXfJ5Ec/4tlYtjh50kMCjR/PkTCKK4PkXJ7pZiMs4YO6tNA9KxHb93RHSRpSQ7sH8O7P+TSP4qQ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLe0H9WdsAaIlBjWsdNaVaP1jNcIaA41lsa7GFyNlk+pAy+Ah
	PQcZM6ytKLQ/c0rGYzthwM8AUL68T9IQLb1qSAk9vmQsEbvzvbcaF//iA/YI8SW3rTEQz+xkmpm
	/aud/2nb3y2ThFbqTijNGuFVp/NHPMaW5/ftXB8ju
X-Gm-Gg: AZuq6aLt3to5CbJkRrU2MJuYKYIP3AfC27wJmxP0L0TL9hrfc5MMEWwzObmZJ/mLu4i
	ogdBDcqYAKyZG+H7Lxmo/uYVSHD3bkuw28Y5HV1XXN9wRqPZjo4oiQM7iaIagSoHRiQZjuDx4oC
	ErBnjPhhov5WzNgi9IDYW+hizWTM4dIQdFwFhPL2Zqy6msNn0WeW/App4ciaQ929/3wtB/kti7K
	u66mip+aKhVIO2KjQ/AvDhqtaXCxJ5BRn/W6zNKZqeKiaLYSB0S0KkSpX9siamweksHoXOq5nda
	/rwo0AZL+x7ezYjnCZRC9gyP
X-Received: by 2002:a05:7301:7018:b0:2b7:857:db6a with SMTP id
 5a478bee46e88-2b78d9f1c0bmr4508715eec.21.1769635374810; Wed, 28 Jan 2026
 13:22:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
 <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
 <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com> <f13cf27da2d1d7d8a54448391c16a8eae349e8a5.camel@linaro.org>
In-Reply-To: <f13cf27da2d1d7d8a54448391c16a8eae349e8a5.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Wed, 28 Jan 2026 13:22:18 -0800
X-Gm-Features: AZwV_QjQO0e1CUwWeMWnyIH6YTKBepQmAq6Hj7xEJz2yP_wXTgaH8YOFAHXb_6o
Message-ID: <CA+zupgzMzwt0Uah_a+frFf=Ek5nG_zFTsupbZ-ZHoAUi0wVxZQ@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 11:57=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> Hi Roy,
>
> On Mon, 2026-01-26 at 18:34 -0800, Roy Luo wrote:
> > the wrong example. Let's look at this build error scenario with
> > "depends on TYPEC || COMPILE_TEST":
> > Given COMPILE_TEST=3Dy and CONFIG_TYPEC=3Dm, the
> > "depends on" would be evaluated as max(y,m) =3D y.
> > Hence, CONFIG_PHY_GOOGLE_USB is allowed to be
> > set to y, m or n. When it's set to y, the exact build error
> > would be introduced. I also tested this locally and saw
> > the build error.
>
> Thanks for trying Roy. In that case, it should be written as
>
> depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)
>
>
> Cheers,
> Andre'

Hi Andre',

Thank you for the clarification. I noticed similar expressions
like "(CONFIG_X=3Dn && COMPILE_TEST)" in other drivers,
though it seems less common, which is why I was initially hesitant.

I will send out v2 now with this change included.

Thanks,
Roy
