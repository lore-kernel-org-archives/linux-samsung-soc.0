Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C516D4C9
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179394; cv=none; b=pxsm7MY4CMd3eV3aAPrp/1f1Xn0R0O/5sD5fVniGHx02sUyRf/DPK7/scYK66BcRAiNYNqyw821pFUhkrrlYRR5oR0zBxk1ALPeDti2FqEBii8blA/JdUg1qFHwVk1P1c69N64VJHBRwY7JRpDKCZLVykYa8ZoqR3HyzU7pHeZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179394; c=relaxed/simple;
	bh=w4GPNplcnOrxjX9LxJ2UyHSylkkAakamu/YIwBqrUQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMb+z9M3IsZFVVCPQuofJqHUcHjJvnUzhpq02r2zmMNl4won4ChooyuUlJlsCLofu9u3sSrljho+1Qd00jkz2qpeyEB0odv51kr4ZdlZ4xRaI5LyE4PNyqvxmjfSFlDZj5YgWouHDHRKt5lVeRRnqKJoCo9DwcmB1HBj+ujnOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IOpl2w/R; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IOpl2w/R"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57c6994e2f1so2727073a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 01:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718179391; x=1718784191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEEQoekQRon+t3gUDKwXNDGB0vL1Zgsl9jkaeNoSvtw=;
        b=IOpl2w/RoVlMxlbW8zBKCki3huobe99tALVgbjtCQ4NZ79zHDscf2gCBwWf029dAo+
         NvPDM+oqH3L8u3VKm4VBL1sntqkaPQCw19gmgTxrMHpC/V8qcql5YWRCy9H2zI71KgL6
         Po8hM5Tr6hVBg6us22tjEYHNVX+ttx2D7f5NLoRLBxRyBQWaVNBvB1WlhagtDMUOGj8K
         lecO4evdp75LIX5hAROm/ppUF66Gax+p5hThA1glv0bc6+a78jQFfOMzGCoyaSajIllk
         Me1DpeH22QIJUXbxqs+ACtbWLMYwPdNUO/b77aNcFWJLP/2cZlldCzd+mKPYUzuR8SE3
         3P7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179391; x=1718784191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEEQoekQRon+t3gUDKwXNDGB0vL1Zgsl9jkaeNoSvtw=;
        b=eYqW05Bm0QHpQAnMXMR+J+Kb/sm7hkeqmnFt75tot6nshkoHugNlvoRZYbOyvTw6ia
         pk8aFCwqtkdS8jOXp03Zk6waJuC8QJQ7DFAjDAxzsMBZcIo8jgiuNRJ/mvgnEhvCIdwv
         5QPivv/WZnweVKv98F2OVbnCK8TGCxIKuSiaRHyWdo2GSC8RSjHLJ+3o9pBvCcw6lSMp
         oFsEG2R3YziXuKv3BZfZaoxGwLhIhd6Mt16JDtIErjtd6OkFkY7AcSVXObHh3AA/2uGP
         TjJmUEb3GQujh72EKShGm0bZFOn0n4KUd/KH7RSQpzRcXDGdU8bpL3bJbiVqDK+b0Dgi
         ibdw==
X-Forwarded-Encrypted: i=1; AJvYcCXYkcGg5RxxjyF4KZdz14DX+LGn4Ap4ccglycIxzp4DfgNlGuWM5BRggS9+LHmFYNsC8FGcbM3DliqH2iysbRyiyXRoQ8FiTEOGSa2p3KNhsdA=
X-Gm-Message-State: AOJu0YzNcDoj+Qdzjf0sLGShtGOaNOENsmFvq2EShClsB+cgPVXJdHUv
	N+m2iuV55z9BmOBIRMm0rQXDxqHMGSdrtdWh/ggcRmCapgZQpVrQ76XEKbqr0dIdkAtdwZ2o18m
	Ng45LHvcLLgzJE6JRtQ1eCPNG+F9NPLCgXw4St5705btLw0jiYIg=
X-Google-Smtp-Source: AGHT+IG3DkdnwCX7yWoeLqpWN1gPYZHoua+wApHjAc3xsU9wEXw7nl/lYk3pClx+tXAPMxhOztwxQVIAAQzvweUAOg8=
X-Received: by 2002:a50:9e2e:0:b0:57c:ad96:14c8 with SMTP id
 4fb4d7f45d1cf-57cad961876mr323057a12.23.1718179390979; Wed, 12 Jun 2024
 01:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org> <20240507-samsung-usb-phy-fixes-v1-1-4ccba5afa7cc@linaro.org>
In-Reply-To: <20240507-samsung-usb-phy-fixes-v1-1-4ccba5afa7cc@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Jun 2024 09:02:57 +0100
Message-ID: <CADrjBPocKu4iSLBu12RdLVo7O3FujF-346aYBOWCn3JutyjX9Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] phy: exynos5-usbdrd: uniform order of register bit macros
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Tue, 7 May 2024 at 15:14, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Most of the macros are ordered high -> low, but there are some
> outliers.
>
> Order them all uniformly from high to low. This will allow adding
> additional register (field) definitions in a consistent way.
>
> While at it, also remove some extra empty lines to group register bit
> field definitions together with the relevant register. This makes the
> registers easier to distinguish visually.
>
> No functional change.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

[..]
