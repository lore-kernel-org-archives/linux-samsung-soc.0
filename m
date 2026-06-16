Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE63D75DE;
	Tue, 16 Jun 2026 06:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590420; cv=none; b=C4CE6jZhInWDblqb/atfi0IS1qZJJdE3v6t7wCDpiGSlYvkNA/5u7FPhiK5OV2QBXZZ7us/EQS5zmPPOnfRAJXfwQSCwdsSaCs1XHz9YYL1z2YitaK6IaAkPtiP8q5A0rRITYR+TO7Yjo9Qq32h3h+cSUK74gQThh5iflbJtojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590420; c=relaxed/simple;
	bh=Joo+TGlqM14IUudZi1Fr7UJlpV/SNGBjCv+OYlhkoug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UFMtiU1fttOGkd5j5dfLC2KG77mt4shvSc9aG3oB7XbSqyy7yAumr0a7tlpR+oP6vgs9lHXUjuaGfoew1X436jkeHnzYCeQINWez8kkQT07Ro4wB3/av7IwJN8EVD5f/sHDm4Aba/9ieRlQD25yyEZ518CAlouQPSFkqBW81/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=RZkZ3sHt; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="RZkZ3sHt"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 07C8E26EB4;
	Tue, 16 Jun 2026 08:13:36 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDViMMbCDhrk; Tue, 16 Jun 2026 08:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781590415; bh=Joo+TGlqM14IUudZi1Fr7UJlpV/SNGBjCv+OYlhkoug=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=RZkZ3sHtpGb1mRej1EIoaIM7RpzUJWs81+a+W+9EueXVg/233tH+OKjyv7gYiW6Qx
	 xaRp12CTd2vcgpBCUeP8gExtRwU899WXTDh7YQFzc3efWXBJRBoyYhI19EBc0tQAHl
	 jFZSh3Au7dKp6kurXKad9Bn+aqfA4TterIYRuiZ5GqSNFAiz5JRMuLKxFj1yKw+3ZW
	 Rug+kBXkbCxCnb0Aog+7PINSvwj7/SZYfezn0GEPtUVf8SsV3jREgr/CmYogd6FFuw
	 Hj0JhTO5WjaOqbShfv1DuXxUTceENTyORNVcbN0ElFwRZwMeJTvuddkc6efpXwEsIc
	 Kg85JHMC+9WyQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 11:43:24 +0530
Message-Id: <DJA938R30SZG.7WGSHHZHP07X@disroot.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: s2mu005-pmic: reorder reg and
 interrupts properties
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Lee Jones" <lee@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Pavel Machek" <pavel@kernel.org>
References: <20260616-s2mu005-pmic-supplement-v1-0-41e84518b711@disroot.org>
 <20260616-s2mu005-pmic-supplement-v1-1-41e84518b711@disroot.org>
 <7dd8dcf3-5aec-442a-941e-7564936befa9@kernel.org>
In-Reply-To: <7dd8dcf3-5aec-442a-941e-7564936befa9@kernel.org>

On 2026-06-16 06:14 +02:00, Krzysztof Kozlowski wrote:
> On 15/06/2026 22:26, Kaustabh Chakraborty wrote:
>> As per convention, and as also reiterated by maintainers [1], the
>> properties in schema is to be ordered similar to how its done in
>> devicetree sources; starting from compatible and reg. Re-order the
>> properties in this schema accordingly.
>>=20
>> Link: https://lore.kernel.org/all/0240eb13-6c56-4879-8db7-b990a220a78f@k=
ernel.org [1]
>> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>
> Honestly, nah... I commented on v6 so you change the patch. But you were
> posting this huge patchset faster than we can review (v6 and v7 posted
> on the same day!), so v7 got applied where you did not implement the
> comments. One small posting per 24h. One big posting per 2-3 days, not
> more often.

Fair, there were a lot of sashiko reviews, so I quickly addressed most
of them and send a v7. It is indeed a failure on my part. :(

> There is little benefit in fixing this single file.

Fine, I drop the series. I'd assumed it'd be at least fine to have it
before a stable release.

> Best regards,
> Krzysztof

