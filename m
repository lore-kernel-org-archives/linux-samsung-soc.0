Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBDA2D03B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146901; cv=none; b=hRyQgp3BnYY8TzAk2cFRWf/xYMeKGh2RFW4b7c8v1cPE8feJD2kNcFTIMcRgL2uTAaot83tm4IPiGkQhNzAhCKZpQqTzHK+FZFN8wztwBjhaRPZmW9b5a+Yj+QpuP4AQ4CYQQIFb2VWX/aBDqJUbTSrivQbtR5Ta/gqShRv4KxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146901; c=relaxed/simple;
	bh=sDRyLlC3gWqMVU08yPO/L/S4ZvFI/bD4jpF5C0pvcss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odcvDywirpiBVcNpmUiaoaL80HAD8fqPSyvWaCSya6WWyFFQotXB25QQ8aQNSPcx9pqK9ap/RaX/v/5uXh5W2X+c7XhW97WA7DlLqkp4SwdJ6oowouRBb8hy7FCjcSgQZvUg9dECctZgMzHfOczOvr9Lnih2VnG5zv9LWVWQI4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3yjfe70; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3yjfe70"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55790581457so6352232a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 07:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707146897; x=1707751697; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sDRyLlC3gWqMVU08yPO/L/S4ZvFI/bD4jpF5C0pvcss=;
        b=L3yjfe708OVoJaMTw+YHmQm6WG891A5Wo+0TLwqIDoDB9PI6r1DaaqNlJqnzAZWxki
         43YatYJD9YGeKj0kWW+2dPk26KjztHzX+ZDXV3IksLUnbzE31h4sRntWEup/w80+lTrK
         n+5ibOKnddHB0CaLj1pdl30BIYo03fBWj/eMGzgOEDGS3M+NjUwtrP9xdvWKaC66e5W0
         m/nEgS99/NgfAWAtBrxPtR1lNB5X5ZQHY0WS9P4Vv5yKUcyEInokdYQb6a8MFOAOJJtf
         LPFD4Ck7WE+A+TvKfZ3y2888tpfzSBVtXPCepnAxgj3ZmxMu1MyzK2FtZsEVGhHjtnbb
         zk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707146897; x=1707751697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDRyLlC3gWqMVU08yPO/L/S4ZvFI/bD4jpF5C0pvcss=;
        b=ahdN3c7kv2bZ5h1TkkiJ1KAQ25Qt1IxEVpCDclhODB6tlfeBxCbOZ8zQWb//oK5ilA
         Uo9Q15DIqklqFMPw6oeiT2daTJ7AcXmi9fMIc+SnvhnCNmRwmbWBdQuIgzGXnRMtH24w
         oPh6KYu9hGizMQGS0qlzTdmnvCh7JGP3Fiw7UEhWiO0rfNyA+JeHbZrgFTv1oXi51FU4
         ukh6gQutW1mhuOMt9OR4qvmzkwiGABpE8h42zIF7FnWGH0dvQf9VtND62mbSzNP5sLRg
         HgsgAmkrubdOQsRySAK6xaUeDVufTT2PRwlrEz8iPlEFb+xorQDKlIE5kGfmu73SbPRm
         L5cw==
X-Gm-Message-State: AOJu0Yw4rH6MciF//loVS3fOAuEovEVG/p/fST9wXhWr5EtTxXdZ5tqi
	ts600aTf7LCsNRWt8BJn8rLAYizIS0gsiWdh7uxnOx3DoDjmf1krc7rWDBa7pVasWwKvsF6DQ8g
	MIUE14RTO2XqtHz9bQw8RWmW9s7/GGILcY4OKdw==
X-Google-Smtp-Source: AGHT+IGIbSdPg2kJtN19Mb0Xsv1cjow8kPEkOEIXkMaPHkzoWnTMAKzZWW0SuSwM277zl/168CsT5ROoYE/L2t/1/LA=
X-Received: by 2002:a05:6402:545:b0:55f:a1af:a1eb with SMTP id
 i5-20020a056402054500b0055fa1afa1ebmr4776963edx.23.1707146897552; Mon, 05 Feb
 2024 07:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205124513.447875-1-tudor.ambarus@linaro.org> <20240205124513.447875-6-tudor.ambarus@linaro.org>
In-Reply-To: <20240205124513.447875-6-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 5 Feb 2024 15:28:05 +0000
Message-ID: <CADrjBPqv2O+au=MOxCoaLAAuQqOPTL7QDKcmEUUWgfAXbuWmAw@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] spi: s3c64xx: sort headers alphabetically
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, semen.protsenko@linaro.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 12:45, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Sorting headers alphabetically helps locating duplicates,
> and makes it easier to figure out where to insert new headers.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
