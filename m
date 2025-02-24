Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCBB1A704B;
	Mon, 24 Feb 2025 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740419280; cv=none; b=CVnjN4dgApwYxheIA3cbzCQYWvtPqECnN7+smixoWlgMUiT7cj4Qm1YMSKlrDLgtwEO8kiEROFvskjdXOo6bHDNQC01F6NnEMcA1nv7KUB643s90g5eSAtyv9uPtgbemcXty1nW3uMplr2DiESWs5iBxCbw1U79kMzb7nmr4QMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740419280; c=relaxed/simple;
	bh=5Dld904E0IHeG2LNNgItT8r0/muuiN9ws/qnIs7U5TA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Heubi6Cj59kf7kKWzvDOb3TDFvwzwKAN/GcCMyMkDEhVPBtc3GU0z21t3NwQmewIHJZe8QC5b7MRom9r5P3ozMw+9Odu9TTRFv3t/K+EQfy1/2tpevHIjw9uRoMjDU00tOGI/jZdoNK/9rqdyI5UX/en/6wKiOEA3pqR3NTvd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=P3g1rziA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="P3g1rziA"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1950725B19;
	Mon, 24 Feb 2025 18:47:57 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PArui_dNLN8n; Mon, 24 Feb 2025 18:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740419266; bh=5Dld904E0IHeG2LNNgItT8r0/muuiN9ws/qnIs7U5TA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P3g1rziAdnhX2YblNyPfiR3AAhxzFY2a2ndkuJ+aIHo+hULpG9FghSrzHhVtVdkPw
	 g2kzCK2lwW8jQ+OKADQw2BLZi5hm7jkm6gEYKxoINcdipif3I0+1KkNHELE51n20V1
	 LQR4Lgx4X9CqwGrTZ7tDQ3gv/xq6Ff5AJJePUs7M/GxohccFfbhaq6n/OR80CLKCdP
	 owPUxMgy93fpcc7bzJEMIZDhB2hIlMcDs91CL6juJrTqM9t/QbJGhvNpN8im43POvQ
	 o+FEh2iq9EgOVFiGITvxkinTitrZ++pjeDedL6eeX8Ra7ECzAS/3a9pDmcGZ/9+IkO
	 15sPoMRjczZ+g==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 23:17:46 +0530
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
In-Reply-To: <20250219-discerning-affable-chital-1fdff4@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
 <20250219-discerning-affable-chital-1fdff4@krzk-bin>
Message-ID: <e2ebd4503100ddbbe8d7e21290329e38@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-19 13:41, Krzysztof Kozlowski wrote:
> On Wed, Feb 19, 2025 at 12:20:32AM +0530, Kaustabh Chakraborty wrote:
>> Exynos7870's CLKOUT registers are the same as Exynos5's. Add the PMU
>> compatible to the existing CLKOUT ID list.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
>> index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..9a31b1c311b45096f1d680b6724571854c08725c 100644
>> --- a/drivers/clk/samsung/clk-exynos-clkout.c
>> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
>> @@ -75,6 +75,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
>>  	}, {
>>  		.compatible = "samsung,exynos5433-pmu",
>>  		.data = &exynos_clkout_exynos5,
>> +	}, {
>> +		.compatible = "samsung,exynos7870-pmu",
>> +		.data = &exynos_clkout_exynos5,
> 
> I wonder why do we need to keep growing this list? All devices are
> compatible, aren't they?

Well, there are two variants of compatibility having different mask
values.

> Do you use clkout, BTW?

Using the clocks defined by clkout? No. I added it as downstream
had it too. And the devices work fine without it. If you want me
to remove this patch and send the PMU patch to its respective
series I'll do that then (unless you object or suggest something
else).

> Best regards,
> Krzysztof
