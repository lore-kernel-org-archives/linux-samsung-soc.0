Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458709;
	b=FJL2slUBh5K/smHo+1HmL1xuyW5FXp44iSAqS1xKdrN4bCsKSISlqiGIeHtmrel0eZYz
	 MHn78SIN6iotBFE3QPzI4le+H46mxaDCZZjnvZGnF0mXLq9FDDEDrIio6Hps1azbbb7Zd
	 8gHRDFVBNMZdeINmi6eAZTqhbvjwgu5tZ5euLWxcOLQUs2uuZsjOV6IVDXvdaC1xSxf3m
	 h3A4AK+OsPv70nArUfS60Qkkc1JRFDxOvosn5DAudldMcB6VNdndQ+ndBuvr7kOYxWR/9
	 yRNOYMStBnrnfYva2izpgNl2hTRPvTCFUx/ws640iYhpNK5gdqyFbiZAN1KBBsec5TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458709;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ToWYk38FNvu30597eBl4hMsIU1KeznrHsCT06pSLviM=;
	b=DYJfHRI/liEj70WlVXEiCtvN28mvrN2AAwyTnM6wLLDjkDAjmKnipfctsBv2SN0nhhOd
	 q5JiXU2lc4mpu7F15nVpxd7/PEVO4DHOij/3ynjTf9kCI5xg+GtPXwYRmgpmCjpFGxHFQ
	 2jf7BqY1pmmKUsA02sAo/qLXEBaH7xkUlbtrgdhXVQ9YsrpieDCaK7rZYazksDg97KRtG
	 4j8PoQn7abOah7LDpUvlGwvuE0Y69ZqFTkdqhPUKHwgE1hOd8e566MLvGQftyY6PzCT2X
	 GlHkodCQtfYOcugiI3meeXvoe7//Kb5AotcU3+0Zn9yv7yQ/gWZ7QQ6WOEeVawzrA3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0IrV4vT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4ED606A31A;
	Mon, 23 Nov 2026 18:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0IrV4vT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC6E1F000C4;
	Mon, 23 Nov 2026 18:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458708;
	bh=ToWYk38FNvu30597eBl4hMsIU1KeznrHsCT06pSLviM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=j0IrV4vTLxhgHGR0ajgzVViKNWfLGXybpgMGQDYJuo6Br78KXVcTssrZifLLcyEKy
	 T/XAwpoiMrHsSzUlJn6zp/IHHtZYJAPuPEwdFyIl+/8qdeDC7ay4r04NTtHLj1Ungt
	 qw7+u0ImnyV+iZYiM9sLAf8YeMwOzRhKjn7CbQz5+8nrexbATzc+yz8C6khlWFey7Z
	 DTzO8AQ9HTM4FbPmMqQcJ1xjOsQUAM525xZpAfRmhLoPOXpC7C4iyJ6PIx1soEGrqF
	 /dHajqFGPXm3aDgWsEMM72hAG+XClBQRPEuT/W3jcUCiMbz3XC84rY6j9SBHW4b/Bc
	 WW46finYM0syQ==
Message-ID: <ca2615ca-7483-481f-ac9c-cf64054ec0de@kernel.org>
Date: Mon, 23 Nov 2026 19:31:41 +0100
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
Subject: Re: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain
 attach
To: Marek Szyprowski <m.szyprowski@samsung.com>, y-asai.0816@docomonet.jp,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <CGME20261123141844eucas1p221c650882789ccab239e57ee458c02a1@eucas1p2.samsung.com>
 <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
 <d0bf2242-d9ad-4a7e-a1cb-ef32e50f34f9@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <d0bf2242-d9ad-4a7e-a1cb-ef32e50f34f9@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 18:53, Marek Szyprowski wrote:
> On 23.11.2026 15:18, Shigeaki Asai via B4 Relay wrote:
>> Since commit c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular
>> platform driver"), the exynos-pd platform driver registers the power
>> domains too late for exynos5-subcmu, so the sub-CMUs are not attached to
>> them and their clock setup is not restored. On ODROID-XU4 this drops the
>> GPU performance badly (about 3.5 fps in the Kodi menu, with repeated
>> panfrost "gpu sched timeout").
>>
>> This series fixes it as follows:
>> - Make the exynos5-clock probe wait until the power domains are
>>   registered, so the sub-CMUs are attached to them.
>> - Also make audss wait for pll_in. As a side effect of making the
>>   sub-CMUs wait, audss would otherwise probe before pll_in exists and
>>   generate audio from the 24 MHz pll_ref, which causes audio stuttering.
>>
>> However, this relies on deferred probe, which conflicts with the move 
>> towards platform_driver_probe(), and the sub-CMU clock data is
>> __initconst, so the deferred probe has to finish before init memory is
>> freed. So I would like to discuss the preferred way to fix it.
>>
>> This may also explain the oopses seen in the RFC series "clk: samsung:
>> Use platform_driver_probe() to avoid __refdata". Krzysztof saw them
>> when converting exynos5-subcmu, and Stephen pointed out that
>> platform_driver_probe() is incompatible with deferred probe. The
>> sub-CMUs have to wait for their power domains, so exynos5-subcmu
>> probably cannot use platform_driver_probe() as long as exynos-pd is a
>> regular platform driver.
>> https://lore.kernel.org/all/20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org/
>>
>> Testing:
>> - Tested on ODROID-XU4 with a Linux 7.3 based LibreELEC kernel:
>>   every power domain now has an exynos5-subcmu device attached in
>>   pm_genpd_summary, the Kodi menu went from about 3.5 fps to 25-30 fps,
>>   "gpu sched timeout" went from 17 to 0, and there is no audio
>>   stuttering.
>> - On next/clk, only build-tested (exynos_defconfig, W=1) and checked
>>   with checkpatch. I have not booted next/clk on the hardware.
>> - These patches are already carried in LibreELEC.
>>
>> I investigated the root cause and wrote these patches and the commit
>> messages with the help of Claude (claude-opus-5-5). I reviewed the
>> changes and tested them on the hardware as described above.
> 
> https://lore.kernel.org/all/20261030075325.517182-1-m.szyprowski@samsung.com/
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5fbe2d229bd3738ed63c7c9177466ad6bc130f18

Which was even committed three weeks ago! I guess author just sends slop.

Best regards,
Krzysztof
