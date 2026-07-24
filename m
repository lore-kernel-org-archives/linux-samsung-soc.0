Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D375345EC0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jul 2026 19:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921152; cv=none; b=tIUfB9uAI2rVjBKtkKYG5sale3rQLUmqylEMM1vHNkOMRWlJZyR5mgQuyGlkDS49PrTHinhfxOl2QL9yvzLIATpE541gmpYkYLa5D1htX9SSjq0WgRnJb93NU4VcDbeqI3zPbkF8s1U+F+x3Qa878qgD1iZB0zFmSbvb86XMpak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921152; c=relaxed/simple;
	bh=2ksqF5z1sIMNtrP1tAqgcwchwd8cY45U2teQX6Ds30I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cu6e0nYW+GYDppZmwOWKpNIRFR8dTUnz+XTbVWY5wmJtwwqVL3RrWhFUdmFQAeOhu692xuHNM24cAC5f9A2Soi2QFNpmGdumGzS5VJmDnoS8MnccmZ1c6E4vcfwtxzXFfALdSL01X6jEVwGt6xhc6LsrRfe1qUQEBNRNebTjHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5DpW+Qj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5DpW+Qj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceed7018c8so5994835ad.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jul 2026 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921149; x=1785525949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0tC7vV+OGBtLj6C1dSzqQ74owp2ZWgS4CBF+5vZQqs=;
        b=U5DpW+QjLEhqPtA+4gUme0zWGhUPsgeSIqst2Jeo+WStjwobZ4fKCeqjNNhq2XTuZs
         jE3VHDwxCvUV5/MadJGYXMJxD1SnPUf/29Q87RU/Q6A4d/b95GjVc/SyKpZQ1+D0g8iY
         zniCZVpX51oPFw7WKgTLGGUO1lxc+SRK2z2nISMo1doTxNnZUms5Ksa/TRqNYQf2ZclK
         U3trorjmjVZkP/nrlmq0KymALkVquD81llgC4dPj9VYgxEtnmX4zDCS5l4HrIgYAAZjM
         6m5MeAUXpskUg3DCncGrJpTDk6ZzM6+9wHY0vI0z+T6YLuf9a1MbH3iYFiBDe0bHyfgc
         4bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921149; x=1785525949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0tC7vV+OGBtLj6C1dSzqQ74owp2ZWgS4CBF+5vZQqs=;
        b=sgEt2L7+Rorp9UprINW61vnzcqY8NF28LqG9RMmPq9esGW2Q7wLZx+n4c4/H2tmwzo
         IOMMWyvuXd9iijL/MuWRdH6mf6TZEIHuwqx1H2GlrfdbQGpWjdxHcz/iU2s+qSWqqZgI
         9v7yndjLIUYMv3NshgxdMBH/Qk8H3+kQ2bYPJNoNkgdm4pmBwlK/GCVOOeOAvMN871ZV
         Uxab5uo9ZnYfjgcuVUCjTnKB3MYT9fSPM2ZFl66WAFqa1thJ5PezLQIKBQsoGqlAQV3S
         Kw9CnBMY/JMYaezTiVmCqXUcstgES+qRl0fOkWD78nG8RAWBDRqsXzVIJwU1+LHBMR7x
         BoQA==
X-Forwarded-Encrypted: i=1; AHgh+Rrv9OQfd0NqdSU0/Q+6eCwpfv7LEY/OrMu12xm864ehGzlHKLYABOimku8iuv80G+y/RqGSqfFgevbvpM3vuV807w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQHz76r8zsqfuFuHzbFbOLPJ38nEmLWlzlYm0EBWcdRjwKC9PR
	nx52iIybjZTsYvV5mhchYnbvvxYAx5vejKCxYx2tKWT/6cpCB8sR4a5/
X-Gm-Gg: AR+sD13kZITSVaUD2+AhbSzsrWj+YkC5cR7lDFDxLbaZOm0ceAKmFcyB9ZpTcBkctGb
	7AwjE2oRzJlPy5Os3MfcZBzaFyrdlZW+v8/2s7MlRqTfU781JPETgrkm/9LZmlgHdKxlEDlbwEe
	mIyQxvcdrBfywOfRMxE/FJz7M0QvIz8kg8U7d81uW7FbIfKufsR9w/fOBSRMBB0U8pROwBPlg2t
	TjbmAY7f0/a5KT2KpFtaQUmA+IfytgUaGB3t1x6PO2uHwDSJ+7zXtAJS5Yl4Q/5FsdHMj70H41n
	3XSUb7LIty7wQXHss5/U9+H7zh0rsDxts+MlaKr8Wh0d/hEG1eukpLQ1RwZ+HI3x9XL7oBWbVWp
	pcHnaC6wYGVPloqltox80WU6UrkVuH5C63TZPHkGr3yndcgZCPxYkVgThBNJTHiACSiK3yAJkfH
	WL69yhUKGZtqocFAv0HTNd6ZlNECBmIhQxCRy8qykCkRI=
X-Received: by 2002:a17:902:d491:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cfa6b77547mr101121265ad.14.1784921148827;
        Fri, 24 Jul 2026 12:25:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:40e1:40e4:dabe:543e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc579127sm1679206eec.21.2026.07.24.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:25:48 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:25:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Linus Walleij <linusw@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] Input: zinitix - add support for modes 0 and 1
Message-ID: <amO7_sEL0hknUGO5@google.com>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-3-f6df7d86a878@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-zinitix-modes-v1-3-f6df7d86a878@disroot.org>

Hi Kaustabh,

On Fri, Jul 24, 2026 at 12:54:05AM +0530, Kaustabh Chakraborty wrote:
> Zinitix touchscreens have three modes, numbered 0 to 2. The driver
> implements mode 2, and leaves out modes 0 and 1. The difference in the
> touchscreen modes is the schema of the event data.
> 
> Implement modes 0 and 1 in the driver, along with their event structs.
> Maintain a common, canonical event struct which is to be the superset of
> the mode-specific structs. With that, introduce functions to convert the
> mode event info to the canonical format.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
...

> +static int zinitix_read_point_status(struct bt541_ts_data *bt541,
> +				     struct touch_event *event)
> +{
> +	switch (bt541->zinitix_mode) {
> +	case 0:
> +		return zinitix_read_point_status_mode0(bt541, event);
> +	case 1:
> +		return zinitix_read_point_status_mode1(bt541, event);
> +	case 2:
> +		return zinitix_read_point_status_mode2(bt541, event);
> +	default:
> +		dev_err(&bt541->client->dev, "Mode %d is unsupported\n",
> +			bt541->zinitix_mode);
> +		return -EINVAL;

Instead of a switch this can be a pointer to "read status" function.


Thanks.

-- 
Dmitry
