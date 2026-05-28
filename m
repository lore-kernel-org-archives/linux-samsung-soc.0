Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB234399358
	for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965613; cv=pass; b=B1N9RF4EBT10mMAHodJF1q057OB3u+gSjyo1bC617aD+Yb+IVNocoh1qQfsJrXE3TsiCZggav2LamshD1uk6CLX2MmTQ/cqvFu2IIeCMNai+Yc+7KTzAShaahDRJRiNXYzhrF/x1JztLNwMe38ftWY7MD6LfGnz286p0QpWl++E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965613; c=relaxed/simple;
	bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QP1IeIY+bxvO/tql05vegud1SJx8lEWs7Hgff9jPFoejbO6oNqlOUpQCCp/MUJ3gIZIXxAGBsS+o3GITG/gGr4NFDs1IaaTYjLceDOJA4VZ8/W4kdePD2Hq4dngCEMY364C+RDAwrDY2qUpoFqhTb5SmAfpUPkPo2WYrZfPb9kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4yD0LOU; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4yD0LOU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so8968003a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 May 2026 03:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779965608; cv=none;
        d=google.com; s=arc-20240605;
        b=ECih1ej94D11GRkFfcAz9dMTHaDm/P2spgq8TG5Ww3chLSpsbEG8CHF83SzDL86rvw
         qwrrHo/GZGd2tSdTd7AI3IrVYC58tgNVSclAbmmGOUiEuwlsjIfyvBlQP2H0kxs2tzJu
         x94Jr81MIkKo2uV/zdh/X0GEbc68OrUchS6I8DSuzfm8I5YAT9QE0PDQ9BMZPHsYrRRJ
         gt0CQtnXZwpdsJlqZTr20xOQ0VFEdCXl/39FSQ4FQ4GOuZjaEa1ZtLRloGWc4Q9CecZq
         NW2EPXM6HoG/eQDMZS+0jFPV3zFQZuBp4zCNj+NifZzic7t6n8WBrTwDpHQfItq2xb46
         ufhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
        fh=RgKOw+Ld4KYAWDpMtVDROkhXYLxsTHP8JkoE4QAWh8U=;
        b=H5YMb8TCWUyHixNf0pzR0y525OGNAEz2iC6TD3HRKfGNg6b2IxYGTqOOGEuzckoWBN
         txzbiPWlkjn7T1JXkWzb5AzACQaYAlgzoR1WQOjIRELrEi+xeE4k4iD+AD34UMvmiD/A
         WhX8f39XV6/+D/NGijKMwsUTyVdLaudF9HG86RYAW5HRzBl4VR2m7HEQa5JTmGuRcDj/
         xKl5LjIRHYgkcUjjmlvTJelwHjVrE/fCS/+XG9dy4+5lpwY2eFfroyXGkZc2PnmdPDcn
         Nb+joKPw28TZBq7u7STq8gbEFhh6wmb7aKE+7/wIYbMMCN/DM5aLKQU9ybTqeg79wPSq
         peGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779965608; x=1780570408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
        b=U4yD0LOUjB7wQKLRSPr1RO0Izma3y1ooS13O379GSHZw8RLHlUgRJM2Vgdorf+Yhra
         +SEk8WAzZD0yH10x8Op5kHbnBcfAaUSmG0Xm+yA4jaJEGUkrTHJcIqvDPktG6aC01R1/
         Gag1cLqlFshDIN7VfbU53f6KiBLgNvZoGXDPDMvaqJlDK7/VJYRuvgaaUf57mrVcA27s
         WWE8LMsg4wuu0VtJBRKRglrrbPQvA9TnDFGz41fjzAvS/s4d8TNPu4anE6zoK62XlXKh
         yW8SMFXYcgZafkA2V5hBllyM2jPrYpMntGFzL48tFHSbm7j3vl44l5AL956FxpmQLhHy
         MMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965608; x=1780570408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2MMTPABAqL5fNcNPCH5MBiBXN1fNpt/Y5x9yYSqznY=;
        b=jysXv/xM7Px/luB1Wb86ZOit2czuO/EYbaIYoQ1rTaCe6ZvKCKp0thYNUW+kdYU1B6
         fBzsri+7bfahWDoM4q992I2/iHBO2K/bozLj+GZ0cMKtR8qeHJSl1SrWgDcEAHb7ozjk
         VNNqMpl0klaSHirqU5GTJ1njS3exOdrTJJFRGD6ratHR5aU7Qf6DLNf5YAlP5P4iskww
         hD4gOAkXr6CLXXoSKhyQYVW2NVO6p39+B7ECiRmIigW6kF5lRl38KRjdBCdolb5Bs0O+
         6bGyRHKV+lFmTpIoDIO2T1CoJJ5cvyd7p8gBsE68wqrUQz3p4JhH4SJ42UnVVzxRgGoN
         h07A==
X-Forwarded-Encrypted: i=1; AFNElJ++nS1vJ8ik6YJVHUkZlUT2y+KxPTlAIatExd8RDT2liqmTg9R9E8cNlwMpYlqPPuLB6jhZM1u5cxihO9C17wgnIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRbrwaEynyLnQyCZ5HpUIiv88w8Qpdwnop2r0KBzdKf5mxYCg
	6BINrRdVoWzcVN9MuG6oP6iZyI+zBPrXsGT266/mo1nwNdeFTZKqqvugZvdLoL66KiWSabrK6yf
	ZOplvbrwavM7im133GmcILAMADWagmbvqq+Vvv4GJbQ==
X-Gm-Gg: Acq92OF7vo1nHg6b4emcxjoqIFNFAjLcKHlrJdeAXlhWdA0eiMZsHcsDAtK8REzeApT
	4cg/Sku0Z0Se9diMj1G+GqMhFAx2c74AjIHHK5jDhcMKDgQQvIycfy1kQkAljhHc6VeSpU7kL/a
	35LCKVmdgthsglt6swOVSOCrS4oopHJSMr+/O1HJ69wLunkovhUF5hCwVGw69rTrzmPt1FBU275
	tGqvxzgYp6bikDbFW41cf3dSKWud388cKML6Vloa959HE7iZ3T7i/epFOMM2ydJLF2hbBMD+yeM
	AQSTR8qjTMMBADT1GcJp/WyMbnqtXEXs/2sbVZtSc9UkfPOJqJVR
X-Received: by 2002:a05:6402:3907:b0:687:f18:c37f with SMTP id
 4fb4d7f45d1cf-6889cc6c63emr14062696a12.22.1779965608447; Thu, 28 May 2026
 03:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 May 2026 11:53:17 +0100
X-Gm-Features: AVHnY4IH3mvkMMS_g1hQ3ZJ8qesRqjWnH3mxTBj-F0Of2pKxAmtKM5oLFn6FugI
Message-ID: <CADrjBPrY+8Cn28+LaM5xqk9ymdAc4oAoGyDm3k2yM5ADszRoCg@mail.gmail.com>
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Brian Masney <bmasney@redhat.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2026 at 11:34, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
