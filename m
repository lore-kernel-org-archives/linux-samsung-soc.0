Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB63A63E6;
	Tue, 24 Feb 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948426; cv=none; b=HEV/EWAkI+Hz23dbrDfeJLcftMoltayv0A5+A8qrEhkufTt55MlOCgcZARKb2G1uZIAgaJUHhWJY+25B8fSC/zHSr8jMJ9sew2BiVJ4qRZn7gIIXVhvW9sSez/8GGYGb9Oq6gQkKlpSbdZHNuoXTVAPfRVv3cwp3ak9OMHj4OQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948426; c=relaxed/simple;
	bh=CdbiAuW7DFMBwfjS2vMQ1K/iVr4GBckWh/hFmYDp5pE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Tnxry1gg2gtV2KEtWCLV3ByKzKuh632ADvOZrqqEU2BSeQXOulNsUIT0A8vCKnSx6Lo970bTsaI5P6gDkhJDAl2ZgGeYJSuSELKFkXJWFvw9Irsfj048ffz+OPbebj/VT9OP3nIdesihGoMc9qQzbLhcxsc1ckcw+Rsirz/3qUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AKKuoRHM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AKKuoRHM"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A789F26892;
	Tue, 24 Feb 2026 16:44:28 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xyD80bs-K9V; Tue, 24 Feb 2026 16:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1771947868; bh=CdbiAuW7DFMBwfjS2vMQ1K/iVr4GBckWh/hFmYDp5pE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=AKKuoRHMYpcTcf4DSfkaKL7PR0lNFp0OegfvvhIbh/Zc35nY2dehSqIhmylr7VF3N
	 OsiTV+GL6iuS9dOwnpmMcM1Tzcl3HTY2HgVWe4dcJ1UM2gcQhNg2qaMbaDW55X2sou
	 h6GZBX6wjXMODivdMj3+/lIg37v+ZWlFhyKx6OJmz8EKgugksCnZRmCZFb2sdjhD+1
	 Z+aWH9VqgvoEeIn1B6J/7JkqC3bzxnL64QY8/2b/Y0/QKWgIa9Rkyw75VEX62MsZ4m
	 it6laVov+XlKsvRNPQlyruVmWQoAo1dJ1pIQvoaoQWVV7W8Fp7YQ3qXWIV/+3hdv6b
	 ELGfsQQwSvseA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 21:14:16 +0530
Message-Id: <DGNB3BMA20CI.BFNTFEX5T5FY@disroot.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rayan Marzouk"
 <rayanmarzouk743@gmail.com>, "bluebunny" <kalorin.bok084@passinbox.com>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: add initial support for Samsung
 Galaxy J7 (2016)
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Tony Luck" <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
 <20260125-exynos7870-j7xelte-v1-2-5cacc3042c42@disroot.org>
 <7cdeb30e-13b9-4c7d-95b4-f6bb6cf15ae8@kernel.org>
In-Reply-To: <7cdeb30e-13b9-4c7d-95b4-f6bb6cf15ae8@kernel.org>

On 2026-02-24 12:20 +01:00, Krzysztof Kozlowski wrote:
> On 24/01/2026 21:05, Kaustabh Chakraborty wrote:
>> From: Rayan Marzouk <rayanmarzouk743@gmail.com>
>>=20
>> Add initial devicetree support for Samsung Galaxy J7 (2016) (codename:
>> j7xelte), an Exynos7870 device.
>>=20
>> Signed-off-by: Rayan Marzouk <rayanmarzouk743@gmail.com>
>> Co-developed-by: bluebunny <kalorin.bok084@passinbox.com>
>> Signed-off-by: bluebunny <kalorin.bok084@passinbox.com>
>
> I cannot take anonymous contributions (see submitting patches). Please
> resend or confirm that I should drop above Co-dev and SoB.

If I recall correctly, "known identity" refers to anyone with a
consistently named user name. This previously used to be a "real name"
but was amended since, so I believed this was valid?

>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>
>
> Best regards,
> Krzysztof

