Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09C3A1B7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Mar 2024 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709321330; cv=none; b=UKjWdx+qaQPeBE0LxO7W2RyN9gVijPT2W4oPJ8705rgdWCm0QS5P8kojanC2+9RP09AYqKorinilQGE5enEjms24tFv9IovcjhBNlapP93hwlgikYjaV7sH3JjYmV7XwYpHbTISFqmnQwFgdYRDpGnop2vMM/XhwaEw3p1VyCHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709321330; c=relaxed/simple;
	bh=t546p6Brvs3tkX10UPo7s28no8BBdd+IpN6RcODT7kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/j4um9I83k6jK60FF/WtW4g15qEeN+z6KUQJRFw+MDJE/93s6ipEXFnc3lv4bE/i6L9hJXnVtTcgsesURKCrMnWrhXfT/eY6tqVl6MxE2VDuMoLUR+P/FWdIs5v4Bkn13nY5AS6smCYkWEolco68IHfAj0z0+jscrVrw4Qrx8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQxSkOAJ; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQxSkOAJ"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcd94fb9e4dso2546741276.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Mar 2024 11:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709321326; x=1709926126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3eQJfKffcVJndSl+5ss1Mu5dgdvX9a32YznZ6LbejE=;
        b=pQxSkOAJc+OYxnkdKNqJHOBERphIxBoVFUhM8TrCuu4yyi3jKu239WWJZGSkZ8T7gM
         mUh6NtKGZzCBM2bncN3mxXBFp6H0gnBF9HBikTpTzH7bJ2D/1/O2uoHBDAbfp0aamuJD
         PhjWwu+YfdnKh01DElhy/DMkAs40iNfEs8vjrzQqNunnCsf2AfqmLvyfgXG2i/5Asau5
         DsnPMnF+tnyjJOabK0zW/tpoAsEUX/YR/vDpxPnQKpySQkkJGfcKbRe1MNYbC/eMTUM4
         Bw6AeAOFz0q1q9IOC/CrbNn3G/Gy//D7zz/JeyjcyuJ8hEXyXFaF0WEN2Q3vh421GUHU
         kDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709321326; x=1709926126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3eQJfKffcVJndSl+5ss1Mu5dgdvX9a32YznZ6LbejE=;
        b=IG2cU35QyH5dHNsXF7sdvKMWDHHJliVf8fJhZzZKJ1cWwckmYzhQBA66jzrm3Pd9Cf
         xuhDKyQz6X0gL7JBJE398EbgfSQFB7wqTkc7SeKDUr8nevXuk+wuhgB4bip6aaO9BHND
         s1WrPKlvyrkMt4oc4R8x1OFWywn/KsVaZrpnE+P2QzKFC9X1lu1da8yUoB6vWxmlN0Da
         LC0xF7Xddu6uW/AG5fdiYX45+3VRYA5048clxQdmfatUMIMBzjFL16t6XLY8piI1fpTL
         GXR/FccPKIWXRmZUHMTwYZo8ns0HyUXfea6c4M6CSrYjzVpmofrrqX6SaGvB8QAbnc72
         Gt8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQcwIStqEHhrX8Fzz7zrITx5XOmyKYpoKmJALaGbtX2R9McYBpo9DuhOE5bXlWvv3/IQUK4qsn+cntQXAioswmlEBmN93cGqnWKXz6d3EYhY8=
X-Gm-Message-State: AOJu0YwwjQQKuMv/ziNU5M+S3McFcX774FhCMgxvZ0Tw8jlouDarfmO7
	NBkPvh/Trp3eBMVeMPcy9UMW1iMsijpLLRqDxwc5a/J9mSGQZcI3HJ0h7A8DaelvK1cgeChfznF
	n4HjWwoI/10E7TvC927WA9eNbJtP/5z2EI2F58Q==
X-Google-Smtp-Source: AGHT+IEv03n8LbjI9tr6DDazz4uxUVmvw+zxPE7+xUkw8/yPG1uVEj4/9mSLSkT4tUUhQpyxWWLPRcYiL/VYZLB4rZY=
X-Received: by 2002:a25:b109:0:b0:dcc:1814:ace9 with SMTP id
 g9-20020a25b109000000b00dcc1814ace9mr2464922ybj.28.1709321326441; Fri, 01 Mar
 2024 11:28:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301115546.2266676-1-tudor.ambarus@linaro.org>
In-Reply-To: <20240301115546.2266676-1-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Mar 2024 13:28:35 -0600
Message-ID: <CAPLW+4=6oYcs0NPXo4ffLiCvtNQ-tY1s_isaxTX8dcPkV56xMw@mail.gmail.com>
Subject: Re: [PATCH] spi: dt-bindings: samsung: make dma properties not required
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 5:55=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Since the addition of the driver in 2009, the driver selects between DMA
> and polling mode depending on the transfer length - DMA mode for
> transfers bigger than the FIFO depth, polling mode otherwise. All
> versions of the IP support polling mode, make the dma properties not
> required.
>

AFAIU, the device tree has nothing to do with drivers, it's about
hardware description. Does making DMA properties not required here
mean that there are some HW out there which doesn't integrate DMA in
SPI blocks? Even if this change is ok (I'm not sure), the
argumentation doesn't look sound to me.

> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Doc=
umentation/devicetree/bindings/spi/samsung,spi.yaml
> index 2f0a0835ecfb..f681372da81f 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -76,8 +76,6 @@ required:
>    - compatible
>    - clocks
>    - clock-names
> -  - dmas
> -  - dma-names
>    - interrupts
>    - reg
>
> --
> 2.44.0.278.ge034bb2e1d-goog
>
