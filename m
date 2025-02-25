Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11E7207DFF;
	Tue, 25 Feb 2025 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740508429; cv=none; b=ryVwf7uaRlXeDeNm/xl75/Oy6iIeFnLs1zQQ5adJJYZX+3GcR99yoxW71kJuHGJidlsJpObtJ9AE5XZy5SUlngbCy8jmFvBfJOTRXe66/pwiDc0dmcG7hKXb4b6ykhGvUsYSXGJdrs5mYcmXLIHJcNGM2kUGKBSdlKm5PKQx/mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740508429; c=relaxed/simple;
	bh=jp2yqcBPM39tFvgEgMaZVXnw5dMZyLhqY44ScHtv4kI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=PH4LpcUmst/i/qahkQ3nt+4ZCbbiTXRlKY/7r9//RXPOZtfG7By6t0p3NAfAr0N3izClYw3xKQPPQYauprtdRTWr08QgAiDhy73TuSnKMnH8jB7Dp1ZbIyDg/6yQwAXj9c7vQiS/QeL6R6fCljFkfuVwxBwunJEze+Yz8d0n/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Gz7hXkKS; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Gz7hXkKS"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0F7DD25BD1;
	Tue, 25 Feb 2025 19:33:46 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1dBkHBe77xL; Tue, 25 Feb 2025 19:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740508425; bh=jp2yqcBPM39tFvgEgMaZVXnw5dMZyLhqY44ScHtv4kI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Gz7hXkKS3jutX5YjgNDJO4KQrSMImH+3D36rkzBlUXN+V1hPOJ/N+0jeRMp7zfsDJ
	 dIBskGdwmi5QlUyROcGfw0wkXVbbqiqPZS+ygjU5Jh0B65LAkIcPirxmmfFvY7Q/Rd
	 FoooKXLh4nZWOd67DLkv0G4yzsj7iZ191SxyznPM/+JvAzpaplfxRmQORp1W/ZAiKb
	 NZ9OHL2uQPtu6ExZDIsHA5dHPXN+DCXYR1Wl98Y5tzBHN6e4L5Li/MqHREja1yUjEO
	 3keH+PLviQgImqUcaCzSBJi6jMr/O43QUzhJ5ItTzl30yWgo8XrK4mrGR3srg67PY+
	 v9H//aE7zPWTA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 00:03:45 +0530
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
In-Reply-To: <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
 <20250219-discerning-affable-chital-1fdff4@krzk-bin>
 <e2ebd4503100ddbbe8d7e21290329e38@disroot.org>
 <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
Message-ID: <b45362334fc448bce3ef069f34349eb6@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-25 00:43, Krzysztof Kozlowski wrote:
>>> Do you use clkout, BTW?
>> 
>> Using the clocks defined by clkout? No. I added it as downstream
>> had it too. And the devices work fine without it. If you want me
>> to remove this patch and send the PMU patch to its respective
>> series I'll do that then (unless you object or suggest something
>> else).
> 
> clkout is a testing tool and I doubt you can use it on a phone - finding
> the actual clkout pins to connect the oscilloscope is tricky.

Ah, then it's of no apparent use. I guess it'd be better to remove it
now. If required, it can be added back later.
