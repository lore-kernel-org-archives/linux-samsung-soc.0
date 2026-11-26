Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697882;
	b=PMGb8KAq01hg8NYQdnbS+WoSTleOlDO5gyHLXJKiOXhrOgbu/9Ugbd03+/11uR5OTr3k
	 6+gzq4kCBMHXICC1QSOxHmVUJr6bC2Ywl9c523Yo/C8/9avy/BPsJz9rWtSJWFWJu4uz7
	 5jNMu+Urdko+b9anwf4uPUuh36QKftUXkgJbVuSRYMd02M48hOiMPGrDI1NfaKboqdR0d
	 PPQ8r2Gc21V8/d/4MLFXhxNbMFx3WdH9fJ4ofuOpKN46WgBw4rUc50KeliMDDKUW/UuGc
	 Ps3PicqTSF3BWhSY0adQR0yfflPYsNGwN3hWYTzDp2RivgCKyS7z8XBNucCDlmSXRmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zogW4wCFsq5UWNkLI/4xoNlFpn4BOZwJaLkB2jw5PQQ=;
	b=dQgrWm54ZAR93OM2kdPmVzkvoqVKKxXT2vI0tGObRnMRBcPFP0Te5WalKQoKc9U4rFfS
	 NHkAuuc+ZcTB3nUf5PhsbJGu0k4tFcx2d8PCFlxEypcW1C037V671lwWAYtF9CeY3eMH+
	 cEAut0qbD/BVoP7pecjEelvFewLd4//EXxsfkiVSnYrWXP8ePTJucu+RoG1D9ue94mU9F
	 pviLQTJP77Jdo4KQqMdioKShqDWVpPPe/7D5Mo2IMY+mIjeGjfALQqsrOFbSFvGWRo+Xr
	 j+2mRKTQmvrg5sffM09gNQxzMSdzJ8BpeeDY7wGi16Vxq2CS4LOT6Q2Rq5oPbYu143w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e9xyUUnQ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6CA606A321
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 12:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e9xyUUnQ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so58565415e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697880; x=1796302680; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zogW4wCFsq5UWNkLI/4xoNlFpn4BOZwJaLkB2jw5PQQ=;
        b=e9xyUUnQXLcue24+72FobV8GYWKabzhBiz71TukEHdYQv1T0RhmDA1CfIryDJ1d3fG
         GbtzMmkp6JDrp36KJfbEV3jyGRf6R3XInIzqnssudJ9QhU7la5DJm3rz9ku14qfBRypH
         2cy043HNo57KS352sTroyOTyK2LHkGHZoZkw2T2VoK7BXGSCTdWpUeVxmgAuai6ZVJso
         CNo6XG154vRExH5NKyfo46LV1KSyYBuPaPlUPID7Am/ixPJMR8ut9m76VQVuBA4z0aca
         8bq2cBTl4rI1HG1CYL9XtqcAWteQ1f+fbCp+faWLoDuR/d6K59MkV8woRkWNTnKrsMd/
         UPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697880; x=1796302680;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zogW4wCFsq5UWNkLI/4xoNlFpn4BOZwJaLkB2jw5PQQ=;
        b=DW4m1vyTJCoheqfrqDzjdjSgo2mSa9QNyykI9bpT4wO0Thg2oe5/J3vQeIP5mNLTVj
         ScdbqNlyIBuEaJBymjVn6XGV5H7iTyyhUNZjutu+AqsaJXNgOcDPyX5R9U8AS27cJ3bb
         N/knWXQe+bzlYwUXK9f+mml6ujFF5LsUH/8yKjR6gUnLd0ohHhN0/rBLA0w1Nn7PnDS/
         uBAdJGUP5mz1HPxlBptLZKKI1TIMfuOUuEulSehibSE4IVsxI3eZoxYz5ljD1oDQmgkw
         l6cWFlwlosPMEAHT55dLRVY16c7kNX8qvCcbPnCEAURzZ2J8I2Sv58QKKpUVs4+ZpLSy
         AlBg==
X-Forwarded-Encrypted: i=1; AL+hErEoSon7lCPaKQNKq6tozpbixaLKDay03uLduLLNLJXlZrJ4IqECLqB5xYaNLkndhp8Ari3aBQviSHavViKW1b6d3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z91MpUWEFyZmm0e/JhTkVlLmSdHUBkXXVtsMPF9ISyg6Mrj6bbx
	ENu5eS6pkPFqjf8Re1YZgpxpseZf4xh/uUoJW2NktktFnAQRvdiXGqceDA4R3DOkw+8=
