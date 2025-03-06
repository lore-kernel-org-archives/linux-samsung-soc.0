Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F0014A088
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269879; cv=none; b=hPeewrlew3HXQNYLba6mb3cFWWxjxr5yEE4SDeH+fR1AfF4Ic66q4rLxnmdExPw7yH7S7IQhRcWcaeMcWc6meDFntMXJ6muwy5vv1oy6F9PqYcSGlToZT2Sr3iPOQC+LlPzapGBdhYBH/WDz2TkXm9DHwc4ndukw+eZS4vuyzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269879; c=relaxed/simple;
	bh=pasKBVsmjYIxWktl12dwQ+tenmQ5xY3lIwtH9DCArpE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=JDMHekOGX7tvtu+L4IiYYWjYkzTwywl/13l/GJLusJd54evr7tehtteNCiol9uLiMkTsFWr8iYufo1N4heWVRAIOb9qdBMuxDSeLYwuQsG3HevCEcC0n77WvzIE0vJ4JAEymaJhPCbZ1T+dhWAIrLBrYW4BU6gXKcm5S72zmiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=e4R+47p6; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="e4R+47p6"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5D57625C3E;
	Thu,  6 Mar 2025 15:04:29 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uajyCdZurwM2; Thu,  6 Mar 2025 15:04:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741269813; bh=pasKBVsmjYIxWktl12dwQ+tenmQ5xY3lIwtH9DCArpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=e4R+47p6TmClghkaexMBYaHlx1HHxNDlv1Z3TIL/r62JZOMGf73EDGaAIr7mfabWt
	 cmiU+nAQPHxU8DCo7W2FuBJJsjHtRljMrF7tnLecpfDWlZbOV5ghCPgXK17/wxRPBv
	 PMOWH2w1LUlKehvvHfAsz7lh8IPir0CEjiMOAs8RmRGHmvYMDlNqtWEwAappowaZXB
	 in+RNODmcoKFmI+D2hx6EN5wmlyJwlNuVaWzIDdOqq9B0hDc60B8LssHPlKIWFxEb3
	 TtdQRd5W1a9ytxQ2t6kAmiaKp/SEeJG9sFp/1Z0X9A2XTdRZ6QWm4mNjkA6thRJkcg
	 8Qr5agPmXVy2w==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 14:03:32 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, Igor Belwon
 <igor.belwon@mentallysanemainliners.org>, Denzeel Oliva
 <wachiturroxd150@gmail.com>, Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: Re: Any pending patches on me for Samsung SoC? Closing applying cycle
In-Reply-To: <56288828-c767-4198-8f5c-a891d169b6cd@kernel.org>
References: <56288828-c767-4198-8f5c-a891d169b6cd@kernel.org>
Message-ID: <55501e08b586c9bb1178be658299207b@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-03-05 19:45, Krzysztof Kozlowski wrote:
> Hey,
> 
> I went through my inbox and cleared my queue because I am approaching
> end of applying cycle. I think I dealt with everything and pending
> things are:
> 
> 1. Exynos7870 SoC: waits for bindings,

Is this possible to be merged? [1]
It's over a month old at this point, seemingly left untouched.

This one's also a build dependency for [2], as mentioned in its cover
letter.

[1] https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
[2] https://lore.kernel.org/all/174100756283.1496281.12555971793250210333.robh@kernel.org/
