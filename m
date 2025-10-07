Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731DF1F63FF
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Oct 2025 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759868460; cv=none; b=ijqTrBBnnwVudXFTDgMq0A47KXiYEi8gGrHCmSOyNDizRwBXhhxXht3ccrzy0Y8lM1d0utB64tJr9mXPwCMtIPAcFD51gkr6KJjhLjA5QkdNQnqUo7evGSS001oIdmn+y3gB60Hm5Ip0hGoMoi6WM+KCVBJcoQweE+qyH3RFN+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759868460; c=relaxed/simple;
	bh=y/TWEe/aEhKr6s5KMRouLoYYcgI2epSiBagA6I5SO6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1Iyv5xRQ5QoW8xLLEaOKP2sBDGoxNaUNlkzoWu/8Uv5MEYCCccYHHLEe6rA8HT+c7PC730aH5UHwsm9h5Z36eJEkqSlDMb8DVWej+YclpLDpWX4nKzeWxTtAJB7VJc1W2VvIPGweDIhgarUsdIXsPdBDonyDNRXn2BqcodXEj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcGQHjzb; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcGQHjzb"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-63f03676bdcso1718238eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Oct 2025 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759868457; x=1760473257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/TWEe/aEhKr6s5KMRouLoYYcgI2epSiBagA6I5SO6E=;
        b=RcGQHjzbAGRrHPJEr+DWLdnoU2rfxNB/1+f3jUIU18Wqm2hO8HXSWKM+968sr974mI
         3AqSI36AL+0qpZJk4af5xGb6D5Ualc7Z/184RZO1wKK2PBy4q/AZA+dYeSlVzVRUi4bE
         8K+Wjz32+OoqjvYLmNlbFWlZ8l1pfb2J9B9/l564MgZNB+onHkDww4gyk5uIG4yYL6Nz
         15llv5nLVFN5J6pebfOFyq6jFrLKHiJATlW5NzHcc2JNmHx7fd4FEdJiJn0lLXiD9yLM
         QkT+bRjKQjSXpa+eJUNFj0eD7jZknplgpJT1boL9SV2twmRFJ9Fo1SRs2bdUC6rBlpNC
         wkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759868457; x=1760473257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/TWEe/aEhKr6s5KMRouLoYYcgI2epSiBagA6I5SO6E=;
        b=pNcNXhuYYmbHdON4qnl9I+ynoIV8ltQp1O+Y9dsJYtMhxixgKjXe5vyuPP52Lp87eE
         ipHwwCQtqSmzh0ajIGd6xm9Pa8DRmW4YGg+MNNImhFmKKKVNv/SPJJXoKWRe0TdQYRWe
         8mr63oBrOTAk2nuq70NtYFCI0WDqmgI6PrxKlpWH8mwd1x+xXo9/ieK0qGpR/pFLQiP2
         alPtw8lAksMJ505HAzQF061l3lwAliKJjbLtL7Lv4VsYCpw+FEbz2Pf/kAI2KgX1RlcX
         MzqMa2TAox2/dFTu69+Qz4ClFnvO2hId0+QE7KccooZbiULykANSCMPra4AWaBGS7NGP
         unmw==
X-Forwarded-Encrypted: i=1; AJvYcCX2vJom1U8xwuflrmLhL4B5AKAlf9HhMSlM0Qhn5fpS9DUUOJShjpy/M5VFgjzo8400LfFrf2OG1qzjpYnHoSToww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5rZUMoKiWR4j4ePTDrv3Qq8KMjLwziauXCZm1S7ZLLTgq4LNu
	+/PUol6zipLgWOtZkW1v6GVoV8gxlfFzUrWNf08OfP82QyUwN08de+57ZtSMIRjhhc81K9n2lXF
	3WzqVC2nmkRgH/SHspDFWgVVY8nNjWLG6ENbPihTGwG2yu+TScg4Q9nQ=
X-Gm-Gg: ASbGncvGma7EE+QjAmh9NtThxqpMxccZsoUI9wzpAjHyHprGhztrlKROTmK75syGBdz
	AywMyDbFTHP9vxvQMIMQqRuFKAEQgbtP5fr8IkE4E/je/BYTye+sgOFp915KmVVLEou+zh2/qfE
	IpsxmlHYVbP6YNmMGKTJ9XVVKJlTZKSh8lPvIF7+t/S82AvRQ4TuJUvvpsrfyfHUmD8C9GDlLQh
	tuK9kx1nMCbxZgMfeDfTU2eRSnJQfhvNU4LVQ==
X-Google-Smtp-Source: AGHT+IEyLeFs/tZrPpe8u5cykgOumU9CrjJh4fjO1Ik2uE9eU8H/ZkZq/fUMlKIiW99d1ig/gW3IYGMToD+2pUB6yiA=
X-Received: by 2002:a05:6820:4a14:b0:622:1a4c:ca84 with SMTP id
 006d021491bc7-64fffe46c1amr372637eaf.3.1759868457494; Tue, 07 Oct 2025
 13:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
In-Reply-To: <20251007-power-domains-scsi-ufs-dt-bindings-exynos-v1-1-1acfa81a887a@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 7 Oct 2025 21:20:46 +0100
X-Gm-Features: AS18NWBXzhclL12SN8KyOZlv89Zez5Qwco0h5Y-fiwtfj-_OtAAbqpmFxHR3Ve4
Message-ID: <CADrjBPo5F9H3BbxBBQmwmDUFnzibnH4hNkYMPTknOn8ZHH_Mwg@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: dt-bindings: exynos: add power-domains
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Oct 2025 at 16:56, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The UFS controller can be part of a power domain, so we need to allow
> the relevant property 'power-domains'.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