X-Gm-Gg: AZFdTZcpXpfK3STkFddcM2CP1Q+cmUYYijOjFtA9J2eSuG3VSvWMBkCkGkJtb5TgTNO
	jmYDUWQZcyFOwyU4n4VsJF0qJx//pgqHGgcHmfCWLaDXZKwAB3j/11eTgYfEAX9H1+Yy2wP78BI
	8xc5JRKGH0U6++tF41Y/CliSLjq4+69pnZqbbV0IGB8sxJEw6aj+uHBwGzjbQfuQcyxvMiDDJOf
	qe/8zkyyxR9caPGINiotVl5ijcY+3qtkmQN2AhxnU3qMmHBDd/sr24uIwtGD9GjBgJ040dwb6IL
	duSHYDQxKLGie1eReL8zDgaR5S7MpXu37YYzhkxeTzW3Xd1Rk2etwqEnO+nu6Z0V3ncyhc0xjbt
	GU06mdUzFWdqX4GM52+POZUdhK+3LfEURqlxGdUE4gTNRZdr9YAkZdhsF4xL8uyt6wJN3idnw9u
	9ZeL1LM8JoOPJ4VHGaM2DZFM+rD1WVMH6Ocn6zQszDALZAZDoKyLeLEslFydBGyAwVBq47sEg7O
	UQoX4KZr1RJvxX8PdJpRFvU7wjg4OyE5Y2yqdhto1n5NPGUZFtTIPzLuDFPAwVmuac+KEovviPn
	B8OEQQXazmCIDx6ze8QmFf/fK/JOMnH0ZA==
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr431408155e9.18.1795697880151;
        Thu, 26 Nov 2026 04:58:00 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm541261675e9.1.2026.11.26.04.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:57:59 -0800 (PST)
Message-ID: <c3273007fcdc6e6e832ce3e24e6ff7052d46c14d.camel@linaro.org>
Subject: Re: [PATCHv3] thermal/drivers/samsung/acpm-tmu: Fix spurious CPU
 throttling
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christian Loehle <christian.loehle@arm.com>, tudor.ambarus@linaro.org, 
	bzolnier@gmail.com
Cc: krzk@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org, 
	lukasz.luba@arm.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Date: Thu, 26 Nov 2026 12:58:16 +0000
In-Reply-To: <20261125173959.2198116-1-christian.loehle@arm.com>
References: <20261125173959.2198116-1-christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Christian,

On Wed, 2026-11-25 at 17:39 +0000, Christian Loehle wrote:
> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command writes
> all eight slots, zero-filling the rest. On GS101, slot 7 limits CPU clock=
s
> independently of its interrupt mask. Setting it to 0 C limits all three
> clusters to about 200 MHz while cpufreq reports the requested frequencies=
.
> This was found through trial and error while tracking EAS regressions.
>=20
> Program slot 7 from the lowest active hot trip so hardware throttling can
> precede the critical trip's system shutdown. Cache the low/high window an=
d
> update the hot limit from set_trip_temp(), because the thermal core skips
> set_trips() when that window is unchanged.
>=20
> Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver=
 GS101")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
> Since v2:
> - Use hot instead of critical s.t. it precedes shutdown. (Tudor)
> Since v1:
> - Rebase onto linux-next, including Daniel=E2=80=99s queued ACPM TMU fixe=
s.
> - Cache only low/high and look up the lowest active critical trip when pr=
ogramming. (Tudor)
> - Retain the requested window even if programming fails, matching the the=
rmal core.
> - Handle critical-trip deactivation and zones without an active critical =
trip.
>=20
>=20
> =C2=A0drivers/thermal/samsung/acpm-tmu.c | 76 +++++++++++++++++++++++++++=
---
> =C2=A01 file changed, 70 insertions(+), 6 deletions(-)

Thanks for this patch. I was indeed wondering what was going on... Boot
time on Oriole is back to normal in my debug kernel; just to add some
numbers:
=E2=80=A2 reaching multi-user.target drops from 99=E2=80=93111 s down to 20=
=E2=80=9328 s (saving
  71=E2=80=9390 s)
=E2=80=A2 adbd readiness drops from 120=E2=80=93132 s down to 21=E2=80=9329=
 s (saving 92=E2=80=93109 s).
=E2=80=A2 cold copy_modules rsync throughput jumps from 4.37 MB/s (1,727 fi=
les)
  to 30.71 MB/s (1,713 files)
=E2=80=A2 CPU die temperatures at boot end also reflect unthrottled executi=
on
  (46=E2=80=9348 =C2=B0C unpatched vs 49=E2=80=9358 =C2=B0C patched).

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
