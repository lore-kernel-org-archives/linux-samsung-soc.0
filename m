Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793500854;
	b=M57SwIRi9ylX/igogxpJQgAZ7eGCsOoGnmDsALcX1dsD1Ai2y5F6ll3Al+RrwTfhoo7a
	 TBHo92oEZP+pHQz0YQXgRJmbSfaxIbGNRU8z1LNOiGxCiJwTO0dvK2VhIOuCXfuftlATL
	 wMiWWBbwEMqZIpHkfj2yzLKPYookdKE+Y9u6Kn9YOscdqm4lJP/TPL9JKkgai9ZjFSZ9y
	 kWt8ajEE8a/1xtoe1wje9FJkEynLbRbbkT88eMQFmWOxX2Dn7WXw+wRx45fTQi8+aORtH
	 8vzj88sqfAbLTFbYmyf108WBFekAVOPBbadcUUenmj0YmZmof8FuNtb1JT55Qt4Zv5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793500854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
	b=U/6KguCmoZGRz+OkVRL6mxpHcHpsQuX3MtcKwkNQFeNnAgeyE6oJ+LOXDRK5xkFVtz9q
	 YgxsMQKXLfmyo2JdBnQPkFHPwls0aGax5RwCzVZl9nkjzcBe7MoXWQ5Pw5UHaAFArOELO
	 y72IKVd0c35OIwXg8QBX36yFlzy4SIGhSst1S3FFCnvk70dSchNnqlrqLF3hgvSL1Hu5R
	 Wq0ORXMn7MeQARy6rYer5JAiELv9kTx+ivg1Ec28I9kJAiXyFHw5KlWnoED+ztzB8rDUf
	 4HrWhGzpBTmIeftnoiIsFvq8TRhz3ljBjFgkgDCo3vWyN8eSCXooldUCYgyKRGn4uHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.136
Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F872606A327
	for <linux-samsung-soc@vger.kernel.org>; Sun,  1 Nov 2026 02:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F872606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f8.google.com with SMTP id 956f58d0204a3-6798922d252so821330d50.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Oct 2026 19:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793500853; cv=none;
        d=google.com; s=arc-20260327;
        b=AeMoovrcGuI4aMKV7YpSjwzhtAT/urR6/du3RYzlJja9frZj7uDw317mtVq5IPXuEx
         AICw9XbXV8K+2PR20j6/6LWTQtWbt9/cAjIDbwVLRTHUMXsOBY/OAnrswMHQfcglYoDT
         EduWUyaL4d+8Xx6gLtoIMYUs2K5ZsLy8Msgeo7fWTiIw3wlVLJbDbVyJQgUn5UPaQJyg
         qTgze0pIX8IvIMyBHO8YbDW4U6cYt6fyLYXOJ/mIjV7LJ44ESmSlpPHauRoX8aDQdO12
         Vxy0FotxTFtzIYrZ5BNmcjNOb7zqxJMcZarwnsI0LICu0vklA94a8bF0vzJm1TjS8Gp0
         5AgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        fh=o9/Sdbx7ffvnzSNWCfi6ykUluT8vQPg2h3T+LShO78o=;
        b=WndiN0LM/mulFPLJw8PmgmCUTxq3/Bspqt+Fnd+GW9lLwvc1kfqGi1GY4rNKiaLFpB
         VCGuk7DcENisoOig+CObZU3cyc6UmLQrbcz93hkR2flbaKhuDMmI18wEy7jJegcaybuH
         YCQ/bFxd80biPgmVMlVl4lFh1eY6DtTasqX6kKDKyLyoazSuTqmRxoImDDobOhSdU8ft
         THrFicc26KfK57QXT4YQHOW+EIsFXXD3/HYG1lZGJbURF9pFLkDj0pxcNLYBrn6yuieM
         dGaVHNPzhWUZR9dZrQko3RAd4vW01Y06WS++6+7Jfjo4F5ls89Sz5QdCQ+kzHmXArGli
         3Gwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793500853; x=1794105653; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        b=BdFFyetvdnDEMnfGsoIWQiMtKPBtPDTFhUEhcQqmNX3fsNX9e+lwkasxGFsEy8ZtHU
         9bdAuna3av4LHkc1kFrP58sIUjq3UyEONkdZHf+un0JfQXRcqd66h5LeQmAjGv34E5NS
         eXJ0gDEAqh3L2m/g2OQ8ILmrL4vT3BBtev9ZRcsjIPT09N+qh+xo4JYhcbnWMzIER31K
         zM5D3VfhSCMVXG+Ak9S9qpIpfEkAuk/05B3Qlvzfg5ys1twUAl1fNw9iJ0MKWpYWYOux
         +OKkYhgTfBrml388WlM3d7x9nkOK9jjc1uFw1iMTWCosMy7KWl/aFChbt1Npo2dJrXJU
         ZO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793500853; x=1794105653;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1IMLP1uSL37pYuVPWPBfoKH2KOXXSQSRBqC/yvZ530o=;
        b=sbMnx7ns7jtDnCC4nZ5hjBiffWxvwgBKsE952nML2DZI0hRVs4GNUlEVPOb47sBxWQ
         ZDkjHLoANvsDV03hCcpsMtQJC8aUx5VuTqiNCsL+WnBqkLdPdaOhQi+0ZPFW7e4p+BIs
         M6WyehB6arDnK04hADl84M0x54jHdihnEoOERXmU1ohylIMJZzr1cY9dhZk4EVt5S486
         su728KUWg6zQ2/igx8gompwPkEttmVQVe+HPM7jeMbX7Xm5DmtRRNUWoYEmGrXA0fLY1
         ieuInv8/wuz/mOtiZgt7gdBLduzBg5MANaE+LaHaCHT8ZHL9yeNh+7XomCNpgnHiU++k
         Mv0A==
