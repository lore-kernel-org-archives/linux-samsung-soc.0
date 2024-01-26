Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAE22F12
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 19:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706297526; cv=none; b=bM73Qkf+zW10dTMqDUg3R5gvvsdGpfh1pWuro32LOhcE72IzPK5x/+/EtdLFmUhCflF2/AgPZibuLb/WdSeT5lgdpB3x49tlJuPIkTXzGHYTIE32ry5r4Sex4XRZI7jAp374pOcIFipOBkndDZeGMHj63vzo9tbwLXiyaV9hUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706297526; c=relaxed/simple;
	bh=4bn/sB8tSLsIIPq6gl/AUEyattz3mYuuGWSOuaRmbWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4LHigzp05zQdpd1YGB9z3lQWkJd6Yp91HWvqsnUhl1X6NTxCbb/MKX0JnPldurHE31WOAsmq5OhMPgbYAXkzpWBwCrZZvzybHhwQusu78csb2P4FKO2C5p7I5JNqJ9L57iRkeh9CcGYMNDaPMTuwOKd/6vIJZx73Qjw8VMMr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMYIKWJD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMYIKWJD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-290ec261a61so645177a91.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 11:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706297524; x=1706902324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq0DzuapwNb+at6/+GR6PN1NNqZZZWZopm5NTAYFnRg=;
        b=DMYIKWJDqTAOuFhNETjb8mZC6i1h+fNlcYZMfPJgLiYKSoD8DoLO0CKUOzLcGRdG85
         Rqewz9nU7w89gb8jlOr/KQdxN/oEdxkFOJwXrCbJmu+EjXgqgnbsBM6AbDlEQG5PtJRv
         6aqxB6GZkMxOL2XidhUFm10q2i8Gfr5xUH7SaS5mI3eYffAcgbJahxclw31Nw66YKq4y
         aaTh2gviG6RgOh/wduSVnrkAG/NWgjhgRzhvEjBqL3vpamU5xlDZro4EudclfLtA6B+v
         VAlLEhNND+PNSZ/opNarHyp+DheHKLq73dUOR0nuEB5nhfs1nY6YhPDNsCoLyaSjt/6Y
         vKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706297524; x=1706902324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq0DzuapwNb+at6/+GR6PN1NNqZZZWZopm5NTAYFnRg=;
        b=o8doTW636xcdmrEBdAWPaTXkyFCqMBTrdecEcwDBbD08RB5K4nkayRLH4QznGZOKre
         qm9yvsPNeSx9pl8ge15tOkUnG8KfwsbygGCI1mnijNQ0fwbh4Dn+ufKK1U0FjUgxbPmJ
         EOcRLGDmSUB+AwkkWoFYP9yZxRDgEldfPLGSVRBnpZKoRAfH3IuvAVxKTbx4hUtrhk+L
         oMddxL7Eo67S3jTG3cMRsx9Vc1oxsOrU5GCn0wUOTCz3hMeeFe0lmcCNRCCy1y/2OInU
         vOXIr13B53wPE73Ywd8WzWG+vw6zCUNY1XQvGauRwtUArNkavEtJKsBP9mMmW4dM3uhG
         37XQ==
X-Gm-Message-State: AOJu0YwGP8tux7eJ7Bk0HiQ62Z4C39ohHIvNzSAPqiY2lygLyvoQGaem
	T7p/0QLEXpnPQAe3NCNGt4gRcFTfrZ5tWoTkJPQGSGuM/MJvpqA5n6cumW2zRFyWSeDLNUBi4DD
	q3TDbciUIQRWr8BJBQ31DZRrFXwPNLzp/lgFdqSw5F5QOinS+XLw=
X-Google-Smtp-Source: AGHT+IFBa6CU0gSHmGQst+5z4PcIsnVzYeH5WRcM7mrPV+jhkrgM9ohuUe97W/fJAYEGMiqNHQkddJwK/+eLNatKOUA=
X-Received: by 2002:a17:90b:3758:b0:290:3b83:8897 with SMTP id
 ne24-20020a17090b375800b002903b838897mr515505pjb.40.1706297524016; Fri, 26
 Jan 2024 11:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
 <20240125145007.748295-17-tudor.ambarus@linaro.org> <CAPLW+4mLWU-8H=qESe9csXm=e_ByvP=nc7MEJzknv+XAUjqUZg@mail.gmail.com>
 <36a664b1-666d-4fc4-90d9-35b42e56973d@linaro.org>
In-Reply-To: <36a664b1-666d-4fc4-90d9-35b42e56973d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 13:31:53 -0600
Message-ID: <CAPLW+4mPMBszTFcs_wUZgmksiRQ13SprQYYu3tShvkRXmZ_Mkg@mail.gmail.com>
Subject: Re: [PATCH v2 16/28] spi: s3c64xx: simplify s3c64xx_wait_for_pio()
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, arnd@arndb.de, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 1:56=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> On 1/25/24 20:43, Sam Protsenko wrote:
> > On Thu, Jan 25, 2024 at 8:50=E2=80=AFAM Tudor Ambarus <tudor.ambarus@li=
naro.org> wrote:
> >>
> >> s3c64xx_spi_transfer_one() makes sure that for PIO the xfer->len is
> >> always smaller than the fifo size. Since we can't receive more that th=
e
> >> FIFO size, droop the loop handling, the code becomes less misleading.
> >
> > Drop (spelling)?
>
> oh yeah, thanks.
>
> >
> > For the patch: how exactly it was tested to make sure there is no regre=
ssion?
>
> no regression testing for the entire patch set, I have just a gs101 on
> my hands.
>
> However, we shouldn't refrain ourselves on improving things when we
> think they're straight forward and they worth it. In this particular

This patch clearly brings a functional change. The way I see things,
the risk of having a regression outweighs the benefits of this
refactoring. I don't think it's even methodologically right to apply
such changes without thoroughly testing it first. It might be ok for
super-easy one-line cleanups, but that's not one of those.

> case, for PIO, s3c64xx_spi_transfer_one() does:
>         xfer->len =3D fifo_len - 1;
> then in s3c64xx_enable_datapath() we write xfer->len and then in
> s3c64xx_wait_for_pio() we code did the following:
>         loops =3D xfer->len / FIFO_DEPTH(sdd);
> loops is always zero, this is bogus and we shall remove it.
>

[snip]
