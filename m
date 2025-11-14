Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705B2D8DA3
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107810; cv=none; b=HtMZlpDQSKX8pL88orpomOrFipEJeFC0UnjSmG2xkAjdVzyg2QD3tpkydNkLWaiTgVFaNMI2HPdKchzGeZrdDczTAHx7guOL3K0FiQaUxwr10nlfozHvYp5FI0wxplQTPAQuNDNuZtktScl5lUeCr1MHZERzJ9CEx5f8wtKtkRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107810; c=relaxed/simple;
	bh=dNx+gPGDCYbWolsyNaW94zcewda/H+5Ta8kxiAjUzjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=RkM12trmRzZ4qwulWrFyv1AlhZKjEZLwrOR5xPhnEDJ7sH3tfH7dStDwdJVK9hr3WNN0l2jozxg/A8m0nPRn02zDEdAi7lBHIJj6Ne+t/1rcLESolYsv6iJC41htjb+ix0n8f0R3UpFVneThOWv73cFZANhez1Hx0Zg4vkzNigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DrJ5PxNI; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DrJ5PxNI"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251114081004epoutp012c3d627c276410effb008652658fe5d0~30TTatBRI0230702307epoutp01A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:10:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251114081004epoutp012c3d627c276410effb008652658fe5d0~30TTatBRI0230702307epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763107804;
	bh=X7MEhwDJbrEf86GCGqWBax7+BgoJHvyn1sQqqm9i5Og=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=DrJ5PxNIogDpoHSb3lto9Jd6SYRDO1qbsbM6C4I5ChoWbFKEH1RNBBGLnjUHCAXin
	 fKaScA2FZqg+8jBmpTUXiZ/mH6v3jN9Std2M/X8Z2Y6FSQNH+ndpaMDKOZEzwXlOpc
	 5Urd32Z9lCRGFxYBO7Xld3AjDQYYl6FDowJMg5a0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20251114081003epcas2p18931f0c80d0a287320244bb3fa8c7258~30TTC6ZxT0267502675epcas2p1z;
	Fri, 14 Nov 2025 08:10:03 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d78vH2PhFz3hhTB; Fri, 14 Nov
	2025 08:10:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20251114081002epcas2p488dbea7bd799dee299d24d3fd86acadb~30TSPGo5p0569205692epcas2p43;
	Fri, 14 Nov 2025 08:10:02 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251114081002epsmtip2e2b396b1004f4670ef2a6a692388631e~30TSFp_jd1709417094epsmtip2U;
	Fri, 14 Nov 2025 08:10:02 +0000 (GMT)
Message-ID: <9ea931e1-57a9-4b83-b71f-39d5c3ab7e69@samsung.com>
Date: Fri, 14 Nov 2025 17:11:18 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v1 1/5] pinctrl: samsung: Consolidate pin-bank
 macros under EXYNOS9_* and pass bank_type explicitly
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com,
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <CAPLW+4k0EwTAn0LLunKsyCbL5SORCfF05HXACSxNKxNBSOsX7Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251114081002epcas2p488dbea7bd799dee299d24d3fd86acadb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082138epcas2p3ef6274056af49f2619030c766412b36d
References: <CGME20251110082138epcas2p3ef6274056af49f2619030c766412b36d@epcas2p3.samsung.com>
	<20251110082649.3109858-1-youngmin.nam@samsung.com>
	<20251110082649.3109858-2-youngmin.nam@samsung.com>
	<CAPLW+4k0EwTAn0LLunKsyCbL5SORCfF05HXACSxNKxNBSOsX7Q@mail.gmail.com>

On 11/13/25 10:12, Sam Protsenko wrote:
> On Mon, Nov 10, 2025 at 2:21 AM Youngmin Nam <youngmin.nam@samsung.com> wrote:
>>
>> Modern Exynos platforms have several near-duplicate pin-bank macro
>> families (EXYNOS850_*, EXYNOS8895_*, EXYNOS7870_*), which makes
>> tables verbose and harder to share across SoCs that differ only by
>> bank_type (alive/off) layout.
>>
>> This patch unifies them into one EXYNOS9_* macro family and makes the
>> bank_type an explicit argument. The common 850-era bank types are also
>> renamed to `exynos9_bank_type_{alive,off}` to reflect their reuse on
>> later Exynos 9xxx–generation parts.
>>
>> Naming rationale:
>> - Use of the EXYNOS9_* prefix indicates that these macros target
>>   current Exynos generations sharing the same register layout and
>>   EINT wiring model. Compared to SoC-specific prefixes
>>   (EXYNOS850_*, EXYNOS8895_*),
>>   EXYNOS9_* is clearer and more future-proof for modern parts.
>>
> 
> Exynos9 sounds like a name for SoC generation or family to me. I
> wonder if Samsung has some specific name for chips covered in this
> series (i.e. modern ARM64 Exynos chips) internally, and if it's
> actually Exynos9?
> 

