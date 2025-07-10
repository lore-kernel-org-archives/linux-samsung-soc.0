Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68675286889
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134550; cv=none; b=Mt2MN31rxqvWAiAWsScAUxXlQykO/GzfThB0FUsE211H71KP72ruZ91N+mTEGuVKQjhQFJmGQHaGyP9fNntGwAbILxRrCh1krDXCCUGF2wqh7KqVKo30afaSf5SnkIMM5/rgq0cVS8+f72gCMWQ8H3ySaYXmmg+qAoZOLbL5pt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134550; c=relaxed/simple;
	bh=GI1VtsjhXtrT2WJCXUGzz8y+u1YIjjmIvhsqRtpRE5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PW1WmbaO6uMzHEG5NC657u7wTPAx1ErWNgvopZxKI1WHKjlZnu4T7ZvkZyOCSl0WW3e+Yw2IKVHk/ersrCcN/v9RpLTtXGJDSkceU4Vit3m2rI6au6ozsgXmH3KccLll5s7o920I6/Td8qzsRwKYAIogkWX3iv/0g6iYMooJ08c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkZPnnmi; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkZPnnmi"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-613a6e39f52so353126eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 01:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752134546; x=1752739346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK8V0E4Xdcf1fTBLfVQvRq2RbYuBxS2NIoLWeiVRMmk=;
        b=wkZPnnmidyJSCaLNWtyJhGh9e0+16A29vkVSz8bkZKgdtNVyBUkmiqZbxdbg5WQINy
         xodsGCuA5b6dM2hysgikYh/bnVvgKwgU6SdcY4urPjaU6IW+QwKA3d6UEksSFKbjuLM7
         Sis63Zn+sbeLvxr0znbSNrbUWnsLSi2HYH2jgTnMS2xFaQ+rijuR94bV7KXyDuSjA3y/
         J8HIkBiFh+BA0dAhl8DMm5cD52faHyi25VbCqdlvnforhWcNGLU2PyhBnJSGEMwgdCxp
         c7EvgGd0t6lF4Ca4f/QY2a+Xb+cl/hsdHjougPVqXZ2yUOExfY8qKGhDRvrd7FITNMKP
         aYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134546; x=1752739346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK8V0E4Xdcf1fTBLfVQvRq2RbYuBxS2NIoLWeiVRMmk=;
        b=u05wrFwJWDkcFnXFl67U5RH0IA88WUlOEgak5q9X6UkhXvaM7SwXWMx9lM7kWyOb/l
         2WCdnhNJxLVc9sxQVdW4iJdOQRaa7fszpH7hsJebrQiMAIAHadQfcBleGL6k+MGYu90V
         adi4h9f2A7SFF5WpDkM7ThkOcziUh/dLsUPpRhs+cwEZXlDho8EVmltWPVXCNeCpmwCC
         iHMSVxk89iw9YewNVja5/LInPYpUYQ9dQrj54jkHIBU8aJ8qGrer998F0xHLetAq/8LM
         tqus6o1GP/j/rC6eZY7kJL1gVPEgvhrLRKTNueuXsjFZWXp7wonVd351eXeKDb5PEh27
         cxVw==
X-Forwarded-Encrypted: i=1; AJvYcCXceb8rY1SrfyYD4uUbIoBJSaeyMSMW0maG9+JaZUNvLLCxM3lW80JI58zMN49ZFO+PHlDtxsKLLXrncW74mh6g2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJoyEJ7JWwgj7zm1kAGPs1mUYcs6awjEEw1nveZJzijShoYKAQ
	sQd6DGJJmRycdtuI9SmWRveMs0owzwMaSeKjrJ1ZnUM9eE9K4Rak7T8cN8LZIrLxt/+g1q/WTES
	AqqD8eYou0LMu7eVXKUp0L448/DLwAbRFtk6BDVDoPg==
X-Gm-Gg: ASbGnctBtmj4HmCza85bDruj+4d5BqQpLHoMeBxcoYQBwrx8H663zmKgZu54Fc4D8xK
	YIsYJwRIEBggSD0LHXfJTJTsAJWSI1gtzofc3eFSlCZZ7QMnquNmgp2Yg0iaDpDzsYcN9Qz2rrQ
	2KDA/+nzl2CoywgDbgu8s1VJuQXmdKUmUvlCmCbnlHZaaunJf6toAxcQ==
X-Google-Smtp-Source: AGHT+IHrFLYymR6F7UKamK/gjTFOEV/FWv98kovyNcG7HeAzZOtkYSEipfwxdZEaT2lEQ5TAU9vcD7JJ0ogSkLcbVfA=
X-Received: by 2002:a05:6820:260e:b0:613:8176:8a00 with SMTP id
 006d021491bc7-613d9db2e43mr1002071eaf.2.1752134546426; Thu, 10 Jul 2025
 01:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
In-Reply-To: <20250707-ufs-exynos-shift-v1-1-1418e161ae40@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 10 Jul 2025 09:02:15 +0100
X-Gm-Features: Ac12FXw14Fnv-NHIV6I5KCDE4Qv3eilf3MCfG465JBU1_Jo35wVeJqk-I6YsdjU
Message-ID: <CADrjBPr_7NL4jFY=0B=VN7+WtxHrFxGvvqg0AnnPY_P45dtngQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: exynos: fix programming of HCI_UTRL_NEXUS_TYPE
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Seungwon Jeon <essuuj@gmail.com>, Avri Altman <avri.altman@wdc.com>, 
	Kiwoong Kim <kwmad.kim@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Jul 2025 at 18:05, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Google gs101, the number of UTP transfer request slots (nutrs) is
> 32, and in this case the driver ends up programming the UTRL_NEXUS_TYPE
> incorrectly as 0.
>
> This is because the left hand side of the shift is 1, which is of type
> int, i.e. 31 bits wide. Shifting by more than that width results in
> undefined behaviour.
>
> Fix this by switching to the BIT() macro, which applies correct type
> casting as required. This ensures the correct value is written to
> UTRL_NEXUS_TYPE (0xffffffff on gs101), and it also fixes a UBSAN shift
> warning:
>     UBSAN: shift-out-of-bounds in drivers/ufs/host/ufs-exynos.c:1113:21
>     shift exponent 32 is too large for 32-bit type 'int'
>
> For consistency, apply the same change to the nutmrs / UTMRL_NEXUS_TYPE
> write.
>
> Fixes: 55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exy=
nos SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
