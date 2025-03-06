Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585AA1DE4EC
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Mar 2025 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741286281; cv=none; b=HA0+WrSDDBhTHujCyTROZr04C8OblzxSzi7BpoHD89G34OYObcq9H01qpBODMd3teocDWL5KpN6C/c34KfEZbH1g/3XoJZ35+ih2C8qo1agbw07kF4OEXcswhHx2kGQWf/PtJ1avsE8idkcaSCR8dlIfktkd59B/AhOcuTuS+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741286281; c=relaxed/simple;
	bh=8QVrITdl2Uss2YsW7o3dCB5CWPCmg9xpYKs6EZXoUMQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aRcQwemtY4DgbP3ngYiZ4AR57obVBhDbR/qVGWgnAGm8HXsBMJ9pB54F9dh6OKu2R5UE+TKuZUnQjlgBGq2vM6kpVj+tRe8rpv+mXObsrpfKm225zo62eMZDmCILhvO+YZzQOel2j02HzmATnhELDd895FUEmoBD+2nVgg08yEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UIi8Mm7d; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UIi8Mm7d"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9F3C5252B1;
	Thu,  6 Mar 2025 19:37:56 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKhYPEc0xzgL; Thu,  6 Mar 2025 19:37:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741286268; bh=8QVrITdl2Uss2YsW7o3dCB5CWPCmg9xpYKs6EZXoUMQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UIi8Mm7dWejnL6lex9HGKbNaDBOpXgzQG51Fkx6YNjHcaRHlKtqu+EV1uMWtZGVd3
	 57TSkZX+vR98jI2L4i9NwY4YZDyVdsU0pJb0dLuyUc7+Wk2GSxx2tF0woPdJRMXU+9
	 fw7dKpjEzMkhS0PhrOGPfmM6CsbmAuZZisjYL03oWvhvqg9NefPBBD+6/5NzkxVbDH
	 O5WBESv+7Hd6O0dZ5kdRbMCQBN1irbIJnhvU9HraeM8I/izvSlHT9ytugoCWyq2iJH
	 Rn+D/4XXxpSNgLGfE5FfMP59HGjFZTD22tkff4oE1axrNsEk9GaGf5XMMP6tiSaBX2
	 P7P1qnOnanyNw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 06 Mar 2025 18:37:48 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>, Igor Belwon
 <igor.belwon@mentallysanemainliners.org>, Denzeel Oliva
 <wachiturroxd150@gmail.com>
Subject: Re: Any pending patches on me for Samsung SoC? Closing applying cycle
In-Reply-To: <10311a34-7774-42dd-92d5-37da57d8bfcb@kernel.org>
References: <56288828-c767-4198-8f5c-a891d169b6cd@kernel.org>
 <55501e08b586c9bb1178be658299207b@disroot.org>
 <10311a34-7774-42dd-92d5-37da57d8bfcb@kernel.org>
Message-ID: <b1a18ae129de8515435b3adbb14bd0d2@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-03-06 18:07, Krzysztof Kozlowski wrote:
> On 06/03/2025 15:03, Kaustabh Chakraborty wrote:
>> On 2025-03-05 19:45, Krzysztof Kozlowski wrote:
>>> Hey,
>>>
>>> I went through my inbox and cleared my queue because I am approaching
>>> end of applying cycle. I think I dealt with everything and pending
>>> things are:
>>>
>>> 1. Exynos7870 SoC: waits for bindings,
>> 
>> Is this possible to be merged? [1]
>> It's over a month old at this point, seemingly left untouched.
> 
> I don't have it in my inbox for some reason. Regardless, you want it to
> be a binding, so is it going to be used also by U-Boot?

Don't have any plans with u-boot at the moment, though I'll likely consider
it later. The macros are used with syscon-reboot-mode which helps switching
modes from userland.

> 
>> 
>> This one's also a build dependency for [2], as mentioned in its cover
>> letter.
>> 
>> [1] https://lore.kernel.org/all/20250204-exynos7870-bootmode-v1-1-0f17b3033c2d@disroot.org/
>> [2] https://lore.kernel.org/all/174100756283.1496281.12555971793250210333.robh@kernel.org/
> 
> Then it should not have been sent separately. Patchset should be split
> by subsystem, so this belongs to soc with the rest.

Hmm, getmaintainer didn't report it as part of the soc subsystem, although
the file path does have 'soc' in it. And thus I decided to kept it
separate.

> 
> Best regards,
> Krzysztof
