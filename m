Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADB29CE6;
	Sun, 17 Aug 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442173; cv=none; b=pZU6mERmPPcfV+rV7F6psECwdaxcF6mxcW6LO+wr9QE6fRix3FdpsHqUoexjOZzHBOCxuBYITsn/JNj4rWyc7BObRvybtUPxcBs2oGATj6k3Tpr4tVKEXc8gFHN4eaKIHLt1mVgWWwfAXzqWz0asubsQfemkmZnP95gMTDj2d24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442173; c=relaxed/simple;
	bh=qIMnvl++/IsEcAL9q+zLlKFvHMY7N9QrxenQ6NuKwmU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=rx72sSH80Wlmem/qphbGvvIKSLVY12pThvNjEyrcekUq9PLjzCczSxvzAlrjE2MZHXnV469hpiamOYivl80taMmhQBoeTvPHYf8CsKfwh4odKBLMpLPIAn53lo07ssZO9FL26ZEn/k+5xdvWEkyyFyKzqYMv35a2YteBiq1UX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=JgXW2Jcy; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="JgXW2Jcy"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6E85F25C75;
	Sun, 17 Aug 2025 16:49:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ot2r675AP6tz; Sun, 17 Aug 2025 16:49:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755442168; bh=qIMnvl++/IsEcAL9q+zLlKFvHMY7N9QrxenQ6NuKwmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JgXW2Jcyn+RVd6NzXLZp7YOqyKs0eHBZEX5tLffK5+NBAsDCTeLmWpoReaia5w03G
	 ixK6J/mes9Y1sdRAqJrEPLzsRRsNB4AY3SjQXVAmQchbbQcocWlSKHo6+EcBCOhzfO
	 ctBn2VP8c3MwfP8uf8/D7lol3aWkD8YWz9Cxuhlryr6dsProyj3hLXNtmfrIklMEPw
	 LME7EOKW6rkP3nAj9bMl8hm+KDr1P6ZL+Phdw3AtHWiwiSWwQ5PmJuRRyTKn8SdqFr
	 BcKeXzcVGcZHuarrVHl0xqqX6VfgsKtzfCOazDhsEBVweOjz4UdoayUaZe1D449N/a
	 bMOCAlRnKLl9w==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 17 Aug 2025 14:49:28 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
In-Reply-To: <3f4f28cf-417b-4f12-8a3d-c1f70f6871c4@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <3f4f28cf-417b-4f12-8a3d-c1f70f6871c4@kernel.org>
Message-ID: <45fc52d9988d1bf17eca392364c63193@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-13 07:58, Krzysztof Kozlowski wrote:
> On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>> This series implements changes in the SoC subsystem, which includes
>> devicetree additions. It depends on all sub-series listed below:
>> (Legend: [R]eviewed, [A]ccepted)
>> 
>> exynosdrm-decon            - 
>> https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
>> exynos7870-mipi-phy        A 
>> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
>> exynos7870-mipi-phy-fix    - 
>> https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
>> exynos7870-dsim            - 
>> https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
>> panel-samsung-s6e8aa5x01   - 
>> https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
>> panel-synaptics-tddi       - 
>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> 
> What is the status of the bindings from dependencies? I think they were
> not accepted.

Except panel-synaptics-tddi, all have been accepted. A lot of them
haven't hit next though. I'm waiting for that to send the next revision.
This rev is pretty old, so the links are old revs too.

There's also another related patch, on the IOMMU driver, which has also
been accepted. I will also add it to the list.

> 
> I also replied with few nits for one of DTS patches. Everything else
> looks fine.
> 
> BTW, really great job you did here, I am impressed!

Thank you! This was quite a ride to work on it and upstream these
patches. Thanks again to you and other kernel maintainers for all the
reviews.

> 
> Best regards,
> Krzysztof
