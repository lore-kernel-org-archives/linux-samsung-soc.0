Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09B350A0C;
	Wed, 19 Nov 2025 11:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552445; cv=none; b=fSDecjNqO9KE+smdM8eHxSqAl4gY4QQvHALMewZQAzYmxsuxcT+E72LCkQHRgP030JizS2StFdwz/1ssrgtkmsIA0ZyC66uemlsgE7ZH2bMYLgkwQBZzgOs/WGovv7OT0hF8Uwt0C7y/7N8l+4P2FvCBQskTe6kExIIkIcPWbIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552445; c=relaxed/simple;
	bh=o2KQ6vpiRdYBwwouguh8StR9fcwrluECWZKRouQdfnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LTTIh9DmnfdthDdOA9Zd9Y3sFpKAXqMJVpVWI0xoIekP4PQis1VKWvQpJ5cCtfsLu8z2AjUY3bgBZejwcQKDXDEafT/uoNkgrrjPpyek5ijwiLdVKFedJ2z40w7u3nGk6LFMkERCwj+w2E4pnAz2MbNQYGfhYXBXZVBViCwfSF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odgQBWAp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odgQBWAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3CEC19423;
	Wed, 19 Nov 2025 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552445;
	bh=o2KQ6vpiRdYBwwouguh8StR9fcwrluECWZKRouQdfnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=odgQBWAp7oBg0R5yUNM/NT9qiFkS/ksWtWGSDC+syhqBS5wZKvfjUwjmyJSHgwZrc
	 +UyJbSW3U7JldA7LmqQ7fQfBA4kB2XjPbiFskw/WalaImK9DJ4cP5j1/vqBeYtAnc2
	 MekZsx4BVpugRjjRWCr7U5nB9XFPhKFgHj4HoOmvPI/E8ZemXXV5xqTx3MGidDE8ML
	 2PypJ6Omt25tV2Jpxhb/OHDdJwnEXRK+j67vLUt2cD1AoGtc2Sa3MH3RbLupvNCAs1
	 LymkpPnPSur7Hw5qdsNypLqfdSa/zh2akyjFPs+tPCYL7uEsHam7xRPmcU3Kl5KRJU
	 G0VHPj7T0An5A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-3-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52@epcas5p4.samsung.com>
 <20251029130731.51305-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 2/4] clk: samsung: Add clock PLL support
 for ARTPEC-9 SoC
Message-Id: <176355243758.116968.4431179201603632884.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:37 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 29 Oct 2025 18:37:29 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-9 SoC platform:
> - pll_a9fracm: Integer PLL with mid frequency FVCO (800 to 6400 MHz)
>              This is used in ARTPEC-9 SoC for shared PLL
> 
> - pll_a9fraco: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 2400 MHz)
>              This is used in ARTPEC-9 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[2/4] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

