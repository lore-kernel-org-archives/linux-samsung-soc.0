Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D7156F45
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484096; cv=none; b=iXN0lS8qvG6P+XSIjAF5Enos8lBhrH0ccTCA2Pp/5q0iFqyhbTgnV2leBwL4pTPH0ScYxMscV5utlfHLSmsiEr7x10FulPz39fL7Qm7VRWwGktYCdVSwWQ/jXfcY4ovNTHioaZ3T8/zIHcCsF5vJmL9tkEl5eV1DhZI6uGlYhuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484096; c=relaxed/simple;
	bh=HpBpI/8wSHF7t4KFhnjlrnK8AhfjX0W1uSniYzs6/yA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WbsWYJo0Ucxt3Tj6iLgDA5TylbHUXRuPGa3YqXGamSjluoJ5v66MIYz5NP8MpzuZ5+8xfV6i3BTfH6qbA2osKMfLJ7ynNfC0tDVhu4FbxbPQkCQWlVEXVUYquB+j2k1MLSwLi90wHR2iyBU3eGltkeFZPsrJeoRleN5BxLgJY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrjYxCcO; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrjYxCcO"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso2211830a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766484094; x=1767088894; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HpBpI/8wSHF7t4KFhnjlrnK8AhfjX0W1uSniYzs6/yA=;
        b=RrjYxCcObkg8TXURFXJB3x5sO39XyO/8c7fauM7C+LwGjzYYZDQmn9GyY3JnASZP4K
         nQFgvStgfV3nNtyLMQPREmRk48hryawTu0W8CG8HCrp6Dwv8nIrOGsIIBxlFfHvwYA6e
         4p3wi1T6pzeeNPYspEgkVsSECYENKP7ptOcf4MEWOUQmmE7tpxlw7TKMyxhNO5zytrhx
         G3A/2TBcCF8ytWs9LJhqdxRsIAtQ/bJcPTzq+4o/q8Lr4Wxe0owbnW3m7bFEJ5TeMFJf
         Ub/zdCedld6QTtxaFpulLRyV/RRNE/ynSiRT0u+RS39pNSlLQaAPRjqseD+c0fCvJ81s
         gWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484094; x=1767088894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpBpI/8wSHF7t4KFhnjlrnK8AhfjX0W1uSniYzs6/yA=;
        b=lZFbIXU8zrX7LcaNXaqcMdsl7aEsmddTUTmudsVmrj28aADp3gsMuHjUKF5WiVal2m
         AqyrDpVcDmN+hcpoJhR/l1/jnciI+ppvZhcEly6KM2DFGOWy/jt1O5rQv+SFsyZCVFuz
         H6MlGQRkjSqF4zS1CslOc57mOk/HNyPkiDnjEacvusM3OEAYoXocq2sCqZ/LSLit8fCq
         xTS71/JoGNilQfnJu12I8dupSyVmUjVyIcTeFD/0CZ6x/sGrOdJEjyeT8qNAz1UrLQ8k
         TpkoviaRvAiIum9ujJAwZCNe7D4c4aVI998ZnvcLA07k9LiHcXHQ+QY3pKx31Hfz/Qln
         ghUA==
X-Forwarded-Encrypted: i=1; AJvYcCWgQqwip3szlklpynKLEMh/fp7Ke6fJsr3QhFw7XWD5Qx+8Oea44Xyz4Juyj1Bkg6/wViQqeqXCUqTuJm7ulZOZFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhvgWAA1OXd1e+NtpelLSoi5Wlu2MVGCgHxb031SAz8vcdpGeA
	C8TInUwBxAW+1NAK/dDXqXIO7ots274YYJkGczH4Y7/JLqMYPRMWpAHEozGCqGGUKIM=
X-Gm-Gg: AY/fxX7gG8sVO/MsKc7VVbdti9EI/8jDmmcZLKiYuyvgQGNe33VUD9S3mFdz8+u93Jy
	nU8mIS08jfNNlixUrLA8pCI/0/H7T73SMIVWBjMvFmSmseHGNzAikCLfie8RH9kTypOlEb06/UP
	Z8wT+QQ9GHidQbApd/WNGBMPKcav46P1DVrHftq21ADBowjAvSJTcfC1C3aPzzG2CWYNV1CZDru
	HTFvxWkGhYdx694YpIbG3YuzHJRONSpaTUv69zO34NGjOYaEbe+Mlj3TONyGqbpY686odPNzwIV
	HoaFaGdundgeSzSOg7GsWFJdDyOQki46GotKBQUcfxcOphN/fn0C5AZ2Inbtt9HZZQc8e5F1EvM
	/qxEp0xZP1q5xg8ELV5x+ghqvBpUtVYHcctFl+mrlSobnRTWmYUFI41cWu75XX3mofF626qoSwl
	C4ing0JL1uzJVR4+Y0
X-Google-Smtp-Source: AGHT+IFXuV7GadqIyPi+nPYJimRq9WoNp2FQ61ILnYC43nto17QpxsN8ikiDj+xBUwBcc1gocDeCbQ==
X-Received: by 2002:a17:90b:2e4a:b0:34c:9cec:3898 with SMTP id 98e67ed59e1d1-34e71e29544mr15068089a91.13.1766484093988;
        Tue, 23 Dec 2025 02:01:33 -0800 (PST)
Received: from draszik.lan ([212.129.75.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7ffsm15451480a91.1.2025.12.23.02.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:01:33 -0800 (PST)
Message-ID: <28ead866eb9a11fb3f20ad49839aadd3993f3886.camel@linaro.org>
Subject: Re: [PATCH v4 5/5] arm64: dts: exynos: gs101: add OTP node
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 10:01:34 +0000
In-Reply-To: <20251222-gs101-chipid-v4-5-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
	 <20251222-gs101-chipid-v4-5-aa8e20ce7bb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
> Add the OTP controller node.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
