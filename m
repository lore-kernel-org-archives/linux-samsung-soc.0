Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8E11713
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2024 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715365826; cv=none; b=Jmg0oFXqijjyAhm3mJIF4tbqksdiwWxFEcXHR/06QZ6v1XBlw00gbQh1dcXhOZCubsoSr/TfwHMsGHLXrgXcwYAeH7ASIOauex9/oa2I9zqqEHxnSndVn64I8MNHtd9Nsntv7oQ1LL/nKLkRhELOoSh3ksiv8Li8N6q+DebQO0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715365826; c=relaxed/simple;
	bh=wC0jfjirw2za7FXTFvs+sXPDHXPCl1QN0MXNhFZPgH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWVofyCSjp/xi4cQTb+gY3mh8VjbeoVpFcWgVjbZiYHSDYJEFU7IyAHAL94qdPd+q5uQ7zQp/m4LVL8s8+hzO0qZMXo3MXM4QMmaC//v2So6LDnPPeSJtd7kF143SgrDtHCUvrv67t/Q2zzS8esxRkJPYkhcoJ5huN7GliU8yvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPU4XzCw; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPU4XzCw"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de60a51fe21so2352426276.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 May 2024 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715365824; x=1715970624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wC0jfjirw2za7FXTFvs+sXPDHXPCl1QN0MXNhFZPgH4=;
        b=lPU4XzCwSI8b947LqkKqd92/F+Dzylj5CZtct+sw7/F2CUgPIwWj6zAwD8ig8cfRYj
         xG3pSF4WwMEx+93nQ5HExyzV5riRRjTzvRGti8tUnwU8Qbq4mOhtyySIXirS+xTFZI1o
         DCUVmKjWNYqqg8gXU7Mvgoec+7d5YXUFI3rn5pp8J2EjkdPv6rEfHlcdZJlDtEHSDek0
         SDGn6fMrwjli+1drtCCY+a7VpzP3AdDjMIJgXGuodPVyEWNDvpVEBcAbe9stPHKVlII9
         V07cyfZVCtly2cKv+zy6djjVUygvFY2HLUcbkoK775kvFgDT2eblAt4hiGASBhxLNJ9v
         RNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365824; x=1715970624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC0jfjirw2za7FXTFvs+sXPDHXPCl1QN0MXNhFZPgH4=;
        b=L/S9KpWif2iAyz76VvqkVzHForgUYTcvV7/JFKPXJHUTBiiWHIXK7cbY9fOku3Nuek
         KLQ/ubaS6XbBnlpbZK48/YyhV3gBe9lddnVY7/o2WWZmWCww80ATPVJBPVxE6mjVsogX
         LYoW+d5JRFkHLiiRhjqd8xs6lvGzJGXUnsRSb9DBhaA3aaAh0uN8bhyGqptlcsx9E80R
         RXa8ZXR9W21r8Ds0wI1QmSKCCSfvz+8XUH9clut40sGoRUoGs4ELTP5KKe61qZ93D3mB
         AZdFRc7C0V7VzYhNUdI/rVWCptI3p2SPsa6vCbvUemXQiW6eru7qrBPINx3lf2/mYgmn
         NSBA==
X-Gm-Message-State: AOJu0YzHYKu377+hsAhh4J2AAeQIYgpQ17PQRiHGZPwL3crpNrcBKz7a
	AWYuqtQBfEiBsmwUrin4aBEWjeBTv6ewqBQRRWAzm6gJqGB8vN990GE2NMRL+aWYbHx1IPCsAgC
	gWEUrENtrfCz9YHXCiKszbr41drXllHypkE5dnw==
X-Google-Smtp-Source: AGHT+IEdUtsjRJuFPtE/WysoIoyTtkfgv+irC179eNOa1gAB+4VTMJciFkgGa8Q1Udn3gJX8TJvtg3/kjSc6VXrh038=
X-Received: by 2002:a25:80ce:0:b0:de5:507a:7378 with SMTP id
 3f1490d57ef6-dee4f4c2a98mr3886600276.45.1715365823561; Fri, 10 May 2024
 11:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384@eucas1p1.samsung.com>
 <20240510070653.537089-1-m.szyprowski@samsung.com>
In-Reply-To: <20240510070653.537089-1-m.szyprowski@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 10 May 2024 13:30:11 -0500
Message-ID: <CAPLW+4kYE7mnEUrQM4qRs0Uhr2RcXXVCu0XLvX7-czJUZ_Fd1w@mail.gmail.com>
Subject: Re: [PATCH v3] clk: samsung: exynos-clkout: Remove misleading of_match_table/MODULE_DEVICE_TABLE
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, David Lechner <david@lechnology.com>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	William McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 2:07=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
> module driver") this driver is instantiated as MFD-cell (matched by
> platform device name) not as a real platform device created by OF code.
> Remove then of_match_table and change related MODULE_DEVICE_TABLE to
> simple MODULE_ALIAS to avoid further confusion.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - Use '#define DRV_NAME' based alias. I see no point bloating the driver
> with another platform device IDs array, as I don't expect this driver to
> be used with any other platform device ID. Driver variants are already
> selected based on the parent PMU device compatible.
>
> v2:
> - added MODULE_ALIAS
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

[snip]
