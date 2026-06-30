Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE56403AF2;
	Tue, 30 Jun 2026 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817967; cv=none; b=FD6DpLj8lYIa+z70RfmWlHLV7r1QP81xl9EMeQMCtWXJNMSyyE4hlsH3uvUnqyssubkJLPMf5Vx4Pe6p49Deam8WhrCesb1+9p6VzMwa5q1qVdfJ+Dl/m2VTXmF8LncGvBVT8LmAc4/ExWGxSdZvdyxYpOgH25HzMAppNXtQs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817967; c=relaxed/simple;
	bh=1cKYV5p/kwcfKQpk90FnJcC90L7zAu2LvjggsG23C18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2YGjsqtlOtwLSgDWuXzCJGTOFEo20ZQLLNq3AxHOnU9TbQ44O8XO9sL6AVFlHN7UMUNGn5mEuePsqpEpnhZtpBhV2RDt4TBkuq9s3Iqb6XE4uZtnKcWkNxDJT+33i+yYXyCIFv40qxwq/P+d7v2tnog3+WOcKepodhvalWqbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyYsbzdm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyYsbzdm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E537B1F000E9;
	Tue, 30 Jun 2026 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782817966;
	bh=wQrE0ReycrpnBX9CUrqb4OLjGjFo1ru+7Cj+6cRm340=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iyYsbzdmqGYRoSuWJDGqtfM1o0lq6B5CONt/3pKwqGlG+p4JjgcCgVfKGyJd4v7QK
	 MExvh7tnMMa8MPts7VE8JizBiFDyz0FerZtreEJ5FasOhN/6/U+fEPM/SI/XGnx/0V
	 8Fdlxw5I5jpsGidykV0gSRYnP0cf/3Zz7ERBsaJPL9Z4UAsvgf+fDfOOlIpbAiOCuP
	 qw5D3ghhL9MTPwKtic+LUYe+eIdB0yVBPu/eP8gwhqW+S56AgjF/5kd/1kVVtGG75N
	 XDa+5RyvW5LWQylH4z7cEDwPiyub4pTyBgFv5DDmDz2nkSOBopVm8VaFbZcHhcVsZv
	 B+oHiXrtkMWqA==
Message-ID: <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
Date: Tue, 30 Jun 2026 13:12:37 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents
To: Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
 <0f1e01dd0844$01190c40$034b24c0$@samsung.com>
 <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 13:02, Peter Griffin wrote:
> Hi Alim,
> 
> On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>>
>>
>>
>>> -----Original Message-----
>>> From: Peter Griffin <peter.griffin@linaro.org>
>>> Sent: Monday, June 29, 2026 6:02 PM
>>> To: Denzeel Oliva <wachiturroxd150@gmail.com>
>>> Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
>>> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
>>> Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
>>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
>>> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
>>> Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
>>> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
>>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>>> Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
>>> parents
>>>
>>> Hi Krysztof & Denzeel,
>>>
>>> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
>>> wrote:
>>>>
>>>> Correct eight PERIS gate clock parents to match the hardware clock
>>>> tree and reorder the GIC mux parents so mout_peris_bus_user is the
>>>> default source.
>>>>
>>>> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
>>>> ---
>>>
>>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>>>
>>> @Krysztof: I was thinking, maybe we should establish a new rule/best
>>> practice for Samsung clock upstream submissions whereby patch
>>> contributors should link to the downstream cal-if code for the SoC after the --
>>> - line. That would make reviewing the patches' correctness a bit easier, as the
>>> downstream cal-if code would be readily available to the reviewer.
>>>
>> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.
> 
> Generally I would like to, but I also don't have time to hunt around
> the internet for a downstream kernel tree. My rationale was that the
> submitter is most likely to know where the downstream code is, and is
> likely using it for the upstream clock implementation. So, linking to
> it as part of the submission should hopefully be fairly easy.
> 
> If it is a Samsung SoC for which no public code is available that's
> fine. I didn't intend this to be a hard requirement: "you can't
> upstream x,y,z unless you link to the cal-if code". I meant it more as
> "best practice/guidance"; if the cal-if code is publicly available,
> linking to it would be a useful reference for reviewers.

cal-if as vendor tree? Some contributors just base their work on
downstream GPL-compliance dumps from opensource.samsung.com, so not sure
how that link would work.

Best regards,
Krzysztof
