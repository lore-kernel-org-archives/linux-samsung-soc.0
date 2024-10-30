Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E31E6DC2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 12:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289942; cv=none; b=Nhy6v4iFAuUPWwXfOk+bQrLHrvxUwkCHrU/Nk9rWsQSQTsn3rIGuL4Nosv9zoGipQcr50TjDZnyqrKdtV7oBMZCCPmvVBgy6TtCmgEO255Tpedj2XLrCK32zh7XEWV69eG3bzFPko4JMqozBeANkctoAjO8LZhZ8+T61EEjXCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289942; c=relaxed/simple;
	bh=i1lP8I2grHrCyE9c+t46FjNKQ7k/gGdFLb+BmlfKGdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tlhc9dAL7fQ/qDFpNHBlIkeCFFxbju8mzyqTN331x27vLkC+hcxkP5SiSBtCIQzpnwNromBLlpdsjMZrNoCM6M0iOM1ERRDE+jjzS43hD81690WLmnQua+EO9SEIG+Itg9yR/XwkK2tUps6rnRUplWN+kM1MjKke+MpvyHtJzqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lSSUQXSs; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSSUQXSs"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71811c7eb8dso3333955a34.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730289936; x=1730894736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i1lP8I2grHrCyE9c+t46FjNKQ7k/gGdFLb+BmlfKGdQ=;
        b=lSSUQXSsaSOgZU2f3Daew00I6NL2+efCPSGiItNwWeeRzKSK6U54gb3nn52IIHOm0E
         R3EW5AxP2G06TB5+Z/ZLJ1Pdk2HrWXvtMzDQUajg+cX3/OG0VpMr2xAyL2B+645X0kZi
         U8jort3N65efeTQM7zhvjI+QbYkgrk6MSaOHx/aCWxbJarVEfdFW9oZ99juJkCGOVPNu
         H5zdJIxuCmC1K43E+EsKeo0BzclI2HP/02K0Xz6hR7lrmABQ2UFytPvGZLKbqwxtLQ1v
         ijuqhe8ZG1OR2H8ARNspiNoYX/EmvYi/YrSQMBCHkZ2/OAO6XcFI/uL7HF78LmNQkudF
         mBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289936; x=1730894736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1lP8I2grHrCyE9c+t46FjNKQ7k/gGdFLb+BmlfKGdQ=;
        b=LXbJZUChWfwAPWDVJTuO2JGQoMEZZAQtQKt7a9FWmN0SWs+JG+XMb79Dn2ykw2TIA6
         D/kHUw1ORhzR/MoMbo6NR5n/PiD1ZoPt88H63lWcv5kOMkFhW+NM81Z6b4j5pImPtOlG
         Zpdw0APU5yhCfHkL1jS9+19ag+z6dBRHjj77w+tKkLU8ZXu7zyz4Xas5+6bY2yyx8Ltd
         jvR9wAe9jbl4qHfTxZqAensbN9bk5ZP2rLS5EIf9G9GmHsoUVWbcfB8UXHnUSeQsXG1e
         w6k9VJqI371VWwYGoiLl0Of9L8iaLi+sTd/ba5LTXnQEIyp0BZCEpCC4dyE1JXoTZSAv
         7r0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6t5hUDioNvqMkcOEF3w8wrcBl4w6WCFXi7oaoaRuweKBL3QiQjTzj0T7SS2ecpQcJcEWIuojaIu2o171cONTYMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4sFkzfts0Ts8LnOAA8cNe9XvqW1tQNHV/M28C7qW/IZ0RnCqn
	GzftLQnflDWBJN9CpeDoz+kqHiMOhqHN3kRr8C+x1BFeSijiz7SB/yiU838kuIxvkTRCwUV/oO1
	oS6WZ+fUZcbbafI0bSbvz8vLy/vQ1J6eUoXEDMQ==
X-Google-Smtp-Source: AGHT+IFn+twCzCSyeeaogqHqxJtlAhMOH/0ALCX8dQKWNuWWzUxem8EDdoP/Zy/JRJuXvAkQG9PBSSTzZU3c7V6LoE4=
X-Received: by 2002:a05:6830:3146:b0:718:531:c190 with SMTP id
 46e09a7af769-7186827b1abmr13608345a34.24.1730289936015; Wed, 30 Oct 2024
 05:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-2-peter.griffin@linaro.org> <74458ba4-af0f-4c41-92f5-c6c0cb79e930@linaro.org>
In-Reply-To: <74458ba4-af0f-4c41-92f5-c6c0cb79e930@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 30 Oct 2024 12:05:25 +0000
Message-ID: <CADrjBPozRnsf5a0fNchbuokUK6y00SNSqEGDJ-sHojSvFzdd2w@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] scsi: ufs: exynos: Allow UFS Gear 4
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org, 
	krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Wed, 30 Oct 2024 at 08:04, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 10/25/24 2:14 PM, Peter Griffin wrote:
> > UFS Gear 4 offers faster speeds, and better power usage so lets
> > enable it.
> >
> > Currently ufshcd_init_host_params() sets UFS_HS_G3 as a default,
> > so even if the device supports G4 we end up negotiating down to
> > G3.
> >
> > For SoCs like gs101 which have a UFS major controller version
> > of 3 or above advertise Gear 4. This then allows a Gear 4 link
> > on Pixel 6.
> >
> > For earlier controller versions keep the current default behaviour
> > of reporting G3.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>
> some nits/personal preferences below, no need to address them

As I'm re-spinning anyways I'll update it like you suggest.

Peter.
