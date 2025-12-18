Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34653328EC;
	Thu, 18 Dec 2025 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073981; cv=none; b=bWAPBWZl4iYiZcldQnPSJWMHauIAMaf9Ux03Rg96RVsK7Hu/Bx9FqErPreKyJeV2usq+q5N0emASXh3fgDVi8D0Tk+eGc9KbXqmcWhQ1jqPfgSkT1tiFM2t/zG0blOpxLLcptjci+XjPkJrQrfc0uNedfaR4HfFUmuAoWdgaWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073981; c=relaxed/simple;
	bh=7TABMIsCse42YAFaYw3ybzBIpztbXVRTGG/2bCRhS/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfSeXdruwsPZCcFRV505PUfrn8nn/tBk3kWaVIyBNC4mwFSGF2mmLf/qaQHVUFtBmTpn6oeziIY+61CBTYYePhfs8OS4oNDKjHd5ifSQBWYYGDfyxPsfsLnrXrh0uMRLVS1hUjEYv0/A1zZCJY9gRmwJ+Z041DgI3ONStJuc2pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9Pm0Yv4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9Pm0Yv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20E9C4CEFB;
	Thu, 18 Dec 2025 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073981;
	bh=7TABMIsCse42YAFaYw3ybzBIpztbXVRTGG/2bCRhS/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F9Pm0Yv43VLDk/6u/2XG43NH9QCkfvmLQ7tWTg6OZHRq7g/DyXMsx6g0EMaBlN01I
	 MY9AgKYj+gabkshxNgBsaBdfuRAAHTfx7fNYLWJl0d9lAfmt1vWSnKdvs2mfxYEfoy
	 gE+bVnoNHfk/t0L+uwlA4bNXr5xhzUEu4lM3tTs+sVXoustmNarTG0kH9ZT6vUTPQr
	 CVQ8dM5dJR560fzfsJDp6rj0wgeX8YYStXe2FLi3ZjLOLI8g51T5hDIWYb7f5zz5vA
	 BL38WPo6s97h2TVXp6VDUo1OTLZAS+cccSOyAqfNA1MGiRYdmiD8NwtQQKBhx8Jjnl
	 G/6LQbX1JB7+w==
Message-ID: <e402ac33-c23a-46a1-b67e-097eb2ea7752@kernel.org>
Date: Thu, 18 Dec 2025 17:06:11 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com
References: <20251114-automatic-clocks-v5-0-efb9202ffcd7@linaro.org>
 <20251114-automatic-clocks-v5-3-efb9202ffcd7@linaro.org>
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
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20251114-automatic-clocks-v5-3-efb9202ffcd7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2025 15:16, Peter Griffin wrote:
> Update exynos_arm64_init_clocks() so that it enables the automatic clock
> mode bits in the CMU option register if the auto_clock_gate flag and
> option_offset fields are set for the CMU. To ensure compatibility with
> older DTs (that specified an incorrect CMU reg size), detect this and
> fallback to manual clock gate mode as the auto clock mode feature depends
> on registers in this area.
> 
> The CMU option register bits are global and effect every clock component in
> the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANUAL
> bit on every gate register is only required if auto_clock_gate is false.
> 
> Additionally if auto_clock_gate is enabled the dynamic root clock gating
> and memclk registers will be configured in the corresponding CMUs sysreg
> bank. These registers are exposed via syscon, so the register
> samsung_clk_save/restore paths are updated to also take a regmap.
> 
> As many gates for various Samsung SoCs are already exposed in the Samsung
> clock drivers a new samsung_auto_clk_gate_ops is implemented. This uses
> some CMU debug registers to report whether clocks are enabled or disabled
> when operating in automatic mode. This allows
> /sys/kernel/debug/clk/clk_summary to still dump the entire clock tree and
> correctly report the status of each clock in the system.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v3:
> - Add missing 'np' func param to kerneldoc in samsung_cmu_register_clocks
> (0-DAY CI)
> 
> Changes in v2:
> - Fallback to manual clock gate mode for old DTs with incorrect CMU size
> (added samsung_is_auto_capable()) (Krzysztof)
> - Rename OPT_UNKNOWN bit to OPT_EN_LAYER2_CTRL (Andre)
> - Rename OPT_EN_MEM_PM_GATING to OPT_EN_MEM_PWR_GATING (Andre)
> - Reverse Option bit definitions LSB -> MSB (Krzysztof)
> - Update kerneldoc init_clk_regs comment (Andre)
> - Fix space on various comments (Andre)
> - Fix regmap typo on samsung_clk_save/restore calls (Andre)
> - Include error code in pr_err message (Andre)
> - Add macros for dcrg and memclk (Andre)
> - Avoid confusing !IS_ERR_OR_NULL(ctx->sysreg) test (Krzysztof)
> - Update kerneldoc to mention drcg_offset & memclk_offset are in sysreg (Andre)
> - Fix 0-DAY CI randconfig warning (0-DAY CI)
> - Update clk-s5pv210 and clk-s3c64xx.c samsung_clk_sleep_init call sites (Peter)
> ---

This does not apply, please rebase entire set:

Patch failed at 0001 clk: samsung: Implement automatic clock gating mode
for CMUs
error: patch failed: drivers/clk/samsung/clk.c:289
error: drivers/clk/samsung/clk.c: patch does not apply


Best regards,
Krzysztof
