Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3565DF0D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714646682; cv=none; b=H1xsixGJBdrRm//2M/l7Crw0NVEEozQo7V4mJf8scACUsak2toaVhHjlgehOTTql7FTYt4B55WSbogwViBBRbiIM7YbrVCSuUBjYY57+sr5vShR4jpjQ0PTUKXC0ARqalb5qfz6v2DUHdYYWjkB5VxsQ712VBd2gq3xPH3sKVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714646682; c=relaxed/simple;
	bh=fi/OCMIqTDub5+jBDReVifYWRIdllR8+TeM638lvtn4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ifrTqjZSRJT8glYgIyPmVeG53zRM+v1k2Q1HDMUVLgv9BfeOJofN8H1M3XNpc0iu0kLCnUPbbjO2f6QaLm5PQafWQ0VrSDc5TgOmXcf4cx3kLGaMW1Z2xZcvIFQ/z8XuMZI2eCJrihMlRrFXsb8OsHRouV9dVHM43X3fsi47kfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CH+SzfyG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CH+SzfyG"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5171a529224so9678040e87.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 May 2024 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714646679; x=1715251479; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fi/OCMIqTDub5+jBDReVifYWRIdllR8+TeM638lvtn4=;
        b=CH+SzfyGkremMeQfFMfD7LfbYchfqOzp+TsXZyTuHw/fw+dGg0Xx1srmLojULAVS4H
         3+95urv/DeZp29qsKTzmsXanW9vjXvRS9Rmlm6y6rwYy0VgpsU1uHMqKoNnPlqKc/Ld5
         PTULzwmA9SFPdeF4DP3vy15/JDG9xg+4MzrNpKdmn5dXAaN+275Mb+zHExctCYCEEdjc
         1i5kJq1N1yHAjS8/+oVqVUF+krySiT+NbIe+VOBzxy30ABfqljsJAAE2KrEAdJUV09PE
         2sQ8VWdZakIer9kifYfHej/PS+uGgo1/vwj/2SH+K73dUhqjjNllqp3U9URzjxTnoYxO
         e9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714646679; x=1715251479;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fi/OCMIqTDub5+jBDReVifYWRIdllR8+TeM638lvtn4=;
        b=pYkAcKDPtk/Z7EdzErZB+cGKKPgwf8YWAe21MxtbNp5luUbgv66+ZwKuk4my8mJUCt
         X/KFGARUoedDLHvQ5HB/2mlhrB6YEfgFOfiq3dVHBy5dpLkn1wkXNUGlmsLci4//ONSA
         b6O3UxTGk5OoPLyFfy0ZIdkv/mtrZ98013l0IlOgA8auyenYnAkHIu7GnsMoyY4F+koy
         uG1hTf4ETiAgIo0pIHXmwyAYBEIzOb8KRjxH4Gjw+1a+f9lI+qdoPyAr96t3xp1G+UAF
         waFa/qU08T8IuNqKHVk+r5/P6NQMMg1HV5qXwdd1As+DmGbyZX2LvQfSfO5p+Jo3ejWC
         GusA==
X-Forwarded-Encrypted: i=1; AJvYcCUPYyER/DspMpvq1di+hFKI/A8NHevzlnilKceGxwORruFDTH5UnOskp97B6OSN2Hn3wDx7j4Am4rbYXl7WSTHGlnqGeeOjNQ9ACekm6ezLiPs=
X-Gm-Message-State: AOJu0YzgvI3pjuDimn7dEYwCRH+g5rucFkiGVR34LmLISyiAqTmKaSv6
	+cNDE7OxqL+Z3eAZHMJAsnCCC72cLseAvzAM+0I8Z4EgTYtLKO+x6lDw8NrhqYk=
X-Google-Smtp-Source: AGHT+IGaXB09un/P/kSPdKIqcS1n+4fdQZY3B+cI52Hb2XCW+mIX0BHn7LMa6S2DRtHJ1pzX35lO2w==
X-Received: by 2002:ac2:495d:0:b0:51d:8d56:6b15 with SMTP id o29-20020ac2495d000000b0051d8d566b15mr2868399lfi.1.1714646679369;
        Thu, 02 May 2024 03:44:39 -0700 (PDT)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4988000000b0034cceee9051sm949872wrq.105.2024.05.02.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 03:44:38 -0700 (PDT)
Message-ID: <2287494109b15960db7de6217ebcf4612a8daac2.camel@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101: specify empty clocks
 for remaining pinctrl
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Peter Griffin
 <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Sam Protsenko
	 <semen.protsenko@linaro.org>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 02 May 2024 11:44:37 +0100
In-Reply-To: <498ff366-b247-4586-b02e-5cbfba5927ac@linaro.org>
References: 
	<20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
	 <20240430-samsung-pinctrl-busclock-dts-v2-4-14fc988139dd@linaro.org>
	 <498ff366-b247-4586-b02e-5cbfba5927ac@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-05-02 at 07:51 +0100, Tudor Ambarus wrote:
>=20
> All 4 patches could have been squashed in a single patch as they do the
> same thing, but I'm fine either way:
>=20
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I guess the patches had accumulated gradually over a period of time while
more CMU support was being implemented.

I'm happy to squash them if that's the preference? Krzysztof?


Cheers,
Andre'

