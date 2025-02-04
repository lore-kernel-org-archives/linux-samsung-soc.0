Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E126C20371F;
	Tue,  4 Feb 2025 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697404; cv=none; b=CK8wjPZmXuAOzDThGZi1p0sSC8vqczCQAo0bV3s/xiABnT/bAR2ABxzvZJlIQj27Qt9JebeMSb+La5JfL2flJL73vvNI7OcuyMYhGXdmM0rVkHtiCHU+HtDpq2Adi/ABIL19c1HeRfuYRLfzkYAjI666MQ3GKzrBOZuVDWfWVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697404; c=relaxed/simple;
	bh=hxElP6ZMp8TmfVNOG45r9dWrj5+/1qB6QlQBTJTNWfU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=vB7tk7KM6Ai/IqGwz4J8E/HcHHLx1ePaupWiw0I/EIL3tyGHFS6U0c584fS8ki5V2fcURK6SsxdOu8BMLhFsIdDV768EvDRVZ9zTfTkqhCPCqesLxWgNGghRcB9ILsry4fUCSZpO4R6GmnrCPn/FSpTp2Iz9bjYxJocHwtBeDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HphrJAQj; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HphrJAQj"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DB34625B35;
	Tue,  4 Feb 2025 20:30:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI-zIj3P_Tsb; Tue,  4 Feb 2025 20:29:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738697399; bh=hxElP6ZMp8TmfVNOG45r9dWrj5+/1qB6QlQBTJTNWfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HphrJAQj4f+5MpePcznZQt9+nPvLQp/jJrxZlgaE+vWtgagKBmJ++NGCWO3C8jTcx
	 84mxKI0yCgq9o/EOybq1ZhM865i7LUE0BGY36QwCgHFZarxOLxpJTmmLeLYC+BZyRo
	 LHg7GjVahaP6wKMt9NeaXRGQ14P5f5zZ1Sw+ltVn3KssBDM8RZeD6n5CD6UlUvGA7Z
	 pJnIuhANa1G+TrG4Am1dACp4iRUtpAnOTMPm1yoLFUdkkze4TkpbjahyUSt615LVKV
	 DrnP821pFvCLCGmugmmjIjPz7l4qWCW/juXKFP/VEkJ3xP6tiLCrZrmDrVrfOD7b0h
	 BIRdx3taTP9nw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 04 Feb 2025 19:29:59 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 0/2] Add chip ID for Exynos7870 SoC
In-Reply-To: <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
 <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
Message-ID: <e9d9388d0adacd5599c6c6f5b7f33f87@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-04 07:53, Krzysztof Kozlowski wrote:
> On 03/02/2025 21:32, Kaustabh Chakraborty wrote:
>> This patch series is a part of Exynos7870 upstreaming.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>> Kaustabh Chakraborty (2):
>>       dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
>>       soc: samsung: exynos-chipid: add support for exynos7870
>> 
>>  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
>>  drivers/soc/samsung/exynos-chipid.c                                 | 1 +
>>  2 files changed, 2 insertions(+)
> 
> When I asked to split, I said per subsystem. Soc is one subsystem.
> Everything targeting SoC should be in one patchset. get_maintainers.pl
> tells the name of the subsystem and its maintainers.
> 
> If there is going to be resend/new version, combine patchsets for soc
> into one patchset (just like the example I gave last time).

Alright, so I'll move these patches to the one which has the devicetrees.

There's also a Documentation/devicetree/bindings/soc/ patch in
exynos7870-pmu-clocks [1]. The CLKOUT driver uses the compatible declared
in there, i.e., the CLKOUT driver depends on that commit. So, should it
stay there? Or...?

[1] https://lore.kernel.org/r/20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org

> 
> Best regards,
> Krzysztof
