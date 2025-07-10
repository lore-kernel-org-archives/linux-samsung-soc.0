Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7BF28980E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134454; cv=none; b=aln0EQDU/JfE32cGNkrTeXubeKN5RB4agVRkuhKFs7u8QtBEi/hb2Ze07ZeijsNgQ+bfi2DVhYsEX8AMaPfJp0DdOX0/amJ95SSNfCtXI1xNCa+YzVDSsL93HfWUt2R3LMcXi7NeXMhO7HmZuiqP0XU6XdYoZaPZq44XK3BsAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134454; c=relaxed/simple;
	bh=iK8IOTCXE2lrPjdoQaDJjyXlv03DESYVyObGJ/m44kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owQ2+S2yDBituXuou1866DrM3jECCDh79oNai6QNZscD8KRs53e8IZwUWpm3BIPfxuCkmbtCbV3ju2NnZ2c494S2XpTfju1Hj2WVt4iCDTU9AoUeFAq6pvMyWIRG2RNJaIVTVzpTg3gGMGJhdT81p6ymO2VPPR/mrKuoMiw6Jws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uzxu+4NA; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uzxu+4NA"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso668796fac.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752134452; x=1752739252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToFgcIrPsT47qophkUF6t9hEDKpaWGkYpzWGaT7NuQQ=;
        b=Uzxu+4NAdve9XcUnFWFBHCBNjqpalyRMQQ+dFqV1zfDYJhEFqifdAH4w2/3/PznNHN
         XhOp4QrvgzAdwA4nTwqwRv3bDciGdY2BmjM2WEMHx2K7mUyz2CObhpeBoWzP8DW5yiwT
         8OcayffK6GHXAwRFRyLmVKqYZe+5Kee6r4gDAFSgvJ+s+zJF6B0NkPpWp96SSXfD5vp5
         mqIGf9CDXFUMaXx6K+mBxx3TUpYuCFaIqaBsxC+Ega/uMAWv8OAo19E4wk8soxxEwFfz
         OsOTWQ0kmKPljXHsr1sOZai40cJ9lwZvQqffsLv40q5wkipMXGNg+5fPIrjIVh+i9pvR
         iCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134452; x=1752739252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToFgcIrPsT47qophkUF6t9hEDKpaWGkYpzWGaT7NuQQ=;
        b=vXteJjHVil+U4jZ097K9hNXcp+6Sjl2s3F088F+XWHBydL9TI09+3VRzsPTe896hib
         yREoNAgYFtkmyJeYVbF5nuZ3xEOoz04lGnog+5it31N4gOC+a5lij4zsL2Mw9rdIz2KG
         bglcdIsSXBPB2HuerT9qOyZN/vgj1vEiP0+/pEy++G8aALcodvOTr+R0C3gYEM5tyL1m
         CTCvvOgavy4oY+ch+4/Wu6iVLEAKuV7Qrbi8XaifrPHX5d/2jQB8MepMFnzU7CAiCuQ2
         OQUSku70JugJqV9NhuN2NSNSIvLkSvGLJufPMATgKFThGIac+nqE71w37hSznWcO7MMX
         YGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsyy4RcJNXDqlOumkMSMLaKdWQxz6ZwVkQhDqNZFtLIy0iZRQWCG/UQkr5F3XDwCacmiMy4lKGZsuSe98TlpPSsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytz0WjoCMZSlCV7PAZWuP+1U65k2F4wq/KonqJfOxrjqF51k3k
	52/bcaBu1CHgzHwFocmcv6baJXeVO91Jh98fQaDmaD9VQWdhH8Yhl57f15rhkH4x51nxlbX+Pfp
	HrYEexu2v6Po88MLY9J73iOw7+LgLdUIA1Q1IR7urJw==
X-Gm-Gg: ASbGncvwYtb8VXJlFbiYo7D8crO1M1Li4xPX/s2K/9IIaK8nlDabyN/gFSzWK2n6QTX
	ubO2pv+Xss85kaH3tAA+MVw3OHdpdrB9GQgJrVqHJQm9l/bjBOvWAJgc5BY+gxDkegdBtj0xWrk
	7OgYHxH4fD9FE7MFZLEQ10gwJadQ9aXEgQD8r9Xgn98UE=
X-Google-Smtp-Source: AGHT+IG42etH9AipEwoVy40wJMSye+NWVNGQGCdLQSYPBIHb3YYmVeD+/TNpEhAraHgVOha7QcC5U1cAMQ15bwl7bNY=
X-Received: by 2002:a05:6870:a351:b0:2d4:ce45:6990 with SMTP id
 586e51a60fabf-2ff10820374mr954468fac.7.1752134451671; Thu, 10 Jul 2025
 01:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 10 Jul 2025 09:00:40 +0100
X-Gm-Features: Ac12FXyPZ25VVFt9KdiEcMMJ5hhaX1smahS3sKtKfS3Bife6pmJ1SYWsA7BHfaM
Message-ID: <CADrjBPpkZf2Hc_97e+-ZX5hpCw+DubEOUNiJ6fHLx0Kq2PZ7Uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC
 clean" maintainer profile
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Jul 2025 at 08:35, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
> SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
> be fully DT bindings compliant (`dtbs_check W=3D1`).  Existing sources
> already are compliant, so just document that implicit rule by mentioning
> respective maintainer profile in their entries.
>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
