Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A313C9C7;
	Wed, 25 Sep 2024 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289786; cv=none; b=H7HCnQXAwaZ4N8duo7HWxyvA4N5QfMPGBwtn+p+42la/GmBppDWwDV6JUe/e8a7OoFVN28VhCC0Dk8GQLcQwmlXxrDTzqQM3aOssFKjYBsa2KG4W5sozRBtX04fz8TnRavc6QQHD9tDOFjnsr4T/OQwizq1hpZnofWIUeKnOqAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289786; c=relaxed/simple;
	bh=iH3kv/Fhc3qp7AndKlRXmww1+0hDdkL2ol8oXq9fdgw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=KWwKEefuqQMs36hwNDXLaIKDLYt3qpX6ttZ8cpZt58cJ329kzANFqxFuoxjCr81jEQe9PKOlXDHEzdcY20rvkfAeCdLrMBUKL4EoYcPckvoZY8rxuoFTbdPI4Yh+d17LkFafnBMEtPW/PyqpAA8ivtZoULFMJgt+S8736kr6dsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=EYVjzcmT; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="EYVjzcmT"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 55A9523D1B;
	Wed, 25 Sep 2024 20:42:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66obs_xSAmAR; Wed, 25 Sep 2024 20:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727289775; bh=iH3kv/Fhc3qp7AndKlRXmww1+0hDdkL2ol8oXq9fdgw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EYVjzcmTrWkOV3fPFDqE6lG0O8exqtCr6cEZ40KYnLYm8mx9ZzSwSrSnwWHXf5JM9
	 YxCjWJkBHSCySmZVbKPakgV7+0FCyylObZH9LsY5Qj3sQYS2ivDkFsvc+hnguzPbGx
	 gVG/L2KambHRNn13IJktK5RidJffO+z5g+5grdbmfpsU7u4PA4HDhmwts+F7YEtbxw
	 hvJUyoQJJcP+sMq5RzuP7y00iU9IdJLwK/5AS3rg0cingNR4G/JrMAoAuZ48/7hz6C
	 amWZNfoz/7tNQiv8CTqvL+Dn0tgIjbjg0ppmZx/HBCXW7plYFpK4K6jLfM8dxH28ta
	 G1vbnv8g7fang==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 18:42:55 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 inki.dae@samsung.com, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com, tzimmermann@suse.de, kauschluss@disroot.org
Subject: Re: [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add
 exynos7870 compatible
In-Reply-To: <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
Message-ID: <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
> On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
>> Add the compatible string of Exynos7870 to the existing list.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> 
> ... and the DTS is <please provide lore ink in changelog>?

Didn't quite understand. The patch adds the compatible string
for Exynos7870 DECON in documentation. There's no DTS involved
in here, right?

> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
