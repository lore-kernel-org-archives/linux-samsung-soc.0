Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9DA2882DE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2026 20:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689891; cv=none; b=SEDLxDhfEqosxDNUkm9z2dTLy+VVXhJt0ZTux9NgGVWKQYkkdiJXMAcW1mr602ilymQ0GtlpmBezrHWHFrGck+/gkMmd9W8vxWgl4bu3DY9Oy7vBs1rgKUaqwSB/nGOQ5bjmdy/SzibFXxFUUH2fGVdyAzfLZRvF7ooLGrIcDEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689891; c=relaxed/simple;
	bh=7bCjJjgICnqgqAHn+tY0EcbNTuNXPayt8vzjbeE5BK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRTV7IusUvVlplTziixTV2jGWOXLzuju0wosysXPCNItWkQQwGfF0D01QkuTTYoqhm7LSqqA7TsqWgMPX8MPwwaplfUBaOp3+QRLG3JlBgerw1+GF3HXrDYfJfcSLmcMLKM6ZXTEaeRh3+sCSzXhSYbWYYMLlmmQ89+QZcPHt2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=hnPYS903; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="hnPYS903"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1787689884;
 bh=TJsN+ycmZ6jkrcNxbgl4Kd5KYLWAfFZNuUGOdqM3yDU=;
 b=hnPYS903fB2GKDeanMZywrbHQN7AwZPLjl0/qT+UbynYjohB9+J5qJ/icJYUSmvS8rAEwi5yS
 smqMsglk7vlRYpRaDy+fwU3rHDiuFsqnsr8e5UjtMubEoSDI9aVCDOP4CLrtuRpc3Aa+MK/fFIq
 5MozAWA4HsmWhl208rjMjoc=
X-Forward-Email-ID: 6a8dfb9650593cdd5fd1dd31
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.66
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <82427334-8196-434a-a7bc-601e88ca8e03@lineageos.org>
Date: Tue, 25 Aug 2026 21:31:12 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzysztof.kozlowski@oss.qualcomm.com, semen.protsenko@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 peter.griffin@linaro.org, alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM>
 <20260820142330.84514-1-tturner@lineageos.org>
 <DKY572QGTWSQ.3GW5FQV7JF485@linaro.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <DKY572QGTWSQ.3GW5FQV7JF485@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexey,

On 25/08/2026 16:50, Alexey Klimov wrote:
> 
> Hi Thomas,
> 
> On the next submission, could you please also add my email
> alexey.klimov@linaro.org to c/c list?
> It is interesting topic.

Sure thing.
> Offtopic: I have working patches that enable cpu idle states on Exynos850
> but they are not upstreameable due to PSCI (needs some argument
> shift in one of the PSCI calls due to messed up MPIDRs).
> If you will be interested to test/use that, please let me know.
> 

Absolutely would be interested to try and test that on my ERD850 device,
feel free to send patches/instructions my way.

On another side note, I noticed that on the e850-96 you setup basic PMIC
functionality in u-boot, on ERD850 we also do a similar thing via a
secondary bootloader (uniLoader), was curious to know whether you or Sam
have tried implementing PMIC capabilities into the Linux kernel at all and
if so how successful or unsuccessful has it been?

Best Regards,
Tom
