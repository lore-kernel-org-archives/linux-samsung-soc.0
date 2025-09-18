Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971336B;
	Thu, 18 Sep 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758183534; cv=none; b=kK0awDY5q50ZOgrxv7SUkbD/GYWLiHI5qIpEV6jrSE9AcsZZnA0k5pQ2sJFKk4uZca37ioMCfZxtYXkP7MPsvVniQ9CnNP5pXq1dskxPhfpaTGvUw8Mog0nnnUSnvXUtbCX1wmtiIaN6H7EPNf+RzlTcxOIalspYnJ0uaUXmt3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758183534; c=relaxed/simple;
	bh=4/T8IJ3R5U+TdrJnbKh29YlwkhUFe974lRou1fa2E7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2zTnoAG8do0Mn3J8sUBZ0ST9NkmmZidkjkY0ij30Xl/0Wfl2AaGTH+RocGyQRVzQG8DI89ll2ywjwUrCK/9FBwDbNvH+tGLbia9kTrayIieD/M7zKIzztqc2sHTqSN81S6CxaxIutCwyO/ynu2PJOeFsF3hnwD0rzHP0W1orD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcNfN5Ds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcNfN5Ds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E82FC4CEE7;
	Thu, 18 Sep 2025 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758183533;
	bh=4/T8IJ3R5U+TdrJnbKh29YlwkhUFe974lRou1fa2E7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FcNfN5Dsp2/+2pRUGmkXJcq9DGpjivbfcunS78JexfYqyGSwpm8ukyzqUK+y3T0qG
	 0ju5aQVHi+CDWv44RzSf/vhCc4QoxmiLxD83O2spr3KiqAvYXltMaTuGTLqijZIfaJ
	 iuy9zUkYcOaajp4cd0SVgQJTl+5F/JMPUhu9VdyGbJ/qKqkDNRv5UwJr9RnCbOyL71
	 dzHGfYPhgHyxat3evqwN5IRRt4GLW+e1BV+M2PPjQAPQTdTtSQVyS8XBhRr7OAgD3F
	 H+hgD4L2p/XUyA9kas0nZ8+tpGrXqVN/4qKKZlbj1852EjEvDCI22oh02I1vFLH/XX
	 F6AmSmmpK0acw==
Message-ID: <f0330c18-11fb-473b-8ed8-891dad16ca78@kernel.org>
Date: Thu, 18 Sep 2025 17:18:45 +0900
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
 <59d50dee-cd6a-4eab-860a-bf6d50d9bb0a@kernel.org>
 <020801dc284d$6f555b50$4e0011f0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <020801dc284d$6f555b50$4e0011f0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2025 12:36, Ravi Patel wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 18 September 2025 06:35
>> To: Ravi Patel <ravi.patel@samsung.com>; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; jesper.nilsson@axis.com;
>> lars.persson@axis.com; mturquette@baylibre.com; sboyd@kernel.org; alim.akhtar@samsung.com; s.nawrocki@samsung.com;
>> cw00.choi@samsung.com
>> Cc: ksk4725@coasia.com; smn1196@coasia.com; linux-arm-kernel@axis.com; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; pjsin865@coasia.com;
>> gwk1013@coasia.com; bread@coasia.com; jspark@coasia.com; limjh0823@coasia.com; lightwise@coasia.com; hgkim05@coasia.com;
>> mingyoungbo@coasia.com; shradha.t@samsung.com; swathi.ks@samsung.com; kenkim@coasia.com
>> Subject: Re: [PATCH 0/7] Add support for the Axis ARTPEC-9 SoC
>>
>> On 17/09/2025 17:49, Ravi Patel wrote:
>>> Add basic support for the Axis ARTPEC-9 SoC which contains
>>> 6-core Cortex-A55 CPU and other several IPs. This SoC is an
>>> Axis-designed chipset used in surveillance camera products.
>>>
>>> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
>>> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
>>>
>>> This patch series includes below changes:
>>> - CMU (Clock Management Unit) driver and its bindings (patch #1 to #3)
>>> - PMU bindings (patch #4)
>>> - Basic Device Tree for ARTPEC-9 SoC and boards (patch #5 to #7)
>>>
>>> The patch series has been tested on the ARTPEC-9 EVB with
>>> Linux Samsung SoC tree (for-next branch) and intended
>>> to be merged via the `arm-soc` tree.
>>>
>>> NOTE: This patch series is dependent on following floating patches:
>>> 1. https://lore.kernel.org/all/20250917070004.87872-1-ravi.patel@samsung.com/T/#t
>>
>> NAK, sorry, DTS cannot depend on the drivers. Please decouple the
>> dependencies.
> 
> Ok, so you want patch #1 - #5 in separate series and #6 - #7 (DTS patches) in another series.

No, I meant above dependencies. You said that these patchset, including
DTS, depends on above. Above are drivers and that's a no go. I said it
multiple times already in various occasions.

Patchset should be organized per maintainers subsystem, but that's
different question.

> Can you please review the patches, I will address review comments in v2 (if any) itself.

As mentioned in other threads, I closed my tree a week ago (if you are
surprised, notice kernel cycles and development process), so review will
happen a bit later.

> 
>>
>> Maybe you wanted to point me where the bindings are, but then say so.
> 
> Yes, these dependencies are for bindings related.
So not really a dependency so again: just provide links to the bindings.

Best regards,
Krzysztof
