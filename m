Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047D450A6C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Feb 2024 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708372553; cv=none; b=a0Fs9zymdUUcWnu6HmRvdZWrp3DIk4rDvsABPuKAcBCiG8qb7VfIcnRgdLk7zbFDOKnyOlsHA7QbwVvJFTzzx679ZtC5nW36Vmg68ZqAbeU1FXwVEBVNU/ypsmBfPvo1g/3l5orxtUFwD3ai7mzOISZmyoJ0eENJarIRKrq9Tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708372553; c=relaxed/simple;
	bh=8OKl41Wc+X80Yr8sNThOn8WRf/IkQK8EP6oDeYEVzfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rF+LetVer/llok2HvVmqz6/JsPa8cALnLRwGBycVISC2nYsR8Z/KOLfyifeamEO9VZV9fYPrxNm0ORYSMW1FelKqISQGX104mwBGNPNm/wS4oHOmMGPHssTW2h+0Yd/ZNs/S4e0LqO85tO/6Wvo726IWAzJJ9q/JxPYj7cWLrgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlKLk5Bx; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlKLk5Bx"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6860ff3951aso23043516d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Feb 2024 11:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708372551; x=1708977351; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8OKl41Wc+X80Yr8sNThOn8WRf/IkQK8EP6oDeYEVzfw=;
        b=zlKLk5Bx5qV8ZRs9WwK799E2imjQoywr4LoZhjnL3NOaBAv2H4dnsTkaSw4yFGQ0VC
         gfyxL7jclaKOC6JGmIJRp3am5tfxYWciy4G/LjBT6d6ZjdOphH5O2+DuXtI93pjvM5Ki
         3bWejXzmNUJrQ3STIAN+CqoNW8lKbkCtznm9HzvP4ZR/XWSHveTVYsnoF1Ww6DYseAx2
         IWxMxvGblRuzyGdTqeL2GJUMV68b+kpzXQ5j89Asne3UVerkWi3fli8z8BL34P405ZzZ
         kuq0EfshsxtSQ0M2Dwz1POm/I2WyoaNqrUlS1nYyhgY0HVhfLJvvXKEiQnj9ys5DFg3q
         WQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708372551; x=1708977351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OKl41Wc+X80Yr8sNThOn8WRf/IkQK8EP6oDeYEVzfw=;
        b=Z1S4WbyeZicQLyHr4mPt7znoLEKq0yGXsTiSHES8nbLz+R3AuxM6z5zlWH1x+kvR3V
         5lO6gZZ6yD3gMCiyJta3h8HWk0mI1sbdX+eCJRGPpqdZGv86YkoXzk3YIyUb5FbOrP7z
         Y+FXnThhh0BWiBqmjOIf+czcuTAhGILoIocYAB2xRhVN8+2x/bfXM0prpWRa95XljdXL
         TmGEiSrfuUM5YCn333j7cz34ynudenOXd9etMwWXhrTdfoR74EVKKNE+VMiRABNUoo0S
         yJirLb4QVKKMtZlaG3zUL4y6WvypbIdB3hJF+3Kgk0OYW9I196awJC9W49krxXpopgtw
         zHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOmS1pBzKXjJRBGtLXe5shT8kAVwlT1BOVq4+1SlRDKpnx//8/GvUwpQ/sA9JhyI8HFrus1WgbPWLH09GaMVLXDyDa7dZ0dHGRW3YUvMGVaKM=
X-Gm-Message-State: AOJu0Yyj+O57EG0dDk6mtIZYE0JSain/SvQ/AV0qde70BtX/1ys9TQrv
	s6DgPiRhdnVQayBCS/oYl/RVkOnx/rWU1p4sEinLJX08MkhyE9JFEE1hnWmy+nUt0ey0B0iVze7
	whvhVlQ4bNs4eKw1U3XKrTRjZOnaf+A8NFfm8eA==
X-Google-Smtp-Source: AGHT+IG102p+3tJPXw/wv5GEecEGDJ4yNBwcwvEeNuhkzfGBOzbwgyL9AORHgu7VBoaPB3l8XOP6sTuKS6wMjWiNBq8=
X-Received: by 2002:a05:6214:2687:b0:68f:3c39:c63e with SMTP id
 gm7-20020a056214268700b0068f3c39c63emr10578054qvb.6.1708372550871; Mon, 19
 Feb 2024 11:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219125453.103692-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240219125453.103692-1-krzysztof.kozlowski@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 19 Feb 2024 19:55:39 +0000
Message-ID: <CADrjBPq1X2P7hTqSiTnZ03c_QguTQ4kbFen9MeWh5TaYn9fh-A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: samsung: gs101: match patches touching
 Google Tensor SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 19 Feb 2024 at 12:54, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Maintainers of Google Tensor SoC should be aware of all driver patches
> having that name.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> This allows to spot easier such weird drivers (weird because they claim they are
> for hardware, but they omit entirely hardware part) like:
> https://lore.kernel.org/all/20240219061008.1761102-3-pumahsu@google.com/
> ---

Thanks for this, I hadn't seen the series you referenced above.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
