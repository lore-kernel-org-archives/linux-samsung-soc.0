Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824FB16C6B1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179596; cv=none; b=DztG4zz/1wrWUDEkQIfl7INHFWqX+Vm8fEjnVgMFo/1jUi7LmL1fGhLlPg20bxCVTu/0h9pFg4zR0+sEYzo2HGD1efYKagksd5TUSGJ0519VRblWWAw1dK6i8IdFyaeqU5uL2hiGM+M7w0koEy6jpuDYdK1ti+BxIi6Ga5V+PkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179596; c=relaxed/simple;
	bh=Hp+wgixUjXcH+0cXMe0p+8KZqim/yUUJ2Z/8XZttkQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYPjzLUfDTq66QCvvIAv4SU3x5UCYMAUCumfVt8yU/TxkUVAa0u5n64EEJjbtiG88qSHZ1uC2YE3cD3cOnrE3iwhhIyfbxA/AAsK6CjqPKZk8LcE0M9vQ2N+8T6vs5kem2b0KerjzQdHgofj4ULIy3qq5Y+7yyVgufn4g67gXvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LQ0Jr4zL; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQ0Jr4zL"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c7681ccf3so4334467a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718179592; x=1718784392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/NUPbIh6KH2M0kCYkMVAfLrTd49vfN01minAiZapEM=;
        b=LQ0Jr4zLx38ZT+upm+lHPYzWZZdxgqJ5gk3+Bx7G6VkZg2vzu7dN3EJ+1/BupHJnGy
         cIu6W3W+dqDLffH8VH3E3DO74tccPS3CVuI9stbeahAfxfSMZPtPgXdzDJ6aA0d5c4p5
         /6T2V0VVu2xzLPXe+vPvWNfKJ3ZZtj/wXyzSXUfrQ2bQl6Ry2o34ZkBFm54r/2SrcKNZ
         C856y/hINUeX2fJIAhYB8E6rZADpjInWPAOcRdT8QKc1Ll5g9wfVkzikbmZmZNPmRyEV
         dZNAkg3W0N/dt39zZahBfUUQehV87P6PO5qKXYRiH572V8Qo2pUTGaiKcBUN2VISftPB
         kqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179592; x=1718784392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/NUPbIh6KH2M0kCYkMVAfLrTd49vfN01minAiZapEM=;
        b=oJqEiwaLymDGvKL+0OVMoC2I2YrsYY59LCVZpQ/EmTcIsjLVcR2Fe4q1IFCgPHY4hy
         6bzoHyqtvBbALQ92V2nu/TrBUcULuzgy3qFq5HjrSeS8Vh1LqoGmSIVTa2psHayrvNCo
         ddB7mtBSWEP7LYpytnww6S3hi4MjeD+iKbvLlxhzk/pPHU6eNJm/6NOj1GRIlvwbpSC+
         g4AMLh8RMs/lxb0Fg7axz9+bck/dbZQUeFWH/2Py3e5k78RYIxdn+z8QfFfPN8SU2Cj0
         ZDUDH7/t3H8KMdkNy9rL/idBmd35qzrum9/oMqZorH6qVUqNY7qKNtdZjjy110NeZZVz
         qlag==
X-Forwarded-Encrypted: i=1; AJvYcCVkmgpO/C8TEK9ZWXqKKI/4kelTyfmwUunnRyuV+vtkWLuhErlmxtN4jTNpWsrlcqeEvncQZ9PKfEQAgEk6SHs+Srnnfq8jqZbsSXsBs7ygmV8=
X-Gm-Message-State: AOJu0YywoC/eofAtysU3LasmHrXlXnm/paiF/bDIU3Xmb7vZquHhFYq1
	bpvLcrycbp4viis869iMK/Gs/flz/g3jR3fv5DmUI0mucC7X6ggE815i+2sA1WxJlJ24zL9njm6
	H9G2LPSQZoI6SPXlOYFsTDY2XDI9CIpED9TB5eg==
X-Google-Smtp-Source: AGHT+IH6OoZV1gKE9M3AfTYykV/eXXOCa0e/szV5LwhuD7ADmm+ab2ExPKHa0SiqR2zEvoqdUE6xd6qSmfp4NPHk93k=
X-Received: by 2002:a50:a419:0:b0:57c:7dee:52e4 with SMTP id
 4fb4d7f45d1cf-57ca9764b69mr562078a12.25.1718179591338; Wed, 12 Jun 2024
 01:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org> <20240507-samsung-usb-phy-fixes-v1-2-4ccba5afa7cc@linaro.org>
In-Reply-To: <20240507-samsung-usb-phy-fixes-v1-2-4ccba5afa7cc@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Jun 2024 09:06:19 +0100
Message-ID: <CADrjBPqRq_T-bz3SXvAzYobH8R9DaZyuikdD=TzDz7PZghJVQA@mail.gmail.com>
Subject: Re: [PATCH 2/5] phy: exynos5-usbdrd: convert udelay() to fsleep()
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
> The timers-howto recommends using usleep_range() and friends anytime
> waiting for >=3D ~10us is required. Doing so can help the timer subsystem
> a lot to coalesce wakeups.
>
> Additionally, fsleep() exists as a convenient wrapper so we do not have
> to think about which exact sleeping function is required in which case.
>
> Convert all udelay() calls in this driver to use fsleep() to follow the
> recommendataion.

Nit: typo in commit message  recommendataion -> recommendation

>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Aside from that:

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

[..]
