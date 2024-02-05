Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFD33A1B6
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146731; cv=none; b=CfxLdnR0PWHowMIHh6VnP7FVc+z2cdUgonDQBvesndAB5w+5frQHoDdbM4DhVDjS493CbzJXO/MNpHmwCDaYRpjPOc3W8ZbJklaV2Ec2EUTlYT7ofMTM0tXpzlEXG3XHbavHKji1ZFZtaff8y4KmgDcvrb9vHefx6F/3r7y/Ctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146731; c=relaxed/simple;
	bh=4KcubRPRLUqgqIoz5G5H+XPel1vrIIpMYFvwjaw9uKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByA8bB7MDb/K2ato5PGp0fWtXsDtzBCblIa2SX7quZEcU8kyUSfIC601vdAdqoYnVSdzwWSUcQFBeBVcHCUitgCu50m9t2dTPB3Ebk9TIBzw9pN9VQ5AC5jY1v4KWjOL+yHLviZbguXef3zMNafnjl1w3mCuvdNdgxPBGlEcFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sAoqS10W; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sAoqS10W"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55fc7f63639so5188666a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 07:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707146727; x=1707751527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4KcubRPRLUqgqIoz5G5H+XPel1vrIIpMYFvwjaw9uKE=;
        b=sAoqS10WJHJI2Fk6qNhhy72Kz0PgZl7A/mdvMk8hbtAf3uMeMi7mWi0RhlQKZfNDEK
         JgWwedqF6je0KSWvm9xmn91PfbOpU8WZZKYhu+qjdDn5vXluyw2ng63+ouNH7obcY8Ms
         c5/F/tpjpaDgdAUx8XxUsD78Lm3vfgvbFtmyGxyrWGVylG1iMcxohPPMsdhFuvT4rV1T
         EDqIGUfhickbzISEVES5KxXzdIhiib1xkGq95l0mWTkIXOu7qSClUdb8jf/xrOr3g8gp
         QieNq2n0XSIzjK9gFsohWdJ6K1TVYmVNGSNr1WNmwotHZ8BpkFNp40FGX2MoJ/OyX1B/
         QVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707146727; x=1707751527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KcubRPRLUqgqIoz5G5H+XPel1vrIIpMYFvwjaw9uKE=;
        b=Diq2t/WGNLAkzJD/adAxSYWGdoduH9UQHV+0DMe88tHDugmHS+AP7+troJIBQrbtF1
         zhEaddUpz61ne5XXy3ZS7zrNcZmWqMEcAB3IewJlbNbWYBG5jhUeq7+jQUGx0scZdhzr
         QkHqKOPw2fvXEcyFjaC+zanmSAlPmjq+qx6UT+f2XPq9F3/xFCUwZ+xhpvHAUAFs/8Bd
         eb5h4TmyDMBURIZwgMeDj6qCuDfKXa+3+qcNLd2WDzuavPYzkyLHBKfBLPF1e7xgfxWi
         nG5ZCBvgILpZeV2pbp8Cei6ycN/82wUGnFtLSAiPKA+IbWgy8jxda68kThF4QBZy5Ro4
         82Zw==
X-Gm-Message-State: AOJu0YwuYfWi/KwINR9B9as4pqesZycSI/hB22GgUi/jReIsPLXtquUR
	DLD3ki3ICZa9M+9jfubMzAACn0+HBS/BXswYvWuX3hIKbbBR7Y5dCA0d3FBNkgRCB7Oyu+rvFFT
	VBKrw/LJjILCE6Nih55yNgizghvMrgDHPKReC1w==
X-Google-Smtp-Source: AGHT+IFeqlPRCRFT539kKDucD25/pT46c5dq1Ga3tjDQ/YWMpKk08QvDrTE6BcrLEWcMlA/MyLH6je9sLL1ST1lEwzY=
X-Received: by 2002:aa7:c0d1:0:b0:560:32f:4360 with SMTP id
 j17-20020aa7c0d1000000b00560032f4360mr4634382edp.33.1707146727621; Mon, 05
 Feb 2024 07:25:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205124513.447875-1-tudor.ambarus@linaro.org> <20240205124513.447875-3-tudor.ambarus@linaro.org>
In-Reply-To: <20240205124513.447875-3-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 5 Feb 2024 15:25:14 +0000
Message-ID: <CADrjBPoBTAQdKTyBUkM7rLMZUY-YEc9P20HbSwNNrkYao2V+-g@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] spi: s3c64xx: explicitly include <linux/bits.h>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, semen.protsenko@linaro.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Feb 2024 at 12:45, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The driver uses GENMASK() but does not include <linux/bits.h>.
>
> It is good practice to directly include all headers used, it avoids
> implicit dependencies and spurious breakage if someone rearranges
> headers and causes the implicit include to vanish.
>
> Include the missing header.
>
> Fixes: 1224e29572f6 ("spi: s3c64xx: Fix large transfers with DMA")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
