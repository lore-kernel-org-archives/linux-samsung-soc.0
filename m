Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5F182CD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735234414; cv=none; b=Oo8ESaySPiPTJq7skrPr84ncQYhBFATLmz1dYVlgeH1ABF3GjJHVaCSrb42znxAtplYuMgNuFBQzAUWDE2xk1wqZ0SNb8EHpqLOv1UlDuI1nH/bkzCqlyWcOfXxNzM2XOQ12OJVUa5Q63VQnEGkHxbe+/pZ+PrBJGS82P5JIsgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735234414; c=relaxed/simple;
	bh=Y4Jg8OpRUoTzb1ctZa4nQnQqaMhZdkcDgu3cCuJxTZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIJ2VjmtBhEI+ZtY2Q+FA3tzpCir2j1OPMpAqFjwbFp0fCM4WvckUHCarCESM++tW9K0NxQCpLelCt+wtXciXyxXbtc8FN4GiuAokog9F099WKw9u1O8D5h3RGaImnJKQ/4Q7Gd1ZBV8CxK+D90tU11mYNMBaPwzJ1AnD+XXDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NrBJawUE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NrBJawUE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215770613dbso56152185ad.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 09:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234413; x=1735839213; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tU2DgvDvdkYRJ/UA+n5FQrbOcfdyXNL9khgRhEzfCzg=;
        b=NrBJawUEwPfuzluZUFzJow/LlN3FvbcZaUsDAF6ppNV3qosITZkgsIYUBIHVsy+jUX
         U39u6W3qwbcM+RwgjkO78bHR43eYBvoMvroKNtQctAXimnoxLB/UpInWnQoh6ROoDH5A
         mf5E6obkBVLlnLQF6sz9lS/zL3JS0NI9sy9uujHEBMU6MikEVwOXamQa3k+MljpBfJ4R
         FxxcYekwrfbthgznNCQC5j91bq4hgHBRYcLmO0lGM17W2iNuqq8ofUA3PnkXaFovQgly
         KX60eC6gMfisY36LgCjpZh1dx1CIhpFZ+VadMwYVHNPKm9EJ6UBnjGo8IWCTs6EDlFBL
         Gaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234413; x=1735839213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tU2DgvDvdkYRJ/UA+n5FQrbOcfdyXNL9khgRhEzfCzg=;
        b=Di9UC0i28jMOumZY8FJ9AR4BZkeVkh+ATcK8zHS3zTomypp46ZlhGZ/fiGLWAyHTpl
         tWtv5H1VgOYb/+66HZ57I7psLlBxFcBLD0uXxhR1gQ7sVZx3BjdCf5seHv5rwH/KYD5e
         caENRgJ9frs27MJFVWPJp6NZQxhQmTZaaRDIhUqq+TG8ihltL+q12y0jBuBR9cKMG45K
         cJ3+ijQb21b5El8Osfxck7XzqMFrI0lgZofLUG19xjlLmYF8AbOLAAROWcvyk2l6OpA+
         tr+24OT8/PPNUWGMku84CKtI0d1XxOnwCZh8u+0BcNtkm4zAL4g7sGh4pqqer1U6k5yM
         KDPw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8wwYwDvHkgewSpJ2mAGZVnv9dqR3DyNEsaldqNigSj2sqildqSpIzlb3NHoH5SrBI11Wnen1VGZpbcX8iPaYig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNw9Q5YFiWWPwnMWK7lsjxuO8Rd7FXLoVR1A6fQtjjPqljIEUh
	C7GA71uw5o9tT9FfTxz4ZzNeFJh5N80fViFkK7+qfzlOTsU+M0QTkZBbJ4knqg==
X-Gm-Gg: ASbGncuWOZjNcWTGln46pyFKQsdDzF3z9h3ZqUig9hqDioVkKwfKFoc5S5N8eR247TV
	c/yzSGS5qKWIwPJjpCdMqPHc0pgXfsY5OR6aB+hsSGtG3rlF+HYUIj6LNvnPNH/06SUtME+y8wU
	sF/frkX8pDY2pWecqTtkbBQx4VqZcgd18obZgcUF5JZ08EtvON7fymOKmSAiRy9+ZD/j6EbL8Tn
	EGhtjDFfsPl7n4aISC0XbM4nhfBHpD637CAyqMht2itbA0xdvYiDh5gewAYlqhC7QUcciarkPDS
	LSXEiE+kXHn0wSv93qbOF1CC
X-Google-Smtp-Source: AGHT+IE+RbsmD3Zf9RNfUiqXZbLMpBzhTHXlQkE7VbdmcxZNIAB/IcMMJ416yI3GXCiiIa7UXuAU0Q==
X-Received: by 2002:a05:6a00:4ac5:b0:725:b12e:604c with SMTP id d2e1a72fcca58-72abdd3c467mr32014218b3a.4.1735234412566;
        Thu, 26 Dec 2024 09:33:32 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb851sm13146587b3a.132.2024.12.26.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:33:32 -0800 (PST)
Date: Thu, 26 Dec 2024 09:33:29 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
Message-ID: <Z22TaVlsIiMw6jwk@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>

On 12/06/2024, André Draszik wrote:
> gs101's SS phy needs to be configured differently based on the
> connector orientation, as the SS link can only be established if the
> mux is configured correctly.
> 
> The code to handle programming of the mux is in place already, this commit
> now adds the missing pieces to subscribe to the Type-C orientation
> switch event.
> 
> Note that for this all to work we rely on the USB controller
> re-initialising us. It should invoke our .exit() upon cable unplug, and
> during cable plug we'll receive the orientation event after which we
> expect our .init() to be called.
> 
> Above reinitialisation happens if the DWC3 controller can enter runtime
> suspend automatically. For the DWC3 driver, this is an opt-in:
>     echo auto > /sys/devices/.../11110000.usb/power/control
> Once done, things work as long as the UDC is not bound as otherwise it
> stays busy because it doesn't cancel / stop outstanding TRBs. For now
> we have to manually unbind the UDC in that case:
>      echo "" > sys/kernel/config/usb_gadget/.../UDC
> 
> Note that if the orientation-switch property is missing from the DT,
> the code will behave as before this commit (meaning for gs101 it will
> work in SS mode in one orientation only). Other platforms are not
> affected either way.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Verified on my Pixel 6 Pro.

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>
