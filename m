Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738113081A1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462294; cv=none; b=HC+cvXvCciCjgV3NbpB9S7Fvdetc1w4fAXJnmn6hv/jI9Yw3wPVHaawq3FAvIa+A8HKXgh0KPmwJ5Mzoy8QjslIg7WuM58dQRqxHDTBLioAfnkG2YWwXxSuEf2GP9S6T1oD8NBYB8rc/zfT9j/zrkHOYtGGrjq3HBdRGu3ZMiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462294; c=relaxed/simple;
	bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1zuyyDRMhbi8dLomP8OBQ+NkFhzcVg8k9/RjElTjydZEHN8Q6ghGOXKGDRXFXrnsNI3GQrb234/rKIysk10inH8qNjCqRkB/PRtf5psfinLSP8phhJ2Cg9XyS/22ih1RxIklTwlxp0By4v2maIKz7+VrC+GxeYuuzVm2L/OVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQLGjcyQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQLGjcyQ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336b071e806so10585151fa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Aug 2025 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756462290; x=1757067090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=DQLGjcyQB8xVGY7S69JpGxpY6sCHLHcxJV/51sAplv9/X9wmIcg4D01ovqDL77/Fet
         sO+9ayzFFnuhb5iOT8W+A+N1nB062Rs7lZBiQgXG/GEnJ5VuFTX1GAoYcRaribtIXTrV
         wk1tCsMNcqEj+vNTDYpDBUT/LXP4BNHKZkPZKgUIT/5fStZWnFtQelIspvGenGvAbU+G
         f2wknwDktiK6zqlcQkSHnOXAUx5nKxkcCfBjgQrcRaGpqd1zUd2NtVVOIIGRrWoZMKTA
         0++9nhcRLeW1Cw0SKqRjmY1tXmeVwmDqQOH8EVeSZwBLcPLPnhOMrOBBcpND5aI+p+jb
         4dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462290; x=1757067090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjnj6nPS6qYYbzWCdNkcP1fjnBYRMWrLTWZgkTJjBnY=;
        b=IMFk1h32w+CNgRpUKzLJjzL8P3U77W3UG43ZPT0nBQGsV/Yg1PG9qvSme25LMjrS/0
         mJPbkg/hbhewL9doEbyxt8j6lbLMX+5tpM91b/YR68CekSeGQTcQYLCGKIlAbIxyeCcu
         idT/gecqgT531sqlOYAhyCDIlT3ka59R1O2YCetvC9KPSePsxF1iDgfJ+S2chEuokvic
         GRze1xdrdiSCPgYIUSo3UwoZ0fMoAvL60sCE5yvW1eImZ93lK8hjiBJphX+8HNDu3PbX
         pAYX/KwNBXMHIfkZ95bBhhl20e3jYaRPoRHZt2HHpllURi2zs2STKV7RXDP7RSwy77KF
         Y4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9dXzRn7JOVatcHKbn8S3dLUZh1BVP2fEWEklhpvJKdvFwKUHdXszQFL214SXgmH6XC7MV4VmKsNaSiJW0kCoMVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPqluB9p3un74MyS96LNRYYonIAN1ueY5/ywKwZ5CWZy936jJ
	UpmLRzGuJPhg7FK139A8WlTT4TESnOlZUJVVNJR2r0jwxy3CeLEyEysPFZorUerKBLR0+rpzn2D
	/4p3xZVJdSvON6eaHkdwdfGZY/hwvNbWC/ZMzZGi+7Q==
X-Gm-Gg: ASbGnctEq04B+imfSn7Mr2RCKxxoMEw9/2ukTeCJ01VJKMv0jQT5nptWUhbt7FuHd0I
	jW/9RcsQ9IKqXfY0VqA2rD9Qa/Lcc2BF3IsjwvNVhMIBhH5lswSKyvHKghGBAMXto0BsR1cmBbR
	g/adpdg1PRG4RqBmKg/ciP7VKc/Leio2bOZTvcvFOwaHwtrLFU71Hl4/8HV6Uhv82DuSJmj4hUV
	IRiob8=
X-Google-Smtp-Source: AGHT+IF2rckuWDB0N8TfxkqBuz+CSPuYoKPwq0L/OKD+eFOshcmaXOwCLTHg9xCg7qGXInQk7y2zM1fsjZxdnfUASAE=
X-Received: by 2002:a05:651c:1544:b0:336:a8fb:937a with SMTP id
 38308e7fff4ca-336a8fb9b93mr12812201fa.19.1756462290440; Fri, 29 Aug 2025
 03:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2@epcas5p4.samsung.com>
 <20250825114436.46882-1-ravi.patel@samsung.com> <20250825114436.46882-6-ravi.patel@samsung.com>
In-Reply-To: <20250825114436.46882-6-ravi.patel@samsung.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Aug 2025 12:11:18 +0200
X-Gm-Features: Ac12FXxjnbVzeqW8L95iuuSr2TZOHM52rnOiOuvqvFvgSGHYE7jxXOy75cPjyPs
Message-ID: <CACRpkdZwz8C=MRgo1tQrkQzNtKMLV+P-LK8XyRA3eSFW-cbFCg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific configuration
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
	inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
	dj76.yang@samsung.com, hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
	Priyadarsini G <priya.ganesh@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ravi / SeonGu,

thanks for your patch!

On Mon, Aug 25, 2025 at 2:07=E2=80=AFPM Ravi Patel <ravi.patel@samsung.com>=
 wrote:

> From: SeonGu Kang <ksk4725@coasia.com>
>
> Add Axis ARTPEC-8 SoC specific configuration data to enable pinctrl.
>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Priyadarsini G <priya.ganesh@samsung.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Please avoid CC to soc@kernel.org on these patches, they end up in the
patchwork for immediate merging for SoC:
https://patchwork.kernel.org/project/linux-soc/patch/20250825114436.46882-6=
-ravi.patel@samsung.com/

I think this is not you intention, the pinctrl portions will be merged by
Krzysztof who sends it to me once that part is finished reviewing.

Yours,
Linus Walleij
