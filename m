Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5671C4EB23
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 May 2024 06:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978507; cv=none; b=evtfMZ8hUszUKgQ8mNtFkMDyhPgHYtuX+5cwDqw2jDMMR0DJpUqxpTSf6TgrCiyfD2Vfl3IzI7no+pBoCETj30oG0487VT0csOhE6RBLVasEGpQq8zbcBbYmo/J9uY59b/gGcUecagYfFSt3dJQgk+nb/AU5nfIP2Zg18JdeCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978507; c=relaxed/simple;
	bh=l2y+LRZZRPAmWxytx7SZQIyRUFOB3jcxkwesINbHaM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9wf8IqK4oZIBTSd4h3BScE5GPU8I7vIl7SaEU5kH6fKp7t9ocfqQnzSBJ+/Mk0oUg6BIWAg1R+gsXnvddT+g759bzeQvEbozV6BLxPhpSW+0oCaLafCQVQBYrRVdRa327YT+2FG7zkxjwuOUHG/2vtDCw3c3+692hatVo2eNhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V9s30+Z6; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9s30+Z6"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-deb654482bcso1366936276.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 May 2024 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714978505; x=1715583305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbYNptaabn99AYRMgWVtL1EYOCWc6xS6cHF9C3AUluY=;
        b=V9s30+Z6jUDjq4lBQiTvC/+c+CDeShbfcGtAZBoIyLcHO3g7emXRJul0M2QsVDJBZX
         JqTMX1xAih9qABEHfLVDf8m/xeJ6YY51E1yMDUh7bxo5awjyGpieVBy4W8CbuOOnMaMh
         h9yAuFmsOBhPUdrwf7RLQ6MV0rUaWqcd6isKZZAtItfQpz1bjlSY2mfqdz1U9o0+qRBu
         n97M0i6IyOqfCUYQJRnmkigh/UgtUaQ+4v0ilSNZA/+tvc0uEXxrJUExMSkj+hrPbgyz
         id5OZRYfjq7wVyAo870zjem2QsC413IgQBoIHq7uO7Xy0sl3T+bUkEcf5GsyKsPluTcK
         yTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714978505; x=1715583305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbYNptaabn99AYRMgWVtL1EYOCWc6xS6cHF9C3AUluY=;
        b=NbiKXXdEMCcN5uKlzj1ISvfBqCtcgrg6RftT1suTwt+FM5LGEuBO8f7kZYQEvJVrFw
         t7L6nh95wBD+IF/Hoy3B+gbqRlm4AfA99ZMbUvInT+zT43kGJei97vbunPo0ln7WxZBA
         IjT8StwUWPxlr5BfydRH2yFTnB5ZIaeVkYXZ4LLeImvrvGvRIOffYzbsm8n17V9m5YGp
         9K0pwOUa/rWb54x5Qgg+X1RROYpwZ3DmYyKWfqpnSa6MdzaE5vryv92GvXBSJZvIVUO/
         2a/TnzUD98d8oyP7o/dPYakyi8CwkJXFLnYzBzjOKLnRT5EGplRl2DSC6RNe6f47EywL
         BnWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcvOIsNzEQ0jnB1VR60mFa5FKgTzPozv0stG+xhJ9Xjlb4j9JAPgMy+iEW60a37lmiyeYMRSD3KBP2OPBfCofp98yyz2/q/LLDiepoDjDpdY=
X-Gm-Message-State: AOJu0YxM60+UU3rCRqJFLEoD23XjZMWq7qx+gInv4DLcMH4gD9B/ALqX
	s526cN1QyC2uMqxcR8s/iFCpvOax0ZnsGMmvVjXEiEqNGGqgaFzZlylEhF/xBK8j9t5lIUBh25f
	7jm1xH75yRlDgu4OFZKMbRKmX7m5hD2FR9YgyGg==
X-Google-Smtp-Source: AGHT+IHywfJ+66LhNCh75inc/HnuMoDX/hzFAveO2yRusNJfFs0ge2yXXLIQLiKRlWUxHMxk3t94HnQKCcJtBwvRyFY=
X-Received: by 2002:a25:ade5:0:b0:dcd:2f89:6aac with SMTP id
 d37-20020a25ade5000000b00dcd2f896aacmr9899101ybe.10.1714978505435; Sun, 05
 May 2024 23:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504121545.8187-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240504121545.8187-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:54:54 +0200
Message-ID: <CACRpkdbKUrX0Vugr98d48Ee8HsgCLMTg7j9WcfBNbrNZJxynYQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.10
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 2:15=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 4cece764965020c22cff7665b18a0120063590=
95:
>
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.10
>
> for you to fetch changes up to e5b3732a9654f26d21647d9e7b4fec846f6d4810:
>
>   pinctrl: samsung: drop redundant drvdata assignment (2024-04-30 09:41:5=
8 +0200)

Thanks for taking so good care of the Samsung drivers!
Excellent work as usual.

Pulled into my "devel" branch for v6.10.

Yours,
Linus Walleij
