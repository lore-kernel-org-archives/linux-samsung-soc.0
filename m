Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701523E25B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108387; cv=none; b=nLXuxMA6MEaHoBrD9ivaUZGdhhJQOeIaO/YbTtnB+ElSf7PQ3KHsHU8jbBYfetwRNCVasUMtkk9jqyVOJXkWxtmIHhHk9p+jJV8/+iLWpAkHWqH8XLJdVY1g23zw71ITsCk/2Ivzy8p4QC00Hgh/VdfBZjfkVhGpmBshb3rMJgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108387; c=relaxed/simple;
	bh=euOm2wfYoqEOdg+hwDShjrvWc0Co9FdWhVLLzPOJI6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=psBt8Loe+6ukxndmK6Y+wdYFxVl3QR3WZ97kGcND+zgIboP5RPHCI2OFc7TNKeZeHg6nAI3dxmIiTBQ/doebI0oZBp4KA0AqgEZtrrWGm86vF7WdYZyESy5mfojjeFcL+PnWy4qzekD7GEfVEC7Z5vzDU3lC7Q1X8QzGy8vo0nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iX8E3vzW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iX8E3vzW"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251114081942epoutp024cecc00c509a5bbb7a4fa269c8afb749~30btsHN-20180801808epoutp02Z
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:19:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251114081942epoutp024cecc00c509a5bbb7a4fa269c8afb749~30btsHN-20180801808epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763108382;
	bh=d0RDO/r3ZCN+6kGD0iIQUOATyF52RUANv4CopEa4PC0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=iX8E3vzWJahcfjiamYkUpMI3imRlj68m9YZfCDgq/+bjxmRaLPTXhcNAS3wE/y1NV
	 7kCfJpGuAMlOG610cafvpWUWgXwmwCO9i5Rs2/MOLgEARzIL14VWwr0ZmRwFTHF2kp
	 0OE9HyEfXqQsf32cU9WAZUOiUes9PzWuUp7z5MwQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20251114081941epcas2p2585a68ec9b6f21cc96ffb559d08e1433~30btYuheO2415124151epcas2p2n;
	Fri, 14 Nov 2025 08:19:41 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.208]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4d796P2rQyz6B9m7; Fri, 14 Nov
	2025 08:19:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251114081940epcas2p20411e29edf567fb21cc832fe995607e9~30bseMtrK2414024140epcas2p2z;
	Fri, 14 Nov 2025 08:19:40 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251114081940epsmtip21fa0bda6b1d4397585cc90600ca3c0f5~30bsa95hm2305623056epsmtip2S;
	Fri, 14 Nov 2025 08:19:40 +0000 (GMT)
Message-ID: <be6b3b93-5c25-405b-86a0-bbdfd59f56f7@samsung.com>
Date: Fri, 14 Nov 2025 17:20:56 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v1 2/5] pinctrl: samsung: fix incorrect pin-bank
 entries on Exynos2200/7885/8890/8895
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com,
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <CAPLW+4m9kmmpBswK_vo0hjqE-MUbN7BA3-5Uo4NdJRFG3VJ7iQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251114081940epcas2p20411e29edf567fb21cc832fe995607e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082141epcas2p4de27828f15600071f03611d2c67db9ab
References: <CGME20251110082141epcas2p4de27828f15600071f03611d2c67db9ab@epcas2p4.samsung.com>
	<20251110082649.3109858-1-youngmin.nam@samsung.com>
	<20251110082649.3109858-3-youngmin.nam@samsung.com>
	<CAPLW+4m9kmmpBswK_vo0hjqE-MUbN7BA3-5Uo4NdJRFG3VJ7iQ@mail.gmail.com>

On 11/13/25 10:27, Sam Protsenko wrote:
> On Mon, Nov 10, 2025 at 2:21 AM Youngmin Nam <youngmin.nam@samsung.com> wrote:
>>
>> This patch corrects wrong pin bank table definitions for 4 SoCs
>> based on their TRMs.
>>
>> Exynos2200
>> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(),
> 
> Nitpick: please keep the lines as long as possible without unnecessary
> breaks, when those are not really needed.
> 
Ack.

>>   which implies a bank_type_off layout (.fld_width = {4,1,2,2,2,2}).
>> - Per the SoC TRM these banks must use the “alive” layout
> 
> Nitpick: please avoid using UTF-8 characters when it's possible to
> make do with just ASCII. UTF-8 might make grepping or git-grepping the
> patches difficult. Not sure if there are any strict rules for this,
> but I think sticking to old good ASCII when possible is a good idea in
> general.
> 
Ack, thanks for catching this. I'll replace the UTF-8 characters with plain ASCII across the series and include it in v2.

>>   (.fld_width = {4,1,4,4}).
>> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, …).
>>
>> Exynos7885
>> - etc0, etc1: update bank type to match the SoC TRM.
>> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>>
>> Exynos8890
>> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>>   a non-external interrupt bank.
>> - gpi1, gpi2: update bank type to match the SoC TRM.
>>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
>> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
>>
>> Exynos8895
>> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>>   change EINTW -> EINTN.
>>   (The bank_type itself was correct and is kept unchanged.)
>>
>> This aligns the pin-bank tables with the documented bitfield layouts and
>> wakeup domains. No DT/ABI change.
>>
>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> Suggest adding "Fixes:" tag here, if this patch actually fixes some
> functionality, so it can be backported to the stable kernels further.
> 
Thanks for the suggestion. In this case the patches have inter-dependencies,
so backporting to the stable tree would require taking the entire series.
Given that no concrete issues have been reported so far, I think we should reconsider backporting later.
For now I’d prefer not to add a Fixes: tag.

>> ---
> 
> Apart from the minor comments:
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
Thank you.

>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 22 +++++++++----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> index f8fbdd921d00..6e874ce40ff5 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> @@ -95,9 +95,9 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
>>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
>>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
>>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
>> -       EXYNOS_PIN_BANK_EINTN(4, 0xa0, "gpq0"),
>> -       EXYNOS_PIN_BANK_EINTN(2, 0xc0, "gpq1"),
>> -       EXYNOS_PIN_BANK_EINTN(2, 0xe0, "gpq2"),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - CMGP */
>> @@ -768,12 +768,12 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
>>
>>  /* pin banks of exynos7885 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
>> -       EXYNOS_PIN_BANK_EINTN(3, 0x000, "etc0"),
>> -       EXYNOS_PIN_BANK_EINTN(3, 0x020, "etc1"),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
>>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
>>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
>>         EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x0a0, "gpq0", 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
>>  };
>>
>>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
>> @@ -1502,7 +1502,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst =
>>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "etc0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 2, 0x000, "gpb3"),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
>> @@ -1520,8 +1520,8 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst =
>>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpi1", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi2", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
>> @@ -1552,7 +1552,7 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst =
>>         EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
>>         EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
>>         EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x1A0, "etc1", 0x34),
>> +       EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1A0, "etc1"),
> 
> Might as well lower case 0x1A0 to 0x1a0 while at it. Kernel prefers
> lower case style for hex numbers.
> 
Ack.
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
>> @@ -1647,7 +1647,7 @@ static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst =
>>         EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
>>         EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
>>         EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 7, 0x0a0, "gpa4", 0x24),
>> +       EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
>> --
>> 2.39.2
>>
> 

