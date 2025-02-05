Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CF721C16F;
	Wed,  5 Feb 2025 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738740490; cv=none; b=sPkuf7hBQ0rLX47/PBON/IX4NEIe70dGy8/fRvkz1svqCc7RNQ6JmwzlRMJauJN+eD1G7PETYSLGZBQX/jrTw5ba4NB9CUQbh/iDWUt1Ka0YH4s/3AMLybeRBC8Ow1hYW0g4TjKVqCMj/FJukzc06clxF/OXiFA1T3Zo8Pp3LU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738740490; c=relaxed/simple;
	bh=Mtk3GPiawz6xM56KH+DJhCTEAZ8bddN3kYMWpzWZj2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJjAq7T/i0CJ88wlmWgpCed8YbpLUWjlDg13yHjppU13ZjwcG3C6o495Y2n+pMFkdh2vlmld38yVEzK+8xrHyGo6v9JtKKNl/MFg6GvjzFhH8OSdPQiVoC6NMrCNKb++3PZmt5QlrvK/wsIJignvBXQu6UOcTMdzLzE5POsKieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Py9eFSyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Py9eFSyR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE7BC4CED1;
	Wed,  5 Feb 2025 07:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738740489;
	bh=Mtk3GPiawz6xM56KH+DJhCTEAZ8bddN3kYMWpzWZj2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Py9eFSyRUEtY/p4T17HMXZ6qxQQsU0ieBz9iWBnZgzu6jp31QwKHISJ+9l44f/CeH
	 b39DerG2O2Rkvmvz1qx3lEFbxObouTrZR305+htCWS59QlNy2c9mrudQdvF08X1lQr
	 z+2E3vQhtyUDBSzuR2zpElazSzx5RI74D42jaRtU8sXQbwLoAbXJmpcgCgqlZJEHnM
	 hZy53PCfGf/c3l+x6pegq3VraO1gsDqY82nqHZtWMHRUOuV9NaKd5y+Ks8EL6Ba8Hq
	 TozPUOSMo7KpqBDCfLRiZu9D9pacDqwUdmDXJJfjKhxZtQgNdAnBsFTBykPZgj5E7/
	 4ZPp5jufNmpEA==
Message-ID: <6be49594-87a1-4e5a-8f68-4c5b5ee1708a@kernel.org>
Date: Wed, 5 Feb 2025 08:28:03 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Support ExynosAutov920 ufs phy driver
To: Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?B?J+uCmOyGjOybkC9TT1dPTiBOQSc=?= <sowon.na@samsung.com>,
 vkoul@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, kishon@kernel.org
References: <CGME20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6@epcas2p4.samsung.com>
 <20241226031142.1764652-1-sowon.na@samsung.com>
 <000001db658c$4dce63c0$e96b2b40$@samsung.com>
 <080d01db7786$ed980e90$c8c82bb0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <080d01db7786$ed980e90$c8c82bb0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2025 05:32, Alim Akhtar wrote:
> Hello Krzysztof / Vinod
> 
>> -----Original Message-----
>> From: 나소원/SOWON NA <sowon.na@samsung.com>
>> Sent: Monday, January 13, 2025 12:55 PM
>> To: vkoul@kernel.org
>> Cc: krzk+dt@kernel.org; linux-kernel@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
>> robh@kernel.org; krzk@kernel.org; conor+dt@kernel.org;
>> alim.akhtar@samsung.com; kishon@kernel.org
>> Subject: RE: [PATCH v4 0/3] Support ExynosAutov920 ufs phy driver
>>
>> Hi Vinod,
>>
>>> -----Original Message-----
>>> From: Sowon Na <sowon.na@samsung.com>
>>
> [Snip]
>> I can't see these patches in -next yet, do let me know if anything is missing to
>> be addressed from myside.
>>
> Which tree will this series go through? 


phy goes through phy. I take the DTS once the bindings got accepted. I
cannot take it earlier for obvious reasons - warnings.

Best regards,
Krzysztof
