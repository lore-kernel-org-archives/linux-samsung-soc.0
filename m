Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1C39ACC;
	Tue, 25 Feb 2025 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740513980; cv=none; b=RLlBjZD/Wn5lgRHPamcFySQV0yxRXJj9j8XpmDQuh2m9M0EiF53l+cQq556S1JrHBccdHCJUKP3FC/U9kbQU6/jFtqvyfLjmv+4X4g7aCSyOPU4ud9Oih6jkfXz5B1zgVXf1OIb3KzYmsHvA2Ii5SppZMjELxWN40r6mfO4BGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740513980; c=relaxed/simple;
	bh=Ndza3OHFLer402GMFSu0ZpZLj/3G05f9pbRJc6S9tAo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=s0DC/YvUeQ8mmH5r3feAfnFg22x1LvvCAOMAL0NPDKvqHJrgTwudzoZ5xfXL610Dyg6NaNZMRvkSF0Tu3E2QqG21iMXzLsXpqFzFoyAwhpTTIxneGMk3OG0c2kbRuWJQJ7xZQvmru9Yub7tQKLuMwDEntRFGNQvtnf3uqCmTNHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Br5wrrkm; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Br5wrrkm"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B010325989;
	Tue, 25 Feb 2025 21:06:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-jEkNpuVHmR; Tue, 25 Feb 2025 21:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740513975; bh=Ndza3OHFLer402GMFSu0ZpZLj/3G05f9pbRJc6S9tAo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Br5wrrkmUEOBCE3CrgehhOxKV4f8qkZ0giA3oJsqVKYdzyJNlGYD7FwrgBc7Flf1J
	 9aMrD/8156W7MFZgVvoSsOAFmNdOMoS3XuSZKOra7ilT2g+28zEPXmHo7estiBkR5e
	 XwCfhESuTVEz9LwiJ0lRZlMduNiLJ0egD+HCHyhI53V+s4yDbV/bNi7qOMH3Ahpbw2
	 a7L7Q5GBuqDf5VLcalf8XQ7oKl+glClJa5YZoccEDHbBHpJawDmeL4cDNl4eHKJTGD
	 r1W/FfJBqSDfcTlcnY/LWwi2fyYPrIkaL9/aNzqDwoYoDlhgMOsbhCjPaonC7srGtQ
	 YcaNbUSh8h9og==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 01:36:14 +0530
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v2 2/3] mfd: sec: add support for S2MPU05 PMIC
In-Reply-To: <b150ef5e-08b3-4747-8fd3-7b60410513a1@kernel.org>
References: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
 <20250219-exynos7870-pmic-regulators-v2-2-1ea86fb332f7@disroot.org>
 <20250223-outrageous-bizarre-hedgehog-8a3bbd@krzk-bin>
 <11387d3d0478d7fa1899ee3d0409541b@disroot.org>
 <07634537-0750-4616-9c88-800d1672dcfc@kernel.org>
 <69c58c0ba04ad85f0ddd3f379bcb8390@disroot.org>
 <b150ef5e-08b3-4747-8fd3-7b60410513a1@kernel.org>
Message-ID: <32c8a624fc44d048e90f556ab293d43d@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-26 00:14, Krzysztof Kozlowski wrote:
>>> BTW, what happened with all the review tags? Nothing in cover letter nor
>>> changelog explains dropping reviews.
>> 
>> Haven't explicitly mentioned dropping the tags, but I've changed the
>> macros a bit, among other things (which is mentioned in cover). I assume
>> that's the standard procedure.
> 
> 
> No, it is highly nonstandard. You must mention dropping tags and
> submitting-patches explicitly asks for that.

Then I might've missed it, apologies. Will mention in changelog in v3.