Yes, internally we also use “Exynos9” as an umbrella name for this family of modern ARM64 Exynos SoCs.

>> Key changes:
>> - Introduce:
>>   - `EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)`
>>   - `EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs)`
>>   - `EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs)`
> 
> Suggestion: change "types" to "type", as it means "bank's type".
> 
Ack, thanks.
Since the struct field is named .type, I’ll rename the macro parameter to bank_type to avoid build error.

>> - Rename:
>>   - `exynos850_bank_type_alive` -> `exynos9_bank_type_alive`
>>   - `exynos850_bank_type_off`   -> `exynos9_bank_type_off`
>> - Convert pin-bank tables for:
>>   - Exynos2200, 7870, 7885, 850, 990, 9810, 8890, 8895,
>>     AutoV9, AutoV920, FSD
>> - Update GS101/EXYNOSV920 helpers to reference `exynos9_bank_type_*`
>>   instead of the old exynos850 names.
>> - Standardize on EXYNOS9_* macros while keeping SoC-specific
>>   `*_bank_type_*` when layouts differ (e.g., 7870/8895).
>>
>> No functional change intended.
>>
>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>> ---
> 
> Except for the minor comments below:
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> I can tell a lot of tedious work went into this, and having reviewed
> it to the best of my abilities, I didn't find any real errors. Tested
> on E850-96.
> 

Thanks a lot for the thorough review and testing on E850-96, and for recognizing the tedious work.

>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 785 +++++++++---------
>>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  49 +-
>>  2 files changed, 402 insertions(+), 432 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> index 627dca504d7a..f8fbdd921d00 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> @@ -53,7 +53,7 @@ static const struct samsung_pin_bank_type exynos7870_bank_type_alive = {
>>   * Bank type for non-alive type. Bit fields:
>>   * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
>>   */
>> -static const struct samsung_pin_bank_type exynos850_bank_type_off  = {
>> +static const struct samsung_pin_bank_type exynos9_bank_type_off  = {
>>         .fld_width = { 4, 1, 4, 4, 2, 4, },
>>         .reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
>>  };
>> @@ -62,7 +62,7 @@ static const struct samsung_pin_bank_type exynos850_bank_type_off  = {
>>   * Bank type for alive type. Bit fields:
>>   * CON: 4, DAT: 1, PUD: 4, DRV: 4
>>   */
>> -static const struct samsung_pin_bank_type exynos850_bank_type_alive = {
>> +static const struct samsung_pin_bank_type exynos9_bank_type_alive = {
>>         .fld_width = { 4, 1, 4, 4, },
>>         .reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
>>  };
>> @@ -90,11 +90,11 @@ static atomic_t exynos_shared_retention_refcnt;
>>
>>  /* pin banks of exynos2200 pin-controller - ALIVE */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst = {
>> -       EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
>> -       EXYNOS850_PIN_BANK_EINTW(8, 0x20, "gpa1", 0x04),
>> -       EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa2", 0x08),
>> -       EXYNOS850_PIN_BANK_EINTW(8, 0x60, "gpa3", 0x0c),
>> -       EXYNOS850_PIN_BANK_EINTW(2, 0x80, "gpa4", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
> 
> For all patches in the series: please break the lines to not exceed 80
> characters, as stated in the kernel coding style doc [1]. Not sure
> what's the maintainers' stance on this nowadays, but I'd prefer this
> for consistency and other reasons.
> 
> [1] https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
> 

Since checkpatch allows up to 100 columns, I kept that limit for now.
I’d like to follow the 80-column rule as much as possible, but I’m concerned that splitting macro invocations like this
into two lines may hurt readability. Would you prefer that I break them into two lines, or keep them within 100 columns?

