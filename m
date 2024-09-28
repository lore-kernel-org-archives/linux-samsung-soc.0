Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C8136352;
	Sat, 28 Sep 2024 16:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727540753; cv=none; b=Fq1FwiBemZyuZ6j5XP0OpUWmDeeJ6sRq0sQ12BWgJyEnNJElDUPsIbp/WqchX66rrM6j3vH4NueBmJ9qNXaozvRag10wPA6l+ahxpOzIU3MTWMpGG6dGrAkYJ5mZ7d4eMtJF94VZbzA2BdVcWeHaapY87HVTXgW5DW/do+ddGUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727540753; c=relaxed/simple;
	bh=V5mT+wVYjQpoHBouSd/nQpnt5/+4LDMm5lqddyF74tk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=NHmsjX7J0mEzisQX+I5LoJTexPDNF/1FVitRL77o9SUAHURXABos++cmOwOHTEL7HY1pPdRGneUmv30OScxLPcS78DeK03qv+8v8LSH3yKbBYOyY8jHciKXApKAq5vRJeWZlJbuOjuLk+u34OxxeL0RuQHZ1k1Dap0gJ/Z/mjyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=mkaMcpZY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="mkaMcpZY"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6A7F523CA1;
	Sat, 28 Sep 2024 18:25:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srQnTbUPZUl5; Sat, 28 Sep 2024 18:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727540742; bh=V5mT+wVYjQpoHBouSd/nQpnt5/+4LDMm5lqddyF74tk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mkaMcpZYJIz+xBxoWJGqd0rIqHSd0s2VEQxFWmfpn97RgDQH+fRMlM3BFEW/C3kcX
	 ifY0AtfwLRrLX51ObBThq0YbPMdrSI1UHG5YFYKt+jI3Nw6THBWNMtuZAMyeBlKX4f
	 5soS39s708vXjvon9WsGEBPan0orpu3HEHgryvb1t2Ve7OnAxaLxVpTd9OwvJFP4NA
	 tO+NmZinLmsbx6tauEXHDsIO9Jxv3DwyN3DkiRwQO3kKv6D1jMG29P+MEBICwGYw20
	 Wqqk7z5eqAjTJR4o0/IdzDYwnDCP1Av4tUXyZ2dPGQauDtMdIYnfE2TFEwZFkAlDsK
	 fyAlSOANWAAcQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 28 Sep 2024 16:25:42 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Kwanghoon Son <k.son@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, airlied@gmail.com,
 alim.akhtar@samsung.com, conor@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, inki.dae@samsung.com,
 kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, robh@kernel.org,
 simona@ffwll.ch, sw0312.kim@samsung.com, tzimmermann@suse.de, kauschluss
 <kauschluss@disroot.org>
Subject: Re: [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add
 exynos7870 compatible
In-Reply-To: <d2a6b8d16b001b72fd01cfc5b4895e6fee0b7032.camel@samsung.com>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
 <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
 <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
 <8e0672ad3fd72f69d2bdb5687e778c86@disroot.org>
 <ef786b8b-32c0-457a-9e14-ed7bd9f04172@kernel.org>
 <d8f5999921a31d7723e0aa9b12bb9eaf@disroot.org>
 <CGME20240926053449epcas1p2e8596f64b7ee5d3b8cdf565bacdc6510@epcas1p2.samsung.com>
 <d2a6b8d16b001b72fd01cfc5b4895e6fee0b7032.camel@samsung.com>
Message-ID: <91447671a12d04e177a7a54e7facc5df@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2024-09-26 05:34, Kwanghoon Son wrote:
> On Wed, 2024-09-25 at 20:05 +0000, Kaustabh Chakraborty wrote:
>> On 2024-09-25 19:56, Krzysztof Kozlowski wrote:
>> > On 25/09/2024 21:36, Kaustabh Chakraborty wrote:
>> > > On 2024-09-25 19:25, Krzysztof Kozlowski wrote:
>> > > > On 25/09/2024 20:42, Kaustabh Chakraborty wrote:
>> > > > > On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
>> > > > > > On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
>> > > > > > > Add the compatible string of Exynos7870 to the existing list.
>> > > > > > > 
>> > > > > > > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> > > > > > 
>> > > > > > ... and the DTS is <please provide lore ink in changelog>?
>> > > > > 
>> > > > > Didn't quite understand. The patch adds the compatible string
>> > > > > for Exynos7870 DECON in documentation. There's no DTS involved
>> > > > > in here, right?
>> > > > 
>> > > > Provide lore link to the DTS submission.
>> > > 
>> > > There aren't any DTS submissions *yet* which use the compatible.
>> > > Is that an issue?
>> > > 
>> > 
>> > Yeah, users are supposed to be upstream. Not downstream.
>> 
>> I understand that. I had plans to submit it in the future.
>> If that's how it's meant to be done, I'll have to revisit this
>> submission at a later date then.
> 
> Hi, may I ask for reason that you don't submit dts?

It's not that I don't want, I have nowhere to submit it to yet. As
pointed out by Krzysztof, support for exynos7870 doesn't exist in
upstream. I'll get back to this after I get that finished.

> I am asking because I wonder if there is an issue related to DPP.

Exynos7870 doesn't have DPP blocks as far as I could tell. Let me
know if I misunderstood anything.

> 
> https://lore.kernel.org/linux-samsung-soc/2e4d3d180f535e57d9cb98e7bac1d14b51ffc5d4.camel@gmail.com/#t
> 
> Best regards,
> kwang.
> 
>> 
>> > 
>> > Best regards,
>> > Krzysztof
