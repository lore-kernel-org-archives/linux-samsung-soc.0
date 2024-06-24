Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370A137C2E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228247; cv=none; b=TWp+IhVUiWer769rUgRDPEzKxHBYnB5rkDzAXahD4qY1NuDshLwyr2/1swej5BQO6KI0gutGZ16cI1vYmUBNdXCyJzFZPOYHPWEmANINao28vMxy+3QKEzzRV7rpdAygYggU1MPJYuDqjnmG6E2M5u2VUXJHdR/vWXZlQLjFzVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228247; c=relaxed/simple;
	bh=4dq6+oB/CSwk781PF0vUGPbURV5g6ETTeJhVeud5l/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDCrM528C12+QSD8DjJpAxpmGgqzXLmZjnvVchXQREqxtJc1rU+nOvhNq5P7jtaRi33MZhykyNiqR4+1Utnas4hXRyoVFB8SpXgASoRu13yy+ruHAYTyJKAUrBj/oHYKUVCzeX8WpHF0tH4OQ3lAl3FnFyPl9YS+mZk+DsHJJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0pCHklK; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0pCHklK"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5bad217c51aso2229377eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719228245; x=1719833045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/uG0pk/rOzEYyf9kgjbXb58wu9autIPkbU8eM8hrs0=;
        b=F0pCHklK7EyVlYG2nmQ4OKISElFyQ5VUGQ4FXAIQvakUZ7lzhmP3eW9eYytPAqFyaz
         wmWem7uPJFVKtYiWt/vOgWU1v4Tav2G1XFV6kh+qsbXTYja+/3HmtrQ853WHROMAlVC7
         E+8tnP1r4RNyUiNwvkcfqJWipV1NskibcOYAe+7UVqDMDqKW2nBDcsAe5Yp9bIuxjZJQ
         OifMfhjzyE4rZdb02UQaBown3/oBff0NKpYoxhUTRXF4EYoL5nSk6z+DvE7HVPhT/IFb
         YwV5I7E18+g3S+YkmBlQPF96wvORTZycXpW0YVA17flJgie+lX6+DKCjFrguCFUScrqd
         iesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228245; x=1719833045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/uG0pk/rOzEYyf9kgjbXb58wu9autIPkbU8eM8hrs0=;
        b=qLI5dHPYU1IkU/ZkV70vxqY4kB/+4XUxPcJ0kdcUuwH4nvFADcGKjvuKc2l4RppRDx
         1vCCgqzDZii9XBTMIBYhCRRuA2geC44aLUlcIzoiK2Swi2522eoaFKAJ2hh6xxjuoiEF
         M7gOURyr8zWJ/0nuGYI89qf/m1yF6H80ObrXiz8aNstWKRNV1H7WfeuZ9wX9ZZpJQcix
         pAJNt5bZxZnhrHPt0ufPjDVO+8HmyWqDejZ8JSTLe39lUc3CU23522PAIu0jJG68CKv0
         Ky9I2dg2OfkUABMckGxWKOrmPUJDDSLF13XVX64KcBdQhgEtM+2KORjjOuA+rYwZr7eN
         zjng==
X-Forwarded-Encrypted: i=1; AJvYcCWp4U0O78C/qzYmBl2YJ7hVT30mMBws/rAZ0JLgxCl/8smI5jJJD008IdK2t443eC+CVMAfwYF+9ORUjs9kndOG/hE266uhEaxmNUb4pL6J6rU=
X-Gm-Message-State: AOJu0Yz4MLxiwAUcUu/SI8+Lr2CkeQQ8mUbOjfAwJ6kkJ5BvhIjVqFRa
	6xNI6H/Y3zAaxnV1xzGTpRjFqagrGudNwrpJFz7/e1H+2uOaaFFRtl5+62u2LPcOLV7QuHmzOP9
	qTd86wV69D7af5eqZ8QI2xAiTPrbQrlrusr1yrg==
X-Google-Smtp-Source: AGHT+IHMLqDC2rTXhVuW4+7eVR8LzUhLBmZIQgM3baPjvR31e95ip2NrsiCp0QKxJlc/jUGwGVTWHwCoML9aCJwp+iA=
X-Received: by 2002:a4a:85c1:0:b0:5bb:e55:56a8 with SMTP id
 006d021491bc7-5c1eec84869mr3670014eaf.0.1719228245151; Mon, 24 Jun 2024
 04:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org> <20240617-usb-phy-gs101-v3-4-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-4-b66de9ae7424@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Jun 2024 12:23:54 +0100
Message-ID: <CADrjBPoP_ZXyNrbS7vwVOqZTBqp3Brg7zigYukf-p1jX4AtHCg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] phy: exynos5-usbdrd: convert (phy) register access
 clock to clk_bulk
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

On Mon, 17 Jun 2024 at 17:45, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> In preparation for support for additional platforms, convert the phy
> register access clock to using the clk_bulk interfaces.
>
> Newer SoCs like Google Tensor gs101 require additional clocks for
> access to additional (different) register areas (PHY, PMA, PCS), and
> converting to clk_bulk simplifies addition of those extra clocks.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>
and
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested using my Pixel 6 pro device. USB comes up and it is possible to
use adb from the host computer to the phone.

regards,

Peter

[..]
