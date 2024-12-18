Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C0D19FA92
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734523140; cv=none; b=PBkIRiHAx8yiDU91omThItzvdqkFXJtcRRC8rOtiFMgWmUaS8PddFItuJfbd+vPhKR+xPRRbmT7Hgzud6AD2ZrkE79amscrNlv7PzcONqJY8t66W1ClHxXnmVtAWH2M+81ZesdYSXEepUyopgs2C/LsbnS3FPDiNbuQ9Zvjlgjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734523140; c=relaxed/simple;
	bh=1+XS02ndYuHh8Y6R7lznhLt5EHIcca3+r9gOHrH6w2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ethLivG565QrEbNnpcFmjOxhEn6yb502DHHU46zbp+OLyP2t9mcY888xbSp5k0CGYc69NB50ONtApxlRGzSQn4DC8khGEiX+I/qQ1j/lmIcwCn432aAzn0FULAuTRAAKd73RWF9dgLw1GZknPRf+kK2VaJvVW6+LU6QzWH8+2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEGdaBga; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEGdaBga"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5f321876499so333723eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2024 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734523138; x=1735127938; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1+XS02ndYuHh8Y6R7lznhLt5EHIcca3+r9gOHrH6w2Q=;
        b=iEGdaBgauuRo08fkM4gotu0SEwDDjBjAuBQ2qSJ7yRK0EyzZmExNPX/WE/6XYiZKV1
         ClWEt6lTx+NUObIBmGxH0dGXejP8UeVdwZUQDp6nyE+hEQSbfnXmgbwON4iVb1kKuJqi
         hmiF1f7//HegYtuD+wrkjn3QHABRPks/ENFJW9xbodBqUfDsW/MQPgRfVHO+Pjunfmeb
         Ie2A1D1qviE0BCYC11H/uRtfEw2rvSQzFyL0Fjic9DIjB+GacEup9T+yaN+3YiBpuczb
         wsxNgfhV824IyGP6MhET7tF2nKxDErFLLqzFFo6YcO7XWZF28RuZA+YqtTMEhqcCRt4l
         /X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734523138; x=1735127938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+XS02ndYuHh8Y6R7lznhLt5EHIcca3+r9gOHrH6w2Q=;
        b=RnvXm3Flra46SUX+CoMzlepdTwbDgDZqfW7vYvHGEbUi+B2IolT+rx+Et9WZoq7nHW
         HG5DKGj1+a5nHDSqo5wm84WRVV+ba4s6LcaC4pQYR4zUeHT30Hi7PEJPY40tnWF0wgSI
         JKdWQLjxONkJjWPVsb9XNvsf+sfUMeeSe//vL6dbEd3pXQTNPVVd0QxyCMqEE+SzCLiE
         e4GOoEF0Oqo77x7tC9tRynBCuGmm19RP67PIpk8t/Ip5Sk64hRhC0xOc/Lswb/Ko8CkZ
         5tDJgovjvDJjVJSmo5+wGNK94UBc6gTCSOgICXpW2A8U/CYCnBg3yzwW+1ganyM5aLz3
         n1XA==
X-Forwarded-Encrypted: i=1; AJvYcCUHMUCMHVGk8Bgzv0BoD0zlqEUtZV1qE5h8CB3Tu2b2iyVXWYMCjYeBEsnvoH+xy7ipI2OGv2OZgRPKZ/6KAyjkxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNs7D3maoQ7XuvGu8mrh67iJRSweYNIDus1t1S6XqsUxSc/6JI
	HUcg6QjiQUtxJ+0wOo6tDTn3QBtjpHdy0WOoPYTu1JYjRcUPvy/Fm8xweYelTX/6Hr7TjCZxaeG
	H6HkQdlVXDPpBBN5hAThbNnlWNKO8WQJvCAF75g==
X-Gm-Gg: ASbGncvU/wvfSUYMHtBtZ0gwyK7igrRtYaNFZjycHYkJQj9Z0St1isGnvFvuhQIze5A
	dIQZUGAaSve9mZMkVhafd/B94MEI3k5JTPSzcMpQ=
X-Google-Smtp-Source: AGHT+IHTn5PamW7QopLfPRzomInn7e/qfueiK6Mp/67924pi7x26nUbu2hSnUQW+W0L7ObbKhwdLAp9PQ0RRDehLdt0=
X-Received: by 2002:a05:6820:2287:b0:5f2:c5e0:453f with SMTP id
 006d021491bc7-5f4ca701b85mr1225321eaf.4.1734523138285; Wed, 18 Dec 2024
 03:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org> <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-2-cd1d3951fe84@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 11:58:47 +0000
Message-ID: <CADrjBPp5M8+3eX75XEVPUO_voVBHP_ZbMXP6YRJbrw0xj8ftRQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mailbox: add Samsung Exynos driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, daniel.lezcano@linaro.org, 
	vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Tue, 17 Dec 2024 at 09:40, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> The Samsung Exynos mailbox controller has 16 flag bits for hardware
> interrupt generation and a shared register for passing mailbox messages.
> When the controller is used by the ACPM protocol the shared register is
> ignored and the mailbox controller acts as a doorbell. The controller
> just raises the interrupt to APM after the ACPM protocol has written
> the message to SRAM.
>
> Add support for the Samsung Exynos mailbox controller.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

[..]
