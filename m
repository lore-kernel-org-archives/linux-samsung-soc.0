Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C52E54A6;
	Wed, 18 Jun 2025 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257562; cv=none; b=nFVglYSj/poZexerMInA+yJzuhTKNg4Tyb5449oKWTIM3J0aLbsIUpNh7kKmdy5ySxTAvAS0v0/R2DA24W6wsTrV8eRxtohiYQiHuAWzzLEghZDKMEahHl/LbpdzzKR/P2SmhGEX3x7ZmRBB5QXc/b79EqXnlivmnmiQD80UYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257562; c=relaxed/simple;
	bh=8oYMcM5NtNjasov9o5oVzWKXy6yG0PqRwFxgVhFio3c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=jJg2ITD0Kktm3CcajQ35z/scW0BYeo4VELFzSufJ9NW4XIdFPihMCpNg3q+1mZVgg384bKpGhMAtdN35zaT4Rl14GC9IkJYVxEUjm2Mt1k9vUAa5R/8nlPzWaVVva2bc2WX/olUvQ2lXIlBPB3a7XzoezMHsLhxamH3WHlV2Cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=V0+cTyMs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="V0+cTyMs"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4B145204A8;
	Wed, 18 Jun 2025 16:39:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtMEojEv1TMF; Wed, 18 Jun 2025 16:39:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750257558; bh=8oYMcM5NtNjasov9o5oVzWKXy6yG0PqRwFxgVhFio3c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V0+cTyMsI0vM0XXOuWLswDaMtDr7XnYIkeYAxZTMtQEsIn0dxQ5xSV1Clfoeq+acj
	 5zQaf2V0DhFVmljetSNPkh5R4xu0XWIUtHusq7b/PbPwgxr9zTGFh8pYjS5XjDna7d
	 2CQQZBWvq0+aMJ1/xJUOtQxuG2IeCIHuW4RG8ndeqrEDqHRUI/sk38ASGPFoAGLxCr
	 RvACOeXHperP7Un5uGExsAbmd9EVxMFk0YghLlBJtiSbRPniXhHnub9m4vQpQfjVRU
	 hfr2YtVwa0G3YlwhpUMNs+HDj9O/wBCzsogs7cBkxc0H6SybiI5COQwYm6wub4OsFb
	 WRkW2+9pMkIug==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:39:18 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arch: arm64: dts: exynos7870-on7xelte: enable display
 panel support
In-Reply-To: <99e31fd7-e0b6-406f-bf4c-ceee8a0db93b@kernel.org>
References: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
 <20250612-exynos7870-drm-dts-v1-3-88c0779af6cb@disroot.org>
 <99e31fd7-e0b6-406f-bf4c-ceee8a0db93b@kernel.org>
Message-ID: <03152ec8103544ad4155dfa5c3ba9a42@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-18 09:57, Krzysztof Kozlowski wrote:
> On 12/06/2025 17:23, Kaustabh Chakraborty wrote:
>> Enable DECON and DSI nodes, and add the compatible display panel and
>> appropriate panel timings for this device. Also, disable the
>> simple-framebuffer node in favor of the panel.
>> 
>> This device has a 1080x1920 Synaptics TD4300 display panel.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 
>> ++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts 
>> b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
>> index 
>> eb97dcc415423f405d7df9b9869b2db3432fb483..86a7fc2554a137752862c37d27cf9813b3ac5514 
>> 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
>> @@ -40,6 +40,8 @@ framebuffer@67000000 {
>>  			height = <1920>;
>>  			stride = <(1080 * 4)>;
>>  			format = "a8r8g8b8";
>> +
>> +			status = "disabled";
> 
> This should be rather removed. What is the idea behind keeping disabled
> node?

Ideally should be removed, yes. A disabled property was added so that if
required, it can be enabled downstream simply by a patch which removes 
it.

And I also understand that upstream doesn't care what's happening 
downstream.
To upstream, it is effectively a dead node. So I'll remove it.

> 
> 
> Best regards,
> Krzysztof
