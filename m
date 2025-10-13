Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1642EAD10;
	Mon, 13 Oct 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760343872; cv=none; b=Vu4V0uT/NgKm7eKq6kIfTwPM/IeNkY80X4S8MUHp/xpFwQ59ePTj8qJOFuKZerUiCo8fCLmyw/4JYzZxUwYGVQz/Cal++bUtV+0YqR1yg4zr2KUsVb/1tNlrKqvrYKal0L5/Cx9A6uOk6Kzt/+m4uHZIyyzAEB2ZtOtYxzNgC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760343872; c=relaxed/simple;
	bh=1egDBRrXkRyh0ACRCIqrOHesPouWqjXhzUBX+oR2Tlw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YFZOraxv6hNeeTmYrIeHekIrd3PuIcWj/U7KREchVm+Uo02wr9rZlY0i77AP8cuE03oaQ319gYSF29uB7dGqB+5jUGpr2BFEc0Pf2VgEzudqxiiLSpMh57EG79TEZN25GFZZj4ttD0mW8LQ+PwqxoL84QAj1DW2v2PikgFd5IKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=LErpJSxn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="LErpJSxn"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A9A3F25D1F;
	Mon, 13 Oct 2025 10:24:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GP6qBm2WuGF; Mon, 13 Oct 2025 10:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760343861; bh=1egDBRrXkRyh0ACRCIqrOHesPouWqjXhzUBX+oR2Tlw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LErpJSxn8tsVKOqLfH7Y+IdptbnzQNlD6f7DVm1B8TDWQ0uQlJzlnVwObNLI8yjs2
	 bEWKw0DnRKbIVBOqAI9HfeEMV755eG+PHhERWO7awh9+Q/CWPJ2Qd/Tnf37nnPZXWr
	 kSxQfFxHhpzN3a4OL+1AGC5SVe1R+NEe/DFIbh8xdVrwvqprUhyNFCuwrUjx9x9uDV
	 TobK8B/7ga9wUg0CqWy1GOUurweBEa/OXUzi50oZW5awVxOlt+ZkqJOJer7qA49zAn
	 sNpEtBGoJwLPEfwJFoVQY+gWejU25hqRPvMwMPo3I8CK2ol0JFx5TQMyHn5L2vT5/3
	 NVBo0UwqbuUWg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 13 Oct 2025 08:24:20 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos7870: relocate ${x}-names property
 after ${x}
In-Reply-To: <8a3b5248-ff46-4aaf-9797-202f85ef9b23@kernel.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-1-a40e77a73f16@disroot.org>
 <CAJKOXPf+fASV2WP+ix_6qb+L-0WqsqLAG7K7FxeQgscsbOUsOA@mail.gmail.com>
 <6dff1e8256f3d0932d1f5ad941e129db@disroot.org>
 <8a3b5248-ff46-4aaf-9797-202f85ef9b23@kernel.org>
Message-ID: <44a87cd90f09c442a2967944d4b0e498@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-07 01:22, Krzysztof Kozlowski wrote:
> On 29/09/2025 19:01, Kaustabh Chakraborty wrote:
>> On 2025-09-28 21:56, Krzysztof Kozlowski wrote:
>>> On Mon, 29 Sept 2025 at 01:44, Kaustabh Chakraborty
>>> <kauschluss@disroot.org> wrote:
>>>> 
>>>> All ${x}-names properties are conventionally placed after their
>>>> corresponding ${x} properties. For instance, 'clock-names' must 
>>>> follow
>>>> 'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
>>>> changes to follow said convention. No functional changes made.
>>>> 
>>> 
>>> I don't intend to take such cosmetic changes, because they interfere
>>> with stable back porting, unless we have a tool for such cleanup. Did
>>> you use my prototype tool for that or some other tool?
>> 
>> No, I did it manually. This is due to your first remark in [1] and
>> my corresponding reply in [2]. What do I do here then?
> 
> 
> I asked for the new code to follow this style, but I don't want to fix
> yet existing code - before we come with a tool doing it.

Well it would stay inconsistent until then – fine, I'll drop these.

> 
> 
> Best regards,
> Krzysztof
