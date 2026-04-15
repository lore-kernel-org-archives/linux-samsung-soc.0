Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6519279358
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Apr 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263573; cv=none; b=Q2mAwNUh5KcrCgzyePSn9QbySJWJ7fj6fKKSGCdXdk8TnzKjXukT60Uk5Zz5ukbeOC0BUpY+Se4yGREFtGK+vcHX+f8+8WEw+ouioBOvBOJS7sPz2Y7HN0eF0CBwaXPwIJk8t7JXlirUPPMG9L3m1bkAGrlRHxDDxo5ZNafjGHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263573; c=relaxed/simple;
	bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ExXYKonyLrmibILw2/4cvhF57PLcgvcTJaO+ySBORNACOhsiBDkptBxOgycx8OWwQI9as7fd45HMqKttvXxHNqj5dCDShR98RzAR5OAZ2fV0o8O/vzTTONDFpvI6+EL0/bhF5hmPUUErFh/FVbKLQiJFoPHiAP+D72fMsVLDo4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bam28bm+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bam28bm+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so83902485e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Apr 2026 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776263570; x=1776868370; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
        b=Bam28bm+ncD9dKmSXk1HY3yKj1vcZTykVVsHCQowM1JvCRS66Y/BEaMJ6OBsdcyPxk
         YKGMP7EK+y8sFAOTPg2QC4eTYq0dMufgbvnmolLd5/muta6S3vmtBpoE20AzcXHhojzc
         LtGAmcu5m7lYSMnvBUwjjwOHI+KH2gdt3swlGifTpq9ZF3L1DY7P1eXyms5IwmbtcCus
         fdIDSO/S4k/qNaYYAF89EPzoVBhGSGAtjhJP4mZh0JsoEpxl8HISVTbZBYrBzrO1dBZy
         5OXTW7NoytYFdTzfprV2k1orF/a6TpBIpR8hJXMlsrHdFd5AgUhbjqtz30c+QHts1zi5
         Zn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776263570; x=1776868370;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
        b=NNV6cKd1Xmu44w5bOrEylE9gFcf33XyxsfwpqRPSGin7yev8zhpCQXqtEpTRCix0VL
         OUEFX5yR28GpWlAHrp90EodVPpridkWMhEyOkO0t4SCwE/3zJBnpQLlz8uyOgMLT0haS
         N6/jqDjZFeIow+fOyGfdeeYBQnoYBMSmy1qbQ4nPRIlI2/t7JDWo+EzAZseKoo3cMEHJ
         VeBSQym+dR8/k+OoPoQl1OaiOrPqBWWl8hO+j7AOD73N4f4pp4HOhoGC9cR6JTxfwmm2
         RsQxr4eJaXaQuJFzLturQC2hyoaxBRrSnNQfjtdUkb7c1H/xjcv2CRqFW6lpmrcjhlOZ
         m5KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mpBFL69cGI6xg/H9syVLi55Z/8rnKTzYItO4dDbLn32POBupRIt84U9b3lsfOPGzjo9JCoPzV6O0snqrgUljNZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8CMaxvz1PdLUbpM+jUeCzuoKQw/7/JklsPeYIuk0UlR6ummG
	p+/THVQO+gs0fEUoEVqqFCcjPVMAAlMcsTImC7kF35llOVyahldvBybNVvNKIjmFnyM=
X-Gm-Gg: AeBDies4e3nv3J6T0MBuzYGBzd3XQV2vnadoXjS4bRSsi8luQ5V+0BpE1gd5ITTiPuJ
	T4hW5Vmno2DcFikRBXEmrds0ixUPVwS+eZpXArtN6bHtHGrnxG68erbVzNYQf34mxfwRWbYye5J
	u7IVdfUr8MIVpWZznmG7Qxn9Yr1t0jGWw8eop5VZQMWjDDy2PsQ8CLAePSp/MOdVuaf4x0QIX+l
	Yhel+KA/a9OVOZnrv3avZR5k5bQrcetm3ZtJTUITDwHmn5DEENXfze0931SqDtBwPmIqHopSuOX
	YJg3uFlrkRE85rFTTWqe/U9e/i47pGLnK9/Zt3EUkh6Lan+ZOsVX0erBgrbCWji/zDsJhH3hvBz
	EgTaJBQ/3GWSgk8Mhy5R1VAAzNzFu8bNDCOrA5hgY2T70QDPvOZcWvcHWi76rWTKFF5PhIFP+r3
	rKETsnrYyli2NdFH6mKmKAyAhR7J8gOSPtfXTlox7pCQzDZPrsoQsioe3LSD/EpE9TU/vlS+Ae1
	9fsxO2u5JFP+qgz0g==
X-Received: by 2002:a05:600c:3149:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488d68432f2mr298691635e9.15.1776263570072;
        Wed, 15 Apr 2026 07:32:50 -0700 (PDT)
Received: from localhost ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f4352900sm2651745e9.1.2026.04.15.07.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 07:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:32:48 +0100
Message-Id: <DHTSVU4ZU568.2BCATHBGQMAWV@linaro.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
 <20260321-beautiful-garnet-magpie-de4fbd@quoll>
 <DHIB5E66SP7A.110YA5R1OOQHS@linaro.org>
 <5d645bb0-22cd-4e96-b8b6-15c4bb83d87d@kernel.org>
In-Reply-To: <5d645bb0-22cd-4e96-b8b6-15c4bb83d87d@kernel.org>

On Thu Apr 2, 2026 at 7:43 AM BST, Krzysztof Kozlowski wrote:
> On 02/04/2026 04:19, Alexey Klimov wrote:
>> On Sat Mar 21, 2026 at 10:44 AM GMT, Krzysztof Kozlowski wrote:
>>> On Fri, Mar 20, 2026 at 09:15:12PM +0000, Alexey Klimov wrote:
>>>> Hi all,
>>>>
>>>> This patch series introduces support for the APM-to-AP mailbox on the=
=20
>>>> Exynos850 SoC. This mailbox is required for communicating with the APM=
=20
>>>> co-processor using ACPM.
>>>>
>>>> The Exynos850 mailbox operates similarly to the existing gs101=20
>>>> implementation, but the register offsets and IRQ mask bits differ.=20
>>>> This series abstracts these differences into platform-specific data=20
>>>> structures matched via the device tree.
>>>>
>>>> Also, it requires APM-to-AP mailbox clock in CMU_APM block.
>>>>
>>>> In theory this can be split into two series with correct dependecies:
>>>> device tree node requires clock changes to be merged. The suggestion
>>>> is to let this go through Samsung SoC tree with corresponding acks
>>>> if it is okay.
>>>
>>> I don't understand why this cannot be split into two seris
>>> *practically*. What is exactly the dependency between mailbox and DTS,
>>> that it had to be combined here?
>>=20
>> Do you suggest to send 3 single patches with proper dependencies
>> description? DT bindings change first, then mailbox change that specific=
ally
>> depends on dt-bindings change and then dts update (which will depend on =
both)?
>>=20
>> I thought that mbox driver change depends implicitly on bindings update?
>
> Please don't answer to a question with a question. Actually three
> questions. If you cannot give argument why there is a dependency, feels
> to me like you send something you do not understand.

Sorry. You're right on the first part. Couldn't say anything about last par=
t.

So I saw series where DTS enablement changes are included in the series
after changes in drivers were introduced. I guess it is more preferred
to split out DTS changes (also considering that kernel without these
changes should be able to boot with new DTS and vice versa). I can split
out DTS change(s), yes. There should/must be no dependency. Thanks.

Best regards,
Alexey
