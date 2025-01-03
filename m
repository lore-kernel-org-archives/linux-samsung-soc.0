Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB817FE
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jan 2025 00:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735865343; cv=none; b=m0IweRsbLmv/8Z5GqTId5zluD6ex36Um5Y/mNkbTxVj6FGaTFdwDHE9Pfc7CrD3UWfLKJsSUYDHBXqcxnjEZ8BZe5ot3HQgaA5FeyksUKRcIR68NRqCldUALELQdOzKWdTDHgUerWYNNtvijbEloCKP2L2vG/jKZLkuwir9K5no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735865343; c=relaxed/simple;
	bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvUaCiP2197dpbbq4pcUD1M88TsHnW6qGovIihATD+QjV0WS+Csnnl0h48IRMCQlUdhPHEuAjgx+9Q+ZvRnWK7Zt8DU/tPHucZYeJmr7/+65Wsue6eHe5ep/jUSuNQ1F1ARJ4mMj/gOPNFjNcybl6Nkdruhoswa7O8aFoP84GGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zfx90xal; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zfx90xal"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso152639111fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jan 2025 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735865340; x=1736470140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
        b=Zfx90xalBT58FQ3aCJfYAOmVTNaB5EHAYTFzv7gGxEhmHIZq6gscOTxSRuTV/HURHD
         RLsY5FmHnRuCwRYUyTVwvWdjQASobk9MCgRe7Zm8Vh9uC2Z7q18c48oS/tNEcEWe4LyW
         qZtY6v1uVxeAwAWHC/2VqUXuNRSYdu0Xk+c3NiI5ZkC4etO1gl5uZIDHRGakb7nx2UXA
         UK8W+WlCHOcmgUVcnk76Ln7NO4QUHGYeuLLboohKjQ/nslXt0XYH66d0Ye+DdL0DB16k
         qcnLzuFUwVJoPA97U6GGxPvAevfMbIO+XMvwqY9shW8rRJ+z39weO8AVKyBE+YiKOtu1
         vyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735865340; x=1736470140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oAv3GTMkxd/jMIXCz20Wp217o/Cl+peGPs01Gj4JL4=;
        b=H87Ofth6e29WCIu40pl185myWdoRc5OSIYDF+BJ1jB56R2hJncpePSi5FbmahJLtu3
         Qi+vJDBq0Hpu9SXhaYVnN75wuC3rzmzTwSIH0l6f2AgQzcvYK9kr4YjSc2Sd6zObKKZV
         rL88j5wrpbJCW3c5ArG4DrpYbrSZv9pjsGt1LFr/HgTshjkrvgA/9VwU3Xxx2/CAHIr1
         P99uAmKVQ6t4J4GiONGynJO3FKv7Eg0Y68Z+O0sn0XRNyY0G64UwirKGdVnEj3E2Mj1s
         bwFYMUi3iiTlJFavfrV5TEzX2qWNiK9bX6MrhjM/jlxKi9EsQt31FGyu6StNI7RzMj5q
         BCgA==
X-Forwarded-Encrypted: i=1; AJvYcCV8qMM4Q3rlTBgk1p/lu0Iw+QcPN8l6u1ZpcJ2fuKZ3ifG0+6xxvNHm5W9+tEGPc5qGwAuW+ItL60jVYwGDsuudcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Cj3hHdifxtkg7q4Pi2FsrTi5bjclVNkkwHBp3woxtgyi9Gpq
	YhOncuo/Z4G6BisIMTo2VCkQAdKoRcL0+SdJm8IbmRIq8r7Mmw1OIFcXkSswExFjDKF5P1SkFHW
	MGrVMOBHxYu7Mzp5eJ93dVDWWG4rogJYHKZdCDw==
X-Gm-Gg: ASbGncue//685vaQTMpvY6B4XrTGeFKcA58rc83dRto56QGTDm2sm6KSh6mJydTyP0W
	aZ6Kst2KpsMIVfL0yBBucAy5JuI21XYhBc6DX
X-Google-Smtp-Source: AGHT+IFXWQX/f1UhbssTBaD9+6l52DI5X3zlRf2eEh5tClnlyupd1zkpxFpa6GGZ03maQWFsWSTLszFhw8NtRp5I7TQ=
X-Received: by 2002:a05:6512:3b1e:b0:542:2a20:e695 with SMTP id
 2adb3069b0e04-5422a20e76emr11167945e87.9.1735865339817; Thu, 02 Jan 2025
 16:48:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241231133106.136237-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jan 2025 01:48:47 +0100
Message-ID: <CACRpkdaW9gCY760dbMohLesLgNTKTjD7m5jGLqi9nvUwu7hmhQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.14
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 2:31=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Fixes for old issues, not critical, so not worth current RC.

Pulled in for v6.14! Thanks Krzysztof!

Yours,
Linus Walleij
