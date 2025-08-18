Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD4E32C316;
	Mon, 18 Aug 2025 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536909; cv=none; b=hjQvnoxLdn/GiLobT3wXmPOU2Hzxyki58gTjU7p2c5qxIDay6P/uj1MtWqEDjbCmmLmdAD5HkDsEko/CAGy5Ys7jxxoQeS0bDO1nhkdRgFFidAh6in/sBrl4RI7c6+qk0+mdtnVwMeXWMHfkmvH8ECyNENMp1upL357x7QI8CKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536909; c=relaxed/simple;
	bh=rPMW5veYC6Pqzzt/IvNOl92DEwVRpPy8WEfW0ZS5F5I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=itOrmSyYSSl1/jhQgeEyltuRZp4ZiwKwCVf5huzCREg3xxYoRdhoGf5GhgUcj5H3DFMP4tRbbEjbylM5qXbHK+PKPg8IYDhKvMCiQ978jwedDuQp/ng3xfOLKFFrUExxfSMhF8rmpR+IfVV746ARw/v8dB9Gfms3UEr8IYuZlSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Hi2iBBvu; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Hi2iBBvu"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8080C22F8E;
	Mon, 18 Aug 2025 19:08:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMVZN71AsQAe; Mon, 18 Aug 2025 19:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755536900; bh=rPMW5veYC6Pqzzt/IvNOl92DEwVRpPy8WEfW0ZS5F5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Hi2iBBvuuvtwAY05hT4157aaA2jyJ96dwAODLyT5zFIyFINe4HwlkjPicA27h7aLr
	 b/xBfuwcShAv0mY46xn9qj46G1rQVVU5cIXJFiwcbGRInMrNAj0+t1UHSTLYPNcTDo
	 o3VqZFGrdiUQClNIVMgxYzBYGv1FVJeRdl0PKItGIL73lnFYSr97RXquqQ8u1HdMVh
	 RFIWDcMrX0mPWr7AX9XvP8xcytDOjs1OCSot0047gjM4/hm4Gv/8dxM0NCoM8CO8RX
	 ++TSWDpuoJ0ciwrtxmSag0OkUDlfbiMODVDxob+QHzlh2mvoLb/zEQJYZA7cji8MWK
	 UHs1kllj/r0CA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 18 Aug 2025 17:08:20 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
In-Reply-To: <2bfa6c0b-1f23-4d57-b618-688ed8dc7fae@kernel.org>
References: <20250627-exynos7870-drm-dts-v2-0-d4a59207390d@disroot.org>
 <3f4f28cf-417b-4f12-8a3d-c1f70f6871c4@kernel.org>
 <45fc52d9988d1bf17eca392364c63193@disroot.org>
 <2bfa6c0b-1f23-4d57-b618-688ed8dc7fae@kernel.org>
Message-ID: <afd9e6c8095df785fa7f39265111e357@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-18 06:32, Krzysztof Kozlowski wrote:
> On 17/08/2025 16:49, Kaustabh Chakraborty wrote:
>> On 2025-08-13 07:58, Krzysztof Kozlowski wrote:
>>> On 26/06/2025 22:13, Kaustabh Chakraborty wrote:
>>>> This series implements changes in the SoC subsystem, which includes
>>>> devicetree additions. It depends on all sub-series listed below:
>>>> (Legend: [R]eviewed, [A]ccepted)
>>>> 
>>>> exynosdrm-decon            -
>>>> https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org
>>>> exynos7870-mipi-phy        A
>>>> https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
>>>> exynos7870-mipi-phy-fix    -
>>>> https://lore.kernel.org/r/20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org
>>>> exynos7870-dsim            -
>>>> https://lore.kernel.org/r/20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org
>>>> panel-samsung-s6e8aa5x01   -
>>>> https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org
>>>> panel-synaptics-tddi       -
>>>> https://lore.kernel.org/r/20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org
>>>> 
>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> 
>>> What is the status of the bindings from dependencies? I think they 
>>> were
>>> not accepted.
>> 
>> Except panel-synaptics-tddi, all have been accepted. A lot of them
>> haven't hit next though. I'm waiting for that to send the next 
>> revision.
> 
> What does it mean - accepted but not hit next? If it is accepted, it
> must be visible in next. Which maintainer's tree are not in the next?

drm-exynos [1] branches haven't been rebased to v6.17-rc1. This should
include all some DECON and all DSIM patches.

Although [2] has been accepted, I don't see the commit in [3] anymore.
But, there's [4] which mentions my panel patches, but then I don't see
them in next (there should be a panel-samsung-s6e8aa5x01-ams561ra01.c
in [5]).

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/
[2] 
https://lore.kernel.org/all/175432157792.3671011.1104200917154441096.b4-ty@linaro.org
[3] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/commits/drm-misc-next?ref_type=heads
[4] https://lore.kernel.org/all/20250814072454.GA18104@linux.fritz.box
[5] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/panel?h=next-20250818

> 
> 
> Best regards,
> Krzysztof
