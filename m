Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECC21766B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738103; cv=none; b=rh3vAr3N9gJN7SzoH4T9wVH6uOg0HbRWSzJS+rC9TSvK9tryXtg/BLFNvJysASPoLfdTlCJ6ijX5EZMM0deqGwdwYM1cXq2FpIjY9tZKXHXOBTb2vMZuVVd9akdJPpdQ9I5HjUo9NAW6ro7fb54kltpPmurEqTtcNWEBahARJEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738103; c=relaxed/simple;
	bh=OB9He6hF6I8ijcVioJl0rUXSdngnWa1nHdHHNLYHYmA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IumfuwHFSw6ab6FnhQZ2rNBdnMsvcE3vr9pMMr5c6ZioPlg+g1gatG2SMGDRYLGW06XhdFXjQWvON75wXhcMyQw+/Y4Ydf0m4jqOgHyzbP/EZ2orgMoZwFIl5Ui5sXoLgAMDA/tuJTOC62n67roqot4kF0lIAa0gXkZb3aviP8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnwRUM1F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnwRUM1F"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434fac2996fso5356085e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2024 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733738099; x=1734342899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OB9He6hF6I8ijcVioJl0rUXSdngnWa1nHdHHNLYHYmA=;
        b=xnwRUM1FRkB2XhnWL+E63aLQhp5DLVmz59F34CEHCDeUmylZkRolCBVymiXCHvqxsy
         GwuO7r4PlnkcFw9K/bMO0zooXuGHo7eX0DM7L9xdAhsmQJGKXwbxOfefga/5BvHk37bm
         UeBQ7n1PwVCDIwgzzIJGxIsI2Cl3iQzCJjUmlbm/bd63oftSMlUfin3kI13hnWXuZ5QY
         99+oiwOUOjekTnprPoZpeAf/mMf2euM4AIjLFTbA1ElaMNWYqtLh4ThuQK6uLw8qZf0w
         FYNqce6Nko47cgSo155YFy9uZxkI8wtA261tfsw5NmeomPZcyvvPoPY2hk5S7ef6nR3w
         4Jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738099; x=1734342899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OB9He6hF6I8ijcVioJl0rUXSdngnWa1nHdHHNLYHYmA=;
        b=NyxRkL0JxEQHhE5EmS1qgGJtM+W1xzKhW3yiV2I/83Gnk3Evoz64tYCsQoqJoprH8A
         dNtFG+I8Uth9HrfQnHpUzUBM+lOGBkbZHHh1wdasFzGuv6rU6Axpwclm8A5hGZFe6+Im
         csV38FXK/mmwy1OZHxLqc7PbEEZuYHDmVgTfbbbs+xc/ImvQ1XPaY6zX4W3U4vFDRZkE
         YPqaJpqSTwRCu+1dM8eQs/k10gpXJrwgqpU8lz7ld/fz9DqZ/01rjFDpSC+JYVX3gdUB
         waPdOFmXTGZ/HFRKcVNga/elkTDWookVeltGl/4MiAd3OoQdXI1YQnywX6o+7EdZ3z11
         cYuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ45xpZLSDVZizW5+HW4LnCtEtS2pyhVMfIYNUYYd8x9d5+RVyNpTesKLNwibSDNxsvNr/3MJfab+/JkNDP053aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk+l3UMUZQxek8BJtz85AacYcuBPB/DGah5sGFsCw4cubmV3Jq
	p9IcFEHKyUfB6/RTcFiq+dueOLfTBZo5uYV61imTmdVeU2Kl7lsUHkh9dAqwjTY=
X-Gm-Gg: ASbGncvt85SuCzv+OscAQEOaUsmqFMSRCdQ9wtyFeJM43RzIqbrOdQlJRydHUNAGT/7
	iXj3bSD3KRIV8SOt+5swbL3dJXrpjzrDATG4WlzUYs4ZncqoQJ1jwP0Za6CE99yT0L0XeP9hakc
	pgXFfmHLtIBRAdys3e4eoKFxlwJpb6AghEvpCoZwtX32xAYrnh9WvfnfJxfqShtjT2ZYGVp5mWC
	UyXBJCamtVab0QrCXiNEwWCGYGEJwXMNJCr9PKLQGHc/Wiu2Cqkrg==
X-Google-Smtp-Source: AGHT+IF0aY320LKmbb9VsSh4Bu/wLdBuFlAilYWTSx5YOCp9lTexIQIbfl6KTwoZqY9Q3xeWbQxuNA==
X-Received: by 2002:a05:600c:3783:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-434f5c03c29mr28643785e9.29.1733738099338;
        Mon, 09 Dec 2024 01:54:59 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f3c96ca2sm52326465e9.24.2024.12.09.01.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:54:58 -0800 (PST)
Message-ID: <bbc6654e3ce7d28c4a98e25db270615b07a42c01.camel@linaro.org>
Subject: Re: [PATCH v3 5/8] phy: exynos5-usbdrd: gs101: ensure power is
 gated to SS phy in phy_exit()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,  Alim Akhtar
 <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, Roy
 Luo <royluo@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 09:54:57 +0000
In-Reply-To: <Z1W9xuCrn40uPWbr@vaman>
References: 
	<20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
	 <20241205-gs101-phy-lanes-orientation-phy-v3-5-32f721bed219@linaro.org>
	 <2024120528-poker-thinness-6cfb@gregkh> <Z1W9xuCrn40uPWbr@vaman>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Vinod,

On Sun, 2024-12-08 at 21:09 +0530, Vinod Koul wrote:
> On 05-12-24, 09:04, Greg KH wrote:
> > On Thu, Dec 05, 2024 at 07:33:16AM +0000, Andr=C3=A9 Draszik wrote:
> > > We currently don't gate the power to the SS phy in phy_exit().
> > >=20
> > > Shuffle the code slightly to ensure the power is gated to the SS phy =
as
> > > well.
> > >=20
> > > Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 =
combo phy (HS & SS)")
> > > CC: stable@vger.kernel.org=C2=A0# 6.11+
> >=20
> > Why is a patch 5/8 a stable thing?=C2=A0 If this is such an important b=
ugfix,
> > it should be sent separately as a 1/1 patch, right?
>=20
> Correct, one should move fixes to top of the series..

Thanks Vinod, and sorry for that - separated out as per Greg's
request here:
https://lore.kernel.org/all/20241205-gs101-usb-phy-fix-v4-1-0278809fb810@li=
naro.org/

Cheers,
Andre'

