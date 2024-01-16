Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B21CD06
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427035; cv=none; b=WQO1AsNB3vGUQJElpfXYr79Atr+DbHk5KVZRvRx1FyRt2q4ZPdCI8jfh6RQR4JXTCNhiT1EVe6pXkXpgwvsIwPOd2cL3npcebDUFoRe8ummF6/FVbY36ykinyeshc2TZ5FdoXBu2mBA3iaMy6A57rKCa1xPKalpzkKUYxcmgKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427035; c=relaxed/simple;
	bh=/5RHq/YUI+hVWY/e6eVlbHgLBhBZafmQizAWBbYsCwk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=ayjFtmzG+nBHz7HnbM9H21snAhViF4RKXUUAOEt4W6wb94XdGZZp9aVKfLO6MlXZ/8cwlxm3jb3o6cgkkW5nNGvGytBx1yMw0252M5yslLsCy0ETHYFl1mKkUqC9Tm0cX5L0CUGf3y++QEfKKEHxTtEYUcbWie+YRvz46w85yow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kytYOVsL; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kytYOVsL"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-598f3e9f2e3so1799447eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Jan 2024 09:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705427032; x=1706031832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sadTVFX/+yOxJi04GWahAJ/5tRCyZICMzUufzMQzqTs=;
        b=kytYOVsLpgGPnOWZyUS2ZYPnNospG68NYHcfCGdQm4YT4Wemn5GnlaJA9xp3OOiGvW
         pYenBsMEW95zkvgxXtT1KbyU8wsXjDf+b7Ax69cyRYuBBj8BVUcA7rtna+F7qajviC/F
         qlRSXSsjp0lL9+iZR/UAQPNgxLqHDKDEDmKPWDbDIocIIL4LLIpx/m+Leyb7ey3NOwT7
         Fjp371GLQ4p8D9OKuuzskbGSPDbUHFtfmavg9Nc8+Zp1ZvYgsXFSCnkPn/1pT68LA3MH
         ekWFgTa0yj0iqhIMpkOZk1GalDGnTwH7NeT2IQVNuMUiJncrJb9IfrSmXbKbHnYLDwbW
         5qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705427032; x=1706031832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sadTVFX/+yOxJi04GWahAJ/5tRCyZICMzUufzMQzqTs=;
        b=BrnN9vkzmfjjMbm+gpveYoYVa5PypZFqfbkfW2mfcPvQeAzIYasNcplJOn8IbmtVXK
         Ddl5ppbp1WwuGv9vsMRsv/NuII1FOWGiFBCYBRd6Pu4a+ZVCkvJRi5mlJUI7by7VeqsB
         4Qw2vrAgQallHWJ57I+9urklETNCKRyu+FZNAG6K8xnTPm/4v4PxT8nyLd/Kmfd1S+uM
         el545N7UVjaG5Mp1zJR/5i34rI30wQS4lQkVJ2NP5DLahUD17NWtHJ50Ffx5NESpn+Zi
         F4ja2xtczI/XvXKY42/oLDBBwUH+nYz0fy+4r/m+c7TUvr+HGV1YTs28HXUl/Q21mheG
         L/gg==
X-Gm-Message-State: AOJu0YzO6Rik35xwVAYWJpOI757/GoPhVB+Bn3Xvwd74MKblM0Mj6KhR
	IRLG8ZdVU21wnTuAa3NpO2x8aW8sbaICLk/kwwaKX2TOHjmfKQ==
X-Google-Smtp-Source: AGHT+IGI87JfSO1MZ7YpCV7ykS5z6dPmVztVmhDswHZl7XYfkO+o3BgBUIEzwgatKdnzSh1R8Y7xKS2CmWu9HOzK/b8=
X-Received: by 2002:a05:6358:611b:b0:175:77e8:6c31 with SMTP id
 27-20020a056358611b00b0017577e86c31mr4700924rws.42.1705427032574; Tue, 16 Jan
 2024 09:43:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109114908.3623645-1-tudor.ambarus@linaro.org> <20240109114908.3623645-2-tudor.ambarus@linaro.org>
In-Reply-To: <20240109114908.3623645-2-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 11:43:41 -0600
Message-ID: <CAPLW+4nz9nOYgdkYGc47h2LRnDpO=ZG0vmNgyNXV5YkSQEqE_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: gs101: rename cmu_misc clock-names
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
	peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 5:49=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> 'bus' and 'ip' are sufficient because naming is local to the module.
> As the bindings have not made a release yet, rename the cmu_misc
> clock-names.
>
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock manageme=
nt unit bindings")
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/clock/google,gs101-clock.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> index 3eebc03a309b..ca7fdada3ff2 100644
> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -85,8 +85,8 @@ allOf:
>
>          clock-names:
>            items:
> -            - const: dout_cmu_misc_bus
> -            - const: dout_cmu_misc_sss
> +            - const: bus
> +            - const: sss
>
>  additionalProperties: false
>
> --
> 2.43.0.472.g3155946c3a-goog
>