X-Forwarded-Encrypted: i=1; AKwUvBzJdUeAIeM+l9cV5/u/ZDOe6gJnvvrSdIb7Ktn4NkHkWt/cOrntj6h7SetHFEc47lID2s6+fkM55XstbPEuWCMmzg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nyhfv14EvyESaVOls2rk98uXAB6FrJD2RWOqdJPskYZHPQQIS
	WnAiNCkYLtak2f5nd/5K2u893e+ac+Y/XfCxhqSg65xlDonDCBWxYerZp6mYO4UGecrhVnRTexO
	HyynWfsBld+sKmaSiGxekRJ74XVn0HW0=
X-Gm-Gg: AYBFou2hCKzAt5wbc5jHCnL+/3Gohep6fCYfDcvQhRbnx5Ls6zPYVsQmEwKc1hf8NwC
	6ED0yrSNuYtxaffvtWnKkzTy22OWBJRlg3uxJDPczbiE9pN+vadOA214Qep3RsryRUuLVB0NfNK
	NqYa19I0qblk8BIyu9v5Ncp5YcVWUe6aDkOfD8g/8tTVukYk51PWiTgqBOT9+fc6cxOH7+Fd9lz
	taKWu5BJSmSDbmR33AE5mkkPW8D7OqP040KPL+tC5zbMM9eIXba/P3MRa9p/294NsCwAyIV2rhI
	FcMSGRcWRBLg0fMFHrwpZVrlwrTIK5FFqpr3mHLB40292tTSShYGjKdI3zePGWAJwz48UeWgn/H
	BajzrV4GJX645hmwfxX4JqPmPfVuPEfppuf4=
X-Received: by 2002:a05:690c:6989:b0:8b0:ecb2:884b with SMTP id
 00721157ae682-8b2b6707c48mr49035517b3.26.1793500852565; Sat, 31 Oct 2026
 19:40:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 31 Oct 2026 21:40:52 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 31 Oct 2026 21:40:52 -0500
In-Reply-To: <2026103142-shorten-shindig-bedc@gregkh>
References: <2026103122-repurpose-cost-2da7@gregkh> <20261031152656.1422-1-xiex16070@gmail.com>
 <2026103142-shorten-shindig-bedc@gregkh>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: akari Akaza <xiex16070@gmail.com>
Date: Sat, 31 Oct 2026 21:40:52 -0500
X-Gm-Features: AclHuK_3PZPlhb8eWBRsqZBFCzLH4zAeC2-QvNwLLojfXV5DV2NRjTLb-47rKFM
Message-ID: <CAJePJ2c8b400Q15=GrdDsJ=aF03g+ZwcTx8ZsJCDM5uHTH3k4Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] tty: serial: samsung: fix TX fifo underflow on flush race
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, krzk@kernel.org, peter.griffin@linaro.org, 
	alim.akhtar@samsung.com, m.szyprowski@samsung.com, samarth.colleges@gmail.com, 
	linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thank you for your honest feedback.

To answer your question, I'm still a student learning Linux and how
the kernel works. I've always been deeply inspired by the generosity
and dedication of the open-source community, where so many developers
freely share their knowledge and work for the benefit of others.

That spirit made me want to try contributing something myself, even
though I still have a great deal to learn.

Looking back, I realize I was too hasty in submitting this patch
without having a proper environment to test it. I sincerely apologize
for my carelessness and for taking up the maintainers' time with
insufficiently tested work.

I have great respect for the rigorous standards of Linux kernel
development, and I understand why those standards are necessary. I
take your criticism seriously, and I appreciate you being direct with
me.

I'll work on obtaining a suitable Linux testing environment as soon as
I can, and I won't resubmit this patch until I can provide more
thorough and meaningful testing.

For now, I'd like to step back from this submission and focus on
learning and improving my testing practices.

Thank you again for your time and for the work you and the other
maintainers do for the Linux community.

Best regards,
tianci xie

On Sat, 31 Oct 2026 21:28:16 +0100, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Oct 31, 2026 at 11:26:55PM +0800, tianci xie wrote:
> > I do not have a Linux machine of my own. The x86_64 build above was run
> > on a rented Linux server, and the arm64 build was cross-compiled there
> > with a no-libc aarch64 toolchain; that is as far as I can take testing
> > without hardware. There is no Exynos or Apple board available to me, so
> > the model is what stands in for a runtime reproduction. If you would
> > rather have the flush modelled as a KUnit test in the tree, say so and I
> > will send that instead.
>
> Sorry, but stuff like this you are going to have to test on your own
> system. Why would you do linux kernel work without that?
>
> greg k-h
