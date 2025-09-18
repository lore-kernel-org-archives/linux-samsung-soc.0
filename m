Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC9D1DE3AD;
	Thu, 18 Sep 2025 01:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758157528; cv=none; b=HQEAjIxAqFDCZSwrx5p8I9j+igf7fcDIHtrajHjjF7XDuZrJpSt6MCnaMTA+dp4gqMZN473rbc+Abptal/Vibp56g3jumR4KeIRGu7sDiZ/W2fkITcoKgl57D7EBs+F9zTgj1qkGeeQ6BPyF6ocq9ss3+IXApgfYZsmOPxnLbAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758157528; c=relaxed/simple;
	bh=K2vKOlj/LnRm8R3/PVr8lNG8eeHcjdyTPfADAPj9Jf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AnyjWJJC/jI97i3JIZtTK+NJXrFGF4Ni0CNVQX8ecgVU1VIZ7kfaTcl1cNN2uBwOjOirzGKvzcaEy1DP/Ci32kzD92pGzMJB4Knb7Hz6awBTCpA+7yoOiI5RJVHMx30hH/uDgzE9NX6b96sGF3g53sqU06fAWRTAOGsgeZGtkHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+i3Qqxq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+i3Qqxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3DFC4CEE7;
	Thu, 18 Sep 2025 01:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758157527;
	bh=K2vKOlj/LnRm8R3/PVr8lNG8eeHcjdyTPfADAPj9Jf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M+i3QqxqzASRQSApDZxomxjRIQu1K+CMyvJv5vHvFWwL6lniSMq+F3VJXeKPnoKrP
	 mvwN50lITvHk3pfsc5tg8gmtvkjoNGohAO2KYx+pahEshxslNdCK6N+lfft8qFBSu6
	 FwXTFqluSwv9m/AEg2R9RGs7M9QUx2hqLDbqC52VPWE1qtJsuwWoMoYgbe0mIAGcP+
	 giwksq1CKMjEZxAKS0chHgO2B4scjfMb3TYOicupSJmBZ6BYWgrkgnnkxyy1DTvK93
	 xXIn1iCivgC/uIR9qZhRfi0VzG7BSQa6KsFeJpFc3N8qQaJZbHUjsLng0uMs6TnKJU
	 h6J7xlan8FRXg==
Message-ID: <59d50dee-cd6a-4eab-860a-bf6d50d9bb0a@kernel.org>
Date: Thu, 18 Sep 2025 10:05:21 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support for the Axis ARTPEC-9 SoC
To: Ravi Patel <ravi.patel@samsung.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jesper.nilsson@axis.com, lars.persson@axis.com,
 mturquette@baylibre.com, sboyd@kernel.org, alim.akhtar@samsung.com,
 s.nawrocki@samsung.com, cw00.choi@samsung.com
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com,
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
References: <CGME20250917085019epcas5p273ef86028a90e78ada55cde48a28a949@epcas5p2.samsung.com>
 <20250917085005.89819-1-ravi.patel@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250917085005.89819-1-ravi.patel@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/09/2025 17:49, Ravi Patel wrote:
> Add basic support for the Axis ARTPEC-9 SoC which contains
> 6-core Cortex-A55 CPU and other several IPs. This SoC is an
> Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> This patch series includes below changes:
> - CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
> - PMU bindings (patch #4)
> - Basic Device Tree for ARTPEC-9 SoC and boards (patch #5 to #7)
> 
> The patch series has been tested on the ARTPEC-9 EVB with
> Linux Samsung SoC tree (for-next branch) and intended
> to be merged via the `arm-soc` tree.
> 
> NOTE: This patch series is dependent on following floating patches:
> 1. https://lore.kernel.org/all/20250917070004.87872-1-ravi.patel@samsung.com/T/#t

NAK, sorry, DTS cannot depend on the drivers. Please decouple the
dependencies.

Maybe you wanted to point me where the bindings are, but then say so.


> 2. https://lore.kernel.org/all/20250917071342.5637-1-ravi.patel@samsung.com/T/#u
> 3. https://lore.kernel.org/all/20250917071311.1404-1-ravi.patel@samsung.com/T/#u

I am dropping the patchset from my queue.


Best regards,
Krzysztof
