Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B61FCD07;
	Wed,  5 Feb 2025 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786038; cv=none; b=CurmDHjEvpnvDPDo3IGp4fr+GV7xs3WusbLBPOWEvknu+8nAF02gGjJTrzcd7RjG+dYOcvYVWGnomngY2GacTskFbxuubarQZxBSKjwI3A0YyHxMP/2Tdv4xKx4ulrYEygzAO6J4daOOvA+OFT1jzh3WpKgorYSIZ81fAwHGPfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786038; c=relaxed/simple;
	bh=C9P54FrenDdJEucqhA1xISeuejGibTokneA+93TymeM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FYQDUGsV2r/PPugqoEobNufIK1Ij2TByBsjDeUW6EZkZ48wKryLvvg4/13sY/XnGwIiGGCgvZpksLaQttjdfCMuEsBG05UchQYsPlwQF3UE1ln9giv3dPSFDCpSTentfYsfuXknPd3rGDzJ1xdPTjSj+Ql/Zrr01oDK9K+k47uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=KWI3stY9; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KWI3stY9"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 967932523F;
	Wed,  5 Feb 2025 21:07:07 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGvrWEyeHoya; Wed,  5 Feb 2025 21:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738786000; bh=C9P54FrenDdJEucqhA1xISeuejGibTokneA+93TymeM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KWI3stY9otuBFcOLrpNT8UkLA8tqNEEW+TfEXDa7lRfHfmTPH8bZwwOC2aJLhNQXC
	 82oNSBEWYBNHAwGg6V73XZrNTNw0LijPaV1q0pDJP4wNmTmKOI2K9sJvP/BDHacC90
	 iF+k/3hALbqvLsoKkw1Un1LvqjGTSoerGZanYcqSGpybppFjWlh40gJw0RG8PaKe8l
	 Aph2NLLrdFvUrb6WtbgKrF5QX1xFi3EweyEhSYH59V/y8kycABDNirHYreNi/VRjfu
	 c/zX7kEgs9JPuk8UBCZTWuYIWppqEKtxh9J1SYGn7S5kXjqzRG73UjLJjtd8v4s+25
	 0uh0U6aJNuMKA==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 05 Feb 2025 20:06:39 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Lee Jones
 <lee@kernel.org>, Sergey Lisov <sleirsgoevy@gmail.com>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 1/4] regulator: dt-bindings: add documentation for
 s2mpu05-pmic regulators
In-Reply-To: <20250205-keen-taupe-loon-35e0de@krzk-bin>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-1-05adad38102c@disroot.org>
 <20250205-keen-taupe-loon-35e0de@krzk-bin>
Message-ID: <a5e8ebc0dfb35f700e29b75a6fc543cc@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-05 08:32, Krzysztof Kozlowski wrote:
>> +
>> +description: |
>> +  This is a part of device tree bindings for S2M and S5M family of Power
>> +  Management IC (PMIC).
>> +
>> +  The S2MPU05 provides buck and LDO regulators.
>> +
>> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
>> +  additional information and example.
>> +
>> +patternProperties:
>> +  # 21 LDOs
>> +  "^LDO([1-9]|10|2[0-9]|3[0-5])$":
> 
> Why is there a gap in LDOs?

LDOs 11-24 are not implemented in the downstream kernel driver. On further
inspection I was able to find the register addresses, but minimum voltage
and step values are unknown. :(
