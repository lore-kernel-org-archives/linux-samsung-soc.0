Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948481;
	b=EJdTYts9rqFSkFbj3Q4Wu5Jn2JQ23saJx8x4dEUmJZoZuxYl0HVgwCwDexlU8+t9GgLT
	 oW+H+NWEVOL5e2VgPkFCb9M9d9AIKucjSTCt7rO9M7zNpeD7ma7LB8dbL1RNZQxgCUMeG
	 hCQo5DHZt+l1ewvo10FxgYD1IB5a7EtHApYn372RUBlivxaf8CIFlLV7O/OAjts5SAEVW
	 jCRfcID+smqdiWMho8gNFQeVRl1VCPQh48g/+y+CexwkCafyrepvvwBAKQbEqvkrcc0qS
	 dVierw7WSEkl70acizcs9XWDbeoOs8F4T5s6URG/ebPB2sx9ztaT3cFCMtMPGbwZXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948481;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MhHztknkSHPqrXjrHLscjPHwEDTCdUtJkajY/SvLZKw=;
	b=U6yyVZNE323bLQr3ED0UFi0kFcfUCWoiuJNbYEfn8F0LV+rgZ7zq810hI117j01bFmmz
	 BEBIuIy5W6L8ANA/HeO3b1+aGbLL2WnnHflNV5tF710stucID6YXaO4/xaS+oCmrx+fYv
	 E/AAvzg2fBit7q8Uua4R+Xd1ouk3Pp9Y6dQY42AoPP1bT79rq0ZlOQ3AQTV0+irjlRkOH
	 8feqeYkEXoz0IHp4Ut9YKRt4tyDqVxCx2aLAcwLvMhuMAIDf6wOThS2/84IowTweaiexg
	 1NrY1B/ma9s68IaImm7LuraJF5BmZkmiW6cuWjP7k5jD1aDAyJzr5l+q3AGeRDkaiUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aBUprk/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B7606A31A;
	Sun, 25 Oct 2026 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBUprk/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC4F1F01825;
	Sun, 25 Oct 2026 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792948480;
	bh=MhHztknkSHPqrXjrHLscjPHwEDTCdUtJkajY/SvLZKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aBUprk/TK0tNCbZt1AonK4UsFkV1ptKhZSpIYnueV7rZEan8xoKMSJhG5kIBuH+Ir
	 3ltueCVb6gQ7ckASgE9wmXxnKbsBrYOs3wnA6ZYqK93jE3meIEHQIKl2eJdYnHhK5W
	 dhzTPciAU8j0K3b9Aw53tckmtfhh01je1v+FZQHYFF+xz28AFN1+kUKOFIQgIXBPYB
	 hvOqEEMm45KHLp6/OmxdZ638iFuuO3vSibghH3Fh8zyD2NsxmShuUF20KR/svHcVGU
	 mDBRJmB7IbGO/VEADt6ylCZ9cML61rNH0TTQswgJ5EXHknjQQ03I3RctuJKI46DyBx
	 r7q6FDMwmCVKA==
Message-ID: <98938da0-6018-433a-9b06-b593bb1cfc11@kernel.org>
Date: Sun, 25 Oct 2026 18:14:34 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: samsung: exynos4412-p4note: allow powering off
 the wifi card
To: thesame-personal <thesame.personal@gmail.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2026 22:48, thesame-personal wrote:
> sdhci_3 serving BCM4334 was missing cap-power-off-card.
> On my N8000 this resulted in the following messages after sleeping:
> [305.759883] PM: suspend entry (deep)
> [306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
> [306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
> [307.127267] PM: suspend exit
> 
> The regression was triggered by commit 8c3170628a9c
> ("wifi: brcmfmac: keep power during suspend if board requires it").
> Midas already has a fix in commit 2ff147fdfa99
> ("ARM: dts: samsung: exynos4412-midas:
> turn off SDIO WLAN chip during system suspend").
> exynos4412-p4note.dtsi does not include exynos4412-midas.dtsi,
> so p4note did not automatically inherit the Midas fix.
> 
> Another affected board was fixed in commit 863d69923bdb ("ARM: dts:
> samsung: exynos4210-i9100: turn off SDIO WLAN chip during system
> suspend").

Drop paragraph, not needed here.

> 

Please add Fixed tax and Cc-stable.

> Signed-off-by: Artem Utkin <thesame.personal@gmail.com>

Does not match From.

Best regards,
Krzysztof
